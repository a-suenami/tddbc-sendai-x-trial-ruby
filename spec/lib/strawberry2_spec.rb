describe Strawberry2 do
  describe '#to_s' do
    describe 'あまおう: L' do
      let(:strawberry) { Strawberry2.new('あまおう', 'L') }
      it { expect(strawberry.to_s).to eq 'あまおう: L' }
    end

    describe 'とちおとめ: S' do
      let(:strawberry) { Strawberry2.new('とちおとめ', 'S') }
      it { expect(strawberry.to_s).to eq 'とちおとめ: S' }
    end
  end

  describe '.factory' do
    describe 'とちおとめ: 30g' do
      let(:strawberry) { Strawberry2.factory('とちおとめ', weight: 30) }
      it { expect(strawberry.to_s).to eq 'とちおとめ: LL' }
    end

    describe 'とちおとめ: 24g' do
      let(:strawberry) { Strawberry2.factory('とちおとめ', weight: 24) }
      it { expect(strawberry.to_s).to eq 'とちおとめ: L' }
    end
    describe 'とちおとめ: 19g' do
      let(:strawberry) { Strawberry2.factory('とちおとめ', weight: 19) }
      it { expect(strawberry.to_s).to eq 'とちおとめ: M' }
    end
    describe 'あまおう: 9g' do
      let(:strawberry) { Strawberry2.factory('とちおとめ', weight: 9) }
      it { expect(strawberry.to_s).to eq 'とちおとめ: S' }
    end
  end
end