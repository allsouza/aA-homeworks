require 'byebug'

class Octopus
    attr_reader :array
    
    def initialize
        @array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
    end

    def sluggish_octopus
        longest = ""
        (0...array.length).each do |first|
            (first...array.length).each do |last|
                longest = array[last] if (array[last].length > array[first].length)
            end
        end
        longest
    end

    def merge_sort(arr)
        prc = Proc.new { |a,b| a.length <=> b.length }
        middle = arr.length/2
        return arr if arr.length <= 1
        first = merge_sort(arr[0...middle])
        last = merge_sort(arr[middle..-1])
        merge(first, last, prc)
    end

    def merge(first, last, prc)
        result = []
        until first.empty? || last.empty?
            if first.first.length < last.first.length
                result << first.shift
            else
                result << last.shift
            end
        end
        result += first + last
    end

    def dominant_octopus
       merge_sort(array).last
    end

    def clever_octopus
        array.inject do |longest, ele|
            if longest.length < ele.length
                longest = ele
            else
                longest
            end
        end
    end

end

octo = Octopus.new

p octo.sluggish_octopus
p octo.dominant_octopus
p octo.clever_octopus

class DancingOctopus
    attr_reader :tiles_array, :titles_hash

    def initialize
        @tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
        @titles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3, "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7 }
    end
    
    def slow_dance(dir)
        tiles_array.each_with_index { |direction, idx| return idx if dir == direction }
    end

    def constant_dance(dir)
        titles_hash[dir]
    end

end

dancer = DancingOctopus.new

p dancer.slow_dance("up")
p dancer.slow_dance("right-down")

p dancer.constant_dance("up")
p dancer.constant_dance("right-down")