class RenameTerephoneNumberColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :terephone_number, :telephone_number
  end
end
