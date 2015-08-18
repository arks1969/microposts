class AddRepostToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :repost, :boolean, default: false, null: false
  end
end
