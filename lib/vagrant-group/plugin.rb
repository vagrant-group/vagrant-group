module VagrantPlugins
  module Group
    class Plugin < Vagrant.plugin(2)

      name 'vagrant-vm-group'
      description 'Plugin allows to group VMs'

      command(:group) do
        require_relative 'command'
        Command
      end

      config(:group) do
        require_relative 'config'
        Config
      end
      
    end # Plugin
  end # Group
end # VagrantPlugins
