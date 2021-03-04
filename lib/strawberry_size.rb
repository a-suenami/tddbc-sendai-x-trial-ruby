class StrawberrySize
  private def initialize(size)
    @size = size
  end

  def self.double_large
    new('LL')
  end

  def self.large
    new('L')
  end

  def self.medium
    new('M')
  end

  def self.small
    new('S')
  end

  def to_s
    @size
  end
end