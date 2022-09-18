# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @projects = Project.order(created_at: :desc)
  end
end
