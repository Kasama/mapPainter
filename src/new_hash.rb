class NewHash < Hash

  attr_reader :number_of_zeros
  attr_reader :last_consumed

  def initialize
    super
    @last_consumed = nil
    @number_of_zeros = self.length
    @next_index = 1
  end

  def has_keys
    @number_of_zeros > 0
  end

  def consume_key(key)
    self[key] = @next_index
    @next_index = @next_index + 1
    @last_consumed = key
  end

  def restore_key
    self[self.key @next_index] = 0
    @next_index = @next_index - 1
  end

  def []=(key, value)
    old_value = self[key]
    super key, value
    if old_value == 0 and value != 0
      @number_of_zeros = @number_of_zeros - 1
    elsif old_value != 0 and value == 0
      @number_of_zeros = @number_of_zeros + 1
    end
  end

end