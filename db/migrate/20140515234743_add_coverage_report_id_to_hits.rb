class AddCoverageReportIdToHits < ActiveRecord::Migration
  def change
    add_column :hits, :coverage_report_id, :integer
  end
end
