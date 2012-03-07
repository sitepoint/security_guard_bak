module SecurityGuard
  class Deduplication
    include Concerns::Initializable

    initializable :input_folder, :output_folder
    attr_accessor :source_data, :deduped_data

    def initialize(args = nil)
      @source_data  ||= []
      @deduped_data ||= []
      initializable_attrs args
    end

    def process
      read_data_from input_folder
      dedupe source_data
      write_data_to output_folder
    end

    private

    def read_data_from(folder)
      files = Dir["#{folder}/*"].sort

      raise Exception.new('Input folder is invalid or is empty.') if files.empty?

      files.each do |file|
        source_data << File.readlines(file).map{ |line| line.downcase.strip }
      end
    end

    def write_data_to(folder)
      deduped_data.each_with_index do |array, index|
        File.open("#{folder}/#{index+1}.txt", 'w') do |f|
          f.puts array
        end
      end
    end

    def dedupe(data)
      # start from the lowest array (in terms of dedupe priority)
      data.reverse!
      data_original = data.clone
      data_original.each do |array|
        data.shift
        deduped_data << _deduped_multi(array, data)
      end
      # the top array doesn't need to be compared, just needs to be unique
      deduped_data.last.uniq!
      deduped_data.reverse!
    end

    def _deduped_multi(target, others)
      others.each do |array|
        target = _deduped(target, array)
      end
      target
    end

    def _deduped(target, other)
      (target - other & target).uniq
    end
  end
end
