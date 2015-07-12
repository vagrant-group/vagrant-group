module VagrantPlugins
  module Group
    class Command < Vagrant.plugin(2, :command)

      COMMANDS = %w(up halt destroy provision hosts)

      def self.synopsis
        "runs vagrant command on specific group of VMs"
      end # self.synopsis
      
      def execute
        options = {}
        opts = OptionParser.new do |o|
          o.banner = sprintf("Usage: vagrant group <group-name> <%s>", COMMANDS.join("|"))
          o.separator ''

          o.on('-h', '--help', 'Print this help') do
            safe_puts(opts.help)
          end
        end

        argv = parse_options(opts)

        group, action = argv[0], argv[1]

        if !group || !action || !COMMANDS.include?(action)
          safe_puts(opts.help)
          return nil
        end

        if action == 'hosts'
          @env.ui.info(sprintf('Hosts in %s group:', group))

          with_target_vms() do |machine|
            if machine.config.group.groups.has_key?(group)
              @env.ui.info(sprintf(' - %s', machine.name))
            elsif
              @env.ui.warn('No hosts associated.')
              break
            end
          end
        elsif
          with_target_vms() do |machine|
            if machine.config.group.groups.has_key?(group)
              if machine.config.group.groups[group].include? machine.name.to_s
                machine.action(action)
              end
            end
          end
        end
      end # execute
      
    end # Command
  end # Group
end # VagrantPlugins
