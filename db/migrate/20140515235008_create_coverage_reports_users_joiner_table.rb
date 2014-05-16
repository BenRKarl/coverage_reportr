class CreateCoverageReportsUsersJoinerTable < ActiveRecord::Migration
  def change
    create_table :coverage_reports_users do |t|
      t.integer :coverage_report_id
      t.integer :user_id
    end
  end
end
