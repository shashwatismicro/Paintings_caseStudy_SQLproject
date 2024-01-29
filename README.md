# Museum Paintings Case Study

## Overview

This repository contains a case study on paintings in museums, utilizing a painting database obtained from Kaggle. The case study involves exploring various aspects of the dataset, answering specific questions through SQL queries, and deriving insights into museum paintings, artists, styles, and more.

## Dataset Description

The dataset includes multiple tables providing information on artists, paintings, museums, canvas sizes, product sizes, subjects, and more. The SQL queries provided in the repository script aim to address specific questions and uncover patterns within the dataset.

## Tables in the Database

- **artist:** Information about artists.
- **canvasSize:** Details about canvas sizes.
- **imageLink:** Links to images related to paintings.
- **museum:** Information about museums.
- **museumHours:** Museum opening hours.
- **productSize:** Information about product sizes related to paintings.
- **subject:** Details about painting subjects.
- **work:** Information about individual paintings.

## SQL Queries

The SQL script in this repository includes queries that answer various questions, such as identifying paintings not displayed in any museums, finding museums without paintings, determining paintings with unique pricing characteristics, analyzing popular subjects, and more.

## Sample Queries

- Fetch all paintings which are not displayed in any museums.
- Identify museums without any paintings.
- Find paintings with an asking price higher than their regular price.
- Determine paintings with asking prices less than 50% of their regular price.
- Identify the most expensive canvas size.
- Discover museums with invalid city information.
- Fetch the top 10 most famous painting subjects.
- Identify museums open on both Sunday and Monday.
- Determine the top 5 most popular museums based on the number of paintings.
- Find the top 5 most popular artists based on the number of paintings.
- Display the 3 least popular canvas sizes.
- Identify the museum open for the longest duration during a day.
- Determine the museum with the most popular painting style.

## Instructions for Running Queries

To run the provided SQL queries on your own database, follow these steps:

1. Create a database named `paintings`.
2. Import the dataset into the database.
3. Execute the SQL queries in the script to explore the dataset and derive insights.
