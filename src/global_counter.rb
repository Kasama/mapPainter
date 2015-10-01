class GlobalCounter

  def self.init
    @@counter = 0
  end

  def self.increment
    @@counter = @@counter + 1
  end

  def self.get
    @@counter
  end

end