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
    <form id="contactForm" action="busPass" method="post">
    <span style="color:red;">
            <c:forEach items="${busError}" var="ref">
            ${ref.defaultMessage}</br>
            </c:forEach>
      </span>
   ${busDTO}
            <h2>BusPass Application</h2>
            <div class="form-group">
                            <input type="text" class="form-control" placeholder="Name" id="name" name="name" value="${busDTO.name}" required>
                            <div id="error-name" class="error"></div>
                        </div>
                        <div class="form-group">
                                        <input type="date" class="form-control" placeholder="Date" id="date" name="date" value="${busDTO.date}" required>
                                        <div id="error-date" class="error"></div>
                        </div>
            <div class="form-group">
                            <input type="text" class="form-control" placeholder="Source" id="source" name="source" value="${busDTO.source}" required>
                            <div id="error-source" class="error"></div>
                        </div>
            <div class="form-group">
                            <input type="text" class="form-control" placeholder="Destination" id="destination" name="destination" value="${busDTO.destination}" required>
                            <div id="error-destination" class="error"></div>
                        </div>

            <div class="form-check">
              <p>Gender</p>
                <div style="margin-top:-10px">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                 ${busDTO.gender eq 'male'? 'checked' : '' }>
                <label class="form-check-label" for="male">Male</label>
                    <br>
                <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                ${busDTO.gender eq 'female'? 'checked' : '' }>
                <label class="form-check-label" for="female">Female</label>
               </div>
            </div>
            <div class="form-group">
                                <select class="custom-select" id="college" name="college" value=${busDTO.college ==null ? 'selected': ''} value="0">
                                                       <option >select college...</option>
                                                       <option value="UBDT College" ${busDTO.college eq 'UBDT College' ? 'selected': ''} > UBDT College</option>
                                                       <option value="SMP college" ${busDTO.college eq 'SMP college' ? 'selected': ''}> SMP college</option>
                                                       <option value="VGBI college" ${busDTO.college eq 'VGBI college' ? 'selected': ''}> VGBI college</option>
                                                       <option value="Gvt college sirsi" ${busDTO.college eq 'Gvt college sirsi' ? 'selected': ''}> Gvt college sirsi</option>
                                                  </select>
                                                 <div id="error-college" class="error"></div>
                          </div>


            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >Submit</button>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('name').addEventListener('input', validateName);
        document.getElementById('date').addEventListener('input', validateDate);
        document.getElementById('source').addEventListener('input', validateSource);
                document.getElementById('destination').addEventListener('input', validateDestination);
                document.getElementById('college').addEventListener('change', validateCollege);
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


       function validateSource() {
                   const source = document.getElementById('source').value;
                   const sourceError = document.getElementById('error-source');
                   if (source.length <= 3 || source.length >= 15 || /\d/.test(source)) {
                       sourceError.textContent = "Source should be greater than 3 and less than 15 characters and not contain numbers.";
                   } else {
                       sourceError.textContent = "";
                   }
                   validateForm();
               }

                 function validateDestination() {
                                  const destination = document.getElementById('destination').value;
                                  const destinationError = document.getElementById('error-destination');
                                  if (destination.length <= 3 || destination.length >= 15 || /\d/.test(destination)) {
                                      destinationError.textContent = "Destination should be greater than 3 and less than 15 characters and not contain numbers.";
                                  } else {
                                      destinationError.textContent = "";
                                  }
                                  validateForm();
                              }

         function validateCollege() {
                    const college = document.getElementById('college').value;
                    const collegeError = document.getElementById('error-college');
                    if (college === "") {
                        collegeError.textContent = "Please select the college";
                    } else {
                        collegeError.textContent = "";
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
            const sourceError = document.getElementById('error-source').textContent === "";
            const destinationError = document.getElementById('error-destination').textContent === "";
            const collegeError = document.getElementById('error-college').textContent === "";
            const genderError = document.getElementById('error-gender').textContent === "";
            const dateError = document.getElementById('error-date').textContent === "";
            const isValid = nameError &&  dateError && genderError && collegeError &&destinationError &&
            sourceError;

            document.getElementById('submitBtn').disabled = !isValid;
        }
</script>
</body>
</html>
