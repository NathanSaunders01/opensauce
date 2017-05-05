class Skill < ActiveRecord::Base
  has_many :profile_skills
  has_many :profiles, through: :profile_skills
  
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :name
end