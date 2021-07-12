class LinkUserAndIdeas < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.remove_references :ideas
    end

    change_table :ideas do |t|
      t.belongs_to :user
    end
  end
end
