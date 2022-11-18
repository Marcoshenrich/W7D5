class RemoveSubIDfromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :sub_id
  end
end
