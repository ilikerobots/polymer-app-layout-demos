@HtmlImport('recipe_detail.html')
library polymer_app_layout_demos.lib.recipe_app.recipe_detail;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' ;


import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/paper_card.dart';
import 'package:polymer_elements/paper_fab.dart';
import 'package:polymer_elements/paper_listbox.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_icon_item.dart';
import 'package:polymer_elements/paper_menu_button.dart';

import 'package:polymer_app_layout/app_header_layout.dart';
import 'package:polymer_app_layout/app_header.dart';
import 'package:polymer_app_layout/app_scroll_effects.dart';
import 'package:polymer_app_layout/app_toolbar.dart';

@PolymerRegister('recipe-detail')
class RecipeDetail extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  @Property(observer: 'recipeChanged') Map recipe = null;
  @property bool favorite = false;

  RecipeDetail.created() : super.created() { }

  @reflectable
  recipeChanged(newRecipe, oldRecipe) {
    if (newRecipe != null) {
      this.style.backgroundImage = 'url(' + newRecipe['imageUrl'] + ')';
    }
  }

  @reflectable
  toggleFavorite(event, detail) {
    set('favorite', !this.favorite);
  }

  @reflectable
  computeFavIcon(favorite) {
    return favorite ? 'app:favorite' : 'app:favorite-border';
  }


}
