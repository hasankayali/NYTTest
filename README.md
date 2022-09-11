# nytimestest

Assignment test for flutter job position.

### Running the app

To run this app you need to be downloaded Android studio, Flutter latest sdk(3.3.1):

* Clone the project to android studio.
* Run `Flutter pub get` in android studio terminal.
* Run the application on Emulator or physical device.

### Running the tests

To run all units test in android studio:

* menu-->Run-->Edit configurations
* Add a new configurations --> Flutter Test
* Configuration:
  - Test scope: All in directory
  - Test directory: (project absolute path)/test.

### Generate code coverage report

To generate code coverage report you need to be downloaded git([git download link](https://git-scm.com/download/win)):

* Run `flutter test --coverage` in android studio terminal.
* Open git bash in project absolute path as shown:

<p align="center">
 <img width="800" alt="wonderous-banner-800w" src="read_me_images/git bash.png">
</p>

* Run `./genhtml.perl ./coverage/lcov.info -o coverage/html` in git bash window.

Now you can find the report in "(project absolute path)/coverage/html/index.html".
  
[generated report url](https://github.com/hasankayali/NYTTest/tree/master/coverage/html/index.html) 










