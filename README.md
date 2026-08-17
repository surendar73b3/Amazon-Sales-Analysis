# 🛒 Amazon Sales Analysis

## 📌 Project Overview

This project analyzes Amazon e-commerce sales data using Python to uncover valuable business insights. The analysis focuses on data cleaning, exploratory data analysis (EDA), and visualization to identify sales trends, customer behavior, product performance, and pricing patterns.

The project demonstrates practical data analysis skills using Python libraries such as Pandas, NumPy, Matplotlib, and Seaborn.

---

## 🎯 Objectives

- Clean and preprocess raw sales data.
- Perform Exploratory Data Analysis (EDA).
- Analyze product pricing and customer ratings.
- Identify top-performing product categories.
- Visualize important sales trends.
- Generate actionable business insights.

---

## 📊 Dataset

- **Dataset Name:** Amazon E-commerce Dataset
- **Format:** Excel (.xls)
- **Records:** Approximately 5,000 products
- **Features Include:**
  - Product Name
  - Category
  - Actual Price
  - Discounted Price
  - Discount Percentage
  - Ratings
  - Rating Count

---

## 🛠️ Technologies Used

- Python
- Jupyter Notebook
- Pandas
- NumPy
- Matplotlib
- Seaborn

---

## 📈 Analysis Performed

- Data Cleaning
- Handling Missing Values
- Data Type Conversion
- Descriptive Statistics
- Univariate Analysis
- Bivariate Analysis
- Correlation Analysis
- Category-wise Product Analysis
- Rating Distribution
- Price Distribution
- Discount Analysis

---

## 📷 Visualizations

The project includes multiple visualizations such as:

- Histogram
- Bar Chart
- Box Plot
- Count Plot
- Scatter Plot
- Heatmap
- Correlation Matrix

---

## 🔍 Key Insights

- **Price does not drive customer ratings.** The correlation between `price` and `rating` was close to zero ([value]), disproving the assumption that higher-priced products are perceived as higher quality. This suggests rating is driven by factors other than price — likely product quality, seller reliability, or delivery experience.

- **`final_price` is derived from `price` and `discount`, confirmed by a strong correlation ([value]).** This served as a sanity check on data consistency rather than a new finding.

- **Category distribution is unusually balanced (~19–21% each across all 5 categories).** Real-world retail data is typically skewed toward a dominant category, so this near-uniform split suggests the dataset may be synthetically generated — an important caveat when drawing business conclusions from it.

- **`final_price` was right-skewed** (skewness = [value]), so a **Box-Cox transformation** was applied to normalize the distribution for more reliable statistical analysis.

- **Outlier treatment on `price`** was evaluated using four approaches — dropping, mean replacement, median replacement, and a custom rule — compared via box plots and KDE plots. Median replacement preserved the distribution shape best, since it's less sensitive to skew than the mean.

- **[Brand/category performance]:** [e.g., "Electronics made up the largest share of listings at X%, followed by..."] — fill in with your actual `value_counts()` output.

- **Shipping times are spread fairly evenly across 1–6 days**, with 1-day delivery only slightly more common (~22%) than other windows — suggesting room to grow the fast-delivery segment if that's a strategic priority.

- **Price vs. discount relationship:** [value] correlation — [interpret once you have the real number: e.g., "higher-priced items receive proportionally smaller discounts" or "no meaningful relationship between price and discount level"].

---

## 📂 Project Structure

```
Amazon-Sales-Analysis/
│
├── amazon_ecommerce_5k.xls
├── Project_Assignment_Surendar_Poojala.html
├── README.md
└── images/ (Optional screenshots)
```

---

## 🚀 How to Run

1. Clone the repository

```bash
git clone https://github.com/surendar73b3/Amazon-Sales-Analysis.git
```

2. Navigate to the project directory

```bash
cd Amazon-Sales-Analysis
```

3. Install required libraries

```bash
pip install pandas numpy matplotlib seaborn openpyxl
```

4. Open the Jupyter Notebook or HTML report to explore the analysis.

---

## 📸 Project Preview

You can add screenshots of your charts here for better presentation.

Example:

```
images/
├── rating_distribution.png
├── correlation_heatmap.png
├── price_distribution.png
```

---

## 💡 Skills Demonstrated

- Data Cleaning
- Data Wrangling
- Exploratory Data Analysis (EDA)
- Data Visualization
- Business Insight Generation
- Statistical Analysis
- Python Programming

---

## 👨‍💻 Author

**Surendar Poojala**

- 📧 Email: your-email@example.com
- 💼 LinkedIn: https://www.linkedin.com/in/your-profile
- 💻 GitHub: https://github.com/surendar73b3

---

## ⭐ If you found this project useful, consider giving it a star!
