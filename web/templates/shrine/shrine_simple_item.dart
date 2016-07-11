@HtmlImport('shrine_simple_item.html')
library shrine.lib.shrine_simple_item;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';


/// Uses [PaperInput]
@PolymerRegister('shrine-simple-item')
class ShrineSimpleItem extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  ShrineSimpleItem.created() : super.created();

  @property Map item = null;
}
