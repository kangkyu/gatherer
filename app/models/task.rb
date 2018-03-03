class Task

  attr_reader :size
  def initialize(options = {})
    @completed = options[:completed]
    @size = options[:size]
  end

  def complete?
    @completed
  end

  def mark_completed
    @completed = true
  end
end
