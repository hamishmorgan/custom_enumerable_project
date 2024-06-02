module Enumerable
  # Your code goes here
  #
  def my_each_with_index
    index = 0
    each do |element|
      yield [element, index]
      index += 1
    end
    self
  end

  def my_select
    result = []
    each do |element|
      result << element if yield(element)
    end
    result
  end

  def my_all?
    each do |element|
      return false unless yield(element)
    end
    return true
  end

  def my_any?
    each do |element|
      return true if yield(element)
    end
    return false
  end

  def my_none?
    each do |element|
      return false if yield(element)
    end
    return true
  end

  def my_count
    return length unless block_given?

    n = 0
    each do |element|
      n += 1 if yield(element)
    end
    return n
  end

  def my_map
    result = []
    each do |element|
      result << yield(element)
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    i = 0
    while i < length
      yield fetch(i)
      i += 1
    end
    self
  end
end
