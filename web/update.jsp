
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String book_name = request.getParameter("book_name");
        String author_name = request.getParameter("author_name");
        String publisher_name = request.getParameter("publisher_name");
        String publish_year = request.getParameter("publish_year");
        String description = request.getParameter("description");
        String number_of_page = request.getParameter("number_of_page");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/library","root","");
        pst = con.prepareStatement("update listbook set book_name = ?,author_name =?,publisher_name= ?,publish_year= ?,description= ?,number_of_page= ? where id = ?");
        pst.setString(1, book_name);
        pst.setString(2, author_name);
        pst.setString(3, publisher_name);
        pst.setString(4, publish_year);
        pst.setString(5, description);
        pst.setString(6, number_of_page);
         pst.setString(7, id);
        pst.executeUpdate();  
        
        response.sendRedirect("dashboard.jsp");
        
        %>
        
        <script>   
            alert("Record Updateddddd");           
       </script>
    <%             
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<title>Library</title>
	<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport' />
	<link rel="icon" href="assets/img/icon.ico" type="image/x-icon"/>

	<!-- Fonts and icons -->
	<script src="assets/js/plugin/webfont/webfont.min.js"></script>
	<script>
		WebFont.load({
			google: {"families":["Lato:300,400,700,900"]},
			custom: {"families":["Flaticon", "Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"], urls: ['assets/css/fonts.min.css']},
			active: function() {
				sessionStorage.fonts = true;
			}
		});
	</script>

	<!-- CSS Files -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/atlantis.min.css">

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link rel="stylesheet" href="assets/css/demo.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
</head>
<body>
	<div class="wrapper">
		<div class="main-header">
			<!-- Logo Header -->
			<div class="logo-header" data-background-color="blue">
				
				<a href="index.html" class="logo">
					<img src="assets/img/logo.svg" alt="navbar brand" class="navbar-brand">
<!--                                        <h1>Library</h1>-->
				</a>
				<button class="navbar-toggler sidenav-toggler ml-auto" type="button" data-toggle="collapse" data-target="collapse" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon">
						<i class="icon-menu"></i>
					</span>
				</button>
				<button class="topbar-toggler more"><i class="icon-options-vertical"></i></button>
				<div class="nav-toggle">
					<button class="btn btn-toggle toggle-sidebar">
						<i class="icon-menu"></i>
					</button>
				</div>
			</div>
			<!-- End Logo Header -->

			<!-- Navbar Header -->
			<nav class="navbar navbar-header navbar-expand-lg" data-background-color="blue2">
				
				<div class="container-fluid">
					<ul class="navbar-nav topbar-nav ml-md-auto align-items-center">
                                            <li class="nav-item dropdown hidden-caret submenu show">
							<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="true">
								<div class="avatar-sm">
									<img src="assets/img/profil.png" alt="..." class="avatar-img rounded-circle">
								</div>
							</a>
							<ul class="dropdown-menu dropdown-user animated fadeIn show">
								<div class="scroll-wrapper dropdown-user-scroll scrollbar-outer" style="position: relative;"><div class="dropdown-user-scroll scrollbar-outer scroll-content" style="height: auto; margin-bottom: 0px; margin-right: 0px; max-height: 272.55px;">
									<li>
										<div class="user-box">
                                                                                    
                                                                                    <%
                                                                                        if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
                                                                                    %>
                                                                                        Anda Belum login <br/>
                                                                                        <a href="index.jsp">Silahkan Login</a>
                                                                                    <%} else {
                                                                                    %>
                                                                                    Welcome <%=session.getAttribute("userid")%>
<!--                                                                                    <a href='logout.jsp'>Log out</a>-->
										</div>
									</li>
									<li>
										<a class="dropdown-item" href='logout.jsp'>Logout</a>
									</li>
								</div><div class="scroll-element scroll-x"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar ui-draggable ui-draggable-handle" style="width: 100px;"></div></div></div><div class="scroll-element scroll-y"><div class="scroll-element_outer"><div class="scroll-element_size"></div><div class="scroll-element_track"></div><div class="scroll-bar ui-draggable ui-draggable-handle" style="height: 99px;"></div></div></div></div>
							</ul>
						</li>
					</ul>
				</div>
			</nav>
			<!-- End Navbar -->
		</div>

		<!-- Sidebar -->
                <div class="card-body mt-30"></div>
                
                <div class="main-panel">
			<div class="content">
				<div class="page-inner">
					<div class="page-header">
						<h4 class="page-title">DataTables.Net</h4>
		
					</div>
					<div class="row">
                               
                               
                               <div class="col-md-12">
				<form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                         Class.forName("com.mysql.jdbc.Driver");
                          con = DriverManager.getConnection("jdbc:mysql://localhost/library","root","");
                           
                          String id = request.getParameter("id");
                          
                        pst = con.prepareStatement("select * from listbook where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Book Name</label>
                        <input type="text" class="form-control" placeholder="Book Name" value="<%= rs.getString("book_name")%>" name="book_name" id="book_name" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Author Name</label>
                        <input type="text" class="form-control" placeholder="Author Name" name="author_name" value="<%= rs.getString("author_name")%>" id="author_name" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Publisher Name</label>
                        <input type="text" class="form-control" placeholder="Publisher Name" name="publisher_name" id="publisher_name" value="<%= rs.getString("publisher_name")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Publish Year</label>
                        <input type="text" class="form-control" placeholder="Publish Year" name="publish_year" id="publish_year" value="<%= rs.getString("publish_year")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Description</label>
                        <input type="text" class="form-control" placeholder="Description" name="description" id="description" value="<%= rs.getString("description")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Number Of Page</label>
                        <input type="text" class="form-control" placeholder="Number Of Page" name="number_of_page" id="number_of_page" value="<%= rs.getString("number_of_page")%>" required >
                     </div>
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="sukses.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>		
                                </div>
		</div>
                                    </div>
                            </div>
                    </div>
		<div class="sidebar">			
			<div class="sidebar-wrapper scrollbar scrollbar-inner">
				<div class="sidebar-content">
					<ul class="nav nav-primary">
						<li class="nav-section">
							<span class="sidebar-mini-icon">
								<i class="fa fa-ellipsis-h"></i>
							</span>
							<h4 class="text-section"></h4>
						</li>
						<li class="nav-item">
							<a data-toggle="collapse" href="#base">
								<i class="fas fa-layer-group"></i>
								<p>Books</p>
								<span class="caret"></span>
							</a>
							<div class="collapse" id="base">
								<ul class="nav nav-collapse">
									<li>
										<a href="biography.jsp">
											<span class="sub-item">Biography</span>
										</a>
									</li>
                                                                        <li>
										<a href="recipe.jsp">
											<span class="sub-item">Recipe</span>
										</a>
									</li>
                                                                        <li>
										<a href="comic.jsp">
											<span class="sub-item">Comic</span>
										</a>
									</li>
                                                                        <li>
										<a href="novel.jsp">
											<span class="sub-item">Novel</span>
										</a>
									</li>
                                                                        <li>
										<a href="magazine.jsp">
											<span class="sub-item">Magazine</span>
										</a>
									</li>
                                                                        <li>
										<a href="encyclopedia.jsp">
											<span class="sub-item">Encyclopedia</span>
										</a>
									</li>
                                                                        <li>
										<a href="dictionary.jsp">
											<span class="sub-item">Dictionary</span>
										</a>
									</li>
                                                                        <li>
										<a href="newspaper.jsp">
											<span class="sub-item">Newspaper</span>
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- End Sidebar -->
				
		<!-- Custom template | don't include it in your project! -->
		<!-- End Custom template -->
	</div>
	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.3.2.1.min.js"></script>
	<script src="assets/js/core/popper.min.js"></script>
	<script src="assets/js/core/bootstrap.min.js"></script>

	<!-- jQuery UI -->
	<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
	<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

	<!-- jQuery Scrollbar -->
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>


	<!-- Chart JS -->
	<script src="assets/js/plugin/chart.js/chart.min.js"></script>

	<!-- jQuery Sparkline -->
	<script src="assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

	<!-- Chart Circle -->
	<script src="assets/js/plugin/chart-circle/circles.min.js"></script>

	<!-- Datatables -->
	<script src="assets/js/plugin/datatables/datatables.min.js"></script>

	<!-- Bootstrap Notify -->
<!--	<script src="assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>-->

	<!-- jQuery Vector Maps -->
	<script src="assets/js/plugin/jqvmap/jquery.vmap.min.js"></script>
	<script src="assets/js/plugin/jqvmap/maps/jquery.vmap.world.js"></script>

	<!-- Sweet Alert -->
	<script src="assets/js/plugin/sweetalert/sweetalert.min.js"></script>

	<!-- Atlantis JS -->
	<script src="assets/js/atlantis.min.js"></script>

	<!-- Atlantis DEMO methods, don't include it in your project! -->
	<script src="assets/js/setting-demo.js"></script>
	<script src="assets/js/demo.js"></script>
	<script>
		Circles.create({
			id:'circles-1',
			radius:45,
			value:60,
			maxValue:100,
			width:7,
			text: 5,
			colors:['#f1f1f1', '#FF9E27'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-2',
			radius:45,
			value:70,
			maxValue:100,
			width:7,
			text: 36,
			colors:['#f1f1f1', '#2BB930'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		Circles.create({
			id:'circles-3',
			radius:45,
			value:40,
			maxValue:100,
			width:7,
			text: 12,
			colors:['#f1f1f1', '#F25961'],
			duration:400,
			wrpClass:'circles-wrp',
			textClass:'circles-text',
			styleWrapper:true,
			styleText:true
		})

		var totalIncomeChart = document.getElementById('totalIncomeChart').getContext('2d');

		var mytotalIncomeChart = new Chart(totalIncomeChart, {
			type: 'bar',
			data: {
				labels: ["S", "M", "T", "W", "T", "F", "S", "S", "M", "T"],
				datasets : [{
					label: "Total Income",
					backgroundColor: '#ff9e27',
					borderColor: 'rgb(23, 125, 255)',
					data: [6, 4, 9, 5, 4, 6, 4, 3, 8, 10],
				}],
			},
			options: {
				responsive: true,
				maintainAspectRatio: false,
				legend: {
					display: false,
				},
				scales: {
					yAxes: [{
						ticks: {
							display: false //this will remove only the label
						},
						gridLines : {
							drawBorder: false,
							display : false
						}
					}],
					xAxes : [ {
						gridLines : {
							drawBorder: false,
							display : false
						}
					}]
				},
			}
		});

		$('#lineChart').sparkline([105,103,123,100,95,105,115], {
			type: 'line',
			height: '70',
			width: '100%',
			lineWidth: '2',
			lineColor: '#ffa534',
			fillColor: 'rgba(255, 165, 52, .14)'
		});
	</script>
</body>
</html>

<%
    }
%>