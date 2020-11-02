arr = [1,2,3,4,10]

module MyEnumerables
  def my_each(arr)
    elmts_len = arr.length
    k = 0
    while k < elmts_len
      if arr[k] % 2 == 0
        puts arr[k]
      end
      k += 1
    end
  end
end

class MyEnumerablesClass
  include MyEnumerables
end

enums = MyEnumerablesClass.new
p enums.my_each(arr)