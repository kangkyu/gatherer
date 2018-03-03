class Project

  def done?
    @tasks.none?
  end

  def initialize
    @tasks = []
  end
  attr_accessor :tasks
end
