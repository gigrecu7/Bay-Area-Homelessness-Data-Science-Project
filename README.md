# Bay-Area-Homelessness-Data-Science-Project
For this project I have 2 files of code. One of the files is a Python file where data exploration took place:
provided descriptive statistics of the dataset, explored patterns, relationships, basic statistics, visualizations, etc. In that file
I also developed models to answer two questions: 
1. What is the prediction amount of outbound recidivism days until next entry based on amount of enrolled days and clients race?
2. Which program can reduce recidivism for specifically Black or African American people?  

For the first question I approached it by doing a multiple regression. A multiple regression 
is similar to linear regression but the difference is that a multiple regression has more than one independent variable to perform a prediction. In this case here, the two independent variables are “Enrollments Days in Project” and “Clients Race”. The dependent variable is “Outbound Recidivism Days Until Next Entry”. I wanted to find the average amount of enrolled days for each race, because I was going to input that average along with the race to predict the “Outbound Recidivism Days Until Next Entry”. For the second question I did  a regression. Unlike a multiple regression the difference is that I am using only one independent variable to perform a prediction. In this case here the independent variable is “Clients Race”. The dependent variable is “Agencies Agency Name". The second file is code done in R and contains the code for the third question:

3. Are there any relationships present amongst the different variables in the dataset that would be valuable information to aid the clients with their issue of homelessness?

To approach this question, I created a machine learning model of association rule mining. 

