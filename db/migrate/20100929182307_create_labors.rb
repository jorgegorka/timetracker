class CreateLabors < ActiveRecord::Migration
  def self.up
    create_table :labors do |t|
      t.belongs_to :user, :job
      t.string     :content
      t.integer    :sid, :pid
      t.integer    :hours, :minutes, :default => 0
      t.datetime   :start_at, :end_at
      t.timestamps
    end

    add_index :labors, :user_id
    add_index :labors, :job_id
    add_index :labors, :pid
    add_index :labors, :pid
  end

  def self.down
    drop_table :labors
  end
end
