Campaigns.Views.Campaigns ||= {}

class Campaigns.Views.Campaigns.ShowView extends Backbone.View
  template: JST["backbone/templates/campaigns/show"]

  events:
    "click .destroy" : "destroy"

  destroy: () ->
    @model.destroy()
    window.router.navigate("/", true)
    return false

  render: ->
    $(@el).html(@template(@model.toJSON()))
    return this
