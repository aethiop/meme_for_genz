from django.db import models
from user.models import User
from django.utils import timezone
from taggit.managers import TaggableManager
from django.utils import dateformat, timezone


def upload_location(instance, filename, **kwargs):
    file_path = 'meme/{user_id}/{utctimezone}-{filename}'.format(
        user_id=instance.user.id, utctimezone=dateformat.format(instance.timestamp, 'U'), filename=filename)
    return file_path


class Post(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    meme_content = models.ImageField(upload_to=upload_location)
    timestamp = models.DateTimeField(timezone.now)
    likes = models.PositiveIntegerField(default=0)
    tags = TaggableManager()


class Comment(models.Model):
    post = models.ForeignKey(
        Post, related_name='comments', on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.CharField(max_length=250, blank=True)
    timestamp = models.DateTimeField(timezone.now)
