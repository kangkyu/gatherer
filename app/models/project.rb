class Project < ActiveRecord::Base

  has_many :tasks

  validates :name, presence: true

  def done?
    tasks.reject(&:complete?).empty?
  end

  def total_size
    tasks.to_a.sum(&:size)
  end

  def remaining_size
    tasks.reject(&:complete?).sum(&:size)
  end

  def completed_velocity
    tasks.to_a.sum(&:points_toward_velocity)
  end

  def current_rate
    completed_velocity * 1.0 / Project.velocity_length_in_days
  end

  def self.velocity_length_in_days
    21
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    return false if projected_days_remaining.nan?
    (Date.today + projected_days_remaining) <= due_date
  end
end
