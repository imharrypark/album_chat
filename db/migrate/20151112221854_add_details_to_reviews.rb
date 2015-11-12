class AddDetailsToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :album_name, :string
    add_column :reviews, :artist_name, :string
    add_column :reviews, :album_release_date, :string
  end
end
