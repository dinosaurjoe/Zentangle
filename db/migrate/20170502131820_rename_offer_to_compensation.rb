class RenameOfferToCompensation < ActiveRecord::Migration[5.0]
  def change
    rename_column :roles, :offers, :compensation
  end
end
