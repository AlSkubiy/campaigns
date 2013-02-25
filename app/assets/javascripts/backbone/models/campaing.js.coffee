class Campaigns.Models.Campaign extends Backbone.Model
  paramRoot: 'campaign'

  defaults:
    name: null
    start_at: null
    end_at: null
    countries: null

class Campaigns.Collections.CampaignsCollection extends Backbone.Collection
  model: Campaigns.Models.Campaign
  url: '/campaigns'
