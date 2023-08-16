class CreateKimages < ActiveRecord::Migration[7.0]
  def change
    create_table :kimages do |t|
      t.references :imageable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
