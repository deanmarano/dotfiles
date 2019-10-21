let g:projectionist_heuristics = {
      \ "ember-cli-build.js": {
      \   "app/adapters/*.js": {
      \     "alternate": "tests/unit/adapters/{}-test.js",
      \     "type": "adapter"
      \   },
      \   "tests/unit/adapters/*-test.js": {
      \     "alternate": "app/adapters/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/components/*.js": {
      \     "alternate": "app/templates/components/{}.hbs",
      \     "type": "template"
      \   },
      \   "app/components/*/template.hbs": {
      \     "alternate": "app/components/{}/component.js",
      \     "type": "component"
      \   },
      \   "app/templates/components/*.hbs": {
      \     "alternate": "app/components/{}.js",
      \     "type": "component"
      \   },
      \   "app/templates/*.hbs": {
      \     "alternate": "app/routes/{}.js",
      \     "type": "route"
      \   },
      \   "app/controllers/*.js": {
      \     "alternate": "app/templates/{}.hbs",
      \     "type": "template"
      \   },
      \   "app/routes/*.js": {
      \     "alternate": "app/controllers/{}.js",
      \     "type": "route"
      \   },
      \   "app/components/*/component.js": {
      \     "alternate": "app/components/{}/template.hbs",
      \     "type": "template"
      \   },
      \   "tests/integration/components/*-test.js": {
      \     "alternate": "app/components/{}/component.js",
      \     "type": "integration-test"
      \   },
      \
      \   "app/helpers/*.js": {
      \     "alternate": "tests/unit/helpers/{}-test.js",
      \     "type": "helper"
      \   },
      \   "tests/unit/helpers/*-test.js": {
      \     "alternate": "app/helpers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/initializers/*.js": {
      \     "alternate": "tests/unit/initializers/{}-test.js",
      \     "type": "initializer"
      \   },
      \   "tests/unit/initializers/*-test.js": {
      \     "alternate": "app/initializers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/instance-initializers/*.js": {
      \     "alternate": "tests/unit/instance-initializers/{}-test.js",
      \     "type": "instance-initializers"
      \   },
      \   "tests/unit/instance-initializers/*-test.js": {
      \     "alternate": "app/instance-initializers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/mixins/*.js": {
      \     "alternate": "tests/unit/mixins/{}-test.js",
      \     "type": "mixin"
      \   },
      \   "tests/unit/mixins/*-test.js": {
      \     "alternate": "app/mixins/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/models/*.js": {
      \     "alternate": "tests/unit/models/{}-test.js",
      \     "type": "model"
      \   },
      \   "tests/unit/models/*-test.js": {
      \     "alternate": "app/models/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/serializers/*.js": {
      \     "alternate": "tests/unit/serializers/{}-test.js",
      \     "type": "serializer"
      \   },
      \   "tests/unit/serializers/*-test.js": {
      \     "alternate": "app/serializers/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/services/*.js": {
      \     "alternate": "tests/unit/services/{}-test.js",
      \     "type": "service"
      \   },
      \   "tests/unit/services/*-test.js": {
      \     "alternate": "app/services/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/transforms/*.js": {
      \     "alternate": "tests/unit/transforms/{}-test.js",
      \     "type": "transform"
      \   },
      \   "tests/unit/transforms/*-test.js": {
      \     "alternate": "app/transforms/{}.js",
      \     "type": "unit-test"
      \   },
      \
      \   "app/mirage/factories/*.js": {"type": "factory"},
      \   "app/mirage/fixtures/*.js": {"type": "fixture"},
      \   "app/mirage/scenarios/*.js": {"type": "scenario"},
      \   "tests/acceptance/*.js": {"type": "acceptance-test"},
      \   "app/*.scss": {"type": "style"},
      \   "app/*.hbs": {"type": "template"},
      \ }}
