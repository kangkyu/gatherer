class Project

  attr_accessor :tasks
  def initialize
    @tasks = []
  end

  def done?
    tasks.reject(&:complete?).empty?
  end

  def total_size
    tasks.sum(&:size)
  end

  def remaining_size
    tasks.reject(&:complete?).sum(&:size)
  end

  def completed_velocity
    tasks.sum(&:points_toward_velocity)
  end

  def current_rate
    completed_velocity * 1.0 / 21
  end
end
