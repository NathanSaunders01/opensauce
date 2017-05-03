class Project < ActiveRecord::Base
  belongs_to :user
  
  has_many :project_categories
  has_many :categories, through: :project_categories
  
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :plan, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
end