class NewHash < Hash

  attr_reader :number_of_zeros
  attr_reader :last_consumed

  def initialize
    super
    @last_consumed = nil
    @number_of_zeros = 0
    @next_index = 1
  end

  def has_keys
    @number_of_zeros > 0
  end

  def has(key)
    if self[key.to_s.to_sym] == 0
      true
    else
      false
    end
  end

  def consume_key(key)
    self[key.to_s.to_sym] = @next_index
    puts "==========set #{key} to #{@next_index} new next_index++ #{self.to_s}"
    @next_index = @next_index + 1
    @last_consumed = key.to_s.to_sym
  end

  def restore_key
    # puts "==========using index #{@next_index} to find key"
    self[self.key self.values.max] = 0
    puts "==========restore #{self.to_s}"
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