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

  def part_of_velocity?
    false
  end

  def points_toward_velocity
    part_of_velocity? ? size : 0
  end
end
