   // var textarea = $('#id_content');
//    var editDiv = $('<div>', {
//      position: 'absolute',
//      width: textarea.width(),
//      height: textarea.height(),
//      'class': textarea.attr('class')
//    }).insertBefore(textarea);
$(document).ready(
   function(){
    textarea=$("#id_content");
    var editDiv = $('<div>', {
      position: 'relative',
      style:"",
      display: 'flex',
      //'id':textarea.attr('id'),
      'id':'editor1',
      //'name':textarea.attr('name'),
      //'class': textarea.attr('class')
    }).insertAfter(textarea);
    // textarea.css("display","none");
    contentvalue=textarea.val();
    //textarea.remove();
    var E = window.wangEditor;
        var editor = new E('#editor1');
        editor.customConfig.uploadImgServer = '/myeditor/upload/';
        editor.customConfig.uploadImgTimeout = 60000;
        editor.customConfig.uploadFileName = 'upimage';
        editor.customConfig.onchange = function (html) {
           textarea.val(html);
        }
    editor.create();
    editor.txt.html(contentvalue);
}
)
    // textarea.style.display="none";
