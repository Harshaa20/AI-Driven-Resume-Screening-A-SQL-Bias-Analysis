# AI-Driven-Resume-Screening-A-SQL-Bias-Analysis
This project uses MySQL to investigate how an automated AI recruitment system evaluates 3,000 synthetic candidate resumes. Through Exploratory Data Analysis (EDA) and Window Functions, I uncovered the "hidden" logic the AI uses to shortlist candidates.

## Key Discoveries
Regardless of education, shortlisted candidates had an average GitHub Activity of ~395. Candidates below this were consistently rejected.
Resume Length Bias: The AI preferred longer resumes. Shortlisted candidates averaged 633 words, while rejected ones averaged only 430.
Education vs. Experience: I discovered a "Substitution Effect." The #1 ranked PhD candidate only needed 1 year of experience to hit a 100 score, while the #1 Bachelors candidate needed 12 years.
The "Superstar" Gap: Using Window Functions, I found that High School candidates must score 31.7 points above their peers to be shortlisted, whereas PhDs only need to be 21 points above.

## SQL Techniques Used
Window Functions: ROW_NUMBER(), PARTITION BY, and AVG() OVER() to rank candidates within their education tiers.
Subqueries: To filter ranked results and compare individual scores against global averages.
Conditional Aggregates: Using SUM(CASE WHEN...) to calculate success rates for different demographics.
Data Cleaning: Handling NULL values and correcting data types during CSV import.
