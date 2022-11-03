module Enumerable
  def my_each
    for el in self do
      yield el
    end
    self
  end

  def my_each_with_index
    i = 0
    for el in self do
      yield el, i
      i+=1
    end
  end

  def my_select
    x = []
    my_each {|el| x.push(el) if yield el}
    x

  end

  def my_all?
   
      result = true
      my_each { |i| result = false if yield(i) == false }
      result

  end

  def my_any?
    result = true
      my_each do |i| 
        if yield(i) == false
          result = false 
        end
        if yield(i) == true
          result = true 
        end
    
      end
      result
  end

  def my_none?
    result = true
    my_each do |i| 
      if yield(i) == true
        result = false 
      end
      if yield(i)
        result = false
      end
  
    end
    result
  end

  def my_count
    if block_given?

      counter = 0
      my_each { |i| counter += 1 if yield(i) }
      counter
  
    else
    self.count()
    end
  end

  def my_map
    array = []
    my_each {|i| array << yield(i)}
    array
  end

  def my_inject(accumulator=0)
    
    base = accumulator
    i = 0
    until i == self.length do
      base = yield(base, self[i])
      i += 1
    end
    base
    

  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array

end

