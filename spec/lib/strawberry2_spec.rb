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

  describe 'サイズ比' do
    let(:type) { ['あまおう', 'とちおとめ', 'さがほのか'].sample }

    [
      { one: 'LL', another: 'LL', expected: 0 },
      { one: 'LL', another: 'L',  expected: 1 },
      { one: 'LL', another: 'M',  expected: 2 },
      { one: 'LL', another: 'S',  expected: 3 },
      { one: 'L', another: 'LL',  expected: 1 },
      { one: 'L', another: 'L',   expected: 0 },
      { one: 'L', another: 'M',   expected: 1 },
      { one: 'L', another: 'S',   expected: 2 },
      { one: 'M', another: 'LL',  expected: 2 },
      { one: 'M', another: 'L',   expected: 1 },
      { one: 'M', another: 'M',   expected: 0 },
      { one: 'M', another: 'S',   expected: 1 },
      { one: 'S', another: 'LL',  expected: 3 },
      { one: 'S', another: 'L',   expected: 2 },
      { one: 'S', another: 'M',   expected: 1 },
      { one: 'S', another: 'S',   expected: 0 },
    ].each do |param|
      context "one=#{param[:one]}, another=#{param[:another]}" do
        let(:one) { Strawberry2.factory(type, size: param[:one]) }
        let(:another) { Strawberry2.factory(type, size: param[:another]) }
        subject { one.size_diff_from(another) }
        it { is_expected.to eq param[:expected] }
      end
    end
  end
end