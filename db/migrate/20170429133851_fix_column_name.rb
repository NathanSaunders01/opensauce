class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :project_categories, :article_id, :project_id
  end
end
