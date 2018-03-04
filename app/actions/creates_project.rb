class CreatesProject

  attr_accessor :project

  def initialize(name: "", task_string: "")
    @project_name = name
    @task_string = task_string
  end

  def build
    self.project = Project.new(name: @project_name)
    project.tasks = convert_string_to_tasks
    project
  end

  def convert_string_to_tasks
    @task_string.split("\n").map do |line|
      title, size = line.split(":")
      Task.create(title: title, size: (size.to_i.nonzero? || 1))
    end
  end

  def create
    build.save
  end
end
