require 'enumerable_blocks'

describe 'Enumerable' do
  let(:arr_num) { [1, 2, 3] }
  let(:arr_strings) { %w[ant bear cat] }
  let(:range_of_num) { (1..6) }
  let(:arr_hash) { { firstname: 'Mina', lastname: 'Ahmad' } }

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

    it 'returns two arguments, the string elem and its index.' do
      expect(arr_strings.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_strings)
    end

    it 'returns two arguments, the string elem and its index.' do
      expect(arr_hash.my_each_with_index { |num, index| puts "#{num}, #{index}" }).to eq(arr_hash)
    end
  end

  describe '#my_select' do
    it 'returns a new array by filtering elements that meet condition' do
      expect(arr_num.my_select { |n| n > 1 }).to eq([2, 3])
    end
  end
end
