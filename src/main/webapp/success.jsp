<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
    body {
               background-color: #f0f2f5;
               margin:0px;
            }
      h2{
      position:relative;
      top:150px;
      left:400px;
      }
      #travel {
      position:relative;
      left:1100px;
      }
       #Home {
            position:relative;
            left:1140px;
       }
       h1{
          position:relative;
          top:100px;
       }
</style>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item" id="img">
                   <img src="/springmvcPractice/image/xworkz.jpg" width="140" height="70" alt="Xworkz" class="logo-img">
                </li>
                <li class="nav-item" id="travel">
                    <a class="nav-link" href="travelForm.jsp">TravelForm</a>

                </li>
                <li class="nav-item" id="Home">
                           <a class="nav-link" href="index.jsp">Home</a>
                  </li>

            </ul>
        </div>
   </nav>
 <div class="container text-center mt-5">
 <h1 style="color:green"> ${setName} <h1>
  <h1 style="color:green"> ${validData} <h1>
  <h1 style="color:blue"> ${data} ${msg} <h1>
   <h1 style="color:blue"> ${message} <h1>

 </div>

</body>
</html>

