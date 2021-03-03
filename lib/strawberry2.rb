class Strawberry2
  attr_reader :size

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

  def size_diff_from(another)
    size_value = {
      'S' => 1,
      'M' => 2,
      'L' => 3,
      'LL' => 4
    }
    (size_value[self.size] - size_value[another.size]).abs
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
