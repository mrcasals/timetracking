class AddUserToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer
    Project.update_all(user_id: 1)
  end
end
