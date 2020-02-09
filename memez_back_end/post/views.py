from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.pagination import PageNumberPagination
from rest_framework.authentication import TokenAuthentication
from rest_framework.generics import ListAPIView
from rest_framework.filters import SearchFilter, OrderingFilter
from user.models import User
from .models import Post
from .serializers import PostSerializer
from rest_framework import mixins


@api_view(['GET', ])
def api_get_post_view(request, id):
    try:
        post = Post.objects.get(id=id)
    except Post.DoesNotExist:
        return Response(status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = PostSerializer(post)
        return Response(serializer.data)


@api_view(['POST', ])
@permission_classes((IsAuthenticated,))
def api_create_post_view(request):

    user = request.user
    post = Post(user=user)

    if request.method == 'POST':
        serializer = PostSerializer(post, data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATE)
        return Response(serializer.errors, status=status.HTTP_404_NOT_FOUND)


class APIListView(ListAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    authentication_class = (TokenAuthentication)
    permission_class = (IsAuthenticated)
    pagination_class = PageNumberPagination
    filter_backends = (SearchFilter, OrderingFilter)
    search_fields = ['tags']
