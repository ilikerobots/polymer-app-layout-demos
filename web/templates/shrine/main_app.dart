@HtmlImport('main_app.html')
library shrine.lib.main_app;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:route_hierarchical/client.dart';
import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_tabs.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/iron_pages.dart';
import 'package:polymer_app_layout/app_scroll_effects.dart';
import 'package:polymer_app_layout/app_header_layout.dart';
import 'package:polymer_app_layout/app_header.dart';
import 'package:polymer_app_layout/app_drawer_layout.dart';
import 'package:polymer_app_layout/app_drawer.dart';
import 'package:polymer_app_layout/app_toolbar.dart';

import 'shrine_list.dart';
import 'shrine_detail.dart';

@PolymerRegister('main-app')
class MainApp extends PolymerElement with PolymerMixin, PolymerBase, JsProxy{

 @property Map route = {};

 @property String page = "list";

 @property Map sectionData = {'section': 'feature'};
 @property Map pageData = {'page': 'feature'};

 @property Map idData = {'id': "0"};

 @property bool onDetailPage = false;

 @property String text;

 @property List sections = [ 'feature', 'latest', 'fashion', 'furniture', 'beauty', 'food', 'travel' ];

 @Property(computed: 'computeSelectedTab(sections, sectionData.section)')
 num selectedTab;

 @property List items = [];
 @property List featuredItems = [];


 @Property(computed: 'computePage(onDetailPage)', reflectToAttribute:  true)


 final Router router = new Router(useFragment: true);

  MainApp.created() : super.created() {
    router.root
      ..addRoute(name: 'root', path: '', enter: (e) => _routePage('feature', -1), defaultRoute: true)
      ..addRoute(name: 'cat', path: '/:cat', enter: (e) => _routePage(e.parameters['cat'], -1))
      ..addRoute(name: 'detail', path: '/:cat/:id', enter: (e) => _routePage(e.parameter['cat'], e.parameters['id']));
    router.listen(ignoreClick: true);

    window.onHashChange.listen((HashChangeEvent e) {
      //Capture Hash
      var hash = window.location.hash;
      List parts = hash.substring(1,hash.length).split("/");
      var pId = parts[0];
      var itemId = -1;
      if (parts.length > 1) {
        itemId = int.parse(parts[1]);
      }
     _routePage(pId, itemId);
    });
  }



  void _routePage(pageId, detailId) {
   IronPages pages = this.$$('iron-pages');
   if (detailId >= 0) {
     set('page', 'detail');
   } else {
     set('page', 'list');
   }
   set('pageData', { 'page': pageId});
   set('sectionData', { 'section': pageId});
   set('idData', { 'id': detailId});
  }


  //observers: [
  //'_hashDidChange(route.path, items, featuredItems)'
  //],

  @reflectable
  num computeSelectedTab(sections, section) {
    return sections.indexOf(section);
  }

  @reflectable
  dynamic getItemsCopy(List i, _) {
    return new List.from(i);
  }

  @reflectable
  getFeaturedItem(List fItems, section) {
    var item  = fItems.firstWhere((item) => item['category'].toLowerCase() == section);
    return item;

  }

  @reflectable
  getDetailItem(items, id) {
    if (id > 0 && id < items.length) {
      return items[id];
    } else {
      return items[0];
    }

  }

  @reflectable
  computePage(onDetailPage) {
    return onDetailPage ? 'detail' : 'list';
  }

  @reflectable
  hashDidChange() {
    // TODO(blasten) Polymer.AppScrollEffects(0);
    //this.$.header._scrollTop = 0;
    //this.$.header.resetLayout();
    //this.$.drawer.close();
  }

  @reflectable
  bool equal(a, b) => a == b;

  @reflectable
  dynamic getSectionClass (index, selectedTab) {
    return index == selectedTab ? 'active' : '';
  }


  @reflectable
  bool shouldShowTabs(onDetailPage, smallScreen) {
     return !onDetailPage && !smallScreen;
  }

}
