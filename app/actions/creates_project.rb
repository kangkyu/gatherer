class CreatesProject

  attr_accessor :project

  def initialize(name: "")
    @project_name = name
  end

  def build
    self.project = Project.create(name: @project_name)
  end
end
