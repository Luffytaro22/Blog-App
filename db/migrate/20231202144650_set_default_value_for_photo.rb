class SetDefaultValueForPhoto < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :photo, 'https://w7.pngwing.com/pngs/184/113/png-transparent-user-profile-computer-icons-profile-heroes-black-silhouette-thumbnail.png'
  end
end
