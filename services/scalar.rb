class Scalar
  def initialize(to, from = nil)
    @to = to
    @from = from
  end

  def from(from)
    Scalar.new(@to, from)
  end

  def scale(n)
    ((@to.max - @to.min) * (n - @from.min)) / (@from.max - @from.min) + @to.min
  end
end
