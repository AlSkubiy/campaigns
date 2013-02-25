class Campaigns.Routers.CampaignsRouter extends Backbone.Router
  initialize: (options) ->
    @campaigns = new Campaigns.Collections.CampaignsCollection()
    @campaigns.reset options.campaigns

  routes:
    "new"      : "newCampaign"
    "index"    : "index"
    ":id"      : "show"
    ".*"        : "index"

  newCampaign: ->
    @view = new Campaigns.Views.Campaigns.NewView(collection: @campaigns)
    $("#campaigns").html(@view.render().el)

  index: ->
    @view = new Campaigns.Views.Campaigns.IndexView(campaigns: @campaigns)
    $("#campaigns").html(@view.render().el)

  show: (id) ->
    campaign = @campaigns.get(id)

    @view = new Campaigns.Views.Campaigns.ShowView(model: campaign)
    $("#campaigns").html(@view.render().el)
