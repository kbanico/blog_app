class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
      t.integer :post_id

      t.timestamps
    end

    add_index :comments, :post_id
  end
end
