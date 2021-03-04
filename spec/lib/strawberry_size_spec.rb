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

  describe '#diff' do
    [
      { one: StrawberrySize.double_large, another: StrawberrySize.double_large, expected: 0 },
      { one: StrawberrySize.double_large, another: StrawberrySize.large,        expected: 1 },
      { one: StrawberrySize.double_large, another: StrawberrySize.medium,       expected: 2 },
      { one: StrawberrySize.double_large, another: StrawberrySize.small,        expected: 3 },
      { one: StrawberrySize.large,        another: StrawberrySize.double_large, expected: 1 },
      { one: StrawberrySize.large,        another: StrawberrySize.large,        expected: 0 },
      { one: StrawberrySize.large,        another: StrawberrySize.medium,       expected: 1 },
      { one: StrawberrySize.large,        another: StrawberrySize.small,        expected: 2 },
      { one: StrawberrySize.medium,       another: StrawberrySize.double_large, expected: 2 },
      { one: StrawberrySize.medium,       another: StrawberrySize.large,        expected: 1 },
      { one: StrawberrySize.medium,       another: StrawberrySize.medium,       expected: 0 },
      { one: StrawberrySize.medium,       another: StrawberrySize.small,        expected: 1 },
      { one: StrawberrySize.small,        another: StrawberrySize.double_large, expected: 3 },
      { one: StrawberrySize.small,        another: StrawberrySize.large,        expected: 2 },
      { one: StrawberrySize.small,        another: StrawberrySize.medium,       expected: 1 },
      { one: StrawberrySize.small,        another: StrawberrySize.small,        expected: 0 },
    ].each do |param|
      context "one=#{param[:one]}, another=#{param[:another]}" do
        subject { param[:one].diff(param[:another]) }
        it { is_expected.to eq param[:expected] }
      end
    end
  end
end
