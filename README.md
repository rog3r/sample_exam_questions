 # Sample Exam Questions
 Sample Exam Questions APP (List of Free Mock Exam Questions) multiple choice support

 Features
 ----
 - Multiple choice questions support
 - Support images in questions and alternatives
 - Mobile-first

 Live Demo
 ----
 https://appcertification.herokuapp.com/
 
 [![Code Climate](https://codeclimate.com/github/rog3r/sample_exam_questions/badges/gpa.svg)](https://codeclimate.com/github/rog3r/sample_exam_questions) 
 
 Screenshots
 ----
 [images]


 Installation
 ----
 AppCertification was designed to run on on modern cloud providers like Digital Ocean or Heroku, although it should work just about anywhere. For a quick trial you can get set up on Heroku by clicking this button:
 <a href="https://heroku.com/deploy?template=https://github.com/rog3r/sample_exam_questions">
  <img src="https://www.herokucdn.com/deploy/button.svg" alt="Deploy">
</a>



 ##### Manual installation

 Requirements are:

 Ruby 2.2
 Rails 4.2
 A server like Unicorn, Puma, Passenger or Thin


 Bundle the Gemfile

 ```sh
 bundle install
 ```


  Setup database
  ```sh
  rake db:setup
  ```


 Version
 ----
 1.0a

 Todos
 ----
 - ~~Add explanation to question~~
 - ~~Login with facebook~~
 - Write Tests
   - Time limit for attempt
   - Add timer to attempt
   - Add exam results
   - Add exam perfomance results
   - Add paginate in attempt
   - Add swipe in attempt (mobile)
   - Add score report
   - Add bar graph with highest score vs current score



 License
 ----

 MIT

