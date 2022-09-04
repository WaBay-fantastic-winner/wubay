# frozen_string_literal: true

class Project < ApplicationRecord
  acts_as_paranoid
  
  belongs_to :user
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time,
            :project_description, presence: true
  has_rich_text :project_description
  has_one_attached :avatar
  has_many :comments, dependent: :destroy
  
  validates :organizer, :email, :phone, :title, :amount_target, :end_time,
            :description, presence: true
end