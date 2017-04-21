class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.integer :profile_id
      t.string :title
      t.text :plan
      t.string :requirements
      t.integer :vote_count
      t.timestamps
    end
  end
end
