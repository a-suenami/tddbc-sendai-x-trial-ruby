describe Strawberry2Pack do
  describe '#same_type_all?' do
    it do
      strawberry1 = Strawberry2.factory('あまおう', size: 'LL')
      strawberry2 = Strawberry2.factory('あまおう', size: 'L')
      strawberry3 = Strawberry2.factory('あまおう', size: 'M')
      pack = Strawberry2Pack.new(strawberry1, strawberry2, strawberry3)
      expect(pack).to be_same_type_all
    end

    it do
      strawberry1 = Strawberry2.factory('あまおう', size: 'LL')
      strawberry2 = Strawberry2.factory('とちおとめ', size: 'L')
      strawberry3 = Strawberry2.factory('さがほのか', size: 'M')
      pack = Strawberry2Pack.new(strawberry1, strawberry2, strawberry3)
      expect(pack).not_to be_same_type_all
    end
  end
end
