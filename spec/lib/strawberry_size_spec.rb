describe StrawberrySize do
  it do
    size = StrawberrySize.double_large
    expect(size.to_s).to eq 'LL'
  end

  it do
    size = StrawberrySize.large
    expect(size.to_s).to eq 'L'
  end

  it do
    size = StrawberrySize.medium
    expect(size.to_s).to eq 'M'
  end

  it do
    size = StrawberrySize.small
    expect(size.to_s).to eq 'S'
  end
end
