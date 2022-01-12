# Google Search From CSV

![Demo](screenshot/workflow.mov)

This is a sample app where an user can login and upload keywords in a CSV, and the uploaded keywords are searched in Google, and the user is shown search results.

The backend of this project is developed in Rails and the Frontend part in React. Following are the instructions to run the project in local machine:

**Setup**

- Clone the repository

  ```bash
  git clone git@github.com:rajibds/google-search-from-csv.git
  ```

- Run Docker

  ```bash
  docker-compose up --build
  docker-compose run web rails db:setup
  ```

Server is now up and running at: http://localhost:3000
