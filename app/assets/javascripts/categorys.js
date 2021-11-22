$(document).ready(function(){
    $("#new").on('click',function () {
    var category_name = $('#category_name').val();
    console.log(category_name)
	$.ajax({
		type: "GET",
		url: "/categories" ,
		data: { category : {name: category_name}},
	}).then(function() {
  		alert('create category')
	});
  });
});