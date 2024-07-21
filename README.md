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


* Database initialization

## Installation

1- Clone the repository

```sh
   git clone https://github.com/Farah-Hamdi/bus_booking_system.git
   cd bus_booking_system

2- The application will be accessible at http://localhost:3000.



