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
    <form id="contactForm" action="hospital" method="post">
    <span style="color:red;">
            <c:forEach items="${hospitalError}" var="ref">
            ${ref.defaultMessage}</br>
            </c:forEach>
      </span>
   ${hospitalDTO}
            <h2>Hospital Appointment</h2>
            <div class="form-group">
                            <input type="text" class="form-control" placeholder="Name" id="name" name="name" value="${hospitalDTO.name}" required>
                            <div id="error-name" class="error"></div>
                        </div>
                        <div class="form-group">
                                        <input type="date" class="form-control" placeholder="Date" id="date" name="date" value="${hospitalDTO.date}" required>
                                        <div id="error-date" class="error"></div>
                        </div>
                        <div class="form-group">
                                  <input type="number" class="form-control" placeholder="number" id="number" name="number" value="${hospitalDTO.number}" required>
                                  <div id="error-number" class="error"></div>
                          </div>
            <div class="form-check">
              <p>Gender</p>
                <div style="margin-top:-10px">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                 ${hospitalDTO.gender eq 'male'? 'checked' : '' }>
                <label class="form-check-label" for="male">Male</label>
                    <br>
                <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                ${hospitalDTO.gender eq 'female'? 'checked' : '' }>
                <label class="form-check-label" for="female">Female</label>
               </div>
            </div>
            <div class="form-group">
                                <select class="custom-select" id="time" name="time" value=${hospitalDTO.time == null ? 'selected': ''} value="0">
                                                       <option >select time...</option>
                                                       <option value="9:30AM-11:00AM" ${hospitalDTO.time eq '9:30AM-11:00AM' ? 'selected': ''} >9:30AM-11:00AM</option>
                                                       <option value="11:15AM-01:00PM" ${hospitalDTO.time eq '11:15AM-01:00PM' ? 'selected': ''}> 11:15AM-01:00PM</option>
                                                       <option value="02:15PM-04:00PM" ${hospitalDTO.time eq '02:15PM-04:00PM' ? 'selected': ''}> 02:15PM-04:00PM</option>
                                                       <option value="04:15PM-06:00PM" ${hospitalDTO.time eq '04:15PM-06:00PM' ? 'selected': ''}>04:15PM-06:00PM</option>
                                    </select>
                                        <div id="error-time" class="error"></div>
                          </div>


            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >Submit</button>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('name').addEventListener('input', validateName);
        document.getElementById('date').addEventListener('input', validateDate);
        document.getElementById('number').addEventListener('input', validateNumber);
        document.getElementById('time').addEventListener('change', validateTime);
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

function validateNumber() {
            const number = document.getElementById('number').value;
            const numberError = document.getElementById('error-number');
            if (!/^\d{10}$/.test(number)) {
                numberError.textContent = "Enter a 10-digit mobile number.";
            } else {
                numberError.textContent = "";
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

  function validateTime() {
                    const time = document.getElementById('time').value;
                    const timeError = document.getElementById('error-time');
                    if (time === "") {
                        timeError.textContent = "Please select the time";
                    } else {
                        timeError.textContent = "";
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
            const timeError = document.getElementById('error-time').textContent === "";
            const numberError = document.getElementById('error-number').textContent === "";
            const genderError = document.getElementById('error-gender').textContent === "";
            const dateError = document.getElementById('error-date').textContent === "";
            const isValid = nameError &&  dateError && genderError && timeError  &&
            numberError;

            document.getElementById('submitBtn').disabled = !isValid;
        }
</script>
</body>
</html>
