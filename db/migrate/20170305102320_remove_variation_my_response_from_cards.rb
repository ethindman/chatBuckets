class RemoveVariationMyResponseFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :variations
    remove_column :cards, :my_response
  end
end
