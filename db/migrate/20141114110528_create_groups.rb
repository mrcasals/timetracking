class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end

    User.find_each do |user|
      group = Group.create(name: "Group for user #{user.id}")
      Membership.create(group: group, user: user)
    end
  end
end
