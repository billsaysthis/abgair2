class CreateMembershipTypes < ActiveRecord::Migration
  def change
    create_table :membership_types do |t|
      t.string :name
      t.belongs_to :organization, index: true

      t.timestamps
    end
  end
end
