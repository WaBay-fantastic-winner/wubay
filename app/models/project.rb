# frozen_string_literal: true

class Project < ApplicationRecord
  #relationship
  belongs_to :user
<<<<<<< HEAD
  has_many :donate_items

  # validation
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time, :project_description,
            presence: true
  
=======
  validates :organizer, :email, :phone, :project_title, :project_amount_target, :project_end_time,
            :project_description, presence: true
>>>>>>> origin/feature/comment
  has_rich_text :project_description
  has_many :comments
end
