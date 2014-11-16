# TimeTracking

This is a repo to teach Rails at IronHack.

I'll keep the repo updated with the contents of the classes.

## Setup

Copy the `config/database.yml.example` file to `config/database.yml`:

    $ cp config/database.yml.example config/database.yml

Now edit your `config/database.yml` so that it matches your development
machines requirements, so add your database username and password (if needed).

Next thing, create and seed the database:

    $ rake db:setup

If your database is already existing, you'll need to drop it first:

    $ rake db:drop db:setup

## Using the API

Youc an `POST` data to our system through the API. Check the
`API::ProjectsController` code to see how you can use it in your own app. Note
that the `skip_before_action` part can be extracted to an
`API::ApplicationController`, and make all API controllers inherit from there.

To try it, use this command:

    $ curl -v -XPOST -H "Content-Type: application/json" -d '{"project":{"name":"API Project"}}' http://localhost:3000/api/projects.json

Remember that you need the `rails s` running, or it won't work. We are using
the `curl` command to `POST` some JSON data to the specified URL. Note that the
URL is the one pointing to the `api/projects#create` action. IF the `POST` was
successful, you will see something similar to this in your terminal:

    {"project":{"name":"API Project","description":null,"entries":[]}}

Otherwise, you'll see an error.

I've added the `api/projects#show` action too to retrieve a single project with
its data, and I use this template in the `#create` action to show the newly
created project. You could actually extract the logic, as it's repeated in the
`#index` template, and use a partial to render data. Use this command to `GET`
a single project:

    $ curl http://localhost:3000/api/projects/1.json

Remember that you can also `GET` data from the browser by visiting the previous
URL.
