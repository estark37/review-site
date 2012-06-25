class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.integer :user_id
      t.string :code
      t.string :title

      t.timestamps
    end

    add_index :snippets, [:user_id, :created_at]
  end
end
