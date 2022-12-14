# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index] 
  before_action :find_project, only: %i[create index]
  before_action :find_comment, only: [:destroy]
  def create
    @comment = @project.comments.new(comment_params) 
    @comment.user = current_user 
    if @comment.save
      redirect_to project_comments_path(@project), notice: '留言成功'
    else
      redirect_to project_comments_path(@project), notice: '留言失敗'
    end
  end

  def destroy
    redirect_to project_comments_path(@comment.project), notice: '留言刪除成功' if @comment.destroy
  end

  def index
    @comment = Comment.new
    @comments = @project.comments.where(parent_id: nil).order(id: :desc) # 只抓第一層留言
    # @comments = @project.comments.order(id: :desc)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end

  def find_project
    @project = Project.find_by(id: params[:project_id])
  end

  def find_comment
    @comment = current_user.comments.find(params[:id])
  end
end
