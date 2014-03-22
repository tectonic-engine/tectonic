uuid = require 'node-uuid'

class Entity
  constructor: ->
    @uuid = uuid.v1()
    @name = 'Entity'

module.exports = Entity
