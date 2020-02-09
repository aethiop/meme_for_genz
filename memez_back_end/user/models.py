from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.utils import timezone, dateformat
from rest_framework import validators

from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from rest_framework.authtoken.models import Token


def upload_location(instance, filename, **kwargs):
    file_path = 'profile/{user_id}/{utctimezone}-{filename}'.format(
        user_id=instance.user.id, utctimezone=dateformat.format(instance.timestamp, 'U'), filename=filename)
    return file_path


class UserManager(BaseUserManager):
    use_in_migration = True

    def create_user(self, username, email, date_of_birth, password):
        user = self.model(
            username=username,
            email=self.normalize_email(email),
            date_of_birth=date_of_birth,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_staffuser(self, username, email, date_of_birth, password):
        user = self.create_user(
            username=username,
            email=email,
            password=password,
            date_of_birth=date_of_birth,
        )
        user.is_staff = True
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email, date_of_birth, password):
        user = self.create_user(
            username=username,
            email=email,
            password=password,
            date_of_birth=date_of_birth,
        )
        user.is_staff = True
        user.is_admin = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, models.Model):
    username = models.CharField('username', max_length=30, unique=True)
    email = models.EmailField('email', unique=True, name='email')
    avatar = models.ImageField(upload_to=upload_location, blank=True)
    date_of_birth = models.DateField(
        'Date of birth',
        default=timezone.now)
    is_staff = models.BooleanField('staff access', default=False)
    is_admin = models.BooleanField('admin access', default=False)
    is_superuser = models.BooleanField('superuser access', default=False)

    USERNAME_FIELD = 'username'

    REQUIRED_FIELDS = ['date_of_birth', 'email']
    objects = UserManager()

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return self.is_admin

    def __str__(self):
        return self.username


class UserSubscription(models.Model):
    user_id = models.ForeignKey(
        'User', related_name='rel_from_set', on_delete=models.CASCADE)
    subscribing_user_id = models.ForeignKey(
        'User', related_name='rel_to_user', on_delete=models.CASCADE)

User.add_to_class('subscribing', models.ManyToManyField(
    'self', through=UserSubscription, related_name='subscribed', symmetrical=False))

@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_auth_token(sender, instance=None, created=False, **kwargs):
    if created:
        Token.objects.create(user=instance)