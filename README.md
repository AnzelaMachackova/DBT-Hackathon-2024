# Designing a Generic Test for Data Contract Validation
In the fast-paced world of data analytics, maintaining data integrity and consistency across various stages of data processing is crucial. This was the challenge our team tackled at the recent Hackathon, focusing on the development and implementation of a testing mechanism for data contracts using dbt (data build tool). **Our team goal was to ensure that the data exchanged between providers and consumers adheres to agreed-upon standards, encapsulated in a data contract.** 

## Description and Objective
The central theme of our project was the creation of a generic test to validate input data, ensuring compliance with a data contract. A data contract is a critical document defining the structure, format, semantics, quality, and usage conditions for data exchange between data providers and consumers. Our task was to design a parametrized test or macro that could be used to verify the Layer 0 (L0) data warehouse layer for each table, configured centrally for all tables within a single domain.

### Contract structure: 
<img width="1200" alt="contract_structure" src="https://github.com/AnzelaMachackova/DBT-Hackathon-2024/assets/92174501/12d9eba9-dbf3-4462-8418-0a02cf4884e1">


## Implementation
Our implementation involved scripting a solution ([supertest macro](https://github.com/AnzelaMachackova/DBT-Hackathon-2024/blob/main/macros/supertest.sql)) that, upon execution, retrieves data for a given table from the contract archive, scans its content, and conducts predefined tests based on the columns as per the data contract. 
### The results are then validated and logged into a LOG_TABLE:
<img width="880" alt="log_table" src="https://github.com/AnzelaMachackova/DBT-Hackathon-2024/assets/92174501/6a2c1714-2eeb-4656-b1de-5fbfc1939ef9">


While functional, the script currently struggles with proper validation; it has been tested on null values, but comparisons with expected values are erroneous, likely due to mismatched data formats. Furthermore, we outlined 11 types of tests, which are yet to be fully defined. There is a need for precise definition of expected versus actual test results for effective validation. Although the code currently exists as a macro, it is intended to evolve into a dbt test model for more streamlined and scalable execution.

## Challenges and Next Steps
The project, while in its initial stages, highlights several areas for improvement:

- Refinement of data format handling to ensure accurate test result comparisons.
- Complete definition and implementation of the 11 proposed test types.
- Transition from macro implementation to dbt test models for enhanced automation and integration.
- Code refactoring and implement improvements and optimizations.

## Conclusion
Our journey at the hackathon has set the foundation for a sophisticated data validation framework using dbt, which will significantly improve data reliability and trustworthiness in real-world applications. Moving forward, refining these tests and fully integrating them into dbt will allow organizations to enforce data contracts more effectively, ensuring that data quality is never compromised.

Thanks Kristína and [Karel](https://github.com/999999333) for their cooperation and amazing teamwork.
