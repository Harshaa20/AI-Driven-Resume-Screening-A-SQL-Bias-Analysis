# AI Resume Screening Analysis (SQL Project)
## Project Overview

This project analyzes an AI-driven resume screening dataset to understand the key factors influencing shortlisting decisions.

Using structured SQL queries, I evaluated how candidate attributes such as experience, skills match score, project portfolio, GitHub activity, and resume length impact automated shortlisting outcomes.

The goal was to uncover measurable patterns and ranking behaviors within the AI evaluation system.

## Dataset Description

The dataset includes structured candidate-level attributes such as:

Years of experience

Skills match score

Project count

GitHub activity

Education level

Resume length

Shortlisting outcome (Yes/No)

# Objectives

Measure the overall shortlisting rate

Compare shortlisted vs rejected candidate profiles

Identify performance thresholds across key metrics

Rank the top candidates within education groups

Detect potential bias patterns in AI decision logic

# SQL Techniques Used

Aggregations (COUNT, AVG)

Subqueries

Conditional filtering

Window functions (ROW_NUMBER, AVG OVER PARTITION)

Ranking analysis

Gap and variance analysis

# Key Insights

Approximately 70% of candidates were shortlisted.

Shortlisted candidates showed significantly higher averages in:

Years of experience

Skills match score

Project count

GitHub activity

Portfolio activity (GitHub engagement) strongly correlated with shortlisting outcomes.

Candidates with fewer projects required higher-than-average skill scores to qualify.

Resume length showed measurable differences between shortlisted and rejected profiles.

Ranking analysis revealed that high skill scores could outperform education level in selection outcomes.

# Analytical Approach

The project followed a structured analytical workflow:

Descriptive analysis of overall shortlisting rates

Diagnostic comparison across candidate segments

Threshold and gap analysis using subqueries

Competitive ranking within education groups

Insight extraction and business interpretation

# Business Interpretation

This analysis demonstrates how AI-based screening systems may weight portfolio strength, skill scores, and experience differently across candidate segments.

It highlights the importance of measurable output (projects, GitHub activity) in automated evaluation environments.
