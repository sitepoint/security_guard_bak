module SecurityGuard
  module Utils
    module AcceptsFromFile
      def self.included(klass)
        klass.extend ClassMethods
      end

      module ClassMethods
        def accepts_from_file(*attributes)
          attributes.each do |attribute|
            self.send :attr_accessor, attribute
            self.send :define_method, "#{attribute}_from_file=", lambda { |file|
              self.send "#{attribute}=", SecurityGuard::Utils::Files.to_array(file)
            }
          end
        end
      end
    end
  end
end