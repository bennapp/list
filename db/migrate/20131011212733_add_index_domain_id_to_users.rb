class AddIndexDomainIdToUsers < ActiveRecord::Migration
  def change
  	add_index :users, :domain_id
  end
end
