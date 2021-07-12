class CreateUpvotes < ActiveRecord::Migration[6.1]
  def change
    create_table :upvotes do |t|
      t.belongs_to :user
      t.belongs_to :idea

      t.timestamps
    end
  end
end
