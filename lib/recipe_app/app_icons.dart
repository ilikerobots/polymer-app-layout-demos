@HtmlImport('app_icons.html')
library polymer_app_layout_demos.lib.recipe_app.app_icons;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' ;


import 'package:polymer_elements/iron_icon.dart';
import 'package:polymer_elements/iron_iconset_svg.dart';


@PolymerRegister('app-icons')
class AppIcons extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  AppIcons.created() : super.created() { }

}
