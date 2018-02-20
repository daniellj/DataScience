# Data Project

### Workflow CRISP-DM (Cross Industry Standard Process for Data Mining)
![img](https://github.com/daniellj/DataScience/blob/master/DataProjectWorkflow/img/CRISP-DM_Process_Diagram.png)

1. Objective 
	- What is the problem you are trying to solve?
2. Importing Data 
	* - Data sources: 
		- Hadoop (HDFS)
		- .CSV
		- .TXT
		- Document-Oriented Database (MongoDB)
		- Wide Column Store (Cassandra)
		- Key-Value Databases (DynamoDB)
		- ...
3. Data Exploration
	* - Data Understanding
		- Exploration some data observations
		- Descritive Data Summarization (mean, moda, median, std - standard deviation, min, max, balanced data classes, ...)
		- Graphic Representation (density, frequency, correlation, ...)
4. Data Preparation
	* - Data Cleaning: detection, removal and adjustment of anomalies contained in the data.
		- Outliers
		- Nan (NULL): missing values
		- Duplicate representations unexpected
	* - Data Wrangling (or Munging): transforming data into a format that makes it easier to work with.
		- Data Partitioning (create training + validation + test data set, ...)
		- Transformations (normalization, standardisation, scaling, binarizing, pivoting, ...)
		- Data Replacement (cutting, splitting, merging, ...)
		- Weighting and Selection (attribute weighting, automatic optimization, ...)
		- Attribute Generation (ID generation, ...)
	* - Feature Engineering: attributes selection to analyze.
		- Brainstorming or testing of features
		- Feature selection
		- Validation of how the features work with your model
		- Improvement of features if needed
		- Return to brainstorming / creation of more features until the work is done
4. Baseline Modeling: contruction "N" models, using Pipeline (automating transformation and prediction tasks), and avaliate.
5. Secundary Modeling: tunning the models.
	* - Parameter estimation: in Python, using grid search with cross validation.
	* - Ensemble modeling:
		- Bagging
		- Boosting
		- Stacking
		- Voting
6. Communicating Results
	* - Storytelling: art of communicate research result with data.
7. Conclusion
8. Resources

* [Some steps for develop in data project](https://github.com/aakashtandel/misc_projects/blob/master/Data%20Science%20Workflow%20Project/Data%20Science%20Workflow.pdf)
