* Useful commands
    - to open rails pry
        # bundle exec rails c

* To create a new rails project
    - run
        # rails new -G projectName -d=postgresql
    - in GemFile add gem 'pry-rails'
    - go to config/database.yml to get db name and creat psql db to match
        # createdb DBNAME

* To create a migration
    -  run: (g stands for generate)
        # bundle exec rails g migration createPeople
    - migrate directory will be in db folder
    - set table properties in migrate file
    - when ready to migrate run:
        # bundle exec rails db:migrate
    - to check migrate status
        # bundle exec rails db:migrate:status

* To create models
    - ./app/models and create model.rb
    - model inherits from < ApplicationRecord

* Model Based Validations
    - add 'annotate' gem to development group, and when you run it prints the schema for models, NOT WORKING!
        # bundle exec annotate
    - validates :column, presence: true
    - can use methods using: validate :method_name
    - to check errors
        # #.errors.full_messages

* Associations
    - refer to https://open.appacademy.io/learn/swe-in-person/sql/association-flowchart
