Tectonic = require '../../src/Tectonic'

describe 'Entity', ->

  describe 'initialisation', ->
    it 'should generate a new uuid', ->
      entity = new Tectonic.Entity

      expect(entity.uuid).not.toBeNull()

    it 'should generate a name', ->
      entity = new Tectonic.Entity

      expect(entity.name).toEqual 'Entity'
