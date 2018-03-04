class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.create!(name: params[:project][:name])
    params[:project][:tasks].each_line do |line|
      title, size = line.split(":")
      @project.tasks.create(title: title, size: size.to_i)
    end
    redirect_to projects_url
  end

  def index
    @projects = Project.all
  end
end
