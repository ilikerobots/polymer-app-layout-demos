@HtmlImport('recipe_app.html')
library polymer_app_layout_demos.lib.recipe_app.recipe_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' ;
import 'package:route_hierarchical/client.dart';

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/iron_pages.dart';
import 'package:polymer_elements/iron_selector.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_listbox.dart';

import 'package:polymer_app_layout/app_drawer_layout.dart';
import 'package:polymer_app_layout/app_drawer.dart';
import 'package:polymer_app_layout/app_header_layout.dart';
import 'package:polymer_app_layout/app_header.dart';
import 'package:polymer_app_layout/app_toolbar.dart';
import 'package:polymer_app_layout/app_scrollpos_control.dart';
import 'package:polymer_app_layout/app_box.dart';

import 'app_icons.dart';
import 'recipe_list.dart';
import 'recipe_detail.dart';


@PolymerRegister('recipe-app')
class RecipeApp extends PolymerElement with PolymerMixin, PolymerBase, JsProxy{


  final Router router = new Router(useFragment: true);

  @property List recipes = [];

  @property Map route = {};

  @property Map pageData = {'page': 'home'};

  @property Map idData = {'id': "0"};

  RecipeApp.created() : super.created() {
    router.root
      ..addRoute(name: 'root', path: '', enter: (e) => _routePage('home', -1), defaultRoute: true)
      ..addRoute(name: 'cat', path: '/:cat', enter: (e) => _routePage(e.parameters['cat'], -1))
      ..addRoute(name: 'detail', path: '/detail/:id', enter: (e) => _routePage('detail', e.parameters['id']));
    router.listen(ignoreClick: true);

  }

  void _routePage(pageId, detailId) {
    IronPages pages = this.$$('iron-pages');
    set('pageData', { 'page': pageId});
    set('idData', { 'id': detailId});
    RecipeDetail rd = this.$$('recipe-detail');
    rd?.set('recipe', getRecipe(pageId, detailId)); //use set to trigger polymer observing
    pages.select(pageData['page']);
  }

  @reflectable
    dynamic getRecipe(p,i) {
    if (this.recipes != null && this.idData['id'] != null) {
      for (var i = 0; i < this.recipes.length; ++i) {
        var r = this.recipes[i];
        if (r['id'] == this.idData['id']) {
          return r;
        }
      }
    }
    return null;
  }

  @reflectable
  void drawerSelected(e, detail) {
    router.go('cat', {'cat':detail['selected']});
    if (!this.$['drawer'].persistent) this.$['drawer'].close();
  }

  @reflectable
  bool isDetailPage(page) {
      return page == 'detail';
  }

}
