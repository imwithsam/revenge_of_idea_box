class AddDefaultValueToQualityColumnOnIdeas < ActiveRecord::Migration
  def change
    change_column :ideas, :quality, :text, default: "swill"
  end
end
