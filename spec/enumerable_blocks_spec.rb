require 'enumerable_blocks'

describe 'Enumerable' do
  let(:arr_num) { [1, 2, 3] }
  let(:arr_strings) { %w[ant bear cat] }
  let(:arr_hash) { { firstname: 'Mina', lastname: 'Ahmad' } }
  let(:range) { (5..10) }
  let(:ouput) { [] }

  # testing code for my_each method
  describe '#my_each' do
    it 'does not change the original array' do
      expect(arr_num.my_each { |n| puts n * 4 }).to eq(arr_num)
    end

    it 'returns all the elements of an array' do
      expect(arr_num.my_each { |n| puts n }).to eq(arr_num)
    end

    it 'returns all the elements of a hash' do
      expect(arr_hash.my_each { |n| puts n }).to eq(arr_hash)
    end
  end
  # testing code for my_each_with_index method
  describe '#my_each_with_index' do
    it 'it does not change the order of the index' do
      expect(arr_num.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_num)
    end

    it 'returns two arguments, the item and its index.' do
      expect(arr_num.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_num)
    end

    it 'returns the string item and its index.' do
      expect(arr_strings.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_strings)
    end
  end
  # testing code for my_select method
  describe '#my_select' do
    it 'does not return nil if the elements were not found' do
      expect(arr_strings.my_select { |n| n.start_with? 'j' }).to eq([])
    end

    it 'filter an array and return elements that meet the condition' do
      expect(arr_num.my_select { |n| n > 1 }).to eq([2, 3])
    end

    it 'returns an Enumerator when the block was not provided' do
      expect(arr_num.my_select).to be_an(Enumerator)
    end

    it 'returns a new array' do
      expect(arr_strings.my_select { |n| n.start_with? 'a' }).to eq(['ant'])
    end

    it 'filter and return selected elements of a hash' do
      expect(arr_hash.my_select { |_k, v| v == 'Mina' }).to eq([[:firstname, 'Mina']])
    end
  end
  # testing code for my_all? method
  describe '#my_all?' do
    it 'does not return true if the block returns false' do
      expect(arr_strings.my_all? { |n| n.size > 6 }).to eq(false)
    end

    it 'does not return true if the block returns false' do
      arr = [1, nil, true, 5.12]
      expect(arr.my_all?).to eq(false)
    end

    it 'returns true if the block never returns false or nil.' do
      expect(arr_num.my_all? { |n| n > 0 }).to eq(true)
    end

    it 'returns true if the word.length > 2' do
      expect(arr_strings.my_all? { |n| n.size > 2 }).to eq(true)
    end

    it 'returns true if the arr is empty' do
      expect(ouput.my_all?).to eq(true)
    end
  end
  # testing code for my_any? method
  describe '#my_any?' do
    it 'returns false if the block does not satisfy the condition' do
      expect(arr_strings.my_any?(/j/)).to eq(false)
    end

    it 'returns false if the block does not satisfy the condition' do
      expect(arr_strings.my_any?(/j/)).to eq(false)
    end

    it 'returns false if the arr is empty' do
      expect(ouput.my_any?).to eq(false)
    end

    it 'returns true if any element of the block satisfies the condition' do
      expect(arr_strings.my_any? { |word| word.length >= 3 }).to eq(true)
    end

    it 'returns true if any word has > 3 length' do
      expect(arr_strings.my_any? { |n| n.size > 3 }).to eq(true)
    end
  end
  # testing code for my_none? method
  describe '#my_none?' do
    it 'returns true if none of the elements == 0.' do
      expect(arr_num.my_none? { |n| n == 0 }).to eq(true)
    end

    it 'returns true if the elements are not a number.' do
      expect(arr_strings.my_none?(/d/)).to eq(true)
    end

    it 'returns false if any elements of the arr is true.' do
      arr = [1, 3.14, 42]
      expect(arr.my_none?(Float)).to eq(false)
    end

    it 'returns false if any elements of the arr is true.' do
      arr = [nil, false, true]
      expect(arr.my_none?).to eq(false)
    end
  end

  # testing code for my_count method
  describe '#my_count' do
    it 'increments the number by one.' do
      count = 0
      expect { count += 1 }.to change { count }.from(0).to(1)
    end
    it 'returns the number of items in the array.' do
      expect(arr_num.my_count).to eq(3)
    end
    it 'returns the number of even elements.' do
      arr = [1, 2, 4, 2]
      expect(arr.my_count(&:even?)).to eq(3)
    end
  end
  # testing code for my_map method
  describe '#my_map' do
    it 'returns a new array by chenging the original array' do
      expect(arr_num.my_map { |n| n * 2 }).to eq([2, 4, 6])
    end
    it 'returns a new string of the array.' do
      expect(arr_strings.my_map { |n| "#{n}!" }).to eq(['ant!', 'bear!', 'cat!'])
    end

    it 'converts strings to integers.' do
      arr = %w[11 12 13]
      expect(arr.my_map(&:to_i)).to eq([11, 12, 13])
    end

    it 'converts hash values to symbols.' do
      expect(arr_hash.my_map { |k, v| [k, v.to_sym] }.to_h).to eq({ firstname: :Mina, lastname: :Ahmad })
    end
  end
  # testing code for my_inject method
  describe '#my_inject' do
    it 'Combines all elements of enum by applying a binary operation' do
      expect(arr_num.my_inject { |sum, n| sum + n }).to eq(6)
    end
    it 'Combines all elements in a given range by performing an addition operation.' do
      expect(range.my_inject { |sum, n| sum + n }).to eq(45)
    end
    it 'Combines all elements in a given range by performing an multiplication operation' do
      expect(range.my_inject(1, :*)).to eq(151_200)
    end
  end
end
