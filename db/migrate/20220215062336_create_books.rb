class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.integer :published_in
      t.integer :volume
      t.boolean :issued, null: false, :default => 0
      t.string :issuedTo, null: false, :default => "student"
      t.timestamps
    end
  end
end
