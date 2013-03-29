class CreateOutNotes < ActiveRecord::Migration
  def change
    create_table :out_notes do |t|
      t.column :to, :string
      t.column :from, :string
      t.column :subject, :string
      t.column :text, :string
      
      t.timestamps
    end
  end
end
