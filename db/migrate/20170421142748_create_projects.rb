class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.text :plan
      t.string :skills_required
      t.string :category
      t.integer :vote_count
      t.timestamps
    end
  end
end
