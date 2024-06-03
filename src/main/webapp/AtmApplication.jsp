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
    <form id="contactForm" action="atm" method="post">
    <span style="color:red;">
            <c:forEach items="${atmError}" var="ref">
            ${ref.defaultMessage}</br>
            </c:forEach>
      </span>
   ${atmDTO}
            <h2>ATM Application</h2>
            <div class="form-group">
                            <input type="text" class="form-control" placeholder="Name" id="name" name="name" value="${atmDTO.name}" required>
                            <div id="error-name" class="error"></div>
                        </div>

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Account Number" id="accountNo" name="accountNo" value="${atmDTO.accountNo}" required>
                            <div id="error-accountNo" class="error"></div>
                        </div>
                        <div class="form-group">
                                        <input type="date" class="form-control" placeholder="Date" id="date" name="date" value="${atmDTO.date}" required>
                                        <div id="error-date" class="error"></div>
                        </div>
            <div class="form-check">
              <p>Gender</p>
                <div style="margin-top:-10px">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                 ${atmDTO.gender eq 'male'? 'checked' : '' }>
                <label class="form-check-label" for="male">Male</label>
                    <br>
                <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                ${atmDTO.gender eq 'female'? 'checked' : '' }>
                <label class="form-check-label" for="female">Female</label>
               </div>
            </div>
             <div class="form-group">
                    <select class="custom-select" id="branch" name="branch" value=${atmDTO.branch ==null ? 'selected': ''} value=" ">
                                           <option >select branch...</option>
                                           <option value="Sirsi" ${atmDTO.branch eq 'Sirsi' ? 'selected': ''} > Sirsi</option>
                                           <option value="Bengaluru" ${atmDTO.branch eq 'Bengaluru' ? 'selected': ''}> Bengaluru</option>
                                           <option value="Mysore" ${atmDTO.branch eq 'Mysore' ? 'selected': ''}> Mysore</option>
                                           <option value="Chennai" ${atmDTO.branch eq 'Chennai' ? 'selected': ''}> Chennai</option>
                                      </select>
                                     <div id="error-branch" class="error"></div>
              </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >Submit</button>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('name').addEventListener('input', validateName);
        document.getElementById('accountNo').addEventListener('input', validateAccountNo);
        document.getElementById('date').addEventListener('input', validateDate);
        document.getElementById('branch').addEventListener('change', validateBranch);
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

        function validateAccountNo() {
            const regNo = document.getElementById('accountNo').value;
            const regNoError = document.getElementById('error-accountNo');
            if (!/^\d{11}$/.test(regNo)) {
                regNoError.textContent = "Enter a 11-digit Account number.";
            } else {
                regNoError.textContent = "";
            }
            validateForm();
        }

        function validateBranch() {
            const branch = document.getElementById('branch').value;
            const branchError = document.getElementById('error-branch');
            if (branch === "") {
                branchError.textContent = "Please select the branch";
            } else {
                branchError.textContent = "";
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
            const accountNoError = document.getElementById('error-accountNo').textContent === "";
            const branchError = document.getElementById('error-branch').textContent === "";
            const genderError = document.getElementById('error-gender').textContent === "";
            const dateError = document.getElementById('error-date').textContent === "";
            const isValid = nameError &&  branchError && accountNoError &&  dateError && genderError;

            document.getElementById('submitBtn').disabled = !isValid;
        }
</script>
</body>
</html>
