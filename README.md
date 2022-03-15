## initializing
```
$ mkdir -p site/public/{image,js,css}
$ touch {site/config.ru,public/index.html}
$ cd site && bundle init

```
## update Gemfile as needed

Gemfile source
```  
  source 'https://rubygems.org'
  gem 'rack'

```

## install gems
```
$ bundle install

```

## site building

update config.ru as needed

```
$ rackup # test locally

```
## deploy to heroku
```
git init
heroku create # only 5 apps allowed in free version
git add .
git commit -m 'first commit'
git push heroku master
heroku open # to view
```
## updating

```
git commit 'm' 'update stuff'
git push heroku master
```
