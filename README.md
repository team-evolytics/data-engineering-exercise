# Data Engineering Exercise

### Instructions

1. Fork repository
1. Complete exercise
1. Commit updated SQL
1. Create pull request
1. Email pull request to data-engineering-exercise@evolytics.com

### Purpose

Here at Evolytics, we often receive requests to help optimize SQL. While the original SQL generates the proper output, the performance requires additional resources to execute, and the readability makes updating and maintaining the code difficult to understand.

This data engineering exercise focuses on the ability to identify sub-optimal and poorly written SQL, and then refactor to improve performance and readability. The exercise is entirely query based, so we are not looking for solutions that incorporate stored procedures, user defined functions, or external programming.

Any query based solutions meeting the following objectives will be considered in scope for this exercise.

### Objective

Refactor the SQL with the following criteria in mind

1. Optimized query plan
1. Enhanced code readability
1. Easier code maintenance

### Final Output

The final output of this exercise will be an updated SQL file, which returns the exact same dataset as produced by the original SQL.

### Environment

This exercise was written and tested using MySQL on Mac with default install locations. All necessary code and instructions to reproduce environment are provided below. You are welcome to follow as is, or use any other database platform that you are comfortable with. Keep in mind that if choosing a different platform, it may be necessary to modify the environment instructions as well as the original SQL, to be in line with platform specific keywords and syntax.

All steps executed on macOS Mojave

1. Download and install [MySQL](https://dev.mysql.com/downloads/mysql/). We tested using version 8.0.11

1. Create or add entries to /etc/my.cnf so load data infile command will read from directory

        sudo nano /etc/my.cnf

        [mysqld]
        secure_file_priv=/add_your_path_here

1. Create or add entries to /etc/my.cnf so MySQL is in the PATH variable

        nano ~/.bash_profile

        export PATH="/usr/local/mysql/bin:${PATH}"

1. Restart MySQL from system preferences so changes take affect
1. Execute the following lines of code to create and populate database. Modify the infile directory based on the secure_file_priv set in /etc/my.cnf file.

        create database evolytics;

        create table evolytics.exercise (visitor_id bigint, visit_num int, visit_start_timestamp datetime, hit_timestamp datetime, transaction_type varchar(6), transaction_action varchar(21));

        load data infile '/add_your_path_here/exercise.tsv' into table evolytics.exercise fields terminated by '\t' ignore 1 rows;

1. Execute original SQL to generate dataset. Begin refactoring exercise.
