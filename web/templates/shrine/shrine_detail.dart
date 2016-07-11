@HtmlImport('shrine_detail.html')
library shrine.lib.shrine_detail;

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart';

import 'package:polymer_elements/iron_flex_layout.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer_elements/paper_fab.dart';
import 'package:polymer_elements/iron_icons.dart';

import 'shrine_simple_item.dart';

/// Uses [PaperInput]
@PolymerRegister('shrine-detail')
class ShrineDetail extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  ShrineDetail.created() : super.created();

  @Property(observer: 'itemChanged') Map item = null;

  @property String type = null;

  @property List relatedItems = [];

  @reflectable
  dynamic itemChanged(item, olditem) {
    this.$['img'].src = '';
    this.$['img'].src = item != null ? item['imageUrl'] : '';
  }

}
