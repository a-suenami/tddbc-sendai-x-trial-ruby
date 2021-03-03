describe Strawberry2Pack do
  describe '#same_type_all?' do
    [
      [ 'あまおう', 'あまおう', 'あまおう', 'すべて同じ場合', true ],
      [ 'あまおう', 'あまおう', 'とちおとめ', '2つ同じ(1つ違う)場合', false ],
      [ 'あまおう', 'とちおとめ', 'さがほのか', 'すべて違う場合', false ],
    ].each do |type1, type2, type3, case_description, expected|
      context "#{case_description}" do
        it do
          size1 = ['LL', 'L', 'M', 'S'].sample
          size2 = ['LL', 'L', 'M', 'S'].sample
          size3 = ['LL', 'L', 'M', 'S'].sample
          strawberry1 = Strawberry2.factory(type1, size: size1)
          strawberry2 = Strawberry2.factory(type2, size: size2)
          strawberry3 = Strawberry2.factory(type3, size: size3)
          pack = Strawberry2Pack.new(strawberry1, strawberry2, strawberry3)
          expect(pack.same_type_all?).to eq expected
        end
      end
    end
  end

  describe '#max_size_diff' do
    it '' do
      strawberry1 = Strawberry2.factory('あまおう', size: 'LL')
      strawberry2 = Strawberry2.factory('あまおう', size: 'LL')
      strawberry3 = Strawberry2.factory('あまおう', size: 'LL')
      pack = Strawberry2Pack.new(strawberry1, strawberry2, strawberry3)
      expect(pack.max_size_diff).to eq 0
    end

    it '' do
      strawberry1 = Strawberry2.factory('あまおう', size: 'LL')
      strawberry2 = Strawberry2.factory('あまおう', size: 'L')
      strawberry3 = Strawberry2.factory('あまおう', size: 'LL')
      pack = Strawberry2Pack.new(strawberry1, strawberry2, strawberry3)
      expect(pack.max_size_diff).to eq 1
    end
  end
end
