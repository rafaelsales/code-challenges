Simple REST API in Rails
------------------------

A simple Rails application that allows the following operations via REST API:

* Create, update and delete users
* Create, update and delete movies
* Make user like/unlike a movie

### Setting up and testing

* Setup development environment: `$ ./setup_dev`

* Running tests: `$ rspec`

### Routes (last updated on 2013-08-25)

    Verb     URI Pattern                                   Controller#Action
    POST     /api/v1/users                                 api/v1/users#create {:format=>:json}
    GET      /api/v1/users/:id                             api/v1/users#show {:format=>:json}
    PATCH    /api/v1/users/:id                             api/v1/users#update {:format=>:json}
    PUT      /api/v1/users/:id                             api/v1/users#update {:format=>:json}
    DELETE   /api/v1/users/:id                             api/v1/users#destroy {:format=>:json}
    GET      /api/v1/movies                                api/v1/movies#index {:format=>:json}
    POST     /api/v1/movies                                api/v1/movies#create {:format=>:json}
    GET      /api/v1/movies/:id                            api/v1/movies#show {:format=>:json}
    PATCH    /api/v1/movies/:id                            api/v1/movies#update {:format=>:json}
    PUT      /api/v1/movies/:id                            api/v1/movies#update {:format=>:json}
    DELETE   /api/v1/movies/:id                            api/v1/movies#destroy {:format=>:json}
    POST     /api/v1/users/:user_id/like_movie/:movie_id   api/v1/users#like_movie {:format=>:json}
    DELETE   /api/v1/users/:user_id/like_movie/:movie_id   api/v1/users#unlike_movie {:format=>:json}
