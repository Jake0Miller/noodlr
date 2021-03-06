class CreateFacebooks < ActiveRecord::Migration[5.2]
  def change
    create_table :facebooks do |t|
      t.references :user, foreign_key: true
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
