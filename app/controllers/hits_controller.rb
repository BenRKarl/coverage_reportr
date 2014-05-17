class HitsController < ApplicationController

def index
   @hits = Hit.all
end

def new
  @user = User.find(params[:user_id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report_id].to_i)
  @hit = Hit.new
end

def create
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
  hit = Hit.create(hit_params)
  @coverage_report.hits << hit
  redirect_to hit_path(hit, user_id: @user.id, coverage_report_id: @coverage_report.id)
end

def show
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
end

def edit
  @user = User.find(params[:user_id])
  @coverage_report = CoverageReport.find(params[:coverage_report_id])
  @hit = Hit.find(params[:id])
end

def update
  # user = User.find(params[:user_id])
  # coverage_report = CoverageReport.find(params[:id])
  # coverage_report.update(coverage_report_params)
  # redirect_to user_path(user)
end

def destroy
  user = User.find(params[:user][:id].to_i)
  coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
  hit = Hit.find(params[:id])
  hit.delete
  redirect_to coverage_report_path(coverage_report)
end

private

def hit_params
  params.require(:hit).permit(:hit_url, :hit_publication, :hit_title, :hit_author, :hit_date, :hit_sentiment)
end

end
