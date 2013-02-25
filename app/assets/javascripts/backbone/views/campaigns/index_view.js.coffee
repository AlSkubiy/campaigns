Campaigns.Views.Campaigns ||= {}

class Campaigns.Views.Campaigns.IndexView extends Backbone.View
  template: JST["backbone/templates/campaigns/index"]

  initialize: () ->
    @options.campaigns.bind('reset', @addAll)

  addAll: () =>
    @options.campaigns.each(@addOne)

  addOne: (campaign) =>
    view = new Campaigns.Views.Campaigns.CampaignView({model : campaign})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(campaigns: @options.campaigns.toJSON() ))
    @addAll()

    return this
