class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :specialty
      t.boolean :insurance

      t.timestamps
    end
  end
end
