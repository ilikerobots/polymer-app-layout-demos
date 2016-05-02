@HtmlImport('x_app.html')
library polymer_app_layout_demos.web.patterns.transform_navigation.transform_navigation;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' ;
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_item.dart';
import 'package:polymer_elements/paper_menu.dart';
import 'package:polymer_elements/paper_tabs.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/roboto.dart';
import 'package:polymer_elements/iron_flex_layout.dart';

import 'package:polymer_app_layout/app_toolbar.dart';
import 'package:polymer_app_layout/app_scroll_effects/effects/parallax_background.dart';
import 'package:polymer_app_layout/app_drawer_layout.dart';
import 'package:polymer_app_layout/app_drawer.dart';
import 'package:polymer_app_layout/app_header.dart';
import 'package:polymer_app_layout/app_header_layout.dart';

@PolymerRegister('x-app')
class Xapp extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

    Xapp.created() : super.created() {
      polymerCreated();
    }

    @property String selected = 'Item One';
    @Property(observer: 'onLayoutChange') bool wideLayout = false;
    @property List<String> items = ['Item One', 'Item Two', 'Item Three', 'Item Four', 'Item Five'];


      @reflectable
      onLayoutChange(bool wide, bool old) {
        var drawer = this.$$('app-drawer');

        if (wide && drawer.opened) {
          drawer.opened = false;
        }
      }

}
