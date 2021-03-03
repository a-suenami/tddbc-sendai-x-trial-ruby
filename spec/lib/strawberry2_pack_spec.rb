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
    [
      ['LL', 'LL',                         'LL', 0],
      ['LL', ['LL', 'L'].sample,           'L',  1],
      ['LL', ['LL', 'L', 'M'].sample,      'M',  2],
      ['LL', ['LL', 'L', 'M', 'S'].sample, 'S',  3],

      ['L', 'L',                           'L', 0],
      ['L', ['L', 'M'].sample,             'M', 1],
      ['L', 'M',                           'S', 2],

      ['M', 'M',                           'M', 0],
      ['M', ['M', 'S'].sample,             'S', 1],

      ['S', 'S',                           'S', 0],
    ].each do |size1, size2, size3, expected|
      context "max=#{size1}, min=#{size3}" do
        let(:type) { ['あまおう', 'とちおとめ', 'さがほのか'].sample }

        let(:pack) do
          strawberry1 = Strawberry2.factory(type, size: size1)
          strawberry2 = Strawberry2.factory(type, size: size2)
          strawberry3 = Strawberry2.factory(type, size: size3)
          Strawberry2Pack.new(strawberry1, strawberry2, strawberry3)
        end

        subject { pack.max_size_diff }

        it { is_expected.to eq expected }
      end
    end
  end
end
