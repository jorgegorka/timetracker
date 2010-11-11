class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :subdomain, :limit => 50
      t.string :nif,       :limit => 20
      t.string :name, :commercial_name, :address, :place

      t.timestamps
    end

    add_index :companies, :subdomain, :unique => true

    add_column :users, :admin,      :boolean, :default => false
    add_column :users, :company_id, :integer
    add_index  :users, :company_id
  end

  def self.down
    drop_table :companies
    remove_column :users, :company_id
    remove_column :users, :admin
  end
end
