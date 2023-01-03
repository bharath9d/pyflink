# pyflink

Use Cases

Self-service : Make data accessible to many people in the company. They can choose how to use it to solve their business problems.

Curated Dashboards : You do not provide access to raw data, but instead work on determining the right data to be used and design sophisticated dashboards intended for decision makers.

Business Decisions

What primary business processes and decisions does your data store support?
What level of granularity is required for these decisions?
What is the impact of data latency on business decisions?
How do you plan to measure success?

User Persona

Which teams, units, or departments inside your organization are they a part of?
What is their level of data analysis and data engineering proficiency?
What tools do they typically use?
Do you need to cater to employees, customers, or partners of the organization?

Data Management

How structured is your data?
How quickly does new data need to be available for querying? 
What is the size of the data to be ingested? 
What is the total volume of data and its growth rate?
What type of analytic queries will run against the data?
 Will it be powering a dashboard with a fixed set of metrics and drill-down? 
Will it participate in large numerical aggregations rolled up by various business dimensions? Or,
 will it be used for diagnostics, leveraging string tokenization for full-text searching and pattern analysis?

Access Patterns and Data retention

How often do key users and personas run their reports, queries, or models?
What is their expectation for data freshness?
What is their expectation of data granularity?
What portion of data is most frequently accessed for analysis?
How long do you intend to retain data for analysis?
At what point can data age out of the data lake environment?

Compliance requirements

What compliance requirements does your business have?
Are you subject to data locality, data privacy, or data redaction requirements?
Who is authorized to see which records and which attributes in the dataset?
How will you enforce the deletion of records on request?
Where can you store data, for example, local to geolocation, county, or global?
