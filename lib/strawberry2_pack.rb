class Strawberry2Pack
  def initialize(strawberry1, strawberry2, strawberry3)
    @strawberry1, @strawberry2, @strawberry3 = strawberry1, strawberry2, strawberry3
  end

  def same_type_all?
    [@strawberry1, @strawberry2, @strawberry3].map(&:type).uniq.length == 1
  end

  def max_size_diff
    diff1 = @strawberry1.size_diff_from(@strawberry2)
    diff2 = @strawberry2.size_diff_from(@strawberry3)
    diff3 = @strawberry3.size_diff_from(@strawberry1)
    [diff1, diff2, diff3].max

    # 別解:
    # arr = [@strawberry1, @strawberry2, @strawberry3].map(&:size)
    # arr.product(arr).map{ |a, b| a - b }.max
  end
end
