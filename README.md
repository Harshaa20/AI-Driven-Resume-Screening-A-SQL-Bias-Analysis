# AI Resume Screening: A SQL Bias Analysis
A deep-dive investigation into the "black box" of automated recruitment. This project uses MySQL to audit 3,000 synthetic resumes, uncovering the hidden logic and systemic biases within an AI-driven shortlisting system.
## Project Overview
Automated screening tools are often touted as objective, but they frequently inherit human biases. By applying Exploratory Data Analysis (EDA) and advanced Window Functions, I reversed-engineered the scoring patterns to see exactly what "features" the AI values most.
## Key Discoveries
The GitHub "Hard Floor": Regardless of education level, shortlisted candidates shared a consistent average GitHub Activity score of ~395. Anything below this threshold acted as an automatic "kill switch."
Resume Length Bias: The AI equated quantity with quality. Shortlisted candidates averaged 633 words, while rejected ones averaged only 430 words.
The "Substitution Effect": I quantified the experience gap—the #1 ranked PhD candidate required only 1 year of experience to achieve a perfect 100 score, whereas the #1 Bachelor’s candidate needed 12 years.
The "Superstar" Gap: Using Window Functions, I found that High School candidates must outperform their peers by 31.7 points to be shortlisted, while PhDs only needed a 21-point lead.
## SQL Techniques Used
Window Functions: Utilized ROW_NUMBER(), PARTITION BY, and AVG() OVER() to rank candidates and compare them against tier-specific benchmarks.
Complex Subqueries: Built to filter top-ranked results and perform multi-level comparisons against global averages.
Conditional Aggregates: Leveraged SUM(CASE WHEN...) to calculate precise success rates across different demographic and educational segments.
Data Engineering: Cleaned NULL values and optimized data types during the initial CSV import to ensure query performance.
## Why This Matters
This analysis highlights how "hidden" thresholds (like resume length or activity scores) can inadvertently penalize qualified candidates. It serves as a case study for why algorithmic auditing is essential in modern HR tech.
