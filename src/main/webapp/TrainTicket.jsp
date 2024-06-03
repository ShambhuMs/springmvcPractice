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
    <form id="contactForm" action="train" method="post">
    <span style="color:red;">
            <c:forEach items="${trainDataError}" var="ref">
            ${ref.defaultMessage}</br>
            </c:forEach>
      </span>
   ${trainDto}
            <h2>Train Ticket Booking</h2>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Name" id="name" name="name" value="${trainDto.name}" required>
                <div id="error-name" class="error"></div>
            </div>
            <div class="form-group">
                <input type="date" class="form-control" placeholder="DATE" id="date" name="date" value="${trainDto.date}" required>
                <div id="error-date" class="error"></div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Mobile" id="mobile" name="number" value="${trainDto.number}" required>
                <div id="error-mobile" class="error"></div>
            </div>
            <div class="form-check">
              <p>Gender</p>
                <div style="margin-top:-10px">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                 ${trainDto.gender eq 'male'? 'checked' : '' }>
                <label class="form-check-label" for="male">Male</label>
                    <br>
                <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                ${trainDto.gender eq 'female'? 'checked' : '' }>
                <label class="form-check-label" for="female">Female</label>
               </div>
            </div>
            <div class="form-group">
                            <select class="custom-select" id="source" name="source" value=${trainDto.source ==null ? 'selected': ''} value=" ">
                                <option >select source...</option>
                                <option value="Bengaluru SBC" ${trainDto.source eq 'Bengaluru SBC' ? 'selected': ''} >Bengaluru SBC</option>
                                <option value="Kengeri" ${trainDto.source eq 'Kengeri' ? 'selected': ''}>Kengeri</option>
                                <option value="Yeshwantpura" ${trainDto.source eq 'Yeshwantpura' ? 'selected': ''}>Yeshwantpura</option>
                            </select>
                            <div id="error-source" class="error"></div>
                        </div>
             <div class="form-group">
                    <select class="custom-select" id="destination" name="destination" value=${trainDto.destination ==null ? 'selected': ''} value=" ">
                        <option >select destination...</option>
                        <option value="Tumkuru" ${trainDto.destination eq 'Tumkuru' ? 'selected': ''} >Tumkuru</option>
                        <option value="Davanagere" ${trainDto.destination eq 'Davanagere' ? 'selected': ''}>Davanagere</option>
                        <option value="Haveri" ${trainDto.destination eq 'Haveri' ? 'selected': ''}>Haveri</option>
                        <option value="Hubli" ${trainDto.destination eq 'Hubli' ? 'selected': ''}>Hubli</option>
                   </select>
                  <div id="error-destination" class="error"></div>
              </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >Submit</button>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('name').addEventListener('input', validateName);
        document.getElementById('date').addEventListener('input', validateDate);
        document.getElementById('mobile').addEventListener('input', validateMobile);
        document.getElementById('room').addEventListener('change', validateSource);
        document.getElementById('room').addEventListener('change', validateDestination);
        document.querySelectorAll('input[name="gender"]').forEach((elem) => {
            elem.addEventListener('change', validateGender);
        });

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

        function validateDate() {
            const date = document.getElementById('date').value;
            const dateError = document.getElementById('error-date');
            const currentDate = new Date().toISOString().split('T')[0];
            if (date < currentDate) {
                dateError.textContent = "Date cannot be in the past.";
            } else {
                dateError.textContent = "";
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
            if (source === "") {
                sourceError.textContent = "Please select the source point";
            } else {
                sourceError.textContent = "";
            }
            validateForm();
        }
         function validateDestination() {
                    const destination = document.getElementById('destination').value;
                    const destinationError = document.getElementById('error-destination');
                    if (destination === "") {
                        destinationError.textContent = "Please select the destination point";
                    } else {
                        destinationError.textContent = "";
                    }
                    validateForm();
                }
        function validateGender() {
            const gender = document.querySelector('input[name="gender"]:checked');
            const genderError = document.getElementById('error-gender');
            if (!gender) {
                genderError.textContent = "Please select a gender.";
            } else {
                genderError.textContent = "";
            }
            validateForm();
        }

        function validateForm() {
            const nameError = document.getElementById('error-name').textContent === "";
            const dateError = document.getElementById('error-date').textContent === "";
            const mobileError = document.getElementById('error-mobile').textContent === "";
            const sourceError = document.getElementById('error-source').textContent === "";
            const destinationError = document.getElementById('error-destination').textContent === "";
            const genderError = document.getElementById('error-gender').textContent === "";
            const isValid = nameError && dateError && mobileError && sourceError &&  destinationError && genderError;

            document.getElementById('submitBtn').disabled = !isValid;
        }
</script>
</body>
</html>
