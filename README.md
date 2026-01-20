# Music & Mental Health: Analyzing the Relationship Between Music Listening Habits and OCD Levels

[![R](https://img.shields.io/badge/R-276DC3?style=flat&logo=r&logoColor=white)](https://www.r-project.org/)
[![Statistical Analysis](https://img.shields.io/badge/Statistical-Analysis-blue)](https://github.com/Mkpz/OCD-Levels-Music-Preference-Pattern-Prediction)
[![Hypothesis Testing](https://img.shields.io/badge/Hypothesis-Testing-orange)](https://github.com/Mkpz/OCD-Levels-Music-Preference-Pattern-Prediction)
[![Regression Modeling](https://img.shields.io/badge/Regression-Modeling-green)](https://github.com/Mkpz/OCD-Levels-Music-Preference-Pattern-Prediction)
[![Data Visualization](https://img.shields.io/badge/Data-Visualization-purple)](https://github.com/Mkpz/OCD-Levels-Music-Preference-Pattern-Prediction)
[![Bonferroni Correction](https://img.shields.io/badge/Bonferroni-Correction-red)](https://github.com/Mkpz/OCD-Levels-Music-Preference-Pattern-Prediction)
[![Medium](https://img.shields.io/badge/Medium-Read%20Article-black?logo=medium)](https://medium.com/@shreymahek/visualizing-and-predicting-ocd-levels-and-music-liking-patterns-7948a8b8ff37)

A statistical analysis examining the relationship between music listening patterns, favorite genres, and self-reported mental health conditions, specifically OCD levels, using hypothesis testing and polynomial regression with RMSE error of 2.75.

## Project Overview

This project analyzes survey data from October-November 2022 exploring how music preferences and listening habits correlate with mental health outcomes. Using advanced statistical methods including Bonferroni-corrected hypothesis testing and polynomial regression, the analysis identifies that EDM listeners show significantly lower OCD levels when listening frequently, while exploring the therapeutic potential of music across different genres.

### Key Findings

- Spotify dominates as the primary streaming service (majority of listeners)
- EDM listeners who listen very frequently have the lowest OCD levels (0 out of 10)
- Gospel vs. EDM shows the only statistically significant difference in OCD levels (p < 0.0004)
- Downward trend: More frequent EDM listening correlates with lower OCD levels
- Improvement through high hours: EDM listeners spending 17+ hours/day show mental health improvement

## Research Questions

1. Do different music genres correlate with different OCD levels?
2. Does listening frequency affect mental health outcomes?
3. Can we predict OCD levels based on music listening patterns?
4. Which demographic and musical factors are most significant predictors?

## Repository Structure

```
OCD-Levels-Music-Preference-Pattern-Prediction/
│
├── OCD levels & music-liking patterns Prediction Project Code.R  # Complete analysis code
├── Errorfunction.R                                               # Custom error function
└── README.md                                                     # Project documentation
```

**Note**: The dataset used in this analysis is locally stored and not included in this repository.

## Getting Started

### Prerequisites

```r
# Required R version
R >= 4.0.0

# Install required packages
install.packages(c("ggplot2", "dplyr", "corrplot", "wesanderson"))
```

### Running the Analysis

1. Clone the repository:
```bash
git clone https://github.com/yourusername/OCD-Levels-Music-Preference-Pattern-Prediction.git
cd OCD-Levels-Music-Preference-Pattern-Prediction
```

2. Obtain the dataset:
   - The analysis uses Music & Mental Health Survey data (October-November 2022)
   - Dataset is not publicly available in this repository
   - Ensure you have access to the required dataset locally

3. Configure data path:
```r
# Update the data path in the R file to point to your local dataset
# Modify the file path in: OCD levels & music-liking patterns Prediction Project Code.R
```

4. Load the error function:
```r
# Load custom error function for model evaluation
source("Errorfunction.R")
```

5. Run the analysis:
```r
source("OCD levels & music-liking patterns Prediction Project Code.R")

# Or run sections individually:
# - Data visualization (pie charts, bar plots, box plots)
# - Hypothesis testing with Bonferroni correction
# - Regression model building and evaluation
```

## Dataset Information

**Source**: Music & Mental Health Survey (Kaggle)  
**Time Period**: October-November 2022  
**Sample Size**: 500+ respondents  

**Key Variables**:
- `Age`: Respondent age
- `Primary.streaming.service`: Main music platform (Spotify, YouTube Music, etc.)
- `Hours.per.day`: Music listening duration
- `Fav.genre`: Favorite music genre (16 options)
- `Frequency_[Genre]`: Listening frequency (Rarely, Sometimes, Very frequently)
- `music.effects`: Self-reported mental health impact (Improve, Worsen, No effect)
- `Exploratory`: Tendency to explore new music (Yes/No)
- `Foreign.languages`: Listens to foreign language music (Yes/No)
- `OCD`: Self-reported OCD level (0-10 scale)

## Technologies & Methods

### Programming & Statistical Tools
- **Language**: R
- **Key Packages**:
  - `ggplot2` - Data visualization
  - `dplyr` - Data manipulation
  - `stats` - Hypothesis testing
  - `corrplot` - Correlation analysis

### Statistical Methods Implemented

**1. Bonferroni Correction for Multiple Testing**

Problem: Testing 120 pairwise genre comparisons (16 choose 2)  
Solution: Adjusted significance level

```
α_adjusted = 0.05 / 120 = 4.16 × 10⁻⁴
```

**2. Z-Score Hypothesis Testing**

**Hypothesis Test 1: EDM vs. Gospel**
- H₀: No difference in average OCD levels between EDM and Gospel listeners
- H₁: Average OCD levels differ between EDM and Gospel listeners
- Result: p-value = 7.00 × 10⁻⁶ < 0.0004
- Conclusion: Reject H₀ - Significant difference exists

**Hypothesis Test 2: Latin vs. EDM**
- H₀: No difference in average OCD levels between Latin and EDM listeners
- H₁: Average OCD levels differ between Latin and EDM listeners
- Result: p-value = 0.778 > 0.0004
- Conclusion: Fail to reject H₀ - No significant difference

Overall Finding: Only EDM vs. Gospel shows statistically significant difference among all 120 pairwise comparisons.

## Analysis Results

### Primary Streaming Services Distribution

| Platform | Percentage | Notes |
|----------|-----------|-------|
| Spotify | ~60% | Dominant platform |
| YouTube Music | ~25% | Second most popular |
| Other platforms | ~15% | Apple Music, Pandora, etc. |

Analysis Focus: Restricted to Spotify users for consistency

### Age Demographics by Favorite Genre

| Genre | Primary Age Range | Observations |
|-------|------------------|--------------|
| Latin | 20s | Concentrated younger audience |
| EDM | 20s-30s | Young to middle-aged adults |
| Gospel | 20s-50s | Broadest age distribution |

Selected Genres: Latin, EDM, Gospel chosen for comparative analysis based on distinct age profiles

### Music Effects on Mental Health by Genre

**EDM Findings**:
- High hours (17+/day): Mental health improvement reported
- Low hours (<5/day): No effect on mental health
- Pattern: More hours → Greater improvement

**Gospel Findings**:
- Moderate hours (~8/day): Mental health improvement reported
- Efficiency: Fewer hours needed for positive effects

**Latin Findings**:
- High hours (~12/day): No effect on mental health reported
- Pattern: Inconsistent improvement despite high engagement

### OCD Level Distribution by EDM Frequency

| OCD Level | Rare Listeners | Sometimes Listeners | Very Frequent Listeners |
|-----------|---------------|---------------------|------------------------|
| 0 (Lowest) | Low | Moderate | Highest count |
| 1 | Low | Moderate | High |
| 2 | Moderate | High | Moderate |
| 3 | High | High | Low |
| 4 | High | Moderate | Very Low |

Clear Trend: As OCD levels increase, the number of very frequent EDM listeners decreases

Statistical Significance: The inverse relationship between EDM listening frequency and OCD severity is statistically significant (Bonferroni-adjusted p < 0.0004)

## Regression Models

### Model 1: Polynomial Regression

**Predictors**:
- `Age`
- `Fav.genre` (Favorite music genre)
- `Hours.per.day` (Music listening hours)

**Performance**:
- RMSE: 2.879737
- Interpretation: Good prediction given varying OCD patterns across genres

### Model 2: Quadratic Polynomial Regression (Best Model)

**Predictors**:
- `Age`
- `Fav.genre`
- `Hours.per.day`
- `music.effects` (Self-reported mental health impact)
- `Exploratory` (Listens to new music frequently)
- `Foreign.languages` (Listens to foreign language music)
- `Primary.streaming.service`

**Performance**:
- RMSE: 2.749560 (Best Performance)
- Improvement: 4.5% reduction in prediction error vs. Model 1

**Model Comparison**:
- Quadratic polynomial > Polynomial > Exponential > Logarithmic
- Additional predictors (music effects, exploratory tendencies) improved accuracy
- Quadratic terms captured non-linear relationships

## Key Insights

### 1. EDM's Therapeutic Potential

Mechanism Hypothesis:
- High engagement (17+ hours/day) suggests deep emotional connection
- Rhythm and tempo may provide cognitive stimulation
- Consistent exposure allows cumulative mental health benefits
- Very frequent listeners show measurable OCD reduction

### 2. Gospel's Efficiency

Characteristics:
- Moderate hours (8/day) sufficient for improvement
- Broader age appeal (20s-50s) suggests universal themes
- Spiritual/emotional content may provide rapid mental health benefits

### 3. Genre-Specific Patterns

Why Latin Shows No Effect:
- Cultural factors not captured in dataset
- Potential confounding variables (location, heritage)
- Different mechanisms of music appreciation

### 4. Listening Patterns Matter

Frequency > Duration for certain genres:
- Very frequent listening (daily habit) more impactful than total hours alone
- Consistency may be key therapeutic factor
- Engagement type (active vs. passive listening) not measured

## Data Visualizations Created

### 1. Pie Chart
- Purpose: Distribution of primary streaming services
- Finding: Spotify dominates the market

### 2. Box Plot
- Purpose: Age distribution across 16 favorite genres
- Finding: Distinct age profiles (Latin: 20s, EDM: 20s-30s, Gospel: 20s-50s)

### 3. Double Bar Plot
- Purpose: Music effects on mental health by genre
- Finding: EDM high-hour listeners show improvement; Gospel moderate-hour listeners show improvement

### 4. Stacked Bar Plot
- Purpose: OCD levels vs. EDM listening frequency
- Finding: Very frequent EDM listeners have lowest OCD levels (inverse relationship)

## Limitations & Future Work

### Current Limitations

1. Incomplete 2022 Data: Only October-November available
2. Missing Location Data: Cannot analyze cultural/regional factors
3. Cross-Sectional Design: Cannot establish causation
4. Self-Reported Measures: Potential bias in OCD assessment
5. Sample Demographics: Limited diversity in age/background

### Proposed Improvements

1. Longitudinal Study: Track participants over time to establish causality
2. Location Variables: Add country/region for cultural analysis
3. Clinical Validation: Use standardized OCD diagnostic tools
4. Expanded Timeframe: Compare pre-COVID (2019) vs. current (2022) trends
5. Qualitative Data: Interviews to understand mechanisms
6. Listening Context: Active vs. passive listening, social vs. solo

### Research Extensions

- Music therapy protocols based on genre-specific findings
- Dose-response curves for different genres
- Demographic subgroup analysis (age, gender, location)
- Other mental health conditions (anxiety, depression)
- Physiological measures (heart rate, cortisol levels)

## Academic Context

**Course**: Data Science / Statistical Analysis  
**Institution**: Rutgers University  
**Completion Date**: 2022  
**Medium Publication**: [Read the full article](https://medium.com/@shreymahek/visualizing-and-predicting-ocd-levels-and-music-liking-patterns-7948a8b8ff37)

## Read the Full Story

For a detailed narrative of this analysis with additional context and insights:

[View the Medium article](https://medium.com/@shreymahek/visualizing-and-predicting-ocd-levels-and-music-liking-patterns-7948a8b8ff37)

The Medium post includes:
- Expanded background on music therapy
- Additional visualizations and interpretations
- Personal reflections on the findings
- Broader implications for mental health awareness

## Music Therapy Implications

**For Practitioners**:
- Consider genre preferences when designing interventions
- High-frequency listening (daily habit formation) may be therapeutic
- EDM's rhythmic properties may specifically benefit OCD management
- Gospel's spiritual elements provide efficient mental health benefits

**For Listeners**:
- Explore genres that resonate emotionally
- Establish consistent listening routines
- Consider very frequent listening for genres you love
- Music streaming accessibility enables self-directed therapy

---

**Note**: This analysis represents academic coursework demonstrating proficiency in statistical hypothesis testing, regression modeling, and research communication through multiple media (code, visualizations, written article).
