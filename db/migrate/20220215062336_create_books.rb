class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :published_in, null: false
      t.integer :volume
      t.boolean :issued, null: false, :default => 0
      t.string :issuedTo, null: false, :default => "student"
      t.string :issuedDate
      t.string :returnDate
      t.timestamps
    end
  end
end
