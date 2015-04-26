<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	request.setAttribute("path", path);
%>
<html>
<head>
    <title>JQuery Ajax Upload ProgressBar</title>
    <link href="${path}/css/static.min.css" rel="stylesheet"/>
    <link href="${path}/css/demo.css" rel="stylesheet"/>
    <script src="${path}/js/static.min.js"></script>
	<script src="${path}/js/jquery.progresstimer.min.js"></script>
	<script>
	    $(function(){
		    $("#file_form").submit(function() {
				var data = new FormData();
				jQuery.each($('input[name=image]')[0].files, function(i, file) {
					data.append('image', file);
				});
				
				var progress = $(".loading-progress").progressTimer({
			        //timeLimit: 10,
			        onFinish: function () {
			            alert('completed!');
			        }
			    });
				
				$.ajax({
					type: "POST",
					url: "${path }/uploadAction.do",
					data: data,
					cache: false,
				    contentType: false,
				    processData: false,
					success: function(data){
						console.log(data);
					}
				}).error(function(){
			        progress.progressTimer('error', {
			            errorText:'ERROR!',
			            onFinish:function(){
			                alert('There was an error processing your information!');
			            }
			        });
			    }).done(function(){
			        progress.progressTimer('complete');
			    });
		    
				return false;
		    });
		});
	</script>
</head>
<body>
	<div class="loading-progress"></div>
	<form id="file_form" enctype="multipart/form-data">
		<input type="file" name="image"><br>
		<input type="submit" value="上传">
	</form>
</body>
</html>