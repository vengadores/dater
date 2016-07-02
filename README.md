# dater

## dev setup

1. install gems `bundle install --without production`
2. create and migrate db `bundle exec rake db:create db:migrate`
3. launch web server `bundle exec rails s`

## tasks

### crawl properties

DB will be empty. fetch properties:

```
$ bundle exec rake fetch:properties
```
