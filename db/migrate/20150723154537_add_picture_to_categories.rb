class AddPictureToCategories < ActiveRecord::Migration
  def up
    add_attachment :categories, :picture
  end

  def down
    remove_attachment :categories, :picture
  end
end
