# Mahmud Ahmed's Morningbrew Project
***
## Technologies
* Ruby on Rails
* PostgreSQL
* HTML5/SCSS

## Installation 

### Pre-requisites

Postgres Database is required for HalalTables to operate correctly.

### Setting up
Please run the following commands:
```
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
bundle exec rails db:seed
```

### Running the app
Please run the following command to start rails server:

```
rails s
```

## Core Functionality:

* Perform all CRUD actions for stories and newsletter with app.

* View an index of all stories and newsletter issues.

* Able to preview an individual story using the given template.

* Stories are nested within a newsletter issue, grouped by date.

* Build and preview newsletter issues based on their dates published. 

* Publish stories and newsletter issues to the Lyra API

* Lyra API is synced for any action that might take place in application. For example, if you DELETE a story in your application, it will also be deleted in Lyra.

* Minimalist UI/UX


## Preview/Mentions

<p align="center">
  <img width="600" height="500" src="./app/assets/images/stories_index.png">
</p>

## Future Endeavors

* CSS Styling
