class CreateCoverageReports < ActiveRecord::Migration
  def change
    create_table :coverage_reports do |t|
      t.string :company_name
      t.string :announcement

      t.timestamps
    end
  end
end
