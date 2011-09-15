// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
		$("#option1").bind("change",function(e){
			id = $(this).val();
			jQuery.getJSON("http://localhost:3000/json/get_sub_cat/"+id+".json",function(data){
				html = "";
				$.each(data,function(index,data){
					html += '<option value="'+data.category.id+'">'+data.category.name+"</option>";
				});
				
				$('#option2').html(html);
				
			})
		});
});