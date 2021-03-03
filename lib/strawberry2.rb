class Strawberry2
  def initialize(type, size)
    @type = type
    @size = size
  end

  def self.factory(type, weight: nil)
    size = weight_to_size(weight)
    new(type, size)
  end

  def to_s
    "#{@type}: #{@size}"
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
