# Roda & Sequel blog app

1. [Motivation](#motivation-⇡)
2. [Setup](#setup-⇡)
3. [Application structure](#application-structure--architecture-⇡)
    * [Gems](#gems)
    * [Boot process](#boot-process)

## Motivation [⇡](#top)

Self-introduction into Roda, Sequel ecosystem and Zeitwerk autoloading.

## Setup [⇡](#top)

1. Install dependencies:

```sh
bundle install
```

2. Prepare the database (sqlite3):

```sh
bundle exec rake db:create
bundle exec rake db:migrate
```

3. Run Puma application server at `http://localhost:9292` with a Rake default task:

```sh
rake

# OR to run explicitly:

rake start
```

## Application structure & architecture [⇡](#top)

### Gems
The application is built with:
1. [Roda](https://github.com/jeremyevans/roda) routing toolkit for routing
2. [Sequel](https://github.com/jeremyevans/sequel) for database connection, migration and ORM
   - [sequel_tools](https://github.com/rosenfeld/sequel_tools) to use Rake tasts for DB operations
3. [Zeitwerk](https://github.com/fxn/zeitwerk) to autoload/reload application during development
4. [dry-configurable](https://github.com/dry-rb/dry-configurable) for `ApplicationSettings` class to store application settings
5. [tilt](https://github.com/rtomayko/tilt) & [erubi](https://github.com/jeremyevans/erubi) for the view layer

### Boot process

1. Entrypoint: `config.ru`
2. `require`s `config/boot`
3. `require`s `config/application_loader` and `config/application_settings`
4. `config/application_loader` sets up the [zeitwerk gem](https://github.com/fxn/zeitwerk), which autoloads the whole `app` directory
5. Rack runs the `Router` from `app/router.rb` (basically the application itself, with routes and actions)

Models are in `app/models` directory.

Views are in `app/views` directory. Partials are supported as well.
