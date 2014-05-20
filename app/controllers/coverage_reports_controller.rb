class CoverageReportsController < ApplicationController

def new
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.new
end

def create
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.create(coverage_report_params)
  @user.coverage_reports << @coverage_report
  redirect_to coverage_report_path(@coverage_report, user_id: @user.id)
end

def show
  @user = User.find(params[:user_id].to_i)
  @coverage_report = CoverageReport.find(params[:id])
  @coverage_reports = @user.coverage_reports.all
  @hits = @coverage_report.hits
end

def edit
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:id])
end

def update
  @user = User.find(params[:user][:id].to_i)
  coverage_report = CoverageReport.find(params[:id])
  coverage_report.update(coverage_report_params)
  redirect_to coverage_report_path(coverage_report, user_id: @user.id)
end

def destroy
  @user = User.find(params[:user][:id].to_i)
  coverage_report = CoverageReport.find(params[:id].to_i)
  coverage_report.delete
  redirect_to user_path(@user)
end

private

def coverage_report_params
  params.require(:coverage_report).permit(:company_name, :announcement)
end

end
