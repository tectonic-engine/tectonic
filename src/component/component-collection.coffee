_ = require 'lodash'

class ComponentCollection
  constructor: ->
    @components = {}

  add: (component, replace = no) ->
    if @readOnly
      throw new Error('Cannot add component to read-only ComponentCollection')
    if replace == no and component.type of @components
      throw new Error('Component with this type already exists. Set the replace flag to true to replace')

    @components[component.type] = component

  get: (type) ->
    @components[type]

  contains: (type) ->
    type of @components

  count: () ->
    _.size @components

module.exports = ComponentCollection
