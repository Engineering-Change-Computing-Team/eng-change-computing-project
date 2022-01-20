# eng-change-computing-project

## Mobile App to Measure Soil Carbon -- MVP

The app allows you to draw an area of land that you want analysed -- a graph is returned detailing how much carbon is contained in any area of farmland. </br>

We use a machine learning model trained to predict the carbon content using satellite image data, allowing for real time measurements without needing to do any soil sampling, saving huge amounts of time and money. </br>

<!-- The front-end is in the '/eng-change-computing-project/workspace' directory and is made using Flutter, whilst the back-end is in the '/eng-change-computing-project/server' directory and is made using Python. The back-end consists of a server made using Flask. This runs a machine learning model which was trained to estimate carbon content by returning a carbon intensity graph given latitude & longitude coordinates. The front-end has a map which allows you to draw your area to be analysed and a results page which displays the carbon graph. </br> -->


<!-- 
## Who we are

We are a team of undergraduate students from Imperial College London. The team met through Imperial's Engineering Change society. More information about the society and their other projects can be found on the [union website](https://www.imperialcollegeunion.org/activities/a-to-z/engineering-change) or [Facebook page](https://www.facebook.com/EngChangeIC/). </br> 

The project is led and supervised by Dr Pedro Baiz. -->


## The Application



<!-- ![image](https://user-images.githubusercontent.com/85403218/150034350-be541e77-02b5-48b0-8866-26103fdb9e33.png) -->

`Easily Select Any Land` 

![Image 18-01-2022 at 23 29](https://user-images.githubusercontent.com/85403218/150035407-3e906d10-ce17-42f8-800a-97b3c65701cd.jpeg) 



## Estimating Soil Carbon -- The Machine Learning

After highlighting an area of land, the 'measure' button is pressed and a carbon map similar to the following is displayed to the user.

`The Accuracy Of Our Model Is Very Good`

![Image 18-01-2022 at 23 43](https://user-images.githubusercontent.com/85403218/150036565-1cb7d01b-8be9-4377-8b0b-faa391da7688.jpeg)

The model was evaluated using large amounts of ground truth carbon data which was previously gathered using soil samples. The results above demonstrate the high accuracy of the model in predicting the carbon stored using only satellite images. With some more funding, we would be able to use live commerical satellite data. The satellite data which has been used up to now is open source meaning the resolution is poor, but commerical satellite data can have orders of magnitude higher resolution which would improve the accuracy of the model substantially. Live data would allow users of the app to get real time carbon measurements just by using our app.

<!-- 
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
-->
