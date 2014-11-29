<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Example - example-example36-production</title>
  

  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.3/angular.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular-resource.min.js"></script>
  <script src="js/registration.js"></script>
  <link rel="stylesheet" href="css/registration.css">
  <script src="https://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.12.0.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  
</head>
<body ng-app="form-example1" >
  <div ng-controller="appCtrl">
      <form name="userForm" class="css-form" ng-submit="submitData(user, 'ajaxResult')" novalidate>
        <div>
          Username:
          <input type="text" ng-model="user.username" name="username" ng-minlength="3" ng-maxlength="10" placeholder="User ID" username required/><br />
          <span ng-show="userForm.username.$pending.username">Checking if this name is available ...</span>
          <span ng-show="userForm.username.$error.username">This username is already taken!</span>
        </div>
  
        <div>
          Email:
          <input type="email" ng-model="user.email" name="email" ng-model-options="{ updateOn: 'blur' }"  class="form-control" placeholder="Email" required />
          <div ng-show="userForm.email.$dirty && form.email.$invalid">Invalid:
              <span ng-show="userForm.email.$error.required">Tell us your email.</span>
              <span ng-show="userForm.email.$error.email">This is not a valid email.</span>
          </div>
        </div>
      
        <div>
      	  Password:
      	  <input type="password" ng-model="user.password" name="password" placeholder="Password">
        </div>
      
      	<div>
		  Password(Enter Again): 
		  <input type="password" ng-model="user.passwordVerify" name="passwordVerify" password-verify="user.password" placeholder="Type Password Again" required />
		</div>
      
        <div>
      	  Firstname:
      	  <input type="text" ng-model="user.fname" name="fname" placeholder="First Name">
        </div>
      
        <div>
      	  Lastname:
      	  <input type="text" ng-model="user.lname" name="lname" placeholder="Last Name">
        </div>
      
        <div ng-controller="DatepickerDemoCtrl">
           Date of Birthday:
           <input type="text" ng-model="user.birthday" name="birthday" class="form-control" datepicker-popup="dd-MMMM-yy" is-open="opened" min-date="1990-01-01" max-date="today" datepicker-options="dateOptions"  data-date-format="mm/dd/yyyy" placeholder="Date of Birthday" ng-required="true" close-text="Close" />
                  <span class="input-group-btn">
                    <button type="button" class="btn btn-default" ng-click="open($event)">
                      <i class="glyphicon glyphicon-calendar"></i>
                    </button>
                  </span>
        </div>
      
      	<button type="button" ng-click="resetForm()" ng-disabled="!isUserChanged()">Reset</button>
	  	<button type="button"  ng-click="submitData(user, 'ajaxResult')" ng-disabled="userForm.$invalid">Submit</button>
      	<pre>form = {{user | json}}</pre>
      	<pre>master = {{master | json}}</pre>
      </form>
    
      <br />
      <div ng-show="canShow">
		<h2><font color="green" id="welcome">{{welcomeMsg}}</font></h2>
		<table border="1" width="200">
			<thead>
        		<tr>
		          <th>username</th>
		          <th>first name</th>
		          <th>last name</th>
		          <th>DOB</th>
		          <th>email</th>
        		</tr>
      		</thead>
      		<tbody>
        		<tr ng-repeat="user in users">
          			<td>{{user.name}}</td>
          			<td>{{user.fname}}</td>
          			<td>{{user.lname}}</td>
          			<td>{{user.dob}}</td>
          			<td>{{user.email}}</td>
        		</tr>
      		</tbody>
		</table>
	</div>
  </div>
</body>
</html>