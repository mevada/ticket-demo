class CreatePictures < ActiveRecord::Migration[6.1]
  def change
    create_table :pictures do |t|
      t.string :name
      t.references :imageable , polymorphic: true , index: true
      t.timestamps
    end

    #add_index :pictures, [:imageable_type, :imageable_id]
  end
end
