class CreateReferees < ActiveRecord::Migration
  def self.up
    puts 'here'
    create_table :referees do |t|
      t.string :first_name
      t.string :last_name
      t.string :avatar_file_name
      t.string :avatar_content_type
      t.integer :avatar_file_size
      t.datetime :avatar_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :referees
  end
end
