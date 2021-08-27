class AddCategoryIdToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :category_id, :integer
  end
end
