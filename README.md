# eng-change-computing-project

## The project: A Mobile App To Measure Soil Carbon Content

The app allows you to draw an area of land that you want analysed -- a graph is returned detailing how much carbon is contained in your farmland's soil! The app is targetted at farmers who want to leverage 'carbon trading' where they use less than their carbon limit. </br>

The front-end is in the '/eng-change-computing-project/workspace' directory and is made using Flutter, whilst the back-end is in the '/eng-change-computing-project/server' directory and is made using Python. The back-end consists of a server made using Flask. This runs a machine learning model which was trained to estimate carbon content by returning a carbon intensity graph given latitude & longitude coordinates. The front-end has a map which allows you to draw your area to be analysed and a results page which displays the carbon graph. </br>


## Who we are

We are a team of undergraduate students from Imperial College London. The team met through Imperial's Engineering Change society. More information about the society and their other projects can be found on the [union website](https://www.imperialcollegeunion.org/activities/a-to-z/engineering-change) or [Facebook page](https://www.facebook.com/EngChangeIC/). </br> 

The project is led and supervised by Dr Pedro Baiz.


## Running the app

To run the app, it is recommended to use a phone emulator such as [android studio](https://developer.android.com/studio) which works well with VSCode. </br>

Currently, the server is hosted locally -- to run the application, two terminals must be opened. In the first, navigate to the `/eng-change-computing-project/server/flask_server` directory and run the following commands (depending on your terminal): </br>

**Using Bash** </br>
` $ export FLASK_APP=flaskr ` </br>
` $ export FLASK_APP=flaskr ` </br>
` $ flask run ` </br>

**Using CMD** </br>
` > set FLASK_APP=flaskr ` </br>
` > set FLASK_ENV=development ` </br>
` > flask run ` </br>

**Using Powershell** </br>
` > $env:FLASK_APP = "flaskr" ` </br>
` > $env:FLASK_ENV = "development" ` </br>
` > flask run ` </br>

Once the local server is running, go to another terminal and navigate to the `/eng-change-computing-project/workspace` directory and type: </br>

`flutter run` </br>
