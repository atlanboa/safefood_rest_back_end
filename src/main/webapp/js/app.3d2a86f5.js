(function(t){function n(n){for(var a,i,s=n[0],c=n[1],l=n[2],d=0,p=[];d<s.length;d++)i=s[d],Object.prototype.hasOwnProperty.call(r,i)&&r[i]&&p.push(r[i][0]),r[i]=0;for(a in c)Object.prototype.hasOwnProperty.call(c,a)&&(t[a]=c[a]);u&&u(n);while(p.length)p.shift()();return o.push.apply(o,l||[]),e()}function e(){for(var t,n=0;n<o.length;n++){for(var e=o[n],a=!0,s=1;s<e.length;s++){var c=e[s];0!==r[c]&&(a=!1)}a&&(o.splice(n--,1),t=i(i.s=e[0]))}return t}var a={},r={app:0},o=[];function i(n){if(a[n])return a[n].exports;var e=a[n]={i:n,l:!1,exports:{}};return t[n].call(e.exports,e,e.exports,i),e.l=!0,e.exports}i.m=t,i.c=a,i.d=function(t,n,e){i.o(t,n)||Object.defineProperty(t,n,{enumerable:!0,get:e})},i.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},i.t=function(t,n){if(1&n&&(t=i(t)),8&n)return t;if(4&n&&"object"===typeof t&&t&&t.__esModule)return t;var e=Object.create(null);if(i.r(e),Object.defineProperty(e,"default",{enumerable:!0,value:t}),2&n&&"string"!=typeof t)for(var a in t)i.d(e,a,function(n){return t[n]}.bind(null,a));return e},i.n=function(t){var n=t&&t.__esModule?function(){return t["default"]}:function(){return t};return i.d(n,"a",n),n},i.o=function(t,n){return Object.prototype.hasOwnProperty.call(t,n)},i.p="/";var s=window["webpackJsonp"]=window["webpackJsonp"]||[],c=s.push.bind(s);s.push=n,s=s.slice();for(var l=0;l<s.length;l++)n(s[l]);var u=c;o.push([0,"chunk-vendors"]),e()})({0:function(t,n,e){t.exports=e("56d7")},"034f":function(t,n,e){"use strict";var a=e("85ec"),r=e.n(a);r.a},"56d7":function(t,n,e){"use strict";e.r(n);e("e260"),e("e6cf"),e("cca6"),e("a79d");var a=e("2b0e"),r=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{attrs:{id:"app"}},[e("nav"),e("div",[e("router-view")],1)])},o=[],i={name:"app",components:{}},s=i,c=(e("034f"),e("2877")),l=Object(c["a"])(s,r,o,!1,null,null,null),u=l.exports,d=e("8c4f"),p=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"container"},[e("br"),e("h1",[t._v("Q & A")]),e("div",{staticClass:"input-group mb-3"},[e("div",{staticClass:"input-group-prepend"},[e("button",{staticClass:"btn btn-outline-secondary dropdown-toggle",attrs:{type:"button","data-toggle":"dropdown"}},[t._v(" "+t._s(t.category)+" ")]),e("div",{staticClass:"dropdown-menu"},[e("div",{on:{click:function(n){return t.categoryChange("제목")}}},[t._v("제목")]),e("div",{on:{click:function(n){return t.categoryChange("작성자")}}},[t._v("작성자")]),e("div",{on:{click:function(n){return t.categoryChange("내용")}}},[t._v("내용")])])]),e("input",{directives:[{name:"model",rawName:"v-model",value:t.searchText,expression:"searchText"}],staticClass:"form-control",attrs:{type:"text",placeholder:"Search......","aria-label":"Recipient's username","aria-describedby":"basic-addon2"},domProps:{value:t.searchText},on:{keyup:t.search,input:function(n){n.target.composing||(t.searchText=n.target.value)}}}),t._m(0)]),e("table",{staticClass:"table table-hover"},[t._m(1),t._l(t.qnas,(function(n){return e("tr",{key:n.no,on:{click:function(e){return t.show_detail(n.no)}}},[e("td",{domProps:{innerHTML:t._s(n.no)}}),e("td",{domProps:{innerHTML:t._s(n.title)}}),e("td",{domProps:{innerHTML:t._s(n.writer)}}),e("td",{domProps:{innerHTML:t._s(n.hit)}}),e("td",{domProps:{innerHTML:t._s(n.time)}})])}))],2),e("button",{staticClass:"btn btn-primary",on:{click:function(n){return t.addQnA()}}},[t._v("글쓰기")])])},f=[function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"input-group-append"},[e("button",{staticClass:"btn btn-outline-secondary",attrs:{type:"button",disabled:""}},[t._v("검색")])])},function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("tr",[e("td",[t._v("글번호")]),e("td",[t._v("제목")]),e("td",[t._v("작성자")]),e("td",[t._v("조회수")]),e("td",[t._v("작성시간")])])}],m=(e("d3b7"),e("4989"),e("ab8b"),e("bc3a")),v=e.n(m),h=v.a.create({baseURL:"http://localhost:9999/",headers:{"Content-type":"application/json"}}),b={name:"qnalist",data:function(){return{category:"검색",searchText:"",qnas:[],loading:!0,errored:!1}},mounted:function(){this.start()},methods:{show_detail:function(t){this.$router.push("/qnaview/"+t)},addQnA:function(){this.$router.push("/addqna")},search:function(){var t=this;""==this.searchText?this.start():h.get("/qnatitle/"+this.searchText).then((function(n){return t.qnas=n.data})).catch((function(){t.errored=!0})).finally((function(){t.loading=!1,window.console.log(t.qnas)}))},start:function(){var t=this;h.get("/qna").then((function(n){return t.qnas=n.data})).catch((function(){t.errored=!0})).finally((function(){t.loading=!1,window.console.log(t.qnas)}))},categoryChange:function(t){this.category=t}}},g=b,_=Object(c["a"])(g,p,f,!1,null,"445cf470",null),q=_.exports,y=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"container"},[e("br"),e("table",{staticClass:"table table-hover"},[e("tr",{staticClass:"table-active"},[e("td",{attrs:{colspan:"2"}},[e("h1",{domProps:{innerHTML:t._s(t.qna.title)}})])]),e("tr",[e("td",[t._v("작성자")]),e("td",{domProps:{innerHTML:t._s(t.qna.writer)}})]),e("tr",[e("td",[t._v("내용")]),e("td",{domProps:{innerHTML:t._s(t.qna.content)}})]),e("tr",[e("td",[t._v("조회수")]),e("td",{domProps:{innerHTML:t._s(t.qna.hit)}})])]),e("table",{staticClass:"table table-hover"},t._l(t.answers,(function(n,a){return e("tr",{key:a},[e("td",{staticClass:"table-active"},[t._v("Administrator")]),e("td",{domProps:{innerHTML:t._s(n.content)}}),e("td",[e("input",{staticClass:"btn btn-outline-dark",attrs:{type:"button",value:"삭제"},on:{click:function(e){return t.delComment(n.cno)}}})])])})),0),e("form",{on:{submit:t.addComment}},[e("div",{staticClass:"input-group mb-3"},[e("input",{directives:[{name:"model",rawName:"v-model",value:t.comment,expression:"comment"}],staticClass:"form-control",attrs:{type:"text",placeholder:"답변 추가.....","aria-label":"Recipient's username","aria-describedby":"basic-addon2"},domProps:{value:t.comment},on:{input:function(n){n.target.composing||(t.comment=n.target.value)}}}),t._m(0)])]),e("button",{staticClass:"btn btn btn-warning",on:{click:t.updateQNA}},[t._v(" QNA 수정 ")]),e("button",{staticClass:"btn btn btn-danger",on:{click:t.deleteQNA}},[t._v(" QNA 삭제 ")])])},w=[function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"input-group-append"},[e("button",{staticClass:"btn btn-outline-primary",attrs:{type:"submit"}},[t._v("추가")])])}],C={name:"qnaview",props:["no"],data:function(){return{qna:{},answers:[],loading:!0,errored:!1,comment:null}},mounted:function(){var t=this;h.get("/qnano/"+this.no).then((function(n){t.qna=n.data})).catch((function(){t.errored=!0})).finally((function(){return t.loading=!1})),h.get("/comment/"+this.no).then((function(n){return t.answers=n.data})).catch((function(){t.errored=!0})).finally((function(){return t.loading=!1}))},methods:{updateQNA:function(){this.$router.push("/updateqna/"+this.no)},deleteQNA:function(){var t=this;alert(this.no),h.get("/deleteqna/"+this.no).then((function(t){1==t.data?alert("삭제 완료"):alert("삭제 실패"),location.href="/"})).catch((function(){t.errored=!0})).finally((function(){return t.loading=!1}))},addComment:function(){var t=this;h.post("/insertcomment",{no:this.no,content:this.comment}).then((function(t){1==t.data?alert("덧글 입력"):alert("덧글 입력 실패"),location.href="/"})).catch((function(){t.errored=!0})).finally((function(){return t.loading=!1}))},delComment:function(t){var n=this;h.get("/deletecomment/"+t).then((function(t){1==t.data?alert("삭제 완료"):alert("삭제 실패"),location.href="/"})).catch((function(){n.errored=!0})).finally((function(){return n.loading=!1}))}}},x=C,P=Object(c["a"])(x,y,w,!1,null,"995ca06e",null),T=P.exports,$=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"container"},[e("br"),e("form",{on:{submit:function(n){return n.preventDefault(),t.addQNA(n)}}},[e("table",{staticClass:"table table-hover form-group"},[t._m(0),e("tr",[e("td",[t._v("제목")]),e("td",[e("input",{directives:[{name:"model",rawName:"v-model",value:t.qna.title,expression:"qna.title"}],staticClass:"form-control",attrs:{type:"text"},domProps:{value:t.qna.title},on:{input:function(n){n.target.composing||t.$set(t.qna,"title",n.target.value)}}})])]),e("tr",[e("td",[t._v("내용")]),e("td",[e("input",{directives:[{name:"model",rawName:"v-model",value:t.qna.writer,expression:"qna.writer"}],staticClass:"form-control",attrs:{type:"text"},domProps:{value:t.qna.writer},on:{input:function(n){n.target.composing||t.$set(t.qna,"writer",n.target.value)}}})])]),e("tr",[e("td",[t._v("작성자")]),e("td",[e("textarea",{directives:[{name:"model",rawName:"v-model",value:t.qna.content,expression:"qna.content"}],staticClass:"form-control",attrs:{rows:"5"},domProps:{value:t.qna.content},on:{input:function(n){n.target.composing||t.$set(t.qna,"content",n.target.value)}}})])])]),e("button",{staticClass:"btn btn-primary",attrs:{type:"submit"}},[t._v("추가")])])])},N=[function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("tr",{staticClass:"table-active"},[e("td",{attrs:{colspan:"2"}},[e("h1",[t._v("글 쓰 기")])])])}],O={name:"addqna",data:function(){return{qna:{title:null,content:null,writer:null,hit:null,time:null}}},methods:{addQNA:function(){var t=this;h.post("/insertqna",this.qna).then((function(t){1==t.data?alert("등록 됨"):alert("등록 실패요"),location.href="/"})).catch((function(){t.errored=!0})).finally((function(){return t.loading=!1}))}}},j=O,k=Object(c["a"])(j,$,N,!1,null,"1c31884a",null),A=k.exports,M=function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("div",{staticClass:"container"},[e("br"),e("div",[e("form",{on:{submit:function(n){return n.preventDefault(),t.updateQNA(n)}}},[e("table",{staticClass:"table table-hover form-group"},[t._m(0),e("tr",[e("td",[t._v("제목")]),e("td",[e("input",{directives:[{name:"model",rawName:"v-model",value:t.qna.title,expression:"qna.title"}],staticClass:"form-control",attrs:{type:"text"},domProps:{value:t.qna.title},on:{input:function(n){n.target.composing||t.$set(t.qna,"title",n.target.value)}}})])]),e("tr",[e("td",[t._v("작성자")]),e("td",[e("input",{directives:[{name:"model",rawName:"v-model",value:t.qna.writer,expression:"qna.writer"}],staticClass:"form-control",attrs:{type:"text"},domProps:{value:t.qna.writer},on:{input:function(n){n.target.composing||t.$set(t.qna,"writer",n.target.value)}}})])]),e("tr",[e("td",[t._v("내용")]),e("td",[e("textarea",{directives:[{name:"model",rawName:"v-model",value:t.qna.content,expression:"qna.content"}],staticClass:"form-control",attrs:{rows:"5"},domProps:{value:t.qna.content},on:{input:function(n){n.target.composing||t.$set(t.qna,"content",n.target.value)}}})])])]),e("button",{staticClass:"btn btn-primary",attrs:{type:"submit"}},[t._v("수정")])])])])},Q=[function(){var t=this,n=t.$createElement,e=t._self._c||n;return e("tr",{staticClass:"table-active"},[e("td",{attrs:{colspan:"2"}},[e("h1",[t._v("글 수 정")])])])}],L={name:"updateqna",props:["no"],data:function(){return{qna:{no:this.no,title:null,content:null,writer:null,hit:null,time:null}}},mounted:function(){var t=this;h.get("/qnano/"+this.no).then((function(n){t.qna=n.data})).catch((function(){t.errored=!0})).finally((function(){return t.loading=!1}))},methods:{updateQNA:function(){var t=this;h.put("/updateqna",this.qna).then((function(t){1==t.data?alert("등록 됨"):alert("등록 실패요"),location.href="/"})).catch((function(){t.errored=!0})).finally((function(){return t.loading=!1}))}}},E=L,H=Object(c["a"])(E,M,Q,!1,null,"1a5cb15c",null),S=H.exports;a["a"].use(d["a"]);var R=new d["a"]({mode:"history",routes:[{path:"/",name:"qnalist",component:q},{path:"/qnaview/:no",name:"qnaview",component:T,props:!0},{path:"/addqna",name:"addqna",component:A},{path:"/updateqna/:no",name:"updateqna",component:S,props:!0}]});a["a"].config.productionTip=!1,new a["a"]({router:R,render:function(t){return t(u)}}).$mount("#app")},"85ec":function(t,n,e){}});
//# sourceMappingURL=app.3d2a86f5.js.map