_ = require 'lodash'

class EntityCollection
  constructor: ->
    @entities = []

  add: (entity) ->
    @entities.push entity

  findByName: (name) ->
    _.where @entities, name: name

  getByName: (name) ->
    _.findWhere @entities, name: name

  getByUuid: (uuid) ->
    _.findWhere @entities, uuid: uuid

module.exports = EntityCollection
