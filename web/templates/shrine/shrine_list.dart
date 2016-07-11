@HtmlImport('shrine_list.html')
library shrine.lib.shrine_list;

import 'dart:html';
import 'dart:math' as math;

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'shrine_item.dart';
import 'shrine_featured_item.dart';


/// Uses [PaperInput]
@PolymerRegister('shrine-list')
class ShrineList extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  ShrineList.created() : super.created();

  @property List items = [];

  @property dynamic featuredItem;

  @property String section;

  @reflectable
  dynamic sortItems(a,b) {
    return new math.Random().nextInt(3) - 1;
  }
}
