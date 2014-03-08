# Capistrano::Ci
[![Build Status](https://travis-ci.org/railsware/capistrano-ci.png)](https://travis-ci.org/railsware/capistrano-ci)


## Introduction

capistrano-ci is extension for capistrano that allows you to check status of your repository before deployment. Currently it supports:

  * Travis CI: Open Source and Pro versions ([https://travis-ci.org](https://travis-ci.org) or [https://travis-ci.com](https://travis-ci.com))
  * CircleCi: [https://circleci.com](https://circleci.com)
  * Semaphore: [https://semaphoreapp.com](https://semaphoreapp.com)

The master branch of Capistrano::CI is capable with Capistrano 3. To use it with Capistrano 2, please check the `cap2` branch.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-ci'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-ci

Add to your Capfile:

    require 'capistrano/ci/recipes'

## Configuration

Variables list:

  * :ci_client (required) - supports `travis`, `travis_pro`, `circle`, or `semaphore`
  * :ci_repository (required) - organization or user name and repository name on github
  * :ci_access_token(required for `travis_pro`, `circle`, or `semaphore`) - access token specific to the service

### Open Source Projects

Setup ci_client and ci_repository variables in your deployment script:

     set :ci_client, "travis"
     set :ci_repository, "organisation-or-user/repository-name"

### Pro Account of Travis-CI:

Additional to ci_client and ci_repository setup ci_access_token:

     set :ci_client, "travis_pro"
     set :ci_repository, "organisation-or-user/repository-name"
     set :ci_access_token, "your-pro-access-token"

Read explaination [how to obtain Travis-CI access token](http://railsware.com/blog/2013/09/10/capistrano-recipe-for-checking-travis-ci-build-status/). To have more information about Travis-CI access token follow [this blog post](http://about.travis-ci.org/blog/2013-01-28-token-token-token).

### CircleCi:

Setup ci_client, ci_repository and ci_access_token in your deployment script:

     set :ci_client, "circle"
     set :ci_repository, "organisation-or-user/repository-name"
     set :ci_access_token, "your-circle-access-token"

### Semaphore:

Setup ci_client, ci_repository and ci_access_token in your deployment script:

    set :ci_client, "semaphore"
    set :ci_repository, "organisation-or-user/repository-name"
    set :ci_access_token, "your-semaphore-access-token"

### Enable ci:verify task:

     before :deploy, "ci:verify"

     # or in case of using capistrano-patch:
     before "patch:create", "ci.verify"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Copyright

Copyright (c) 2013 Railsware LLC. See LICENSE.txt for
further details.
