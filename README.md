# Machine Learning: Decision Trees and Random Forests Assignment

## Breast Cancer Dataset Analysis

This repository contains a comprehensive analysis of the Wisconsin Diagnostic Breast Cancer (WDBC) dataset using Decision Trees and Random Forests classifiers.

## Contents

- `cancer_analysis.ipynb` - Main Jupyter notebook with complete analysis and solutions
- `wdbc.data` - Breast cancer dataset (569 samples, 30 features)
- `wdbc.names` - Dataset documentation and feature descriptions
- `requirements.txt` - Python dependencies

## Dataset Information

**Wisconsin Diagnostic Breast Cancer (WDBC) Dataset**
- **Samples**: 569 instances
- **Features**: 30 real-valued features (mean, SE, and worst values of 10 measurements)
- **Target**: Binary classification (Malignant vs Benign)
- **Distribution**: 357 benign, 212 malignant cases

### Features
The dataset includes 30 features computed from cell nucleus measurements:
- Radius, Texture, Perimeter, Area
- Smoothness, Compactness, Concavity, Concave points
- Symmetry, Fractal dimension

Each measurement has three values: mean, standard error, and "worst" (mean of three largest values).

## Installation

### Prerequisites
- Python 3.8 or higher
- pip package manager

### Setup
```bash
# Clone the repository
git clone https://github.com/jeevanspatil/machineLearning.git
cd machineLearning

# Install dependencies
pip install -r requirements.txt
```

## Usage

### Running the Notebook
```bash
# Start Jupyter Notebook
jupyter notebook cancer_analysis.ipynb
```

Or use JupyterLab:
```bash
jupyter lab cancer_analysis.ipynb
```

### Executing All Cells
You can execute the entire notebook from the command line:
```bash
jupyter nbconvert --to notebook --execute cancer_analysis.ipynb --output cancer_analysis_executed.ipynb
```

## Assignment Questions Covered

### Question 1: Base Rate Analysis
- Calculates the probability of malignant cancer occurrence in the dataset
- Provides visualization of class distribution

### Question 2: Decision Tree Classifier
- **(a)** Implements DecisionTreeClassifier with varying `max_depth` (1-10)
  - Evaluates using full-dataset accuracy
  - Evaluates using 10-fold cross-validation
  - Plots performance comparison
- **(b)** Identifies optimal `max_depth` for:
  - (i) Full-dataset accuracy
  - (ii) 10-fold cross-validated accuracy

### Question 3: Random Forest Classifier
- **(a)** Uses RandomForestClassifier with optimal `max_depth` from 2(b)(ii)
  - Varies `n_estimators` from 1 to 20
  - Plots 10-fold CV accuracy
- **(b)** Compares Random Forest vs single Decision Tree performance
- **(c)** Identifies optimal `n_estimators` value
- **(d)** Varies `max_depth` (1-10) with optimal `n_estimators`
  - Creates performance plot
- **(e)** Compares optimal `max_depth` settings between DT and RF
  - Provides detailed explanation of differences

### Question 4: Stability Analysis
- **(a)** Analyzes optimal `max_depth` across 100 random states (0-99)
  - Creates bar chart showing frequency distribution
- **(b)** Identifies top two most frequently chosen `max_depth` values

## Key Results

The notebook demonstrates:
- Comprehensive data loading and preprocessing
- Model training and evaluation with proper cross-validation
- Hyperparameter optimization strategies
- Comparison between single and ensemble models
- Stability analysis across multiple random initializations
- Professional visualizations with detailed annotations

## Documentation

Each section of the notebook includes:
- Clear problem statement
- Detailed approach explanation
- Well-commented code
- Comprehensive result analysis
- Visualizations with proper labels and legends
- Interpretation and conclusions

## Submission

To create a submission package:

1. Ensure all cells are executed with outputs
2. Export to PDF (optional):
   ```bash
   jupyter nbconvert --to pdf cancer_analysis.ipynb
   ```
3. Create a zip file:
   ```bash
   zip -r submission.zip cancer_analysis.ipynb wdbc.data wdbc.names cancer_analysis.pdf
   ```

The submission package will be under 10 MB as required.

## Dependencies

- **NumPy**: Numerical computing
- **Pandas**: Data manipulation and analysis
- **Matplotlib**: Data visualization
- **Seaborn**: Statistical data visualization
- **Scikit-learn**: Machine learning algorithms
- **Jupyter**: Interactive notebook environment

See `requirements.txt` for specific version requirements.

## License

This project is for educational purposes as part of a machine learning course assignment.

## Author

Jeevan Patil

## Acknowledgments

- Dataset: Dr. William H. Wolberg, W. Nick Street, Olvi L. Mangasarian
- UCI Machine Learning Repository