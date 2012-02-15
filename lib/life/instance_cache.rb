module Life

  module InstanceCache

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      protected

      def cache_instance(instance_name, constructor = nil)
        class_variable = :"@@_cached_instance_#{instance_name}"
        if class_variable_defined? class_variable
          class_variable_get class_variable
        else
          instance = constructor ? constructor.call : yield
          class_variable_set class_variable, instance
        end
      end

    end

  end

end
