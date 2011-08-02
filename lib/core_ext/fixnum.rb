class Fixnum
  def minute
    self * 60
  end

  def hour
    minute * 60
  end

  def day
    hour * 24
  end

  def week
    day * 7
  end

  def month
    day * 30 
  end

  def year
    day * 365
  end

  def ago(time = Time.now)
    time - self
  end
end
