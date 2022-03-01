class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :age
      t.string :birthPlace
      t.string :skill
      t.timestamps
    end
  end
end
