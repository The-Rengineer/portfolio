class AddTitleNumberToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :NumApplicants, :integer
  end
end
