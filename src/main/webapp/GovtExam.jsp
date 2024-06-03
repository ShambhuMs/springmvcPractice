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
    <form id="contactForm" action="gvt" method="post">
    <span style="color:red;">
            <c:forEach items="${gvtError}" var="ref">
            ${ref.defaultMessage}</br>
            </c:forEach>
      </span>
   ${gvtDTO}
            <h2>GVT Exam Application</h2>
            <div class="form-group">
                            <input type="text" class="form-control" placeholder="Name" id="name" name="name" value="${gvtDTO.name}" required>
                            <div id="error-name" class="error"></div>
                        </div>
                        <div class="form-group">
                                        <input type="date" class="form-control" placeholder="Date" id="date" name="date" value="${gvtDTO.date}" required>
                                        <div id="error-date" class="error"></div>
                        </div>

            <div class="form-check">
              <p>Gender</p>
                <div style="margin-top:-10px">
                <input class="form-check-input" type="radio" name="gender" id="male" value="male"
                 ${gvtDTO.gender eq 'male'? 'checked' : '' }>
                <label class="form-check-label" for="male">Male</label>
                    <br>
                <input class="form-check-input" type="radio" name="gender" id="female" value="female"
                ${gvtDTO.gender eq 'female'? 'checked' : '' }>
                <label class="form-check-label" for="female">Female</label>
               </div>
            </div>
            <div class="form-group">
                                <select class="custom-select" id="centre" name="centre" value=${gvtDTO.centre ==null ? 'selected': ''} value=" ">
                                                       <option >select centre...</option>
                                                       <option value="UBDT College" ${gvtDTO.centre eq 'UBDT College' ? 'selected': ''} > UBDT College</option>
                                                       <option value="SMP college" ${gvtDTO.centre eq 'SMP college' ? 'selected': ''}> SMP college</option>
                                                       <option value="VGBI college" ${gvtDTO.centre eq 'VGBI college' ? 'selected': ''}> VGBI college</option>
                                                       <option value="Gvt college sirsi" ${gvtDTO.centre eq 'Gvt college sirsi' ? 'selected': ''}> Gvt college sirsi</option>
                                                  </select>
                                                 <div id="error-centre" class="error"></div>
                          </div>
             <div class="form-group">
                    <select class="custom-select" id="type" name="type" value=${gvtDTO.type ==null ? 'selected': ''} value=" ">
                                           <option >select type...</option>
                                           <option value="Railway" ${gvtDTO.type eq 'Railway' ? 'selected': ''} > Railway</option>
                                           <option value="UPSC" ${gvtDTO.type eq 'UPSC' ? 'selected': ''}> UPSC</option>
                                           <option value="IAS" ${gvtDTO.type eq 'IAS' ? 'selected': ''}> IAS</option>
                                           <option value="KAS" ${gvtDTO.type eq 'KAS' ? 'selected': ''}> KAS</option>
                                      </select>
                                     <div id="error-type" class="error"></div>
              </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block" id="submitBtn" >Submit</button>
            </div>
        </form>
    </div>
    <script>
        document.getElementById('name').addEventListener('input', validateName);
        document.getElementById('date').addEventListener('input', validateDate);
        document.getElementById('type').addEventListener('change', validateType);
                document.getElementById('centre').addEventListener('change', validateCentre);
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


        function validateType() {
            const type = document.getElementById('type').value;
            const typeError = document.getElementById('error-type');
            if (type === "") {
                typeError.textContent = "Please select the type";
            } else {
                typeError.textContent = "";
            }
            validateForm();
        }

         function validateCentre() {
                    const centre = document.getElementById('centre').value;
                    const centreError = document.getElementById('error-centre');
                    if (centre === "") {
                        centreError.textContent = "Please select the centre";
                    } else {
                        centreError.textContent = "";
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
            const typeError = document.getElementById('error-type').textContent === "";
            const centreError = document.getElementById('error-centre').textContent === "";
            const genderError = document.getElementById('error-gender').textContent === "";
            const dateError = document.getElementById('error-date').textContent === "";
            const isValid = nameError &&  typeError &&  dateError && genderError && centreError;

            document.getElementById('submitBtn').disabled = !isValid;
        }
</script>
</body>
</html>
