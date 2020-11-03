#my_each
def my_each(arr)
    for i in arr
      yield i
    end
  end
  
  p my_each(["a", "b", "c", "d", "e"]) {|elem| puts elem.upcase}

#my_each_with_index
 def my_each_with_index(arr)
    i = 0
    while i < arr.length
      yield i, arr[i]
    i += 1
  end
  end
  
  my_each_with_index(%w[ruby css takhmina josias microverse]) {|index, elem| puts "#{index}, #{elem}"}

#my_select
def my_select(arr)
    i = 0
    while i < arr.length
      yield arr[i]
    i += 1
  end
  end
  
  my_select([1, 2, 3, 4, 5, 6, 7, 8]) do |elem|
    if elem % 2 == 0
      puts elem
    end
  end

#my_all?
def my_all(&my_block)
    my_block.call
    end
   
    arr = [1, 2, 3, 4, 5, 6, 7, 8]
    my_all do
      puts arr.is_a?(String)
    end
#my_any?
 def my_any(arr, name)
    yield
    end
  array = ["Josias", "Mina", "Microverse"]
  nm = "Mina"
  my_any(array, nm) { p array.include?(nm)}

#my_none?
def my_none(arr)
    for i in arr
     yield i
   end
   end
   
   my_none(["bacon", "orange", "apple"]) {|k| puts false unless k.size == 5 }
