# MemeZ -- Meme Sharing App for Gen-Z
 Meme became a culture to share common phenomnena or event to the masses specially for Generation Z. 
## Table of Content
* [Introduction](#introduction)
* [Features](#features)
* [Goals](#goals)
* [Technologies](#technologies)
* [Setup(Backend)](#setup-backend)
* [Setup(Frontend)](#setup-frontend)

## Introduction
This project aims to share the ideologies of the people by sharing and interacting with creators of memes or users /Memezers/ and the memes themselves to become more connected and smile more.


## Features
1. Sign up or Sign in users (Backend).
2. Subscribe other users (Backend).
3. Create Posts (Backend).
4. Add tags and comment to posts (Backend).
5. An API interface for the front-end. 
6. Feed UI (Frontend).
7. Partial Profile UI.

![Screenshot](Screenshot_1581298376.png)

## Goals
1. People rate how funny the Meme is -- not the conventional likes (Not implemented yet).
2. Memezers recieve in app token and badges for achievements by amount of subscribers and or laughters generated (Not implemented yet).


## Technologies
This project is created with: 
* Django version: 3.0.2
* Flutter version: 1.13.5


## Setup Backend
1. Install Python
2. Install requirements
```
asgiref==3.2.3
Django==3.0.2
django-taggit==1.2.0
djangorestframework==3.11.0
Pillow==7.0.0
pycodestyle==2.5.0
pytz==2019.3
sqlparse==0.3.0
```
3.
```
> env\Scripts\activate
> cd ..\memez_back_end
> python manage.py runserver
```


## Setup Frontend
1. Install Flutter and Dart (https://flutter.dev/docs/get-started/install)

2.
```
> cd ..\memez_front_end
> flutter run
```
