class AddAuthorAndSnippetToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :snippet_id, :integer
  end
end
