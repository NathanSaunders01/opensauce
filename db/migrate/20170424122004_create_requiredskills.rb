class CreateRequiredskills < ActiveRecord::Migration[5.0]
  def change
    create_table :requiredskills do |t|
      t.string :name
    end
  end
end
