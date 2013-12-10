# Capistrano-nrsysmond
[![Code Climate](https://codeclimate.com/github/davidcollom/capistrano-nrsysmond.png)](https://codeclimate.com/github/davidcollom/capistrano-nrsysmond)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/davidcollom/capistrano-nrsysmond/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

Capistrano recipe for installing the newrelic sysmond service on multiple operating systems.



## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-nrsysmond'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-nrsysmond

Prepend your config/deploy.rb with the following lines

    require 'capistrano-nrsysmond'
    set :newrelic_licencekey, '<< NEWRELIC LICENCE KEY >>'

## Usage

    $ cap newrelic:sysmond

## Tested on:
* Ubuntu 10.04
* CentOS 5.9 (Final)


# Credits
* Jamis Buck ([Capistrano's](https://github.com/capistrano) original author)
* [Patrick Reagan](http://stackoverflow.com/users/206390/patrick-reagan) for the `remote_file_exists?` method example from [How can you check to see if a file exists (on the remote server) in Capistrano?](http://stackoverflow.com/questions/1661586/how-can-you-check-to-see-if-a-file-exists-on-the-remote-server-in-capistrano)
* [NewRelic](http://www.newrelic.com/)
* Mitchell Hashimoto [@mitchellh](https://twitter.com/mitchellh) (http://tech.pro/tutorial/1226/basic-rubygem-development) 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Bugs & Feedback

http://github.com/davidcollom/capistrano-nrsysmond/issues




