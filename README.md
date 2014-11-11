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
