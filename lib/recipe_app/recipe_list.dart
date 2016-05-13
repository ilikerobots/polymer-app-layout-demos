@HtmlImport('recipe_list.html')
library polymer_app_layout_demos.lib.recipe_app.recipe_list;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' ;


import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/paper_fab.dart';

import 'package:polymer_app_layout/app_header_layout.dart';
import 'package:polymer_app_layout/app_header.dart';
import 'package:polymer_app_layout/app_scroll_effects.dart';
import 'package:polymer_app_layout/app_toolbar.dart';

@PolymerRegister('recipe-list')
class RecipeList extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  @property List recipes = [];

  @Property(computed: 'isRecipesEmpty(recipes)')
  bool isEmpty;

  RecipeList.created() : super.created() { }

  @reflectable
  bool isRecipesEmpty(r) => r.isEmpty;

}
