# Technologies Used

| Resource | Resource Name | Version |
| ------------- | ------------- | ------------- |
| Back-end programming language | ruby | 3.1.3 |
| Back-end web framework | Ruby on Rails | 7.0.8 |
| Database | SQLite3 | 1.4 |

## Project
https://ftl-test-task.fly.dev/

## FTL Test Task Application

How to run a project locally?

1. Preparing
Make sure that defined ruby and rails gem are installed on your machine. After that, install all other gems used in this project with bundle install. Last step will be starting PostgreSQL database on your localhost within the credentials set at `config/database.yml`

2. Start server
To start our server on uor localhost run `rails s`

3. Stop server
To stop our server on our localhost use `Ctrl-C`

4. Run migrationsor or detabase schema
To create database `rails db:create`. To run migrations `rails db:migrate`

5. Run seeds
To run seed `rails db:seed`

6. Run unit tests
To run unit tests run `rspec` or `rspec file/to/test` or `bundle exec rspec`

## Additional Instructions for Ubuntu

If you are working on the Ubuntu operating system, you can follow these steps to run the project:

## Installing Dependencies
Install the necessary packages such as Ruby and PostgreSQL using the following commands:

`bash`
`sudo apt update`
`sudo apt install ruby-full`
`sudo apt install postgresql postgresql-contrib libpq-dev`

1. Installing Gems
Use the `bundle install` command to install all the necessary gems used in your project.

2. Starting the Server
Launch the server by using the `rails s` command

3. Stopping the Server
To stop the server, use `Ctrl-C`

4. Running Migrations and Creating the Database
Create the database using `rails db:create`. Run migrations using `rails db:migrate`

5. Running Tests
Execute unit tests using the `rspec` or `bundle exec rspec` command
