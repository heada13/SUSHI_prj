(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["HmoeView"],{"1a32":function(t,e,s){"use strict";s("bdce")},3112:function(t,e,s){},"3a3d":function(t,e,s){"use strict";s("4dad")},"4dad":function(t,e,s){},"5a7c":function(t,e,s){"use strict";s("5b33")},"5b33":function(t,e,s){},"7d97":function(t,e,s){"use strict";s.r(e);var a=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"ly_homeViewContainer"},[s("div",{staticClass:"ly_status hp_padding"},[s("Status")],1),s("div",{staticClass:"ly_main hp_padding"}),s("div",{staticClass:"ly_command hp_padding"})])},i=[],n=s("2b0e"),l=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"bl_status"},[s("div",{staticClass:"bl_freshness"},[s("Freshness")],1),s("div",{staticClass:"bl_salinity"},[s("Salinity")],1),s("div",{staticClass:"bl_price"},[s("Price")],1)])},c=[],r=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"bl_hpContainer"},[s("div",{staticClass:"el_hpText"},[t._v(" 鮮度"+t._s(t.currentHp)+"/100 ")]),s("div",{staticClass:"el_hpGage"},[s("div",{staticClass:"el_currentHp",style:t.styles})])])},u=[],o={name:"Freshness",data:function(){return{scale:.75}},computed:{styles:function(){return{"--hpp-scale":this.scale}},currentHp:function(){var t=100*this.scale;return t}}},d=o,_=(s("1a32"),s("2877")),p=Object(_["a"])(d,r,u,!1,null,null,null),f=p.exports,v=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"bl_salinityContainer"},[s("div",{staticClass:"el_salinityTitle"},[t._v(" 塩分濃度 ")]),s("div",{staticClass:"salinityPercentage"},[t._v(" "+t._s(t.salinity)+" "),s("span",{staticClass:"persentage"},[t._v("%")])])])},b=[],C={props:{salinityValue:{type:String,default:"0"}},computed:{salinity:function(){return this.salinityValue}}},m=C,h=(s("5a7c"),Object(_["a"])(m,v,b,!1,null,null,null)),y=h.exports,P=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",{staticClass:"el_priceContainer"},[s("div",{staticClass:"el_basePrice"},[s("span",{staticClass:"el_basePriceTitle"},[t._v(" 基準値 ")]),s("span",{staticClass:"el_basePriceValue"},[t._v(t._s(t.basePrice))])]),s("div",{staticClass:"el_marketPrice"},[s("span",{staticClass:"el_marketPriceTitle"},[t._v(" 市況 ")]),s("span",{staticClass:"el_marketPriceValue"},[t._v(t._s(t.marketPrice))])])])},V=[],g={props:{basePriceValue:{type:String,default:"0"},marketPriceValue:{type:String,default:"0"}},computed:{basePrice:function(){return this.basePriceValue},marketPrice:function(){return this.marketPriceValue}}},k=g,w=(s("e403"),Object(_["a"])(k,P,V,!1,null,null,null)),x=w.exports,S={components:{Freshness:f,Salinity:y,Price:x}},j=S,E=(s("93a5"),Object(_["a"])(j,l,c,!1,null,null,null)),O=E.exports,$=n["default"].extend({name:"HomeView",components:{Status:O}}),H=$,T=(s("3a3d"),Object(_["a"])(H,a,i,!1,null,"5146997e",null));e["default"]=T.exports},"93a5":function(t,e,s){"use strict";s("3112")},bdce:function(t,e,s){},dab6:function(t,e,s){"use strict";s.r(e);var a=function(){var t=this,e=t.$createElement,s=t._self._c||e;return s("div",[t._v(" test ")])},i=[],n={},l=n,c=s("2877"),r=Object(c["a"])(l,a,i,!1,null,null,null);e["default"]=r.exports},e3ec:function(t,e,s){},e403:function(t,e,s){"use strict";s("e3ec")}}]);
//# sourceMappingURL=HmoeView.5dc99f22.js.map