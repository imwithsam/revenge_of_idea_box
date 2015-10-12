class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :title
      t.text :body
      t.text :quality

      t.timestamps null: false
    end
  end
end
