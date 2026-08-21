# 🛒 Amazon Sales Analysis

## 📌 Project Overview

This project analyzes an Amazon e-commerce sales dataset (54,183 orders) using Python to uncover patterns in pricing, ratings, discounts, delivery performance, and returns. The analysis covers data cleaning, exploratory data analysis (EDA), outlier treatment, statistical transformation, and correlation analysis — with a focus on translating raw numbers into clear, defensible business insights.

The project demonstrates practical data analysis skills using Python libraries including Pandas, NumPy, Matplotlib, Seaborn, and SciPy.

---

## 🎯 Objectives

- Clean and preprocess raw sales data.
- Perform Exploratory Data Analysis (EDA) across pricing, ratings, and delivery.
- Quantify the relationship between price, discount, and customer rating.
- Evaluate and compare outlier-handling strategies for skewed price data.
- Investigate delivery delays and return rates across operational variables.
- Generate quantified, evidence-based insights rather than assumptions.

---

## 📊 Dataset

- **Source:** Amazon e-commerce order dataset
- **Format:** CSV
- **Records:** 54,183 orders, 0 missing values
- **Features include:**
  - `category`, `subcategory`, `brand`
  - `price`, `discount`, `final_price`
  - `rating`, `review_count`, `seller_rating`
  - `stock`, `shipping_time_days`, `delivery_status`, `is_returned`
  - `purchase_date`, `location`, `device`, `payment_method`

> **Note on data authenticity:** Category share is unusually even (19.8%–20.3% across all 5 categories) and brand share is similarly flat (~8% across 12 brands). Real-world retail data is typically skewed toward dominant categories/brands, so this near-uniform distribution suggests the dataset may be synthetically generated. This is treated as a caveat throughout the analysis rather than ignored.

---

## 🛠️ Technologies Used

- Python
- Jupyter Notebook
- Pandas, NumPy
- Matplotlib, Seaborn
- SciPy (Box-Cox transformation, KDE)

---

## 📈 Analysis Performed

- Data cleaning and null-value checks
- Outlier detection and treatment (IQR method, compared across drop / mean-replace / median-replace / custom strategies)
- Descriptive statistics and skewness analysis
- Univariate and bivariate analysis
- Correlation analysis across price, rating, discount, and seller rating
- Category- and brand-level segmentation
- Box-Cox transformation for right-skewed price data
- Delivery and returns analysis across location, device, category, brand, and payment method
- Conditional probability analysis (category likelihood given high price)

---

## 🔍 Key Insights

- **Price and rating have a moderate positive relationship (r = 0.331).** Higher-priced items trend toward slightly higher ratings — this contradicts the common assumption that price has no bearing on perceived quality.

- **`final_price` is strongly derived from `price` (r = 0.986)**, confirming internal data consistency as a sanity check.

- **Price is right-skewed (skew = 2.14)** with a mean of $13,148 well above the median of $4,932. A **Box-Cox transformation** was applied to `final_price` (skew reduced from 2.24 toward normal) to support more reliable statistical analysis.

- **Outlier treatment on `price`** was evaluated using four approaches — dropping, mean replacement, median replacement, and a custom rule. Median replacement preserved the underlying distribution shape best, since it's less sensitive to the right skew than the mean.

- **Category and brand distributions are unusually even** (all categories within 19.8%–20.3%; all brands within ~8.0%–8.5%), an anomaly for real retail data and a reason to treat other findings as directional rather than definitive.

- **11.8% of all orders were returned** (6,382 of 54,183). Return rate does not vary meaningfully by category, brand, or payment method (all within a ~1 percentage point spread), and correlates negligibly with rating (r = -0.04) — in this dataset, returns appear largely independent of these factors.

- **29.5% of orders were delayed** — nearly matching the 29.5% delivered on time. Delay rate is essentially flat across location (29.0%–30.6%), device (29.0%–30.0%), and shipping window (27.1%–30.1%), suggesting delivery delays aren't driven by any operational factor captured in this dataset.

- **Price shows a weak negative correlation with discount (r = -0.203)** — higher-priced items tend to receive slightly smaller percentage discounts.

- **Seller rating shows no relationship with product rating (r = 0.0005)** — a seller's reputation score does not predict how customers rate the products they sell.

- **High-price items (top 25% by `final_price`) are overwhelmingly Electronics (70.7%)**, followed by Home (21.8%) and Sports (7.4%) — the clearest category-level pricing pattern in the dataset.

---

## 📷 Visualizations

The notebook includes:

- Box plots and KDE plots comparing raw vs. outlier-treated price distributions
- Histograms of price, discount, and stock
- Bar charts of category, brand, subcategory, and shipping-time distributions
- Scatter plots of price vs. rating (by category)
- Correlation heatmaps (price/rating, price/final_price)
- Box-Cox transformed density plot

---

## 📂 Project Structure

```
Ecommerce-Sale-Analysis/
│
├── Analysis_Notebook.ipynb      # Full EDA, cleaning, and statistical analysis
├── amazon_Sales_Dataset.csv     # Raw dataset (54,183 rows)
├── README.md
└── img/                         # Exported chart images
```

---

## 🚀 How to Run

1. Clone the repository
   ```
   git clone https://github.com/surendar73b3/Ecommerce-Sale-Analysis.git
   ```

2. Navigate to the project directory
   ```
   cd Ecommerce-Sale-Analysis
   ```

3. Install required libraries
   ```
   pip install pandas numpy matplotlib seaborn scipy
   ```

4. Open `Analysis_Notebook.ipynb` in Jupyter or VS Code to explore the full analysis.

---

## 💡 Skills Demonstrated

- Data Cleaning & Preprocessing
- Exploratory Data Analysis (EDA)
- Outlier Detection & Treatment
- Statistical Transformation (Box-Cox)
- Correlation & Conditional Probability Analysis
- Data Visualization
- Critical Evaluation of Data Quality
- Business Insight Generation

---

## 👨‍💻 Author

**Surendar Poojala**

- 💻 GitHub: [surendar73b3](https://github.com/surendar73b3)

---

## ⭐ If you found this project useful, consider giving it a star!
