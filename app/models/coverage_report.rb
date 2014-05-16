class CoverageReport < ActiveRecord::Base
    has_and_belongs_to_many :coverage_reports
    has_many :hits
end
