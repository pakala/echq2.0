class CreateCheques < ActiveRecord::Migration
  def change
    create_table :cheques do |t|
      t.date :date
      t.decimal :amount
      t.string :amount_text
      t.references :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
