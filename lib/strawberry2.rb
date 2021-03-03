class Strawberry2
  private def initialize(type, size)
    @type = type
    @size = size
  end

  def self.factory(type, weight: nil, size: nil)
    if weight
      size = weight_to_size(weight)
    end
    new(type, size)
  end

  def to_s
    "#{@type}: #{@size}"
  end

  def same_size_as?(another)
    true
  end

  private

  def self.weight_to_size(weight)
    if weight < 10
      'S'
    elsif weight < 20
      'M'
    elsif weight < 25
      'L'
    else
      'LL'
    end
  end
end
