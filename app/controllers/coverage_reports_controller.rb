class CoverageReportsController < ApplicationController

def index
   @coverage_reports = User.all
end

def new
  @user = User.find(params[:user_id])
  @coverage_report = CoverageReport.new
end

def create
  user = User.find(params[:user_id])
  coverage_report = CoverageReport.create(coverage_report_params)
  binding.pry
  redirect_to user_path(user)
end

def show
  @user = User.find(params[:id])
  @coverage_reports = @user.coverage_reports.all
end

def edit
  @coverage_report = CoverageReport.find(params[:id])
end

def update
  coverage_report = CoverageReport.find(params[:id])
  coverage_report.update(coverage_report_params)
  redirect_to user_path(user)
end

def destroy
  coverage_report = CoverageReport.find(params[:id])
  coverage_report.delete
  redirect_to user_path(user)
end

def coverage_report_params
  params.require(:coverage_report).permit(:company_name, :announcement)
end

end
