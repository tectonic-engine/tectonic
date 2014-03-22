uuid = require 'node-uuid'
Tectonic = require '../../src/Tectonic'

describe 'Entity Collection', ->

  beforeEach ->
    @entityCollection = new Tectonic.Entity.EntityCollection

  describe 'add method', ->
    it 'should add a new entity to the collection', ->
      entity = new Tectonic.Entity.Entity

      @entityCollection.add entity

      expect(@entityCollection.entities.length).toBe 1
      expect(@entityCollection.entities[0]).toBe entity


  describe 'findByName method', ->
    it 'should find entities in the collection by name', ->
      entity1 = new Tectonic.Entity.Entity
      entity2 = new Tectonic.Entity.Entity
      entity3 = new Tectonic.Entity.Entity

      @entityCollection.add entity1
      @entityCollection.add entity2
      @entityCollection.add entity3

      entity1.name = 'foobarbaz'
      entity2.name = 'foobarbar'
      entity3.name = 'foobarbaz'

      results = @entityCollection.findByName 'foobarbaz'

      expect(results.length).toBe 2
      expect(results).toContain entity1
      expect(results).toContain entity3

      results = @entityCollection.findByName 'foobarbar'

      expect(results.length).toBe 1
      expect(results).toContain entity2


  describe 'getByName method', ->
    it 'should find a single entity in the collection by name', ->
      entity1 = new Tectonic.Entity.Entity
      entity2 = new Tectonic.Entity.Entity
      entity3 = new Tectonic.Entity.Entity

      @entityCollection.add entity1
      @entityCollection.add entity2
      @entityCollection.add entity3

      entity1.name = 'foobarbaz'
      entity2.name = 'foobarbar'
      entity3.name = 'foobarbaz'

      expect(@entityCollection.getByName 'foobarbaz').toBe entity1
      expect(@entityCollection.getByName 'foobarbar').toBe entity2


  describe 'getByUuid method', ->
    it 'should find a single entity in the collection by uuid', ->
      uuid = uuid.v1()
      entity = new Tectonic.Entity.Entity
      entity.uuid = uuid
      @entityCollection.add entity

      expect(@entityCollection.getByUuid uuid).toBe entity
