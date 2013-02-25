class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :countries

      t.timestamps
    end

    add_start_at_column_sql = 'ALTER TABLE campaigns ADD COLUMN start_at timestamp with time zone;'
    add_end_at_column_sql = 'ALTER TABLE campaigns ADD COLUMN end_at timestamp with time zone;'

  	ActiveRecord::Base.connection.execute(add_start_at_column_sql)
  	ActiveRecord::Base.connection.execute(add_end_at_column_sql)
  end

  def down
  	drop_table :campaigns
  end
end
