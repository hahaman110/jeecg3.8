var isValidate=true,existLis=[],captchaLis=[],authcodeLis=[],triggered=false;function initRadio(){$("li[typ='radio']","#fields").each(function(g,p){var e=$(p),m=e.find("div.content");if(e.has("fieldset").length>0){m=m.find("fieldset")}if(e.attr("random")=="1"){var d=[],h=m.find("span");if(h.length==0){h=m.find(">label")}var o=$(h[h.length-1]).find(":radio").hasClass("other"),k,f=h.length;if(o){k=h[h.length-1];f=h.length-1}while(d.length<f){var n=Math.random();n=Math.round(n*(f-1));if($.inArray(n,d)===-1){d.push(n)}}m.empty();for(j=0;j<f;j++){m.append(h[d[j]])}if(o){m.append(k)}}m.find(">label:eq(0)").addClass("first");var b=function(){var q=$(this).parent().parent(),l=$.trim($(this).val());if(!l){l="其它"}q.find(":radio.other").val(l)};m.find(":text.other").bind({keyup:b,change:b,click:function(c){$(this).parent().parent().find(":radio.other").prop("checked",true);highlight(c,this)}})});if(!window.isForMobile){var a=null;$(":radio").bind({click:function(b){if(a===this){$(a).prop("checked",false).trigger("change");a=null}else{a=this;if($(this).hasClass("other")){$(this).parent().find(":text.other").focus()}}b.stopPropagation()}});$("table.table td").click(function(){var b=$(this).find(":radio");b.attr("checked",true)})}}function initUpload(){var c=function(d){var h;if($("#_id").val()){var l=d.find("div.content"),k=l.find("input.fileSize").attr("name"),g=l.find("input.fileId").attr("name"),f=l.find("input.fileType").val(),e=[g.substring(0,k.indexOf("_")),l.find("input.fileType").attr("name"),k.substring(0,k.indexOf("_")),l.find("input.fileName").attr("name")];h={ENTRYID:$("#_id").val(),FRMID:$("#FRMID").val(),FILEID:l.find("input.fileId").val(),FILETYPE:f,FILEFIELDS:e,FLDID:d.attr("id")}}else{h={FRMID:$("#FRMID").val(),FLDID:d.attr("id")}}return h},b=function(d,e){var f=d.find("div.content");if(e.status==="success"){d.removeClass("error").find("p.errMsg").remove();f.find("div.uploadedFile").show();if($.isImage(e.fileName)){f.find("span.uploadedFileName").html($.format('<img class="img-edit" src="{0}" />',IMAGEURL+e.fileId+e.fileType+FILEIMAGEEDITSTYLE))}else{f.find("span.uploadedFileName").text($.format("{0}({1})",e.fileName,$.formatFileSize(e.fileSize)))}f.find("input.fileId").val(e.fileId).trigger("change");f.find("input.fileName").val(e.fileName).trigger("change");f.find("input.fileSize").val(e.fileSize).trigger("change");f.find("input.fileType").val(e.fileType).trigger("change")}else{if(e.status==="error"){showErrorMsg(d,$.format(msg[e.errCode],e.msg));f.find("input.fileId").val("").trigger("change");f.find("input.fileName").val("").trigger("change");f.find("input.fileSize").val("").trigger("change");f.find("input.fileType").val("").trigger("change")}}$("#btnSubmit").prop("disabled",false);$.hideStatus()};var a=function(d){var g=d.find("div.content"),e=g.find("input.file").attr("id");$("#btnSubmit").prop("disabled",true);var f=c(d);$.showStatus("正在上传文件...");$.ajaxFileUpload({url:"/web/formview/ajaxupload",fileElementId:e,secureuri:true,dataType:"json",data:f,success:function(k,h){b(d,k)},error:function(k,h,l){showErrorMsg(d,$.format(msg.uploadError,l));isValidate=true;$("#btnSubmit").prop("disabled",false);$.hideStatus();return false}})};$("#fields").find("input.file").each(function(g,e){var h=$(e),d=h.parent().parent(),k;h.localResizeIMG({cprs:d.attr("cprs"),quality:0.5,before:function(l,f){k=$(l).val().match(/[^\/\\]*$/)[0];$.showStatus("正在上传文件...")},unsupport:function(){a(d)},success:function(f){var l=$.extend(c(d),{IMAGENAME:k,IMAGEDATA:f.clearBase64});if(l.FILEFIELDS){l.FILEFIELDS=l.FILEFIELDS.join(",")}jQuery.ajax({url:"/web/formview/compressandupload",data:l,type:"post",contentType:"application/x-www-form-urlencoded",dataType:"json",success:function(n,m){b(d,n);$.hideStatus()},error:function(n,m,o){showErrorMsg(d,$.format(msg.uploadError,o));isValidate=true;$("#btnSubmit").prop("disabled",false);$.hideStatus();return false}})}})});$("a.deleteIcon","#fields").live({click:function(){if(confirm("删除后不可恢复，确认删除吗？")){var l=$(this).parent().parent(),h,g="/web/formview/deletefile";if($("#_id").val()){var k=l.find("input.fileSize").attr("name"),f=l.find("input.fileId").attr("name"),e=l.find("input.fileType").val(),d=[f.substring(0,k.indexOf("_")),l.find("input.fileType").attr("name"),k.substring(0,k.indexOf("_")),l.find("input.fileName").attr("name")];h={ENTRYID:$("#_id").val(),FRMID:$("#FRMID").val(),FILEID:l.find("input.fileId").val(),FILETYPE:e,FILEFIELDS:d,INITTIME:INITTIME};g="/web/entries/deletefile"}else{h={FRMID:$("#FRMID").val(),FILEID:l.find("input.fileId").val(),FILETYPE:l.find("input.fileType").val()}}$.showStatus("正在删除文件...");$.postJSON(g,h,function(m){if(m){$.alert(m.ERRMSG);$.hideStatus();return}l.find("div.uploadedFile").hide();l.find("input.fileId").val("").trigger("change");l.find("input.fileName").val("").trigger("change");l.find("input.fileSize").val("").trigger("change");l.find("input.fileType").val("").trigger("change");$.hideStatus()})}return false}})}var calShopCard=function(){var h=false,a,k,g,m,d,b,f=0,n=0,l=0;$("#fields>li[TYP='goods']").each(function(p,o){a=$(o);if(!a.is(":visible")){return true}k=$("#ul"+a.attr("id")).empty();a.find("div.goods-item").each(function(q,r){var s=$(r);d=parseFloat(s.find("input.number").val())||0;m=s.find("div.price").text();g=parseFloat(m.replace(/[¥$£€]/,""))||0;b=s.find("label.name").text();if(d>0){k.append($.format("<li><span class='goods-name'>{0}</span><span class='price-number'>{1} × {2}</span></li>",b,m,d));l+=d*g;h=true}})});l=l.toFixed(2);f=l;var c=parseFloat($("#shopping_cart").find("span.salem").text())||0,e=parseFloat($("#shopping_cart").find("span.salej").text())||0;if(c>0&&e>0){n=(Math.floor(l/c)*e).toFixed(2);f=(l-n).toFixed(2)}$("#amount").val(f);if(h){$("#shopping_cart").show().find("span.total").text(l).end().find("span.amount").text(f);if(n>0){$("#shopping_cart").find("div.discount-container").show().find("span.discount").text(n)}else{$("#shopping_cart").find("div.discount-container").hide()}}else{$("#shopping_cart").hide()}};function initGoods(){$("#fields div.goods-item a.decrease,#fields div.goods-item a.increase").click(function(){var d=$(this).parent(),b=d.find("input.number"),a=parseFloat(b.val())||0;if(b.prop("disabled")){return false}if($(this).hasClass("decrease")){if(a>=1){b.val(--a)}}else{b.val(++a)}calShopCard();return false});$("#fields div.goods-item").find("input.number").bind({blur:function(){calShopCard()}});$("#fields div.goods-item").find("input.number").trigger("blur")}function initAuthCode(){$("#fields").find("button.sendcode").click(function(){var b=$("div.content").has(this).find("input.phone").val();if($.isMobile(b)){var c=$(this),a=c.parent().find("span.ui-btn-text");$.showStatus("正在发送手机验证码...");$.postJSON("/web/formview/sendauthcode",{FRMID:$("#FRMID").val(),TEL:b,SIGN:$(this).attr("SIGN")},function(e){if(e<=0){$.alert("发送验证码失败：可用短信量不足，需要充值，请与表单创建者联系。")}else{c.text("120").prop("disabled",true);a.text("120").css({color:"#aaaaaa"});var d=setInterval(function(){var f=parseInt(c.text());if(f>0){c.text(--f);a.text(f)}else{c.text("发送验证码").prop("disabled",false);a.text("发送验证码").css({color:"#222222"});clearInterval(d)}},1000)}$.hideStatus()})}})}function initInstruct(){$("#fields>li").bind({mouseover:function(){$(this).find("p.instruct").removeClass("hide")},mouseout:function(){var a=$(this).find("p.instruct");if(!$("li").has(a).hasClass("focused")){a.addClass("hide")}}})}function initAddress(){$("#fields>li[typ='address']").each(function(d,b){b=$(b);var f=b.attr("def"),a,g=b.find("select.province"),h=b.find("select.city"),e=b.find("select.zip"),c="";if(f){a=f.split("-")}$.each(address.provinces,function(m,l){c+=$.format("<option value='{0}'>{1}</option>",m,m)});g.append(c);g.change(function(){var k=$(this).val();h.empty().append("<option value=''>市</option>");e.empty().append("<option value=''>区/县</option>");if(k){var l="";$.each(address.provinces[k],function(n,m){l+=$.format('<option value="{0}">{1}</option>',n,n)});h.append(l)}});h.change(function(){var k=b.find("select.province").val(),m=$(this).val();e.empty().append("<option value=''>区/县</option>");if(m){var l="";$.each(address.provinces[k][m],function(o,n){l+=$.format('<option value="{0}">{1}</option>',n,n)});e.append(l)}});if(a&&a[0]){g.val(a[0]);g.trigger("change")}if(a&&a[1]){h.val(a[1]);h.trigger("change")}if(a&&a[2]){e.val(a[2])}})}function initMap(){$("#fields").find("div.map").each(function(e,p){var n=$(p).parent(),f=n.find("input.location"),d=n.find("input.j"),o=n.find("input.w"),k=n.find("button.getlocation"),q=n.find("button.marker");var b,m,l;var a=function(s){d.val(s.position.getLng());o.val(s.position.getLat());var r=new AMap.LngLat(s.position.getLng(),s.position.getLat());b.clearMap();var c=new AMap.Marker({});c.setPosition(r);c.setMap(b);b.setCenter(r);l.getAddress(r)},h=function(){$.alert("获取地址位置失败，请检查GPS是否打开，然后重试一次。");$.hideStatus()},g=function(c){f.val(c.regeocode.formattedAddress);f.removeClass("hide").show();k.text("重新获取").parent();$.hideStatus()};var b=new AMap.Map($(p).attr("id"),{zoom:13});b.plugin(["AMap.Geolocation","AMap.Geocoder"],function(){m=new AMap.Geolocation({});l=new AMap.Geocoder({radius:1000,extensions:"all"});b.addControl(m);AMap.event.addListener(m,"complete",a);AMap.event.addListener(m,"error",h);AMap.event.addListener(l,"complete",g)});$(p).data("map",b);AMap.event.addListener(b,"click",function(s){b.clearMap();var c=new AMap.Marker({});d.val(s.lnglat.getLng());o.val(s.lnglat.getLat());var r=new AMap.LngLat(s.lnglat.getLng(),s.lnglat.getLat());c.setPosition(r);c.setMap(b);l.getAddress(r)});k.click(function(){$.showStatus();m.getCurrentPosition()});q.click(function(){var c=n.find("div.map");if(c.is(":visible")){n.find("div.map").slideUp(200)}else{n.find("div.map").css("height","200px").slideDown(200)}n.find("input.location").show()});f.change(function(){if(!$(this).val()){d.val("");o.val("")}})})}function highlight(d,b){var a=$("li").has(b),c=a.attr("typ");$("li.focused").removeClass("focused");if(!a.hasClass("error")){a.addClass("focused")}$("p.instruct").addClass("hide");a.find("p.instruct").removeClass("hide");d.stopPropagation()}function initFocus(){if(window.isForMobile){$("#fields").find(".controlgroup>label,table.table label").bind({click:function(a){a.stopPropagation()}});return}$(".fld").bind({click:function(a){highlight(a,this)},focus:function(a){highlight(a,this)}});$("#fields>li[id]").click(function(){if(!$(this).hasClass("focused")){$("li.focused").removeClass("focused");$("p.instruct").addClass("hide");var a=$(this).attr("typ");if(a!="section"&&a!="html"&&a!="image"&&a!="goods"){$(this).addClass("focused").find("p.instruct").removeClass("hide").end().find(":input:eq(0)").focus()}}})}function updateSelects(a,b){var d=$(b).is("li")?$(b):$(b).parent().parent();if(a&&d.find("input.yyyy").length>0){d.find("input.yyyy").val(a.getFullYear());d.find("input.mm").val($.formatHH(a.getMonth()+1));d.find("input.dd").val($.formatHH(a.getDate()));d.find("input.val").val($.getDate(d)).trigger("change")}else{d.find("input.val").val(a).trigger("change")}}function initNumberInput(){var e=function(l){var k=l.find("input.tel1").val(),h=l.find("input.tel2").val(),g=l.find("input.tel3").val();if(k||h){return $.format("{0}-{1}-{2}",k,h,g)}else{return""}},f=function(h){var g=$(this).val(),k=$(this).parent().parent();$(this).val(g.replace(/^\+\D/g,""));k.find(".val").val(e(k))},b=function(h){var g=$(this).val(),k=$(this).parent().parent();$(this).val(g.replace(/\D/g,""));k.find(".val").val($.getTime(k)).trigger("change")},d=function(h){var g=$(this).val(),k=$(this).parent().parent();$(this).val(g.replace(/\D/g,""));k.find(".val").val($.getDate(k)).trigger("change")},c=function(h){if(window.isForMobile){return}var g=$(this).val();$(this).val(g.replace(/[^(\-?\d\.?)]/g,"").replace(/[\(\)\?]/g,""))},a=function(){var g=$(this).val(),h=$(this).parent().parent();$(this).val(g.replace(/-/g,""));h.find(".val").val($.getName(h)).trigger("change")};$("select.hh,select.mi","#fields").bind({change:function(){var k=$(this).parent().parent(),h=k.find("select.hh").val(),g=k.find("select.mi").val();if(h&&g){k.find(".val").val($.format("{0}:{1}",h,g))}else{k.find(".val").val("")}}});$("input.yyyy,input.mm,input.dd","#fields").bind({keyup:d,change:d});$("input.number,input.money","#fields").bind({keyup:c,change:c});$("input.n1,input.n2,input.n3","#fields").bind({keyup:a,change:a});$("input.authcode,input.phone,input.tel1,input.tel2,input.tel3","#fields").bind({keyup:f,change:f})}function initDropdown2(){$("#fields").find("select.dd1").bind({change:function(){var a=$(this).find("option:selected").attr("items"),b=$(this).parent().find("select.dd2").empty();if(a){$.each(a.split(","),function(d,c){b.append($.format("<option value='{0}'>{0}</option>",c))})}}}).trigger("change")}function initMatchAndAcmp(){var getMatchedText=function(s){var idx=s.indexOf(",");if(idx>0){return s.substring(0,idx)}else{return s}},updown=function(_txt,keycode){var txt=$(_txt),ul=txt.parent().find("ul.matul"),liCount=ul.find("li").length,li=ul.find("li.selected"),idx=li.index(),oldVal=txt.data("oldval");if(keycode==40){if(idx<liCount-1){li.removeClass("selected");var selectedLi=ul.find("li:eq("+(idx+1)+")");selectedLi.addClass("selected");txt.val(selectedLi.text())}else{li.removeClass("selected");txt.val(oldVal)}}else{if(keycode==38){if(idx>0){li.removeClass("selected");var selectedLi=ul.find("li:eq("+(idx-1)+")");selectedLi.addClass("selected");txt.val(selectedLi.text())}else{if(idx==0){li.removeClass("selected");txt.val(oldVal)}else{var selectedLi=ul.find("li:eq("+(liCount-1)+")");selectedLi.addClass("selected");txt.val(selectedLi.text())}}}}},getmatchdata=function(_txt,e){var keycode=e.which;if(keycode==40||keycode==38||keycode==13){updown(_txt,keycode);return false}var txt=$(_txt),v=txt.val(),matfrm=txt.attr("matfrm"),matfld=txt.attr("matfld"),p=txt.position(),h=txt.outerHeight(),w=txt.innerWidth();var ul=txt.parent().find("ul.matul"),ex=$("#fields>li").has(txt).attr("ex");txt.data("oldval",v);if(v){$.postJSON("/web/formview/getmatchvalue",{FRMID:matfrm,FLD:matfld,VAL:v,EXFLDS:ex?JSON.parse(ex).matfld:"",FLDS:txt.data("matflds")},function(list){if(ul.length==0){ul=$("<ul class='matul'></ul>");txt.after(ul)}ul.css("top",p.top+h);ul.css("left",p.left);ul.css("minWidth",w);ul.empty().show();$.each(list,function(i,v){var reg=new RegExp("("+txt.data("oldval")+")","g");var liStr="<li>"+v[matfld].replace(reg,"<i>$1</i>");if(ex){var ss=JSON.parse(ex).matfld.split(",");$.each(ss,function(j,s){if(s&&v[s]){liStr+=","+v[s]}})}liStr+="</li>";var li=$(liStr);li.data("data",v);ul.append(li);li.bind({mouseover:function(){$(this).addClass("selected")},mouseout:function(){if($(this).is(":visible")){$(this).removeClass("selected")}},mousedown:function(){var ul=$(this).parent(),txt=ul.parent().find("input.fld");setAutoCompValue(txt.data("liids"),$(this).data("data"));txt.val(getMatchedText($(this).text()));$(this).addClass("selected");ul.hide()}})})})}else{ul.hide()}},setAutoCompValue=function(liids,data){var setAddress=function(li,data){var selProvince=li.find("select.province"),selCity=li.find("select.city"),selZip=li.find("select.zip"),txtDetail=li.find("textarea.detail"),names=li.attr("acmpfld").split(",");selProvince.val("");selCity.val("");selZip.val("");txtDetail.val("");if(data[names[0]]){selProvince.val(data[names[0]]).trigger("change")}if(data[names[1]]){selCity.val(data[names[1]]).trigger("change")}if(data[names[2]]){selZip.val(data[names[2]])}if(data[names[3]]){txtDetail.val(data[names[3]])}};$.each(liids,function(i,liid){if(!liid){return true}var li=$("#"+liid),acmpfld=li.attr("acmpfld"),type=li.attr("typ"),v=data[acmpfld],fmt=li.attr("fmt");if(type!="radio"&&type!="checkbox"){li.find("input").val("");li.find("input[name]").val(v||"")}if(type=="date"){$.setDate(li,v)}else{if(type==="time"){$.setTime(li,v)}else{if(type==="name"){$.setName(li,v)}else{if(type==="phone"){$.setPhone(li,v)}else{if(type=="dropdown"){li.find("select[name]").val("");li.find("select[name]").val(v||"")}else{if(type=="radio"){li.find("input[name]").prop("checked",false);li.find("input[value='"+v+"']").prop("checked",true)}else{if(type=="address"){setAddress(li,data)}else{if(type=="name"){$.setName(li,v)}}}}}}}}})};$("#fields").find("input[matfrm],select[matfrm]").each(function(i,_txt){var txt=$(_txt),ex=$("#fields>li").has(txt).attr("ex"),nm=txt.attr("name"),matfld=txt.attr("matfld"),fields=[matfld],liids=[];if(ex){var obj=JSON.parse(ex);if(obj.matfld){var matflds=obj.matfld.split(",");$.each(matflds,function(i,v){fields.push(v);liids.push(null)})}}$("#fields>li[acmpsrcfld]").each(function(j,li){var l=$(li),acmpsrcfld=l.attr("acmpsrcfld"),acmpfld=l.attr("acmpfld");if((nm==acmpsrcfld||nm.indexOf(acmpsrcfld+"_")>-1)&&acmpfld){fields.push(acmpfld);liids.push(l.attr("id"))}});if(txt.is("select")){txt.bind({change:function(){var acmpData=eval("("+$(this).find("option:selected").attr("acmp")+")");setAutoCompValue(liids,acmpData)}})}else{txt.data("matflds",fields);txt.data("liids",liids);var keyupTime;var str="",now="",filter_time=function(e){var time=setInterval(function(){filter_staff_from_exist(e)},500);txt.bind("blur",function(){clearInterval(time)})},filter_staff_from_exist=function(e){now=$.trim(txt.val());if(now!=str){getmatchdata(txt,e)}str=now};txt.bind({focus:function(e){str=$.trim(txt.val());filter_time(e)},keyup:function(e){keyupTime=new Date().getTime(),_this=$(this);var keycode=e.which;if(keycode==40||keycode==38){getmatchdata(_this,e);now=$.trim(txt.val());str=now;return false}},keypress:function(e){var keycode=e.which;if(keycode==13){var txt=$(_txt),ul=txt.parent().find("ul.matul"),li=ul.find("li.selected"),idx=li.index(),oldVal=txt.data("oldval");if(idx>=0){txt.val(getMatchedText(txt.val()));setAutoCompValue(txt.data("liids"),li.data("data"))}ul.hide();return false}},blur:function(){var txt=$(_txt),ul=txt.parent().find("ul.matul"),li=ul.find("li.selected"),idx=li.index();if(idx>=0){setAutoCompValue(txt.data("liids"),li.data("data"))}else{txt.val("");setAutoCompValue(txt.data("liids"),{})}ul.hide()}})}})}function initFieldsPermForView(){if(window.ADVPERM&&"1"==ADVPERM.VIEWPERM){$("#fields").find("li").each(function(c,b){var a=$(b);if("1"==ADVPERM.VIEWPERM&&$.inArray(a.attr("id"),ADVPERM.VIEWFLDS)==-1){var d=a.attr("typ")||"";if($.inArray(d,["image","html","section",""])==-1){a.addClass("hide")}}})}}function showErrorMsg(a,b){isValidate=false;a.addClass("error");if(a.find("p.errMsg").length===0){a.append("<p class='errMsg'></p>")}a.find("p.errMsg").text(b)}function initValidate(){var b=function(){var h=$("li").has(this),g=parseInt(h.attr("max")),f=$(this).val().length;if(h.find("span.lengthLimit").length===0){h.find("label.desc").append("<span class='lengthLimit'></span>")}if(g-f>=0){h.find("span.lengthLimit").text($.format(msg.lengthLimit,g-f))}else{$(this).val($(this).val().substring(0,g));h.find("span.lengthLimit").text($.format(msg.lengthLimit,0))}},d=function(){isValidate=true;var f=$("#fields").find("li[id]:visible"),g=true,q,l,u,x,m,s,r,A,p,n;for(i=0;i<f.length;i++){q=$(f[i]);n=true;l=q.attr("TYP"),u=q.attr("MIN"),x=q.attr("MAX"),m=q.attr("REQD"),s=q.attr("UNIQ"),r=q.attr("DEF"),A=q.attr("name"),p;if(m==="1"){var y=true;if(l==="radio"){var t=q.find(":checked");if((t.val()&&!t.hasClass("other"))||(t.hasClass("other")&&$.trim(q.find(":text").val()))){y=false}}else{if(l==="checkbox"||l==="likert"){if(q.find(":checked").length>0){y=false}}else{if(l==="goods"){q.find("div.goods-item input.number").each(function(B,v){if((parseFloat($(v).val())||0)>0){y=false;return false}})}else{if(l==="address"){var h=q.find("select.province").val(),w=q.find("select.city").val(),z=q.find("select.zip").val();if(h&&w&&z){y=false}}else{q.find(":input[name]").each(function(v,B){if($.trim($(B).val())){y=false;return}})}}}}if(y){g=false;n=false;showErrorMsg(q,msg.reqdError);continue}}if(u){p=q.find("input,textarea").val();if(p){if(l==="number"||l==="money"){if(parseFloat(p)<parseFloat(u)){g=false;n=false;showErrorMsg(q,$.format(msg.minNumberError,u));continue}}}if(l==="text"||l==="textarea"){if(p.length<parseFloat(u)){g=false;n=false;showErrorMsg(q,$.format(msg.minTextError,u));continue}}else{if(l=="checkbox"){if(q.find(":checkbox:checked").length<parseFloat(u)){g=false;n=false;showErrorMsg(q,$.format(msg.minChkError,u));continue}}}}if(x){p=q.find("input,textarea").val();if(p){if(l==="number"||l==="money"){if(parseFloat(p)>parseFloat(x)){g=false;n=false;showErrorMsg(q,$.format(msg.maxNumberError,x));continue}}}if(l==="text"||l==="textarea"){if(p.length>parseFloat(x)){g=false;n=false;showErrorMsg(q,$.format(msg.maxTextError,x));continue}}else{if(l=="checkbox"){if(q.find(":checkbox:checked").length>parseFloat(x)){g=false;n=false;showErrorMsg(q,$.format(msg.maxChkError,x));continue}}}}if(l==="number"||l==="money"){p=q.find(":input[name]").val();if(p!=""&&!$.isNumber(p)){g=false;n=false;showErrorMsg(q,msg.numberError);continue}}else{if(l==="date"){p=q.find(":input[name]").val();if(p!=""&&!$.isDate(p)){g=false;n=false;showErrorMsg(q,msg.dateError);continue}}else{if(l==="email"){p=q.find(":input[name]").val();if(p!=""&&!$.isEmail(p)){g=false;n=false;showErrorMsg(q,msg.emailError);continue}}else{if(l==="phone"){var o=q.find(":input[name]"),k=o.attr("fmt"),p=o.val();if(p&&k=="mobile"&&!$.isMobile(p)){g=false;n=false;showErrorMsg(q,msg.mobileError);continue}}}}}if(n){q.removeClass("error");q.find("p.errMsg").remove()}}return g},c=function(m){var f=$("li").has(m),h=f.find(":input[name]"),k=h.attr("name"),g=h.val();var l={FRMID:$("#FRMID").val(),SID:$("#SID").val(),ENTRYID:$("#_id").val(),NM:k,VAL:g};$.postJSON("/web/formview/existValidate",l,function(n){if(n){showErrorMsg(f,msg.uniqError)}existLis.splice($.inArray(f.attr("id"),existLis),1);$("#btnSubmit,#btnSave,#btnActSave").trigger("serviceValidate")})},e=function(h){var f=$("li").has(h);var g={kaptcha:f.find(":input[name='kaptcha']").val()};$.postJSON("/web/formview/captchaValidate",g,function(k){if(!k){showErrorMsg(f,msg.captchaError)}captchaLis.splice($.inArray("liCaptcha",captchaLis),1);$("#btnSubmit,#btnSave,#btnActSave").trigger("serviceValidate")})},a=function(f){var g=$("#"+f.attr("id").substring(2));var h={TEL:g.find("input.phone").val(),CODE:f.find("input.authcode").val()};$.postJSON("/web/formview/authcodevalidate",h,function(k){if(!k){showErrorMsg(f,msg.authCodeError)}authcodeLis.splice($.inArray(f.attr("id"),authcodeLis),1);$("#btnSubmit,#btnSave,#btnActSave").trigger("serviceValidate")})};$("li[max]:has(textarea)","#fields").find("textarea").bind({keyup:b,change:b});$("#btnSubmit,#btnSave,#btnActSave").bind({click:function(){captchaLis=[],authcodeLis=[],triggered=false;var f=$("#_id").val()?"edit":"new";if(f=="new"&&"1"==ADVPERM.ADV&&!"1"==ADVPERM.ADD){$.alert("没有新增数据的权限，请与管理员联系。");return false}$.each(RULE.FIELDSRULE||[],function(h,k){if(!$("#"+k.RULEFLD).is(":visible")){$("#"+k.RULEFLD+",#au"+k.RULEFLD).setValues({},true)}});calShopCard();if(!d()){$("#fields").find("li.error:first").find(":input").focus();return false}$(this).prop("disabled",true);$.showStatus("正在验证数据...");if($("#liCaptcha").length>0){captchaLis.push("liCaptcha");e($("#liCaptcha").find(":text"))}var g=$("li[uniq='1']");if(g.length>0){g.each(function(k,h){existLis.push($(h).attr("id"));c($(h).find(":input[name]"))})}$("#fields input.authcode").each(function(h,k){var l=$(k);authcodeLis.push($(l).parent().parent().attr("id"));a($(l).parent().parent())});$(this).trigger("serviceValidate");return false},serviceValidate:function(){if(captchaLis.length===0&&existLis.length===0&&authcodeLis.length===0&&!triggered){triggered=true;if(!isValidate){$("#fields").find("li.error:first").find(":input").focus();$("#btnSubmit,#btnSave,#btnActSave").prop("disabled",false);$.hideStatus();return}else{var g=$("#_id").val()?"edit":"new";if(g==="new"){var h=parseFloat($("#TMOUT").val());$("#TMOUT").val(Math.round((new Date().getTime()-h)/1000))}var f=$("#form1").getValues();$.each(f,function(m,l){if(/^t\d/.test(m)){delete f[m]}});if($(this).attr("id")==="btnSubmit"){if($("#FRMID").attr("autofill")=="1"){$.setCookie($("#FRMID").val(),JSON.stringify(f),10)}else{$.delCookie($("#FRMID").val())}$.hideStatus();$("#form1")[0].submit()}else{$.showStatus("正在保存数据...");f.INITTIME=$.trim(INITTIME.toString());f.FRMNM=FRM.FRMNM;$.postJSON("/web/entries/save",f,function(k){if(k&&k.ERRMSG){$.alert(k.ERRMSG);$.hideStatus();return}$.closeLightBox();if(window.query){if(g==="new"){query(null,"FIRST",PAGESIZE,$("#entriesGrid").datagrid("getSortString"),$("#entriesGrid"))}else{if("1"==ADVPERM.ADV&&"1"==ADVPERM.FLT){query(null,"FIRST",PAGESIZE,$("#entriesGrid").datagrid("getSortString"),$("#entriesGrid"))}else{var l=$("#entriesGrid"),o=l.data("rowsData"),n=l.data("total"),m=l.find("tbody>tr.rowSelected").index();o[m]=k;l.data("rowsData",o);l.datagrid("fillData",{total:n,rows:o});l.find("tbody>tr:eq("+m+")").addClass("rowSelected");window.selectedData=k;$("#btnActVie").trigger("click")}}$.hideStatus()}else{$.malert("保存成功，正在跳转...",function(){window.location.href=document.referrer+$.format("#l{0}",liIndex||0)});$.hideStatus()}$("#btnSubmit,#btnSave,#btnActSave").prop("disabled",false)});return false}}}}})}var getDateByReg=function(d){var f,b=/^\+?(-?\d+) ?[Dd]ays$/,e=/^\+?(-?\d+) ?[Ww]eeks$/,c=/^\+?(-?\d+) ?[Mm]onths$/,a=new Date();if(d==="today"){return a}else{if(b.test(d)){f=parseInt(d.replace(b,"$1"));return a.addDate("d",f)}else{if(e.test(d)){f=parseInt(d.replace(e,"$1"));return a.addDate("w",f)}else{if(c.test(d)){f=parseInt(d.replace(c,"$1"));return a.addDate("m",f)}else{if($.isDate(d)){return Date.fromString(d)}}}}}},getTimeByReg=function(d){var e,b=/^\+?(-?\d+) ?[Mm]inutes$/,c=/^\+?(-?\d+) ?[Hh]ours$/,a=new Date();if(d==="now"){return $.format("{0}:{1}",$.formatHH(a.getHours()),$.formatHH(a.getMinutes()))}else{if(b.test(d)){e=parseInt(d.replace(b,"$1"));a=a.addDate("n",e);return $.format("{0}:{1}",$.formatHH(a.getHours()),$.formatHH(a.getMinutes()))}else{if(c.test(d)){e=parseInt(d.replace(c,"$1"));a=a.addDate("h",e);return $.format("{0}:{1}",$.formatHH(a.getHours()),$.formatHH(a.getMinutes()))}else{if($.isTime(d)){return d}}}}};function setDefaultValue(a){if(window.ISMBLEDIT){return}if(a){$("#fields").setValues({},true);$("#fields").find("select.dd1").trigger("change")}else{var d=$.getCookie($("#FRMID").val());if(d){try{var b=JSON.parse(d);$("#fields").setValues(b,true);$("#fields").find("input[type=hidden],input.location").val("");$("#fields").find("li[typ='goods']").find("input.number").trigger("blur")}catch(c){}}}$("li[def]","#fields").each(function(g,f){f=$(f);var l,h=f.attr("typ"),k=f.attr("def");if(!k){return}if(h==="date"){updateSelects(getDateByReg(k),f)}else{if(h==="time"){$.setTime(f,getTimeByReg(k))}else{if(h==="phone"){var e=k.split("-");if(e.length>0){$(e).each(function(n,m){f.find(":text:eq("+n+")").val(m)})}f.find(":input[name]").val(k)}else{if(h==="radio"){f.find(":radio:eq("+k+")'").prop("checked",true)}else{if(h==="dropdown"){f.find("option:eq("+k+")'").prop("selected",true)}else{if(h==="likert"){f.find("tbody>tr").each(function(m,n){$(n).find(":radio:eq("+k+")'").prop("checked",true)})}else{f.find("input.fld,textarea.fld").val(k)}}}}}}});if(window.QPARAMS){$("#fields").setValues(window.QPARAMS,true,true)}}function initRule(){var b=function(d,c){var e=true;if(d==="or"){e=false}$.each(c,function(h,f){var l=true,g=$(":input[name='"+f.FLD+"']"),n;if(g.length===0){g=$(":input[name^='"+f.FLD+"_']")}n=g.val();if(g.is(":checkbox")||g.is(":radio")){n=undefined;g.each(function(o,q){if($(q).prop("checked")){n=$(q).val();return false}})}if(f.CTYP==="eq"){if(f.DTYP==="filesize"){l=parseInt(n)===parseFloat(f.VAL)*1024*1024}else{if(f.DTYP==="number"){l=parseFloat(n)===parseFloat(f.VAL)}else{if(f.DTYP==="date"){l=n===$.formatDate(getDateByReg(f.VAL))}else{l=n===f.VAL}}}}else{if(f.CTYP==="ne"){if(f.DTYP==="filesize"){l=parseInt(n)!=parseFloat(f.VAL)*1024*1024}else{if(f.DTYP==="number"){l=parseFloat(n)!=parseFloat(f.VAL)}else{l=n!=f.VAL}}}else{if(f.CTYP==="bw"){l=n.indexOf(f.VAL)===0}else{if(f.CTYP==="ew"){var k=new RegExp("("+f.VAL+")$","gi");l=k.test(n)}else{if(f.CTYP==="ct"){l=n.indexOf(f.VAL)>=0}else{if(f.CTYP==="nct"){l=n.indexOf(f.VAL)===-1}else{if(f.CTYP==="in"){var m=f.VAL.split(";");l=$.inArray(n,m)>=0}else{if(f.CTYP==="nin"){var m=f.VAL.split(";");l=$.inArray(n,m)===-1}else{if(f.CTYP==="gt"){if(f.DTYP==="filesize"){l=parseInt(n)>parseFloat(f.VAL)*1024*1024}else{if(f.DTYP==="number"){l=parseFloat(n)>parseFloat(f.VAL)}else{l=n>f.VAL}}}else{if(f.CTYP==="gte"){if(f.DTYP==="filesize"){l=parseInt(n)>=parseFloat(f.VAL)*1024*1024}else{if(f.DTYP==="number"){l=parseFloat(n)>=parseFloat(f.VAL)}else{l=n>=f.VAL}}}else{if(f.CTYP==="lt"){if(f.DTYP==="filesize"){l=parseInt(n)<parseFloat(f.VAL)*1024*1024}else{if(f.DTYP==="number"){l=parseFloat(n)<parseFloat(f.VAL)}else{l=n<f.VAL}}}else{if(f.CTYP==="lte"){if(f.DTYP==="filesize"){l=parseInt(n)<=parseFloat(f.VAL)*1024*1024}else{if(f.DTYP==="number"){l=parseFloat(n)<=parseFloat(f.VAL)}else{l=n=f.VAL}}}}}}}}}}}}}}if(!l&&d==="and"){e=false;return false}if(l&&d==="or"){e=true;return false}});return e},a=function(c){$.each(RULE.FIELDSRULE||[],function(d,f){if(c){var e=false;$.each(f.CONS,function(k,h){if(c==h.FLD||c.indexOf(h.FLD+"_")==0){e=true;return false}});if(!e){return true}}var g=b(f.ANDOR,f.CONS);if(g){if(f.RULETYPE==="show"){$("#"+f.RULEFLD+",#au"+f.RULEFLD).show()}else{$("#"+f.RULEFLD+",#au"+f.RULEFLD).hide()}}else{if(f.RULETYPE==="show"){$("#"+f.RULEFLD+",#au"+f.RULEFLD).hide()}else{$("#"+f.RULEFLD+",#au"+f.RULEFLD).show()}}if("goods"==$("#"+f.RULEFLD).attr("typ")){calShopCard()}})};if(window.RULE&&RULE.FIELDSRULE&&RULE.ENABLERULE==="1"){$.each(RULE.FIELDSRULE,function(c,d){if(d.RULETYPE==="show"){$("#"+d.RULEFLD).hide()}});$(":text,input,select").change(function(){var c=$(this).attr("name");a(c)});$(":radio,:checkbox").click(function(){var c=$(this).attr("name");a(c)});a()}$("#container").removeClass("hide")}function onBridgeReady(){WeixinJSBridge.call("hideOptionMenu")}function initWeixinShare(){if(window.F&&F.DISSHARE==="1"){if(typeof WeixinJSBridge=="undefined"){if(document.addEventListener){document.addEventListener("WeixinJSBridgeReady",onBridgeReady,false)}else{if(document.attachEvent){document.attachEvent("WeixinJSBridgeReady",onBridgeReady);document.attachEvent("onWeixinJSBridgeReady",onBridgeReady)}}}else{onBridgeReady()}}}function initOthers(){$("#TMOUT").val(new Date().getTime());$("#imgKaptcha").click(function(){$(this).attr("src","/kaptcha.jpg?"+Math.floor(Math.random()*100))});if($("#needBuyInfo").length>0){$("#btnSubmit").prop("disabled",true)}$("#cornerQrcode").click(function(){var a=$("#qrcode");if(!a.attr("src")){a.attr("src","/qrcode.jpg?type=formview&c="+$("#FRMID").val())}$("#qrcodeContainer").show()});$("#qrcode").click(function(){setTimeout(function(){$("#qrcodeContainer").hide()},10)})}head.ready(function(){if(isEmbed){$("body").css({background:"none",padding:"0px",margin:"0px"});$("#form1").css({marginTop:"0px"});$("#container").css({width:"100%","box-shadow":"none"}).find("#form1").css({"padding-top":"20px"});$("#logo").hide()}initFocus();initInstruct();initRadio();initNumberInput();initGoods();initMap();initAddress();initAuthCode();initValidate();setDefaultValue();initMatchAndAcmp();initRule();initDropdown2();initFieldsPermForView();if($.ajaxFileUpload){initUpload()}$.initDate($("#fields"),updateSelects);initOthers();$.initPlat();initWeixinShare();var a=$("#container").attr("mobile");if(a){var b=$("#container").height(),c=$(window).height()-6;if(b<c){$("#container").css({minHeight:c})}}});