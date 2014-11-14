class UpdateProjects < ActiveRecord::Migration
  def change
    add_column :projects, :group_id, :integer

    Project.find_each do |project|
      membership = Membership.where(user_id: project.user_id).first
      project.group_id = membership.group_id
      project.save
    end

    remove_column :projects, :user_id
  end
end
