# Data Science Freelancers

For my final project at Metis, I collected information on the 93,000+ freelancers working in the data science and analytics category on Upwork.com, their 120,000 completed data science jobs, and the 3,000+ currently listed data science jobs. I created an [application](https://robinsones.shinyapps.io/Job_Shiny_App/) using R Shiny for data science freelancers to find their best-fitting jobs based on their skills, profile text, education level, and prefrences. You can find the code for that application and all of the data I used [here](https://github.com/robinsones/Freelancer-Shiny-App). 

This repository has several parts. Instead of having all of my code in one large jupyter notebook, I split it up into seven different ones, each documenting a part of my project. 
- **Emily_Final_Presentation**, in original keynote form and as a pdf. The keynote version has a video demonstrating my application. I also included a pdf version so you can see the presentation on github without downloading it. 
- **Upwork_Gather_Freelancer_Information** and **Upwork_Gather_Current_Jobs**: these have the code I used to access the profiles and jobs from UpWork's API.
- **UpWork_Create_Datasets**: this is where I took the data from the API and transformed it into a [tidy format](ftp://cran.r-project.org/pub/R/web/packages/tidyr/vignettes/tidy-data.html). This mainly involved unnesting the several columns that had lists of dictionaries as entires. For example, the "assignment" column for a person contained the history of that person's jobs as a list of jobs, with each job being a dictionary that had information about that job such as the rate, dates, etc. 
- **UpWork_Exploratory**: this is where I did some exploratory analysis. This is also where I cleaned up the education column by using regular expressions to standardize degree type. I also used regular expressions to classify a person's past job as either a data science job or not based on whether it included one of a list of words. 
- **UpWork_Explore_Rates**: this is where I did some exploratory analysis of how average hourly rates vary by country and highest degree. 
- **UpWork_Profile_Job_Matching**: this is where I developed a way to match a freelancer to currently listed jobs. 
- **UpWork_Skill_Plot**: this was used to generate a correlation plot of skills for my final presentation. 



