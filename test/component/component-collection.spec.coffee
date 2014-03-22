Tectonic = require '../../src/Tectonic'

describe 'Component Collection', ->

  beforeEach ->
    @componentCollection = new Tectonic.ComponentCollection

  describe 'add method', ->
    it 'should add a new component to the collection', ->
      component = new Tectonic.Component 'SomeComponent'

      @componentCollection.add component

      expect(@componentCollection.count()).toBe 1
      expect(@componentCollection.components['SomeComponent']).toBe component

    it 'should not add a new component if the collection is read-only', ->
      component = new Tectonic.Component 'SomeComponent'

      @componentCollection.readOnly = true

      expect =>
        @componentCollection.add component
      .toThrow()

    it 'should replace a component with the same type if the replace flag is set', ->
      component = new Tectonic.Component 'SomeComponent'
      otherComponent = new Tectonic.Component 'SomeComponent'

      @componentCollection.add component
      expect(@componentCollection.components['SomeComponent']).toBe component

      @componentCollection.add otherComponent, true
      expect(@componentCollection.count()).toBe 1
      expect(@componentCollection.components['SomeComponent']).toBe otherComponent

    it 'should throw an error if trying to replace a component without the replace flag being set', ->
      component = new Tectonic.Component 'SomeComponent'
      otherComponent = new Tectonic.Component 'SomeComponent'

      @componentCollection.add component

      expect =>
        @componentCollection.add otherComponent
      .toThrow()


  describe 'get method', ->
    it 'should return a component from the given type', ->
      component = new Tectonic.Component 'MyComponent'
      @componentCollection.add component

      expect(@componentCollection.get 'MyComponent').toBe component


  describe 'contains method', ->
    it 'should return whether a component by type exists', ->
      component = new Tectonic.Component 'SomeComponent'
      @componentCollection.add component

      expect(@componentCollection.contains 'SomeComponent').toBe true
      expect(@componentCollection.contains 'MyComponent').toBe false
