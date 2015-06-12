class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :name
      t.integer :orgprice
      t.integer :shares
      t.integer :curprice
      t.integer :profit

      t.timestamps null: false
    end
  end
end
