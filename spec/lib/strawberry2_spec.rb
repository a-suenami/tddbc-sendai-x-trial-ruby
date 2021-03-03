describe Strawberry2 do
  describe '.factory' do
    shared_examples_for '重さから作成したオブジェクト' do
      let(:type) { ['あまおう', 'とちおとめ', 'さがほのか'].sample }
      subject { Strawberry2.factory(type, weight: weight).to_s }
      it { is_expected.to eq expected }
    end

    describe '重さ=25g' do
      let(:weight) { 25 }
      let(:expected) { "#{type}: LL" }
      it_should_behave_like '重さから作成したオブジェクト'
    end

    describe '重さ=24g' do
      let(:weight) { 24 }
      let(:expected) { "#{type}: L" }
      it_should_behave_like '重さから作成したオブジェクト'
    end

    describe '重さ=20g' do
      let(:weight) { 20 }
      let(:expected) { "#{type}: L" }
      it_should_behave_like '重さから作成したオブジェクト'
    end

    describe '重さ=19g' do
      let(:weight) { 19 }
      let(:expected) { "#{type}: M" }
      it_should_behave_like '重さから作成したオブジェクト'
    end

    describe '重さ=10g' do
      let(:weight) { 10 }
      let(:expected) { "#{type}: M" }
      it_should_behave_like '重さから作成したオブジェクト'
    end

    describe '重さ=9g' do
      let(:weight) { 9 }
      let(:expected) { "#{type}: S" }
      it_should_behave_like '重さから作成したオブジェクト'
    end

    shared_examples_for 'サイズから作成したオブジェクト' do
      let(:type) { ['あまおう', 'とちおとめ', 'さがほのか'].sample }
      subject { Strawberry2.factory(type, size: size).to_s }
      it { is_expected.to eq expected }
    end

    describe 'LL' do
      let(:size) { 'LL' }
      let(:expected) { "#{type}: LL" }
      it_should_behave_like 'サイズから作成したオブジェクト'
    end
    describe 'L' do
      let(:size) { 'L' }
      let(:expected) { "#{type}: L" }
      it_should_behave_like 'サイズから作成したオブジェクト'
    end
    describe 'M' do
      let(:size) { 'M' }
      let(:expected) { "#{type}: M" }
      it_should_behave_like 'サイズから作成したオブジェクト'
    end
    describe 'S' do
      let(:size) { 'S' }
      let(:expected) { "#{type}: S" }
      it_should_behave_like 'サイズから作成したオブジェクト'
    end
  end

  describe '#same_size_as?' do
    let(:type) { ['あまおう', 'とちおとめ', 'さがほのか'].sample }
    subject { Strawberry2.factory(type, size: 'LL') }
    it do
      another = Strawberry2.factory(type, size: 'LL')
      is_expected.to be_same_size_as(another)
    end

    it do
      another = Strawberry2.factory(type, size: 'L')
      is_expected.not_to be_same_size_as(another)
    end
  end
end