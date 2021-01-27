require 'enumerable_blocks'

describe 'Enumerable' do
  let(:arr_num) { [1, 2, 3] }
  let(:arr_strings) { %w[ant bear cat] }
  let(:arr_hash) { { firstname: 'Mina', lastname: 'Ahmad' } }
  let(:range) { (5..10) }

  describe '#my_each' do
    it 'returns all the elements of an array' do
      expect(arr_num.my_each { |n| puts n }).to eq(arr_num)
    end

    it 'returns all the string of an array ' do
      expect(arr_strings.my_each { |n| puts n }).to eq(arr_strings)
    end

    it 'returns all the elements of a hash' do
      expect(arr_hash.my_each { |n| puts n }).to eq(arr_hash)
    end
  end

  describe '#my_each_with_index' do
    it 'returns two arguments, the item and its index.' do
      expect(arr_num.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_num)
    end

    it 'returns the string item and its index.' do
      expect(arr_strings.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_strings)
    end

    it 'returns two arguments of a hash.' do
      expect(arr_hash.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_hash)
    end
  end

  describe '#my_select' do
    it 'filter a new array and return elements that meet the condition' do
      expect(arr_num.my_select { |n| n > 1 }).to eq([2, 3])
    end

    it 'returns a new array that satisfy the condition' do
      expect(arr_strings.my_select { |n| n.start_with? 'a' }).to eq(['ant'])
    end

    it 'returns the elements of a hash' do
      expect(arr_hash.my_select { |_k, v| v == 'Mina' }).to eq([[:firstname, 'Mina']])
    end
  end

  describe '#my_all?' do
    it 'returns true if the block never returns false or nil.' do
      expect(arr_num.my_all? { |n| n > 0 }).to eq(true)
    end

    it 'returns true if the word.length > 2' do
      expect(arr_strings.my_all? { |n| n.size > 2 }).to eq(true)
    end
  end

  describe '#my_any?' do
    it 'returns true if any element of the block satisfies the condition' do
      expect(arr_strings.my_any? { |word| word.length >= 3 }).to eq(true)
    end

    it 'returns true if any word has > 3 length' do
      expect(arr_strings.my_any? { |n| n.size > 3 }).to eq(true)
    end
  end

  describe '#my_none?' do
    it 'returns true if none of the elements are > 0.' do
      expect(arr_num.my_none? { |n| n > 0 }).to eq(false)
    end

    it 'returns true if the elements are not a number.' do
      expect(arr_strings.my_none?(/d/)).to eq(true)
    end

    it 'returns true if the elements are not a number.' do
      arr = [1, 3.14, 42]
      expect(arr.my_none?(Float)).to eq(false)
    end
  end
end
