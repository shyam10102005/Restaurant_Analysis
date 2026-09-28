# 🍔 Restaurant Analysis

![Power BI](https://img.shields.io/badge/PowerBI-F2C811?style=flat&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=flat&logo=postgresql&logoColor=white)

Welcome to the **Restaurant Analysis** project! This repository contains a comprehensive data analysis pipeline focused on understanding restaurant operations, customer behavior, and financial metrics.

## 📊 Overview

This project analyzes key metrics across a restaurant platform, providing actionable insights into:
- **Revenue & Orders**: Tracking total revenue, total orders, and average order value (AOV).
- **Customer Segmentation**: Comparing premium vs. regular customers and analyzing performance across different city tiers.
- **Operational Efficiency**: Monitoring service times, delay rates, and the impact of traffic and distance.
- **Customer Satisfaction**: Analyzing customer ratings, staff ratings, and cancellation rates.


## 🗄️ Database Entity-Relationship Diagram

```mermaid
erDiagram
    consumers ||--o{ consumer_preferences : "Consumer_ID"
    consumers ||--o{ ratings : "Consumer_ID"
    restaurants ||--o{ ratings : "Restaurant_ID"
    restaurants ||--o{ restaurant_cuisines : "Restaurant_ID"

    consumers {
        int Age
        string AgeGroup
        string Budget
        int Children
        string City
        string Consumer_ID PK
        string Country
        string Drink_Level
        float Latitude
        float Longitude
        string Marital_Status
        string Occupation
        string Smoker
        string State
        string Transportation_Method
    }

    consumer_preferences {
        string Consumer_ID FK
        string Preferred_Cuisine
    }

    ratings {
        string Consumer_ID FK
        int Food_Rating
        string Food_Rating_Category
        int Overall_Rating
        string Overall_Rating_Category
        string Restaurant_ID FK
        int Service_Rating
    }

    restaurants {
        string Alcohol_Service
        string Area
        string City
        string Country
        string Franchise
        float Latitude
        float Longitude
        string Name
        string Parking
        string Price
        string Restaurant_ID PK
        string Smoking_Allowed
        string State
        string Zip_Code
    }

    restaurant_cuisines {
        string Cuisine
        string Restaurant_ID FK
    }
```

## 📁 Repository Contents

- `restaurant_analysis_cleaned.csv`: The cleaned dataset used for the analysis, containing detailed customer, order, and service metrics.
- `Restaurant_Analysis.pbix`: The interactive **Power BI** dashboard file containing data visualizations, KPIs, and visual analytics.
- `Restaurant_Analysis.py`: A **Python** script (originally a Jupyter Notebook) that uses `pandas` and `matplotlib` to clean, transform, and visualize the data. It calculates correlations, trends, and summary statistics.
- `Restaurant_Analysis.sql`: **SQL** scripts used to query and aggregate metrics from the database (e.g., revenue by city tier, monthly trends, delay impacts on ratings).

## 🚀 Key Insights Explored

1. **Revenue Trends**: Monthly revenue analysis to identify peak ordering periods.
2. **Premium vs. Regular Customers**: Assessing the revenue contribution and cancellation rates of premium subscribers compared to regular users.
3. **Logistics & Delays**: Understanding how travel distance, weather severity, and traffic level scores impact average service times and delay probabilities.
4. **Cancellations**: Investigating cancellation rates across different city tiers and customer types.

## 🛠️ Technology Stack

- **Data Visualization**: Power BI
- **Data Manipulation & Analysis**: Python (Pandas, Matplotlib)
- **Database Querying**: SQL (MySQL/PostgreSQL syntax)

## 💻 Getting Started

### Power BI Dashboard
1. Ensure you have [Power BI Desktop](https://powerbi.microsoft.com/desktop/) installed.
2. Open `Restaurant_Analysis.pbix` to interact with the visualizations.

### Python Analysis
1. Install the required Python libraries:
   ```bash
   pip install pandas matplotlib
   ```
2. Place the `restaurant_analysis_cleaned.csv` dataset in the root directory.
3. Run the Python script:
   ```bash
   python Restaurant_Analysis.py
   ```

### SQL Queries
1. Import your dataset into your preferred SQL database.
2. Execute the queries in `Restaurant_Analysis.sql` to generate summary tables and aggregated views.

## 📄 License
This project is for analytical and educational purposes.
