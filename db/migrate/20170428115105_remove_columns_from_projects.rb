class RemoveColumnsFromProjects < ActiveRecord::Migration[5.0]
  def change
    remove_column :projects, :skills_required
    remove_column :projects, :category
    remove_column :projects, :vote_count
  end
end
