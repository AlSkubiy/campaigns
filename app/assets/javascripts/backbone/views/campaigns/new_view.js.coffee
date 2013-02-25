Campaigns.Views.Campaigns ||= {}

class Campaigns.Views.Campaigns.NewView extends Backbone.View
  template: JST["backbone/templates/campaigns/new"]
  templateCountry: JST["backbone/templates/campaigns/country"]
  templateLanguage: JST["backbone/templates/campaigns/language"]

  events:
    "submit #new-campaign"   : "save"
    "click  #add_country"   : "addCountry"
    "click  .remove_country": "removeCountry"
    "click  .add_language"   : "addLanguage"
    "click  .remove_language": "removeLanguage"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  addLanguage: (e) ->
    self = $(e.currentTarget).parent().find(".languages")
    self.append(@templateLanguage)
    languages = @loadLanguages()
    $(@el).find("input.language").autocomplete({
      source : languages,
      minLength : 2
    });

  removeLanguage: (e) ->
    $(e.currentTarget).parent().remove()

  addCountry: ->
    $(@el).find(".countries").append(@templateCountry)
    countries = @loadCountries()
    $(@el).find("input.country").autocomplete({
      source : countries,
      minLength : 2
    });

  removeCountry: (e) ->
    $(e.currentTarget).parent().remove()

  getCountries: ->
    result = {}
    countries = $(@el).find("div.country")
    for country in countries
      countryName = $(country).find("input.country").val()
      if (!result[countryName]) 
        result[countryName] = []
      languages = $(country).find("input.language")
      for lang in languages
        result[countryName].push(lang.value)
    return JSON.stringify(result)

  getFormParams: ->
    result = {
      name: $(@el).find("#name").val(),
      start_at: new Date( $(@el).find("#start_at").val() ),
      end_at: new Date( $(@el).find("#end_at").val() ),
      countries: @getCountries()
    }
    return result

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    @model.set(@getFormParams())
    @collection.create(@model.toJSON(),
      success: (campaign) =>
        @model = campaign
        window.location.hash = "/#{@model.id}"

      error: (campaign, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
  
  loadCountries: () ->
    countries = $.ajax({url : "campaings/countries.json", async: false})
    names = JSON.parse(countries.responseText)
    return names;

  loadLanguages: () ->
    languages = $.ajax({url : "campaings/languages.json", async: false})
    names = JSON.parse(languages.responseText)
    return names;

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    $(@el).find(".datepicker").datepicker()
    return this
