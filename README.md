## Challenge description

Build an application that fulfills following requirements

* It must by API (REST, JSON)
* It must be secured by basic auth
* It must contain User mode ­ with different roles (admin, user, guest)
* It must limit access to given part of API depend of User role
* Admin has access to everything
* User can read all, create all, but update and deleted only his records
* Guest has only read access
* There should be at least 2 different models except User
* Those models should be in relation (1 to many)

## Solution

I'm building an API to manage Movies and users ratings.

* An admin user can manage movies information
* A user can create, update and remove his rating on a movie
* A user and guest can see all movies and ratings

### User Stories

**[01]** A guest can see all movies
**[02]** A guest can see movies ratings

### Technical Overview

* Backend implemented with Rails for API - rails-api gem
* Authenticates with Devise through HTTP Basic Authentication
* Pundit for managing resource access policies
* Tested with RSpec
