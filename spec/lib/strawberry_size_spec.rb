describe StrawberrySize do
  # describe '.factory' do
  #   shared_examples_for '重さから作成したオブジェクト' do
  #     let(:type) { ['あまおう', 'とちおとめ', 'さがほのか'].sample }
  #     subject { Strawberry2.factory(type, weight: weight).to_s }
  #     it { is_expected.to eq expected }
  #   end
  # end

  it do
    size = StrawberrySize.large
    expect(size.to_s).to eq 'L'
  end
end
