class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.belongs_to :company
      t.string     :title
      t.timestamps
    end
    add_index :jobs, :company_id
  end

  def self.down
    drop_table :jobs
  end
end
