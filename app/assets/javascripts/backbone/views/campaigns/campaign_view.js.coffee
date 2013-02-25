Campaigns.Views.Campaigns ||= {}

class Campaigns.Views.Campaigns.CampaignView extends Backbone.View
  template: JST["backbone/templates/campaigns/campaign"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
