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
  end
end