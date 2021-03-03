class Strawberry
  def initialize(type, weight)
    unless ['あまおう', 'とちおとめ', 'さがほのか'].include?(type)
      raise ArgumentError, "#{type}は未定義の品種です"
    end
    unless weight > 0
      raise ArgumentError, "#{weight}は1g以上を指定してください"
    end

    @type = type
    @weight = weight
  end

  def to_s
    "#{@type}: #{@weight}g"
  end

  def size
    if @weight < 10
      'S'
    elsif @weight < 20
      'M'
    else
      'L'
    end
  end
end
