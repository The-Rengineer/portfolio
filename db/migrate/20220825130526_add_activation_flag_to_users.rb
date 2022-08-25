class AddActivationFlagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activation_flag, :boolean
  end
end
