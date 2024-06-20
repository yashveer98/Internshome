<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${title}</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->



<%@include file="/views/common/allcss.html" %>
<style>
   
	.contact{
		padding: 4%;
		height: 400px;
		
	}
	.col-md-3{
		background-color: #5891ff;
		padding: 4%;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	.contact-info{
		margin-top:10%;
	}
	.contact-info img{
		margin-bottom: 15%;
	}
	.contact-info h2{
		margin-bottom: 10%;
	}
	.col-md-9{
		background: #fff;
		padding: 3%;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	.contact-form label{
		font-weight:600;
	}
	.contact-form button{
		font-weight: 600;
		width: 25%;
	}
	.contact-form button:focus{
		box-shadow:none;
	}
	.form-control:hover{
	outline: 0px solid transparent;
	border:solid;
	
	}

}</style>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>
<body style="background-color:#dee9ff; ">
<%@include file="/views/common/navbar.html" %>


<div class="container contact">
	<div class="row">
		<div class="col-md-3 rounded-4">
			<div class="contact-info">
				<img src="https://image.ibb.co/kUASdV/contact-image.png" alt="image"/>
				<h2>FeedBack</h2>
				<div class="container">
				<span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope" viewBox="0 0 16 16">
  <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
</svg> <a href="#">abc@xyz.com</a></span>
				</div>
				<h4>We would love to hear from you !</h4>
			</div>
		</div>
		<div class="col-md-9 rounded-3">
		<form action="postfeedback" method="post">
			<div class="contact-form">
				<div class="form-group">
				  <label class="control-label col-sm-2" for="fname">Full Name:</label>
				  <div class="col-sm-10">          
					<input type="text" class="form-control" id="name" placeholder="Enter Full Name" name="name" required="required">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="phone">Phone:</label>
				  <div class="col-sm-10">
					<input type="tel" class="form-control" id="phone" placeholder="Enter Phone Number" name="phone" required="required">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="email">Email:</label>
				  <div class="col-sm-10">
					<input type="email" class="form-control" id="email" placeholder="Enter email" name="email" required="required">
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="rating">Enter Rating</label>
				  <div class="col-sm-10">
             <input type="range" class="form-range" min="0" max="5" id="rating" name="rating" >
				  </div>
				</div>
				<div class="form-group">
				  <label class="control-label col-sm-2" for="feedback">Feedback:</label>
				  <div class="col-sm-10">
					<textarea class="form-control" rows="5" id="feedback" name="feedback" required="required"></textarea>
				  </div>
				</div>
				<div class="form-group">        
				  <div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-outline-secondary btn-lg px-5 bg-primary text-dark rounded-4 ">Submit</button>
				  </div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>
<%@include file="/views/common/alljs.html" %>

</body>
</html>