# Vagrant Group Plugin

[![Gem Version](https://badge.fury.io/rb/vagrant-group.svg)](http://badge.fury.io/rb/vagrant-group)

With this plugin you can associate VMs to groups and then perform
basic operations like up/halt/provision/destroy on specific group.
One host may belong to multiple groups.

## How to install

```sh
vagrant plugin install vagrant-group
```

## How to configure

```ruby
Vagrant.configure("2") do |config|
  config.vm.define "web1" do |web|
    web.vm.box = "apache"
  end

  config.vm.define "web2" do |web|
    web.vm.box = "apache"
  end

  config.vm.define "db1" do |db|
    db.vm.box = "mysql"
  end

  config.vm.define "db2" do |db|
    db.vm.box = "mysql"
  end

  config.group.groups = {
    "webservers" => [ "web1", "web2" ],
    "databases"  => [ "db1", "db2" ]
  }
end
```

## How to use

```sh
$ vagrant group webservers up
$ vagrant group databases halt
```

At the moment you use commands `up`, `halt`, `provision` and `destroy`.  
Parameters are not supported except `--force` in `halt` and `destroy` commands.

In order to list hosts associated to group issue below command:
```
$ vagrant group webservers hosts
```

## Contributing

1. Fork it ( https://github.com/krzysztof-magosa/vagrant-group/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
