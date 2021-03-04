describe StrawberrySize do
  describe '#to_s' do
    [
      { subject: StrawberrySize.double_large, description: 'double large size', expected: 'LL' },
      { subject: StrawberrySize.large,        description: 'large size', expected: 'L' },
      { subject: StrawberrySize.medium,       description: 'medium size', expected: 'M' },
      { subject: StrawberrySize.small,        description: 'small size', expected: 'S' }
    ].each do |testcase|
      describe testcase[:description] do
        subject { testcase[:subject].to_s }
        it { is_expected.to eq testcase[:expected] }
      end
    end
  end
end
