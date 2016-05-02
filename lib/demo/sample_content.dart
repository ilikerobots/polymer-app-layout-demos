@HtmlImport('sample_content.html')
library polymer_app_layout_demos.lib.demo.sample_content;

import 'package:polymer/polymer.dart';
import 'dart:math' as Math;
import 'dart:html';
import 'package:web_components/web_components.dart' show HtmlImport;

@PolymerRegister('sample-content')
class SampleContent extends PolymerElement with PolymerMixin, PolymerBase, JsProxy {

  @property int size = 10;
  @property String label = '';
  @property String padding = '16px';
  @property String margin = '24px';
  @property String boxShadow = '0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 1px 5px 0 rgba(0, 0, 0, 0.12), 0 3px 1px -2px rgba(0, 0, 0, 0.2)';


  List<String>  _lorem_ipsum_strings = [
        'Lorem ipsum dolor sit amet, per in nusquam nominavi periculis, sit elit oportere ea.',
        'Ut labores minimum atomorum pro. Laudem tibique ut has.',
        'Fugit adolescens vis et, ei graeci forensibus sed.',
        'Convenire definiebas scriptorem eu cum. Sit dolor dicunt consectetuer no.',
        'Ea duis bonorum nec, falli paulo aliquid ei eum.',
        'Usu eu novum principes, vel quodsi aliquip ea.',
        'Has at minim mucius aliquam, est id tempor laoreet.',
        'Pro saepe pertinax ei, ad pri animal labores suscipiantur.',
        'Detracto suavitate repudiandae no eum. Id adhuc minim soluta nam.',
        'Iisque perfecto dissentiet cum et, sit ut quot mandamus, ut vim tibique splendide instructior.',
        'Id nam odio natum malorum, tibique copiosae expetenda mel ea.',
        'Cu mei vide viris gloriatur, at populo eripuit sit.',
        'Modus commodo minimum eum te, vero utinam assueverit per eu.',
        'No nam ipsum lorem aliquip, accumsan quaerendum ei usu.'
  ];

  @Observe('size, label, padding, margin, boxShadow')
  void render(s, a, p, m, b) {
    //String html = '';
    for (var i = 0; i < size; i++) {
      Element e = new DivElement()
        ..style.boxShadow = boxShadow
        ..style.padding = padding
        ..style.margin = margin
        ..style.borderRadius = "5px"
        ..style.backgroundColor = "#fff"
        ..style.color = "#757575"
        ..children.add(new DivElement()
          ..style.display = "inline-block"
          ..style.height = "64px"
          ..style.width = "64px"
          ..style.borderRadius = "50%"
          ..style.background = "#ddd"
          ..style.lineHeight = "64px"
          ..style.fontSize = "30px"
          ..style.color = "#555"
          ..style.textAlign = "center"
          ..text = _randomLetter()
        )
        ..children.add(new DivElement()
          ..style.fontSize = "22px"
          ..style.margin = "16px 0"
          ..style.color = "#212121"
          ..text = "$label ${_randomString()}"
        )
        ..children.add(new ParagraphElement()
          ..style.fontSize = "16px"
          ..text = "$label ${_randomString()}"
        )
        ..children.add(new ParagraphElement()
          ..style.fontSize = "14px"
          ..text = "$label ${_randomString(3)}"
        );


      this.children.add(e);
    }
  }

  String _randomString([int len = 1]) {
        var ls = this._lorem_ipsum_strings;
        var s  = '';
        do {
          s += ls[new Math.Random().nextInt(ls.length)];
          len--;
        } while (len > 0);
        return s;
      }

   String _randomLetter() {
        return new String.fromCharCode(65 + new Math.Random().nextInt(26));
   }


  SampleContent.created() : super.created() {
    polymerCreated();
  }


}



