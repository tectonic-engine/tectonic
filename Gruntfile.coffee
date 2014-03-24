module.exports = ->

  @initConfig

    coffee:
      compile:
        expand: true
        cwd: 'src'
        src: ['**/*.coffee']
        dest: 'lib/tectonic'
        ext: '.js'

    browserify:
      examples:
        expand: true
        cwd: 'examples/'
        src: ['**/*.coffee']
        dest: 'examples/'
        ext: '.js'
        options:
          extension: ['.coffee']
          transform: ['coffeeify']

    watch:
      compile:
        files: ['src/**/*.coffee', 'examples/**/*.coffee']
        tasks: ['compile', 'compile:examples']
      test:
        files: ['src/**/*.coffee', 'examples/**/*.coffee']
        tasks: ['test']

    coffeelint:
      app:
        files:
          src: ['src/**/*.coffee', 'examples/**/*.coffee', 'test/**/*.coffee', 'Gruntfile.coffee']
        options:
          configFile: 'coffeelint.json'

    jasmine_node:
      options:
        coffee: true
        useHelpers: true
      app: ['test/']


  # Plugins
  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-browserify'
  @loadNpmTasks 'grunt-coffeelint'
  @loadNpmTasks 'grunt-jasmine-node'

  # Tasks
  @registerTask 'compile', ['coffee:compile']
  @registerTask 'compile:examples', ['browserify:examples']

  @registerTask 'default', ['compile']
  @registerTask 'test', ['jasmine_node:app', 'coffeelint:app']
