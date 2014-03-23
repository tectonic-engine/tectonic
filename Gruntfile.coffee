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
      files: ['src/**/*.coffee', 'examples/**/*.coffee']
      tasks: ['compile', 'compile:examples']


  # Plugins
  @loadNpmTasks 'grunt-contrib-coffee'
  @loadNpmTasks 'grunt-contrib-watch'
  @loadNpmTasks 'grunt-browserify'

  # Tasks
  @registerTask 'compile', ['coffee:compile']
  @registerTask 'compile:examples', ['browserify:examples']

  @registerTask 'default', ['compile']
