<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f0f2f5;
        }
        .signup-form {
            width: 360px;
            margin: 100px auto;
            font-family: Arial, sans-serif;
        }
        .signup-form form {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 20px 0px rgba(0,0,0,0.1);
        }
        .signup-form h2 {
            margin: 0 0 15px;
            text-align: center;
        }
        .form-control, .btn {
            min-height: 38px;
            border-radius: 2px;
        }
        .btn {
            font-size: 15px;
            font-weight: bold;
        }
        .error {
            color: red;
            font-size: 12px;
        }
        #home {
            position: relative;
            left: 1200px;
        }
        h2 {
            color: black;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item" id="img">
                    <img src="/springmvcPractice/image/xworkz.jpg" width="140" height="70" alt="Xworkz" class="logo-img">
                </li>
                <li class="nav-item" id="home">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="signup-form">
        <form id="contactForm" action="person" method="post">
        <span style="color:red;">
        <c:forEach items="${errors}" var="objectError">
        ${objectError.defaultMessage}</br>
        </c:forEach>
        </span>
            <h2>Booking Form</h2>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Name" id="name" name="name" required>
                <div id="error-name" class="error"></div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Email" id="email" name="email" required>
                <div id="error-email" class="error"></div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Mobile" id="mobile" name="number" required>
                <div id="error-mobile" class="error"></div>
            </div>
            <div class="form-check">
                <p>Gender</p>
                <input class="form-check-input" type="radio" name="gender" id="male" value="Male" checked>
                <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="gender" id="female" value="Female">
                <label class="form-check-label" for="female">Female</label>
            </div>
            <div class="form-group">
                <select class="custom-select" id="seats" name="seats">
                    <option selected>No of seats...</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                </select>
                <div id="error-seats" class="error"></div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Source" id="source" name="source" required>
                <div id="error-source" class="error"></div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Destination" id="destination" name="destination" required>
                <div id="error-destination" class="error"></div>
            </div>
            <div class="form-group">
                <textarea class="form-control" placeholder="Comment" id="comment" name="comment" required></textarea>
                <div id="error-comment" class="error"></div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >Submit</button>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('name').addEventListener('input', validateName);
        document.getElementById('email').addEventListener('input', validateEmail);
        document.getElementById('mobile').addEventListener('input', validateMobile);
        document.getElementById('source').addEventListener('input', validateSource);
        document.getElementById('destination').addEventListener('input', validateDestination);
        document.getElementById('comment').addEventListener('input', validateComment);
        document.getElementById('seats').addEventListener('change', validateSeats);

        function validateName() {
            const name = document.getElementById('name').value;
            const nameError = document.getElementById('error-name');
            if (name.length <= 3 || name.length >= 15 || /\d/.test(name)) {
                nameError.textContent = "Name should be greater than 3 and less than 15 characters and not contain numbers.";
            } else {
                nameError.textContent = "";
            }
            validateForm();
        }

      function validateEmail() {
          const email = document.getElementById('email').value;
          const emailError = document.getElementById('error-email');
          const emailRegex = /^[A-Za-z\d]{10,24}@gmail\.com$/;
          const hasNumber = /\d/;
          if (!emailRegex.test(email) || !hasNumber.test(email)) {
              emailError.textContent = "Email should contain only alphabets and at least one number, and end with @gmail.com. Length should be between 11 and 25 characters.";
          } else {
              emailError.textContent = "";
          }
          validateForm();
      }

        function validateMobile() {
            const mobile = document.getElementById('mobile').value;
            const mobileError = document.getElementById('error-mobile');
            if (!/^\d{10}$/.test(mobile)) {
                mobileError.textContent = "Enter a 10-digit mobile number.";
            } else {
                mobileError.textContent = "";
            }
            validateForm();
        }

        function validateSource() {
            const source = document.getElementById('source').value;
            const sourceError = document.getElementById('error-source');
            if (source.length <= 5 || source.length >= 20 || /\d/.test(source)) {
                sourceError.textContent = "Source should be greater than 5 and less than 20 characters and not contain numbers.";
            } else {
                sourceError.textContent = "";
            }
            validateForm();
        }

        function validateDestination() {
            const destination = document.getElementById('destination').value;
            const destinationError = document.getElementById('error-destination');
            if (destination.length <= 5 || destination.length >= 20 || /\d/.test(destination)) {
                destinationError.textContent = "Destination should be greater than 5 and less than 20 characters and not contain numbers.";
            } else {
                destinationError.textContent = "";
            }
            validateForm();
        }

        function validateComment() {
            const comment = document.getElementById('comment').value;
            const commentError = document.getElementById('error-comment');
            const numberCount = (comment.match(/\d/g) || []).length;
            if (comment.length <= 30 || comment.length >= 300) {
                commentError.textContent = "Comment should be greater than 30 and less than 300 characters.";
            } else if (numberCount > 5) {
                commentError.textContent = "Comment should not contain more than 5 numbers.";
            } else {
                commentError.textContent = "";
            }
            validateForm();
        }

        function validateSeats() {
            const seats = document.getElementById('seats').value;
            const seatsError = document.getElementById('error-seats');
            if (seats === "No of seats...") {
                seatsError.textContent = "Please select the number of seats.";
            } else {
                seatsError.textContent = "";
            }
            validateForm();
        }

        function validateForm() {
            const nameError = document.getElementById('error-name').textContent === "";
            const emailError = document.getElementById('error-email').textContent === "";
            const mobileError = document.getElementById('error-mobile').textContent === "";
            const sourceError = document.getElementById('error-source').textContent === "";
            const destinationError = document.getElementById('error-destination').textContent === "";
            const commentError = document.getElementById('error-comment').textContent === "";
            const seatsError = document.getElementById('error-seats').textContent === "";
            const isValid = nameError && emailError && mobileError && sourceError && destinationError && commentError && seatsError;

            document.getElementById('submitBtn').disabled = !isValid;
        }
    </script>
</body>
</html>
