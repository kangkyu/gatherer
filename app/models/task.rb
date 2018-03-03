class Task
  def initialize(completed: false, size: nil)
    @completed = completed
    @size = size
  end
  attr_reader :size

  def complete?
    @completed
  end

  def mark_completed
    @completed = true
  end
end
