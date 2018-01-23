# HOW TO RUN
## SETUP
* bundle install
* setup your local database config in `config/database.yml`
```
  development:
    adapter: postgresql
    database: api_dev
    username: ror
    password: ror
```
* rake `db:create` `db:migrate`
* rails s

## TEST
* run `rspec`

# ENDPOINTS
## `POST /create_page` - create url index
request to `POST /create_page` with params `url (mandatory)`

## `GET /pages` - list url already indexed
request to `GET /pages` with params `page (optional)` eg `/pages?page=1`


