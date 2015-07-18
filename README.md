# Vagrant Group Plugin

[![Gem Version](https://badge.fury.io/rb/vagrant-group.svg)](http://badge.fury.io/rb/vagrant-group)

This plugin makes your life easier when it comes to maintain big development environments based on Vagrant.
You can associate each VM to multiple groups, e.g. based on role (webserver, database) or project they belong to.
Then with one simple command you can run basic commands on entire group.  

For big configuration you may be also interested in [vagrant-dotvm plugin](https://github.com/krzysztof-magosa/vagrant-dotvm).

## How to install

```sh
$ vagrant plugin install vagrant-group
```

## How to configure

You need to add definition of groups to your existing `Vagrantfile`:
```ruby
config.group.groups = {
  "group-name-1" => [
    "vm-1", "vm-2",
  ],
  "group-name-2" => [
    "vm-3",
    "vm-4"
  ],
}
```

For example it may look like that:
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
    "webservers" => [
      "web1",
      "web2",
    ],
    "databases" => [
      "db1",
      "db2",
    ],
  }
end
```

## How to use

If you forgot how to use `vagrant-group` just issue below command:
```
$ vagrant group
```

Start VMs:
```
$ vagrant group up <group-name>
```

Start VMs with forced provisioning:
```
$ vagrant group up <group-name> --provision
```

Shut down VMs:
```
$ vagrant group halt <group-name>
```

Forced shut down of VMs (equivalent of pulling power):
```
$ vagrant group halt <group-name> --force
```

Destroy VMs:
```
$ vagrant group destroy <group-name>
```

Destroy VMs without asking:
```
$ vagrant group destroy <group-name> --force
```

Provision VMs:
```
$ vagrant group provision <group-name>
```

Reload VMs:
```
$ vagrant group reload <group-name>
```

Reload VMs with forced provisioning:
```
$ vagrant group reload <group-name> --provision
```

Suspend VMs:
```
$ vagrant group suspend <group-name>
```

Resume suspended VMs:
```
$ vagrant group resume <group-name>
```

List hosts associated to specific group:
```
$ vagrant group hosts <group-name>
```

