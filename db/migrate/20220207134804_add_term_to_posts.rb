class AddTermToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :start_date, :date
    add_column :posts, :end_date, :date
  end
end
