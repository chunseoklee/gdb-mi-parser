# encoding: utf-8

  class ResultList
    def initialize(hash = nil)
      @values = []
      @names = []
      merge!(hash) if hash
    end

    include Enumerable
    def each(&block)
      @values.each(&block)
    end

    def each_pair(&block)
      if block
        @values.each_index do |i|
          block.call(@names[i], @values[i])
        end
      else
        Enumerator.new do |yielder|
          @values.each_index do |i|
            yielder << [@names[i], @values[i]]
          end
        end
      end
    end

    def merge!(hash)
      hash.each_pair do |key, val|
        @values << val
        @names << key
      end
      return self
    end
  end
