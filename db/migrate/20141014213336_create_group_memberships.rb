class CreateGroupMemberships < ActiveRecord::Migration
  def change
    create_table :group_memberships do |t|
      t.references :user
      t.references :group

      t.timestamps
    end
  end
end
