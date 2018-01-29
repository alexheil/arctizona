class CreateMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :memberships do |t|
      t.references :user
      t.boolean :member, default: false
      t.boolean :bronze, default: false
      t.boolean :silver, default: false
      t.boolean :gold, default: false
      t.boolean :platnium, default: false
      t.string :membership_type, default: ""
      t.integer :amount, default: 0
      t.integer :percent, default: 20

      t.timestamps
    end
  end
end
