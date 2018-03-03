class Project

  def done?
    @tasks.all?(&:complete?)
  end

  def initialize
    @tasks = []
  end
  attr_accessor :tasks
end
