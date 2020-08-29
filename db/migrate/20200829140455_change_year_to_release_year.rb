class ChangeYearToReleaseYear < ActiveRecord::Migration[5.0]
  def change
    rename_column :songs, :year, :release_year 
  end
end
