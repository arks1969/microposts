class RemoveColumnToMicropost < ActiveRecord::Migration
  def change
    remove_column :microposts, :repost, :boolean
  end
end
