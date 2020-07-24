

# EXERCISE 1

class Stack

    def initialize
        @data = []
    end

    def push(el)
        @data.push(el)
    end

    def pop
        @data.pop
    end

    def peek
        @data.last
    end

end

# s1 = Stack.new
# p s1.push(1)
# p s1.push(5)
# p s1.push(4)
# p s1.push(3)
# p s1.push(2)

# p s1.peek
# p s1
# p s1.pop
# p s1
# p s1.push(10)
# p s1.peek
#  s1.pop
#  s1.pop
# p s1

# EXERCISE 2