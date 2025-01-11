class AddRatingToMovies < ActiveRecord::Migration[7.2]
  def change
    add_column :movies, :rating, :float
  end
end
