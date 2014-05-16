class HitsController < ApplicationController

def index
   @hits = Hit.all
end

def new
  # @user = User.find(params[:user_id])
  # @coverage_report = CoverageReport.find(params[:coverage_report_id])
  @hit = Hit.new
end

def create
  @user = @current_user
  @coverage_report = CoverageReport.find(params[:coverage_report_id])
  hit = Hit.create(hit_params)
  @coverage_report.hits << hit
  redirect_to user_coverage_report_path(@user, @coverage_report)
end

def show
  @user = User.find(params[:user_id])
  @coverage_report = CoverageReport.find(params[:coverage_report_id])
  @hit = Hit.new
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
  user = User.find(params[:user_id])
  coverage_report = CoverageReport.find(params[:coverage_report_id])
  hit = Hit.find(params[:id])
  hit.delete
  redirect_to user_coverage_report_path(user, coverage_report)
end

def hit_params
  params.require(:hit).permit(:hit_url, :hit_publication, :hit_title, :hit_author, :hit_date, :hit_sentiment)
end

end
