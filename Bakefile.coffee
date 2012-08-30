module.exports =
  library:
    join: 'knockback.js'
    compress: true
    files: [
      'src/knockback-core/knockback-core.coffee'
      'src/knockback-core/knockback-utils.coffee'
      'src/knockback-core/knockback-factory.coffee'
      'src/knockback-core/knockback-store.coffee'
      'src/knockback-core/knockback-model-watcher.coffee'
      'src/knockback-core/knockback-observable.coffee'
      'src/knockback-core/knockback-view-model.coffee'
      'src/knockback-core/knockback-collection-observable.coffee'
      'src/knockback-defaults/knockback-default-wrapper.coffee'
      'src/knockback-formatting/knockback-formatted-observable.coffee'
      'src/knockback-localization/knockback-localized-observable.coffee'
      'src/knockback-triggering/knockback-triggered-observable.coffee'
    ]

  knockback_core:
    join: 'knockback-core.js'
    compress: true
    files: [
      'src/knockback-core/knockback-core.coffee'
      'src/knockback-core/knockback-utils.coffee'
      'src/knockback-core/knockback-factory.coffee'
      'src/knockback-core/knockback-store.coffee'
      'src/knockback-core/knockback-model-watcher.coffee'
      'src/knockback-core/knockback-observable.coffee'
      'src/knockback-core/knockback-view-model.coffee'
      'src/knockback-core/knockback-collection-observable.coffee'
    ]

  knockback_defaults:
    join: 'knockback-defaults.js'
    output: 'lib'
    compress: true
    files: [
      'src/import-knockback.coffee'
      'src/knockback-defaults/knockback-default-wrapper.coffee'
      'src/knockback-defaults/knockback-extensions.coffee'
    ]

  knockback_formatting:
    join: 'knockback-formatting.js'
    output: 'lib'
    compress: true
    files: [
      'src/import-knockback.coffee'
      'src/knockback-formatting/knockback-formatted-observable.coffee'
    ]

  knockback_localization:
    join: 'knockback-localization.js'
    output: 'lib'
    compress: true
    files: [
      'src/import-knockback.coffee'
      'src/knockback-localization/knockback-extensions.coffee'
      'src/knockback-localization/knockback-localized-observable.coffee'
    ]

  knockback_triggering:
    join: 'knockback-triggering.js'
    output: 'lib'
    compress: true
    files: [
      'src/import-knockback.coffee'
      'src/knockback-triggering/knockback-triggered-observable.coffee'
    ]

  knockback_statistics:
    join: 'knockback-statistics.js'
    output: 'lib'
    compress: true
    files: [
      'src/import-knockback.coffee'
      'src/knockback-statistics/knockback-statistics.coffee'
    ]

  test_localization_examples:
    join: '_localization_examples.js'
    output: 'test/_examples/build'
    files: [
      'src/import-knockback.coffee'
      'test/_examples/locale_manager.coffee'
      'test/_examples/localized_observables.coffee'
      'test/_examples/localized_string.coffee'
    ]

  test_contact_examples:
    join: '_contact_examples.js'
    output: 'test/_examples/build'
    files: [
      'src/import-knockback.coffee'
      'test/_examples/contact.coffee'
    ]

  publishing:
    _build:
      commands: [
        # knockback dependencies
        'cp -v underscore vendor/underscore.js'
        'cp -v underscore/underscore-min.js vendor/underscore.min.js'
        'cp -v backbone vendor/backbone.js'
        'cp -v backbone/backbone-min.js vendor/backbone.min.js'
        'cp -v knockout-client/knockout.js vendor/knockout.js'
        'cp -v knockout-client/knockout.debug.js vendor/knockout.min.js'

        # knockback optional dependencies
        'cp -v lodash vendor/optional/lodash.js'
        'cp -v lodash/lodash.min.js vendor/optional/lodash.min.js'
        'cp -v backbone-modelref vendor/optional/backbone-modelref.js'
        'cp -v backbone-modelref/backbone-modelref.min.js vendor/optional/backbone-modelref.min.js'
        'cp -v backbone-relational vendor/optional/backbone-relational.js'
        'cp -v backbone-relational/backbone-relational.min.js vendor/optional/backbone-relational.min.js'

        # minimally-sized stack
        'uglifyjs -o vendor/underscore-1.3.3-kb.min.js vendor/underscore-1.3.3-kb.js'
        'uglifyjs -o vendor/backbone-0.9.2-kb.min.js vendor/backbone-0.9.2-kb.js'
        'uglifyjs -o vendor/knockout-2.1.0-kb.min.js vendor/knockout-2.1.0-kb.js'
        'uglifyjs -o vendor/optional/lodash-0.6.1-kb.min.js vendor/optional/lodash-0.6.1-kb.js'
        'cat vendor/underscore-1.3.3-kb.js vendor/backbone-0.9.2-kb.js vendor/knockout-2.1.0-kb.js knockback-core.js > knockback-minimal-stack.js'
        'cat vendor/underscore-1.3.3-kb.min.js vendor/backbone-0.9.2-kb.min.js vendor/knockout-2.1.0-kb.min.js knockback-core.min.js > knockback-minimal-stack.min.js'

        # npm
        'cp knockback.js packages/npm/knockback.js'
        'cp knockback.min.js packages/npm/knockback.min.js'
        'cp knockback-minimal-stack.js packages/npm/knockback-minimal-stack.js'
        'cp knockback-minimal-stack.min.js packages/npm/knockback-minimal-stack.min.js'
        'cp knockback-core.js packages/npm/knockback-core.js'
        'cp knockback-core.min.js packages/npm/knockback-core.min.js'
        'cp README.md packages/npm/README.md'

        # npm: components
        'cp lib/knockback-defaults.js packages/npm/lib/knockback-defaults.js'
        'cp lib/knockback-formatting.js packages/npm/lib/knockback-formatting.js'
        'cp lib/knockback-triggering.js packages/npm/lib/knockback-triggering.js'
        'cp lib/knockback-localization.js packages/npm/lib/knockback-localization.js'
        'cp lib/knockback-statistics.js packages/npm/lib/knockback-statistics.js'

        # npm: minimally-sized stack
        'cp vendor/underscore-1.3.3-kb.js packages/npm/vendor/underscore-1.3.3-kb.js'
        'cp vendor/underscore-1.3.3-kb.min.js packages/npm/vendor/underscore-1.3.3-kb.min.js'
        'cp vendor/backbone-0.9.2-kb.js packages/npm/vendor/backbone-0.9.2-kb.js'
        'cp vendor/backbone-0.9.2-kb.min.js packages/npm/vendor/backbone-0.9.2-kb.min.js'
        'cp vendor/knockout-2.1.0-kb.js packages/npm/vendor/knockout-2.1.0-kb.js'
        'cp vendor/knockout-2.1.0-kb.min.js packages/npm/vendor/knockout-2.1.0-kb.min.js'
        'cp vendor/optional/lodash-0.6.1-kb.js packages/npm/vendor/optional/lodash-0.6.1-kb.js'
        'cp vendor/optional/lodash-0.6.1-kb.min.js packages/npm/vendor/optional/lodash-0.6.1-kb.min.js'

        # nuget
        'cp knockback.js packages/nuget/Content/Scripts/knockback.js'
        'cp knockback.min.js packages/nuget/Content/Scripts/knockback.min.js'
        'cp knockback-minimal-stack.js packages/nuget/Content/Scripts/knockback-minimal-stack.js'
        'cp knockback-minimal-stack.min.js packages/nuget/Content/Scripts/knockback-minimal-stack.min.js'
        'cp knockback-core.js packages/nuget/Content/Scripts/knockback-core.js'
        'cp knockback-core.min.js packages/nuget/Content/Scripts/knockback-core.min.js'
        'cp knockback-core.js packages/nuget/Content/Scripts/knockback-core.js'

        # nuget: components
        'cp lib/knockback-defaults.js packages/nuget/Content/Scripts/lib/knockback-defaults.js'
        'cp lib/knockback-formatting.js packages/nuget/Content/Scripts/lib/knockback-formatting.js'
        'cp lib/knockback-triggering.js packages/nuget/Content/Scripts/lib/knockback-triggering.js'
        'cp lib/knockback-localization.js packages/nuget/Content/Scripts/lib/knockback-localization.js'
        'cp lib/knockback-statistics.js packages/nuget/Content/Scripts/lib/knockback-statistics.js'

        # nuget: minimally-sized stack
        'cp vendor/underscore-1.3.3-kb.js packages/nuget/Content/Scripts/vendor/underscore-1.3.3-kb.js'
        'cp vendor/underscore-1.3.3-kb.min.js packages/nuget/Content/Scripts/vendor/underscore-1.3.3-kb.min.js'
        'cp vendor/backbone-0.9.2-kb.js packages/nuget/Content/Scripts/vendor/backbone-0.9.2-kb.js'
        'cp vendor/backbone-0.9.2-kb.min.js packages/nuget/Content/Scripts/vendor/backbone-0.9.2-kb.min.js'
        'cp vendor/knockout-2.1.0-kb.js packages/nuget/Content/Scripts/vendor/knockout-2.1.0-kb.js'
        'cp vendor/knockout-2.1.0-kb.min.js packages/nuget/Content/Scripts/vendor/knockout-2.1.0-kb.min.js'
        'cp vendor/optional/lodash-0.6.1-kb.js packages/nuget/Content/Scripts/vendor/optional/lodash-0.6.1-kb.js'
        'cp vendor/optional/lodash-0.6.1-kb.min.js packages/nuget/Content/Scripts/vendor/optional/lodash-0.6.1-kb.min.js'
      ]

  tests:
    _build:
      output: 'build'
      directories: [
        'test/knockback-legacy'

        'test/knockback-utils'
        'test/knockback-memory-management'
        'test/knockback-observable'
        'test/knockback-collection-observable'
        'test/knockback-view-model'

        'test/backbone-modelref'
        'test/backbone-relational'

        'test/knockback-defaults'
        'test/knockback-formatting'
        'test/knockback-localization'
        'test/knockback-triggering'
      ]
      commands: [
        'mbundle test/packaging/bundle-config.coffee'
        'mbundle test/lodash/bundle-config.coffee'
        'mbundle test/minimal-stack/bundle-config.coffee'
      ]
    _test:
      command: 'phantomjs'
      runner: 'phantomjs-qunit-runner.js'
      files: '**/*.html'
      directories: [
        'test/knockback-legacy'

        'test/knockback-utils'
        'test/knockback-memory-management'
        'test/knockback-observable'
        'test/knockback-collection-observable'
        'test/knockback-view-model'

        'test/backbone-modelref'
        'test/backbone-relational'

        'test/knockback-defaults'
        'test/knockback-formatting'
        'test/knockback-localization'
        'test/knockback-triggering'

        'test/minimal-stack'
        'test/packaging'
        'test/lodash'
      ]