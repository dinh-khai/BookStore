var category=document.querySelector(".category")
var categoryList =document.querySelector(".category-list")

if(category!=null){
category.onclick=function(){
	categoryList.classList.toggle("hide")
}
}
