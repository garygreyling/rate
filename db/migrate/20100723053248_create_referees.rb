class CreateReferees < ActiveRecord::Migration
  def self.up
    create_table :referees do |t|
      t.first_name :string
      t.last_name :string
      t.avatar_file_name :string
      t.avatar_content_type :string
      t.avatar_file_size :integer
      t.avatar_updated_at :datetime
      t.timestamps
    end
  end

  def self.down
    drop_table :referees
  end
end
