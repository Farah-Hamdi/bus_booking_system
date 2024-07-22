# README

This is a bus-booking system built with Ruby on Rails. The application manages bus trips between various cities in Egypt, allowing users to book seats on these trips.

## Features

- Proper validation for user input
- Authentication using Devise and JWT
- Database structure using SQLite3
- APIs for booking seats and listing available seats

## Ruby version 3.3.4

## Development Stack

- Ruby on Rails
- SQLite3
- Devise for authentication
- JWT for token-based authentication


## Configuration 

- Enable CORS in Gemfile 
- 'devise', 'devise-jwt', 'jsonapi-serializer' gems added to the Gemfile to handle authentication and serialization ruby objects in JSON format
- FakeRackSession has been created because sessions are disabled by default in api only projects


## API Documentation
Link to documentation: https://documenter.getpostman.com/view/29295323/2sA3kUHha7

## Prerequisites

- Docker 
- Docker Compose
- Git

## References

- For Authentication: https://sdrmike.medium.com/rails-7-api-only-app-with-devise-and-jwt-for-authentication-1397211fb97c

- Ruby on rails API Crash Course: https://youtube.com/playlist?list=PLbTv9eGiI03u1-JFkFpPGsR_hMre6WX3e&si=SsglNjSGtc8w2D9T


## Installation

1- Clone the repository

```sh
   git clone https://github.com/Farah-Hamdi/bus_booking_system.git
   cd bus_booking_system
```

2- Generate a Devise JWT Secret Key
```sh 
   bundle exec rails secret
```
3- Create env file in the root of your project directory and add the generated key
``` sh
   DEV_JWT_SECRET_KEY=your_generated_secret_key
```
4- Build and run the docker container 
``` sh
docker-compose build
docker-compose up
```
5- The application will be accessible at http://localhost:3000.




