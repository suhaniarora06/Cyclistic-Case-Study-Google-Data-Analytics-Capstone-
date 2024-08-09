# Cyclistic Data Analysis Project

### Dashboard Link : [Tableau Public](https://public.tableau.com/views/CYCLISTICDASHBOARD3/Dashboard23?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

## Introduction

Welcome to the Cyclistic bike-share analysis case study project that I did for my
[Google Data Analytics Professional Certificate](https://www.coursera.org/professional-certificates/google-data-analytics)!

Cyclistic is a bike-share company in Chicago that features more than 5,800 bicycles and 600 docking stations. The majority of riders opt for traditional bikes and about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use the bikes to commute to work each day.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders and will be the key to future growth. Rather than creating a marketing campaign that targets all-new customers, they believe that there is a solid opportunity to convert casual riders into members.

## Problem Statement

This analysis aims to develop marketing strategies to convert casual riders into annual members. To achieve this, we need to understand how annual members and casual riders use Cyclistic bikes differently, why casual riders might be inclined to purchase annual memberships, and how Cyclistic can leverage digital media to influence casual riders to become members.


## Data Source

Even though Cyclistic is a fictional company, for the purposes of this case study, the datasets are appropriate and
have been made available by [Motivate International Inc.](https://motivateco.com/) under this [Data Agreement License](https://divvybikes.com/data-license-agreement).

The data used is representative of all bike rides from August 2023 to July 2024, reflecting the most recent information, and can be downloaded from [here](https://divvy-tripdata.s3.amazonaws.com/index.html).

However, due to data privacy concerns, personally identifiable information about the riders is not accessible. Consequently, we will be unable to obtain payment details or residential addresses to determine if a single rider has purchased multiple passes or to track the distance a rider lives from the Cyclistic service network.


## Steps followed 

- Step 1 : [Data Preparation](https://github.com/suhaniarora06/Cyclistic-Case-Study-Google-Data-Analytics-Capstone-/blob/main/Data%20Preparation.sql)
- Step 2 : [Data Cleaning](https://github.com/suhaniarora06/Cyclistic-Case-Study-Google-Data-Analytics-Capstone-/blob/main/Data%20Cleaning.sql)
- Step 3 : [Data Exploration](https://github.com/suhaniarora06/Cyclistic-Case-Study-Google-Data-Analytics-Capstone-/blob/main/Data%20Exploration.sql)
- Step 4 : [Data Visualization](https://github.com/suhaniarora06/Cyclistic-Case-Study-Google-Data-Analytics-Capstone-/blob/main/Data%20Visualization.pdf)
- Step 5 : [Insights Summary](#Insights-Summary)
- Step 6 : [Recommendations](#Recommendations)




# Snapshot of the Dashboard (Tableau Desktop)

![Dashboard_upload](https://github.com/user-attachments/assets/7eaacb3e-94c7-49da-b675-00e046c7cc21)

![Dashboard_upload2](https://github.com/user-attachments/assets/83fbc479-1be7-49db-b639-86e922f60952)


# Insights Summary
Following inferences can be drawn from the dashboard;

### [1] Total Number of Riders = 5734170

   Number of Riders with Annual Memberships = 3684916 (64.26 %)

   Number of Casual Riders = 2049254 (35.73 %)

           There are more Riders with Annual Memberships as 
           compared to the Casual Riders.

   Number of Riders using Classic Bikes = 2853768 (49.76 %)

   Number of Riders using Docked Bikes = 34381 (0.6 %)

   Number of Riders using Electric Bikes = 2846021 (49.63 %)

           Majority of the Riders prefer Classic and Electric 
           bikes over Docked bikes.
        
           
### [2] Average Ride Length = 15.72 minutes

Average Ride Length of Riders with Annual Memberships = 12 minutes

Average Ride Length of Casual Riders = 21 minutes

           On average, Casual Riders ride for more extended periods compared 
           to those with Annual Memberships, which suggests that Casual Riders 
           are likely to take longer rides, possibly for leisure or one-day trips.

Average Ride Length of Riders using Classic Bikes = 18 minutes

Average Ride Length of Riders using Docked Bikes = 69 minutes

Average Ride Length of Riders using Docked Bikes = 12 minutes
  
           Even though Docked Bikes are only used by a handful of
           Riders, the rides taken by the Docked Bike are the longest.

  
### [3] Nested Relationships between the Count and Ride Length of the Riders
  
Number of Riders with Annual Memberships using Classic Bikes = 1889413 *(51.27 % of the Riders with Annual Memberships)*

Number of Riders with Annual Memberships using Docked Bikes = 0

Number of Riders with Annual Memberships using Electric Bikes = 1795503 *(48.72 % of the Riders with Annual Memberships)*

           Here, we observe that none of the riders with 
           Annual Memberships use Docked Bikes indicating 
           that they are exclusively used by Casual Riders.
           
           Furthermore, among Classic and Electric Bikes, the riders 
           show a slight preference for Classic Bikes over Electric Bikes.

           
Number of Casual Riders using Classic Bikes = 964355 *(47.05 % of the Casual Riders)*

Number of Casual Riders using Docked Bikes = 34381 *(1.67 % of the Casual Riders)*

Number of Casual Riders using Electric Bikes =  1050518 *(51.26 % of the Casual Riders)* <br>



Average Ride Length of Riders with Annual Memberships using Classic Bikes = 13 minutes

Average Ride Length of Riders with Annual Memberships using Docked Bikes = 0 minutes

Average Ride Length of Riders with Annual Memberships using Electric Bikes = 11 minutes

Average Ride Length of Casual Riders using Classic Bikes = 27 minutes

Average Ride Length of Casual Riders using Docked Bikes = 69 minutes

Average Ride Length of Casual Riders using Electric Bikes = 14 minutes
 
           We observe from the above metrics that ride lengths for members are more consistent 
           and shorter compared to those of casual riders. 
           This suggests that casual riders use bikes for recreation and short excursions, 
           while members are more likely to primarily use them for commuting fixed distances, such as to work or school.
           This also explains why members might avoid using docked bikes; they likely prefer bikes that they can keep 
           for longer periods or those that offer a more consistent route.


 ### [4] Riders Behavioural Patterns


 Monthly trip patterns reveal that both casual and member riders follow similar trends, showing a peak in trips during the summer months and a drop in winter months. Notably, the difference between casual and 
 member riders is smallest in July, at the height of summer.

 Comparing days of the week reveals that casual riders tend to make more trips on weekends, while members experience a decrease in trips over the weekend compared to the rest of the week. This again leads to the 
 theory that casual riders are more inclined to use bikes for recreational purposes on weekends, while members, who may use bikes exclusively for commuting, experience a drop in usage when the workweek is over.

 Throughout the day, members exhibit two distinct peaks in their trip patterns : 
 one in the early morning, between 6 a.m. and 8 a.m., aligning with the start of the workday, and another in the evening, from around 4 p.m. to 8 p.m, coinciding with their return home. In contrast, casual 
 riders show a steady increase in trips throughout the day, reaching a high in the evening before tapering off.

 Even the average ride length of the members doesn't change during the weekdays and remains stable whereas casual riders have longer durations.

 Based on these insights, it is safe to conclude that casual commuters cover roughly twice the distance of members, but they do so less frequently. 









 
