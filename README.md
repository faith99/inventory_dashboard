# Fashion Inventory Insights Dashboard

## Problem Statement / Business Objective

Retailers often struggle to align their inventory with actual demand, leading to frequent out-of-stock situations or excess unsold products. This project analyzes a fashion retail inventory dataset to uncover patterns in stock availability, brand performance, and product features—empowering smarter stock management and sales strategies.

---

## About the Dataset

- **Source:** Provided by the #30DaysOfDataWithAnnie challenge  
- **Size:** 15,000+ rows, 13 columns  
- **Key Columns:**  
  - `Product ID`  
  - `Brand`  
  - `Product Type`  
  - `Variant Price`  
  - `Variant Compare At Price`  
  - `Is In Stock`  
  - `Ideal For`  
  - `Date`, `Time`, and derived `Month` column

---

## Data Cleaning Process

**Tools Used:** Excel

Steps Taken:

- Verified **no duplicate records** existed
- Standardized `Date` format from `dd-mm-yyyy` to `dd/mm/yyyy`
- Created new columns:
  - `On Sale`: IF `Variant Price` < `Variant Compare At Price`
  - `Month`: Extracted using `TEXT(Date, "mmm")`
- Filled missing values:
  - Stock column: `Unknown`
  - Dominant Material, Color, Product Type: `N/A`
- Converted `Variant Price` and `Compare At Price` to Currency format

---

## Exploratory Data Analysis

**SQL** was used to answer key business questions:

- Which product types are most frequently out of stock?
- Are discounted items being ignored despite price cuts?
- Do product features (like size or demographic target) affect stock status?

**Inferential Statistics (Excel):**

- **Chi-square test**: Examined relationship between stock status and product type
- **Confidence Intervals**: Estimated stock availability range across demographics

---

## Dashboard Summary

A one-page **Power BI dashboard** designed to answer our business questions using interactive and clean visuals.

## Dashboard Preview
<p align="center">
  <img src="https://github.com/user-attachments/assets/636dd329-5130-44e1-9eb2-50b853d7efb5" alt="Fashion Inventory Dashboard Preview" width="800" height="450">
</p>


**View the Dashboard:**  
[Power BI Dashboard Link](https://app.powerbi.com/view?r=eyJrIjoiZThkYTUyYmQtZjU2Yi00ZTc3LWIxZGMtNjM5OWUxZjQ0N2EyIiwidCI6IjA3YTAwYzJhLTAxZDItNDYwNC04N2YyLTJmN2MwYzQ5ODIwZiJ9)

---

## Insights & Recommendations

**Key Takeaways:**

1. **High-Demand Styles:** A-Line and Straight Kurtas are frequently both stocked and sold out—this suggests strong customer interest and quick turnover.
2. **Discount Blind Spots:** Some discounted products still remain in stock—indicating that pricing alone isn’t enough to drive purchases.
3. **Demographic Variation:** Female-focused products tend to have slightly higher stock retention rates than other categories.

**Recommendation:**  
Brands should prioritize faster restocking of high-demand products and pair discounting with targeted promotions or improved visibility for underperforming items.

---

## Tools Used

- Microsoft Excel  
- SQL (MySQL)  
- Power BI  

---

