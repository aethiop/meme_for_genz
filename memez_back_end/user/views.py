from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from .models import User
from .serializers import RegisterSerializer, UserPropertiesSerializer
from rest_framework.authtoken.models import Token
from rest_framework.parsers import JSONParser
from rest_framework.views import APIView
from django.contrib.auth import authenticate


@api_view(['POST', ])
@permission_classes([])
def registration_view(request):
    if request.method == 'POST':
        serializer = RegisterSerializer(data=request.data)
        data = {}
        if serializer.is_valid():
            print("Hello")
            user = serializer.save()
            data['response'] = 'Successfuly registered a new User'
            data['date_of_birth'] = user.date_of_birth
            data['username'] = user.username
            data['email'] = user.email
            token = Token.objects.get(user=user)
            data['token'] = token.key
            return Response(data)
        else:
            return Response(serializer.errors)


@api_view(['GET', ])
@permission_classes((IsAuthenticated,))
def user_detail_view(request):
    try:
        user = request.user
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == "GET":
        serializer = UserPropertiesSerializer(user)
        return Response(serializer.data)


@api_view(['PUT', ])
@permission_classes((IsAuthenticated,))
def user_update_view(request):
    try:
        user = request.User
    except User.DoesNotExist:
        return Response(status=status.HTTP_404_NOT_FOUND)
    if request.method == "PUT":
        serializer = UserPropertiesSerializer(user, data=request.data)
        data = {}
        if serializer.is_valid():
            serializer.save()
            data['response'] = "User successfuly updated"
            Response(data=data, status=status.HTTP_400_BAD_REQUEST)
        return Response(serializer.errors)


class ObtainAuthTokenView(APIView):

    authentication_classes = []
    permission_classes = []

    def post(self, request):
        context = {}
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(username=username, password=password)
        if user:
            try:
                token = Token.objects.get(user=user)
            except Token.DoesNotExist:
                token = Token.objects.create(user=user)
            context['response'] = 'Successfully authenticated.'
            context['id'] = user.id
            context['username'] = username
            context['token'] = token.key
        else:
            context['response'] = 'Error'
            context['error_message'] = 'Invalid credentials'

        return Response(context)
