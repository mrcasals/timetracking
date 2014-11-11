class AddProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.timestamps
    end
  end
end
