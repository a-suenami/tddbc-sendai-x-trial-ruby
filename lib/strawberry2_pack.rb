class Strawberry2Pack
  def initialize(strawberry1, strawberry2, strawberry3)
    @strawberry1, @strawberry2, @strawberry3 = strawberry1, strawberry2, strawberry3
  end

  def same_type_all?
    [@strawberry1, @strawberry2, @strawberry3].map(&:type).uniq.length == 1
  end
end
