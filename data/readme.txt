Test Case - File Change Data Set

# Details of the data set
- build ID: 	The unique build id in the travis CI.
- commit: 	The commit(s) trigger the build.
- prev commit: 	The previous commit from the current commit.
- time:		The time of the current build.
- file change:	The files changed in the current commit.
- is test run: 	Whether test cases are run in the current build.
- tests: 	Tests failed in the current build, if tests are run.

# How these features come from
- build ID: 	The unique build id extracted from the TravisTorrent data set.
- commit: 	The commit(s) trigger the build, which extracted from the TravisTorrent data set as well.
- prev commit:	Extracted from the Github.com (https://github.com/<project name>/<project owner>/commit/<commit number> by using the BeautifulSoup4 package.
- time: 	The time of the current build, which extracted from the TravisTorrent data set as well.
- file change: 	Same as prev commit, extracted from the Github.com (https://github.com/<project name>/<project owner>/commit/<commit number> by using the BeautifulSoup4 package.
- is test run: 	Whether tests are run, which extracted from the TravisTorrent data set.
- tests: 	Tests failed in the current build, which extracted from the TravisTorrent data set.

Information from the TravisTorrent data set are extracted by the code "extract_project.R"
Information from the Github.com are extracted by the code "Data collection and cleaning.ipynb"

# Ways have tried before
- Between any two consecutive builds, we record which test(s) turn to opposite status (P->F or F->P) after what file(s) changed. In a table, which column is file's name and row is test cases, we count how many times a test turns to opposite status by a change of the specific file. In the testing phase, the test case which has larger count will be assigned first.

- By using the Time Weighted Risk formula, we predict the defect score of each file. Then based on the table above, we assign higher priority to test cases that highly related to the file which has high defect score.