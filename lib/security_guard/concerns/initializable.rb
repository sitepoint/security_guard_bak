module SecurityGuard
  module Concerns
    module Initializable
      def self.included(klass)
        klass.extend ClassMethods
      end

      def initializable_attrs(attributes)
        attributes.each do |name, value|
          self.send "#{name}=", value
        end
      end

      module ClassMethods
        def initializable(*attributes)
          attributes.each do |name|
            self.send :attr_accessor, name
          end

          unless self.method_defined?(:initialize)
            self.send :define_method, :initialize, lambda { |args|
              initializable_attrs args
            }
          end
        end
      end
    end
  end
end