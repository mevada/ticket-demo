class CreateCates < ActiveRecord::Migration[6.1]
  def change
    create_table :cates do |t|
      t.string :name

      t.timestamps
    end
  end
end
