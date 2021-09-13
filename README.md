# Shortnr

To start the Shortnr server:

  * Alias `mix` to `docker-compose run --rm phx mix`
  * docker-compose up db
  * `mix ecto.setup`
  * Stop the DB container
  * docker-compose up

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## TODO

  * During "create", if a long URL exists, go to the "show" for it
  * Recreate short_url if a duplicate is created
  * Create more front-end tests
  * Create a proper Elixir release
  * Pull sensitive information out of files/repo
