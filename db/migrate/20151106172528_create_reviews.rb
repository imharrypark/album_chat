class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.float :rating
      t.references :user

      t.timestamps null: false
    end
  end
end
