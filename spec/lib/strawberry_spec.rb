describe Strawberry do
  context '未定義の品種の場合' do
    it '作成に失敗する' do
      expect { Strawberry.new('未定義の品種', 30) }.to raise_error ArgumentError
    end
  end
  context '0g以下の場合' do
    it '作成に失敗する' do
      expect { Strawberry.new('あまおう', 0) }.to raise_error ArgumentError
    end
  end

  describe '#to_s' do
    describe 'あまおう: 30g' do
      let(:strawberry) { Strawberry.new('あまおう', 30) }
      it { expect(strawberry.to_s).to eq 'あまおう: 30g' }
    end
    describe 'とちおとめ: 20g' do
      let(:strawberry) { Strawberry.new('とちおとめ', 20) }
      it { expect(strawberry.to_s).to eq 'とちおとめ: 20g' }
    end
  end

  describe '#size' do
    shared_examples_for 'size_gettable' do
      let(:type) { ['あまおう', 'とちおとめ', 'さがほのか'].sample }
      let(:strawberry) { Strawberry.new(type, weight) }
      it { expect(strawberry.size).to eq expected }
    end

    describe '20g' do
      let(:weight) { 20 }
      let(:expected) { 'L' }
      it_should_behave_like 'size_gettable'
    end
    describe '19g' do
      let(:weight) { 19 }
      let(:expected) { 'M' }
      it_should_behave_like 'size_gettable'
    end
    describe '10g' do
      let(:weight) { 10 }
      let(:expected) { 'M' }
      it_should_behave_like 'size_gettable'
    end
    describe '9g' do
      let(:weight) { 9 }
      let(:expected) { 'S' }
      it_should_behave_like 'size_gettable'
    end
  end
end
