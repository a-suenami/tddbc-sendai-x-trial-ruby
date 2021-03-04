class StrawberrySize
  private def initialize(size, rank)
    @size = size
    @rank = rank
  end

  def self.double_large
    new('LL', 4)
  end

  def self.large
    new('L', 3)
  end

  def self.medium
    new('M', 2)
  end

  def self.small
    new('S', 1)
  end

  def diff(another)
    (self.to_i - another.to_i).abs
  end

  def to_s
    @size
  end

  def to_i
    @rank
  end
end