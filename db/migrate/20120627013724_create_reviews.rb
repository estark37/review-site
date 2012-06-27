class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :contents
      t.integer :line

      t.timestamps
    end
  end
end
