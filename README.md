# OARS 

A rails app which models the course registration platform for IITK. We have used docker container to run the application. The
application uses 2 containers in development mode and 3 in production.

# Running the app

## Development

The application has 2 container one running the unicorn server and the other running postgres database server. The
docker-compose.yml has the code for the development environment.

    git clone https://github.com/ndesh26/oars.git
    docker-compose build4
    docker-compose up -d
    docker-compose run web db:migrate db:seed

The app is served on `localhost:3000`. The last command will create the db and add dummy values to the database. The credentials for the admin are `admin@iitk.ac.in/admin123`. To stop the
server use `docker-compose stop` and `docker-compose start` to restart them. Use `docker-compose down` to delete the containers.

## Production

The production environent has an additional container which runs the nginx server which acts as a proxy server and also serves
static assets like css, images, js etc. The application might still have some security issues and hasn't been tested in a real
deployment environment. We need to setup the secret base key for the production enviroment. For production we need to run
`rails assets:precompile` to get all the static assets to the public folder so that they can be copied to the nginx server for
serving.

    rails secret
    echo "SECRET_KEY_BASE=your_secret" >> .env
    docker-compose -f docker-compose-production.yml up -d
    docker-compose run web db:migrate db:seed

The app is server on `localhost:80` in this case.


# The App

Refer to online-acaedemic-registration.pdf for details about the architecture of the application and its features 

## Contributors
* Abhinav Garg
* Anuj Nagpal
* Nayan Deshmukh
