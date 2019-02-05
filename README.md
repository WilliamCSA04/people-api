To create project: `rails new people-api --api -d postgresql`

To create database: `rake db:create`

To create people table: `rails generate migration CreatePeople name:string age:integer birth_at:datetime`

To create schema: `rake db:migrate`