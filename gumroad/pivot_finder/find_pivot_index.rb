def find_pivot_index(list)
  right_sum_by_index = {}

  # Creates a hash that maps an index to the sum of numbers on the right of the index.
  list.reverse_each.with_index.inject(0) do |right_sum, (number, index)|
    right_sum_by_index[list.length - 1 - index] = right_sum

    right_sum += number
  end

  # Traverses through the list comparing the sum of numbers on the left of the current
  # index against the sum of numbers on right of the current index.
  # Returns the current index if that is a pivot.
  list.each.with_index.inject(0) do |left_sum, (number, index)|
    return index if left_sum == right_sum_by_index[index]

    left_sum += number
  end

  -1
end

[1, 4, 6, 3, 2].tap do |list|
  puts "find_pivot_index(#{list}) = #{find_pivot_index(list)}"
end

# Usage: ruby ./find_pivot_index.rb 1 2 3 0 0 3 3
ARGV.map(&:to_i).tap do |list|
  puts "find_pivot_index(#{list}) = #{find_pivot_index(list)}"
end
