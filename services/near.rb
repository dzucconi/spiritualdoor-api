class Near
  def initialize(choose, scalars = [])
    @choose = choose
    @left, @right = scalars
  end

  def detect(heading)
    [@left.scale(heading), @right.scale(heading)]
      .send(@chose)
  end
end
