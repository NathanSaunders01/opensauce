class RenameUserSkillTable < ActiveRecord::Migration[5.0]
  def change
    rename_table :user_skills, :profile_skills
    rename_column :profile_skills, :user_id, :profile_id
  end
end
