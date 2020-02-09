from rest_framework import serializers
from django.core.serializers import serialize
import json
from .models import Post


class PostSerializer(serializers.ModelSerializer):
    username = serializers.SerializerMethodField('get_username')
    comments = serializers.SerializerMethodField('get_comments')

    class Meta:
        model = Post
        depth = 1
        fields = ['id', 'meme_content', 'timestamp',
                  'likes', 'username', 'comments']

    def get_username(self, post):
        username = post.user.username
        return username

    def get_comments(self, post):
        comments = post.comments
        return json.loads(serialize('json', comments.all(), fields=['user', 'text', 'timestamp']))
