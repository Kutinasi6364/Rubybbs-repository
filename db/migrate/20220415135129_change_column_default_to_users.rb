class ChangeColumnDefaultToUsers < ActiveRecord::Migration[7.0]
  
  def up
    change_column_default :users, :admin, false
  end

end
