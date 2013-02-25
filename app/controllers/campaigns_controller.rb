class CampaignsController < ApplicationController
  respond_to :json, :html

  include CountriesHelper
  include LanguagesHelper

  def index
    @campaigns = Campaign.all

    respond_with @campaigns
  end

  def show
    @campaign = Campaign.find(params[:id])

    respond_with @campaign
  end

  def new
    @campaign = Campaign.new
    
    respond_with @campaign
  end

  def create
    puts params[:campaign]
    @campaign = Campaign.create(params[:campaign])

    respond_with @campaign
  end

  def countries
    @countries_names = country_list
    respond_with @countries_names
  end

  def languages
    @languages_names = language_list
    respond_with @languages_names
  end

  def destroy
    @campaign = Campaign.find(params[:id])
    @campaign.destroy

    respond_with :no_content
  end
end
