class CreateJoinTableRequiredskillProject < ActiveRecord::Migration[5.0]
  def change
    create_join_table :requiredskills, :projects do |t|
      # t.index [:requiredskill_id, :project_id]
      # t.index [:project_id, :requiredskill_id]
    end
  end
end
