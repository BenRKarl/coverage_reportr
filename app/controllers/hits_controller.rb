class HitsController < ApplicationController

def index
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
  @hits = @coverage_report.hits.all
  send_data Hit.to_csv(@hits)
end

def new
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
  @hit = Hit.new
end

def create
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
  @hit = Hit.create(hit_params)
  @coverage_report.hits << @hit
  redirect_to edit_hit_path(@hit, user_id: @user.id, coverage_report_id: @coverage_report.id)
end

def show
  @user = User.find(params[:user_id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report_id].to_i)
  @hit = Hit.new
end

def edit
  @user = User.find(params[:user_id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report_id].to_i)
  @hit = Hit.find(params[:id])
  @hit.hit_title = Hit.get_title(@hit.hit_url)
  @hit.hit_publication = Hit.get_publication(@hit.hit_url)
  @hit.hit_author = Hit.get_author(@hit.hit_url)
  # @hit.hit_date = Hit.get_date(@hit.hit_url)
  @hit.hit_sentiment = Hit.get_sentiment(@hit.hit_url)
end

def update
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
  @hit = Hit.find(params[:id])
  @hit.update(hit_params)
  redirect_to coverage_report_path(@coverage_report, user_id: @user.id, coverage_report_id: @coverage_report.id)
end

def destroy
  @user = User.find(params[:user][:id].to_i)
  @coverage_report = CoverageReport.find(params[:coverage_report][:id].to_i)
  @hit = Hit.find(params[:id])
  @hit.delete
  redirect_to coverage_report_path(@coverage_report, user_id: @user.id, coverage_report_id: @coverage_report.id)
end

private

def hit_params
  params.require(:hit).permit(:hit_url, :hit_publication, :hit_title, :hit_author, :hit_date, :hit_sentiment)
end

end
