require "byebug"

# EXERCISE 1

class Stack

    def initialize
        @data = []
    end

    def push(el)
        @data.push(el)
    end

    def dequeue
        @data.dequeue
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
# p s1.dequeue
# p s1
# p s1.push(10)
# p s1.peek
#  s1.dequeue
#  s1.dequeue
# p s1

# EXERCISE 2
class Queue

    def initialize
        @line = []
    end

    def enqueue(el)
        @line.unshift(el)
    end

    def dequeue
        @line.dequeue
    end

    def peek
        @line.last
    end

end

# q1 = Queue.new
# p q1.enqueue(1)
# p q1.enqueue(5)
# p q1.enqueue(4)
# p q1.enqueue(3)
# p q1.enqueue(2)

# p q1.peek
# p q1
# p q1.dequeue
# p q1
# p q1.enqueue(10)
# p q1.peek
#  q1.dequeue
#  q1.dequeue
# p q1

# EXERCISE 3
class Map

    def initialize
        @map = []
    end

    def set(key, value)
        @map += [[key, value]] if available?(key)
    end

    def get(key)
        # debugger
        @map.select { |ele| key == ele[0] }
    end

    def show
        @map.each { |ele| print "#{ele[0]} => #{ele[1..-1].join(", ")}, "}
        puts
    end

    def delete(key)
        @map.reject! { |ele| key == ele[0] }
    end

    def available?(key)
        !@map.any? { |ele| key == ele[0] }
    end

end

map1 = Map.new

p map1.set(1,"wow")
p map1.set(2,"woow")
p map1.set(3,"wooow")
p map1.set(4,"woooow")
p map1.set(5,"wooooow")
p map1

p map1.get(4)

p map1.show

p map1.set(1,"shouldnt work")
p map1.set(3,"shouldnt work also")
p map1.get(2)
p map1.delete(3)
p map1.get(3)
p map1.show
p map1.set(3,"should work now")
p map1.get(3)
p map1.show

