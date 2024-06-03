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
    <form id="contactForm" action="hallTicket" method="post">
    <span style="color:red;">
            <c:forEach items="${HallTicketError}" var="ref">
            ${ref.defaultMessage}</br>
            </c:forEach>
      </span>
   ${hallDTO}
            <h2>HallTicket Application</h2>
            <div class="form-group">
                <input type="text" class="form-control" placeholder="studentName" id="studentName" name="studentName" value="${hallDTO.studentName}" required>
                <div id="error-studentName" class="error"></div>
            </div>

            <div class="form-group">
                <input type="text" class="form-control" placeholder="Registration Number" id="regNo" name="regNo" value="${hallDTO.regNo}" required>
                <div id="error-regNo" class="error"></div>
            </div>
            <div class="form-check">
              <p>Gender</p>
                <div style="margin-top:-10px">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                 ${hallDTO.gender eq 'male'? 'checked' : '' }>
                <label class="form-check-label" for="male">Male</label>
                    <br>
                <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                ${hallDTO.gender eq 'female'? 'checked' : '' }>
                <label class="form-check-label" for="female">Female</label>
               </div>
            </div>
            <div class="form-group">
                            <select class="custom-select" id="sem" name="sem" value=${hallDTO.sem ==null ? 'selected': ''} value=" ">
                                <option >select sem...</option>
                                <option value="1" ${hallDTO.sem eq '1' ? 'selected': ''} >1</option>
                                <option value="2" ${hallDTO.sem eq '2' ? 'selected': ''}>2</option>
                                <option value="3" ${hallDTO.sem eq '3' ? 'selected': ''}>3</option>
                                <option value="4" ${hallDTO.sem eq '4' ? 'selected': ''} >4</option>
                                <option value="5" ${hallDTO.sem eq '5' ? 'selected': ''}>5</option>
                                <option value="6" ${hallDTO.sem eq '6' ? 'selected': ''}>6</option>
                            </select>
                            <div id="error-sem" class="error"></div>
                        </div>
             <div class="form-group">
                    <select class="custom-select" id="branch" name="branch" value=${hallDTO.branch ==null ? 'selected': ''} value=" ">
                        <option >select branch...</option>
                        <option value="BCA" ${hallDTO.branch eq 'BCA' ? 'selected': ''} >BCA</option>
                        <option value="BSC" ${hallDTO.branch eq 'BSC' ? 'selected': ''}>BSC</option>
                        <option value="BBA" ${hallDTO.branch eq 'BBA' ? 'selected': ''}>BBA</option>
                        <option value="BHS" ${hallDTO.branch eq 'BHS' ? 'selected': ''}>BHS</option>
                   </select>
                  <div id="error-branch" class="error"></div>
              </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >Submit</button>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('studentName').addEventListener('input', validateName);
        document.getElementById('regNo').addEventListener('input', validateRegNo);
        document.getElementById('branch').addEventListener('change', validateBranch);
        document.getElementById('sem').addEventListener('change', validateSem);
        document.querySelectorAll('input[name="gender"]').forEach((elem) => {
            elem.addEventListener('change', validateGender);
        });

        function validateName() {
            const name = document.getElementById('studentName').value;
            const nameError = document.getElementById('error-studentName');
            if (name.length <= 3 || name.length >= 15 || /\d/.test(name)) {
                nameError.textContent = "Name should be greater than 3 and less than 15 characters and not contain numbers.";
            } else {
                nameError.textContent = "";
            }
            validateForm();
        }



        function validateRegNo() {
            const regNo = document.getElementById('regNo').value;
            const regNoError = document.getElementById('error-regNo');
            if (!/^\d{10}$/.test(regNo)) {
                regNoError.textContent = "Enter a 10-digit mobile number.";
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
            const nameError = document.getElementById('error-studentName').textContent === "";
            const regError = document.getElementById('error-regNo').textContent === "";
            const branchError = document.getElementById('error-branch').textContent === "";
            const semError = document.getElementById('error-sem').textContent === "";
            const genderError = document.getElementById('error-gender').textContent === "";
            const isValid = nameError &&  branchError && regError &&  semError && genderError;

            document.getElementById('submitBtn').disabled = !isValid;
        }
</script>
</body>
</html>
