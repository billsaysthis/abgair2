class RemoveOrganizationIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :organization_id, :integer
  end
end
