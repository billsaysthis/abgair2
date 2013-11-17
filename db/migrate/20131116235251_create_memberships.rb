class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :organization, index: true
      t.date :expires_at
      t.belongs_to :membership_type, index: true

      t.timestamps
    end
  end
end
