@HtmlImport('shrine_item.html')
library shrine.lib.shrine_item;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';
import 'package:polymer_elements/iron_icons.dart';
import 'package:polymer_elements/iron_icon.dart';

/// Uses [PaperInput]
@PolymerRegister('shrine-item')
class ShrineItem extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  ShrineItem.created() : super.created();

  @property dynamic item;

}
