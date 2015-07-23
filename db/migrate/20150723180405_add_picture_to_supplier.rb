class AddPictureToSupplier < ActiveRecord::Migration
  def up
    add_attachment :suppliers, :picture
  end

  def down
    remove_attachment :suppliers, :picture
  end
end
