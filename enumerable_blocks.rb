module Enumerable
  # my_each
  def my_each(arr)
    arr.each do |i|
      yield i
    end
  end

  # my_each_with_index
  def my_each_with_index(arr)
    i = 0
    while i < arr.length
      yield i, arr[i]
      i += 1
    end
  end

  # my_select
  def my_select(arr)
    i = 0
    while i < arr.length
      yield arr[i]
      i += 1
    end
  end

  my_select([1, 2, 3, 4, 5, 6, 7, 8]) do |elem|
    puts elem if elem.even?
  end

  # my_all?
  def my_all(&my_block)
    my_block.call
  end

  # my_any?
  def my_any(_arr, _name)
    yield
  end

  # my_none?
  def my_none(arr)
    arr.each do |i|
      yield i
    end
  end

  def my_count(param = nil)
    count = 0
    :my_count.lenght unless block_given?
    if param.instance_of?(Number)
      each do |element|
        count += 1 if element == param
      end
      count
    else
      my_each { |element| count += 1 if yield(element) }
    end
  end

  def my_map(param = nil)
    to_enum(:my_map) unless block_given? || param
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
    if (!param.nil? && symbol.nil?) && (param.instance_of?(Symbol) || param.instance_of?(String))
      # If the param is not nil and the symbol is not nil and param is a symbol or param is a string:
      symbol = argument # symbol is now param
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

p my_each(%w[a b c d e]) { |elem| puts elem.upcase }
my_each_with_index(%w[ruby css takhmina josias microverse]) { |index, elem| puts "#{index}, #{elem}" }

arr = [1, 2, 3, 4, 5, 6, 7, 8]
my_all do
  puts arr.is_a?(String)
end

array = %w[Josias Mina Microverse]
nm = 'Mina'
my_any(array, nm) { p array.include?(nm) }
my_none(%w[bacon orange apple]) { |k| puts false unless k.size == 5 }