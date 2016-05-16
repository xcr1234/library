function cancel(){
	var r=confirm("是否要删除，暂时没有回收站功能")
  if (r==true)
    {
   alert("您已成功删除");
    }
  else
    {
    alert("您取消了这次删除操作");
    }
    return false;
}
function tabshift(){
  var links=document.getElementById("links").getElementsByTagName("a");
  for (var i = 0; i <links.length; i++) {
    // alert(links[i]);
    var sectionId=links[i].getAttribute("href").split("#")[1];
    links[i].destination=sectionId;
    links[i].onclick=function(){
      showSection(this.destination);
      return false;
    }
  };
}
function showSection(id){
  var sections=document.getElementsByTagName("section");
  for (var i = 0; i<sections.length; i++) {
    if(sections[i].getAttribute("id")!=id){
      sections[i].style.display="none";
    }else{
    sections[i].style.display="block";}
  };
}
window.onload=tabshift;