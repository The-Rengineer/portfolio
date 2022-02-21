class AddProfileToUserId < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :userId, :integer
  end
end
