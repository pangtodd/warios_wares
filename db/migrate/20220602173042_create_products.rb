class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.column(:name, :string)
      t.column(:price, :decimal, :precision => 8, :scale => 2)
      t.column(:country_of_origin, :string)

      t.timestamps()
    end
  end
end
