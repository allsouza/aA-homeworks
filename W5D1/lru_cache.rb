class LRUCache

    def initialize(size)
        @size = size
        @information = []
    end

    def count
      @information.count
    end

    def add(el)
      @information << el
    end

    def show
        p @information
    end

    private
    # helper methods go here!

  end