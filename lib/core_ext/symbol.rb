class Symbol
  def to_proc
    Proc.new { |obj, *args| obj.send(self, *args) }
  end
end
