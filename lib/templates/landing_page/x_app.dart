@HtmlImport('x_app.html')
library polymer_app_layout_demos.lib.templates.landing_page.x_app;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' ;

import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/paper_icon_button.dart';

import 'package:polymer_app_layout/app_scroll_effects.dart';
import 'package:polymer_app_layout/app_header.dart';
import 'package:polymer_app_layout/app_header_layout.dart';
import 'package:polymer_app_layout/app_toolbar.dart';

import 'package:polymer_app_layout_demos/demo/sample_content.dart';

@PolymerRegister('x-app')
class XApp extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  XApp.created() : super.created() {
    polymerCreated();
  }

}


