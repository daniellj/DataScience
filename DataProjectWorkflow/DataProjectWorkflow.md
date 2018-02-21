## 1. Data Project Workflow

### 1.1. KDD (Knowledge Discovery in Databases)
![img](https://github.com/daniellj/DataScience/blob/master/DataProjectWorkflow/img/KDD_Process_Diagram.png)

- Some algorithms supported on data minning phase for KDD:
	- Classification
	- Regression
	- Clustering
	- Associations

### 1.2. CRISP-DM (Cross Industry Standard Process for Data Mining)
![img](https://github.com/daniellj/DataScience/blob/master/DataProjectWorkflow/img/CRISP-DM_Process_Diagram.png)

### 1.2.1. Workflow orientation topics based on CRISP-DM:
- **1.2.1.1. Objective**
	- What is the problem you are trying to solve?
- **1.2.1.2. Importing Data**
	- Data sources: 
		- Hadoop (HDFS)
		- .CSV
		- .TXT
		- Document-Oriented Database (MongoDB)
		- Wide Column Store (Cassandra)
		- Key-Value Databases (DynamoDB)
		- ...
- **1.2.1.3. Data Exploration**
	- Data Understanding
		- Exploration some data observations
		- Descritive Data Summarization (mean, moda, median, std - standard deviation, min, max, balanced data classes, ...)
		- Graphic Representation (density, frequency, correlation, ...)
- **1.2.1.4. Data Preparation**
	- Data Cleaning: detection, removal and adjustment of anomalies contained in the data.
		- Outliers
		- Nan (NULL): missing values
		- Duplicate representations unexpected
	- Data Wrangling (or Munging): transforming data into a format that makes it easier to work with.
		- Data Partitioning (create training + validation + test data set, ...)
		- Transformations (normalization, standardisation, scaling, binarizing, pivoting, ...)
		- Data Replacement (cutting, splitting, merging, ...)
		- Weighting and Selection (attribute weighting, automatic optimization, ...)
		- Attribute Generation (ID generation, ...)
	- Feature Engineering: attributes selection to analyze.
		- Brainstorming or testing of features
		- Feature selection
		- Validation of how the features work with your model
		- Improvement of features if needed
		- Return to brainstorming / creation of more features until the work is done
- **1.2.1.5. Baseline Modeling**: contruction "N" models, using Pipeline (automating transformation and prediction tasks), and avaliate.
- **1.2.1.6. Secundary Modeling**: tunning the models.
	- Parameter estimation: in Python, using grid search with cross validation.
	- Ensemble modeling:
		- Bagging
		- Boosting
		- Stacking
		- Voting
- **1.2.1.7. Communicating Results**
	- Storytelling: art of communicate research result with data.
- **1.2.1.8. Conclusion**
- **1.2.1.9. Resources**

## 2. Credits:

- [KDD article (EN-US)](http://recommender-systems.readthedocs.io/en/latest/datamining.html)

- [CRISP-DM article (PT-BR)](http://www.bigdatabusiness.com.br/se-voce-se-interessa-por-big-data-precisa-entender-o-crisp-dm/)

- [Some steps for develop a data project (EN-US)](https://github.com/aakashtandel/misc_projects/blob/master/Data%20Science%20Workflow%20Project/Data%20Science%20Workflow.pdf)