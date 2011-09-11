class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :title
      t.string :description
      t.integer :category_id

      t.timestamps
    end
    
    add_index :ads,:category_id
  end

  def self.down
    drop_table :ads
  end
end
