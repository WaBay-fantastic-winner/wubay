# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :destroy, :update]
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def destroy
    if @project.destroy
        redirect_to '/projects', notice: '提案刪除成功 !!'
    else
        redirect_to '/projects', notice: '不能刪除 !!'
    end
  end

  def show
    @comment = Comment.new
    @comments = @project.comments.order(id: :desc) 
  end

  def update
    if @project.update(clean_params)
      redirect_to project_path, notice: ' 提案更新成功 !!'
    else
      render :edit
    end
  end

  def create
    # 登入後的使用者，使用多對多方式 .projects ，建立表單
    @project = current_user.projects.new(clean_params)
    if @project.save
      redirect_to projects_path, notice: ' 提案成功 !!'
    else
      render :new
    end
  end

  private

  def clean_params
    # 資料清洗
    params.require(:project).permit(:organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time, :project_description)
  end

  def find_project
    @project = Project.find_by(id: params[:id])
  end
end
