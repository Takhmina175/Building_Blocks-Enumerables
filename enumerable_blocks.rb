module Enumerable
  # my_each
  def my_each
    return to_enum(:my_each) unless block_given?

    element = if instance_of?(Array)
                self
              else
                to_a
              end

    k = 0
    while k < element.length
      yield element[k]
      k += 1
    end
    self
  end

  # my_each_with_index
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    element = to_a
    k = 0
    while k < element.length
      yield element[k], k
      k += 1
    end
    self
  end

  # my_select
  def my_select
    return to_enum(:my_select) unless block_given?

    arr = []
    my_each { |i| arr << i if yield i }
    arr
  end

  # my_all?
  def my_all?(&my_block)
    my_block.call
  end

  # my_any?
  def my_any?(_arr, _name)
    yield
  end

  # my_none?
  def my_none?(arr)
    arr.each do |i|
      yield i
    end
  end

  def my_count(param = nil)
    if !block_given? && param.nil?
      count = to_a.length
    elsif block_given?
      my_each { |element| count += 1 if yield element }
    else
      count = my_select { |element| element == param }.length
    end
    count
  end

  def my_map(param = nil)
    return to_enum(:my_map) unless block_given? || param

    arr = []
    if param.nil?
      my_each { |element| arr << yield(element) }
    else
      # This is for procs/lambdas
      my_each { |element| arr << param.call(element) }
    end
    arr
  end

  def my_inject(param = nil, symbol = nil)
    if (!param.nil? && symbol.nil?) && (param.is_a?(Symbol) || param.is_a?(String))
      # If the param is not nil and the symbol is not nil and param is a symbol or param is a string:
      symbol = param # symbol is now param
      param = nil # param is now nil
    end
    if !block_given? && !symbol.nil? # If no block and symbol is not nil
      # param is either the item or a send to param's symbol depending if it's nil or not
      my_each { |item| param = param.nil? ? item : param.send(symbol, item) }
    else
      my_each { |item| param = param.nil? ? item : yield(param, item) }
    end
    param
  end
end

def multiply_els(items)
  items.my_inject(:*)
end