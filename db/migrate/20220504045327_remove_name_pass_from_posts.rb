class RemoveNamePassFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :name, :string
    remove_column :posts, :password_digest, :string
  end
end
