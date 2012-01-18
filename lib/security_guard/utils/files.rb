module SecurityGuard
  module Utils
    class Files
      def self.load(filename)
        File.expand_path("../../../../data/#{filename}", __FILE__)
      end

      def self.to_array(line_delimited_file)
        File.readlines(line_delimited_file).map{ |line| line.sub("\n", '') }
      end
    end
  end
end