module VagrantPlugins
  module Group
    class Config < Vagrant.plugin(2, :config)

      attr_accessor :groups

      def initialize
        @groups = UNSET_VALUE
      end

      def finalize!
        @groups = {} if @groups == UNSET_VALUE
      end

    end # Config
  end # Group
end # VagrantPlugins
