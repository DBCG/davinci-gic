# HL7 CMS/FHIR Da Vinci Gaps in Care

Resources for use at HL7/CMS FHIR Connectathon, Da Vinci Gaps in Care Track.


* GIC IG:
    
        clone: https://github.com/DBCG/davinci-gic.git

* CQF-Ruler

1. Hosted Sandbox:

        http://gic-sandbox.alphora.com/cqf-ruler-r4/fhir/
        This testing instance is subject to change throughout the event.

2. Docker Container:

        R4
        ```
        docker pull contentgroup/cqf-ruler
        docker run -p 8080:8080 contentgroup/cqf-ruler
        ```
3. Code repository:
        
        https://github.com/DBCG/cqf-ruler/tree/master
        clone: https://github.com/DBCG/cqf-ruler.git, master branch
        
   
## Gaps In Care Scenarios
These testing materials are subject to change throughout the event.

### Cervical Cancer Screening - EXM124

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM124-8.2.000.cql)
* [Master Bundle](fhir401/bundles/EXM124-8.2.000/EXM124-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM124-8.2.000/EXM124-8.2.000-files/measure-EXM124-8.2.000.json)
* [Terminology Bundle](fhir401/bundles/EXM124-8.2.000/EXM124-8.2.000-files/valuesets-EXM124-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM124-8.2.000/EXM124-8.2.000-files/tests-denom-EXM124-bundle.json)
    * Denominator Patient ID: denom-EXM124
* [Numerator Test Bundle](fhir401/bundles/EXM124-8.2.000/EXM124-8.2.000-files/tests-numer-EXM124-bundle.json)
    * Numerator Patient ID: numer-EXM124



### Breast Cancer Screening - EXM125

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM125-7.3.000.cql)
* [Master Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/measure-EXM125-7.3.000.json)
* [Terminology Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/valuesets-EXM125-7.3.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/tests-denom-EXM125-bundle.json)
    * Denominator Patient ID: denom-EXM125
* [Numerator Test Bundle](fhir401/bundles/EXM125-7.3.000/EXM125-7.3.000-files/tests-numer-EXM125-bundle.json)
    * Numerator Patient ID: numer-EXM125
    


### Colorectal Cancer Screening - EXM130

#### FHIR401

* [Measure CQL](fhir401/input/pagecontent/cql/EXM130-7.3.000.cql)
* [Master Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/measure-EXM130-7.3.000.json)
* [Terminology Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/valuesets-EXM130-7.3.000-bundle.json)
* [Denominator Test Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/tests-denom-EXM130-bundle.json)
    * Denominator Patient ID: denom-EXM130
* [Numerator Test Bundle](fhir401/bundles/EXM130-7.3.000/EXM130-7.3.000-files/tests-numer-EXM130-bundle.json)
    * Numerator Patient ID: numer-EXM130


## Sessions

### Postman scripts:

A Postman collection containing all the content required for the Sessions can be downloaded from: https://github.com/DBCG/davinci-gic/blob/master/fhir401/docs/postman-collection/HL7%20Da%20Vinci%20GIC%20Connectathon%2026.postman_collection.json

These testing materials are subject to change throughout the event.

### Gaps In Care Demo

 * Open the "GIC Demo" folder in the Postman collection
 
#### Examples
1. Open the "Examples" folder in the "GIC Demo" folder
2. Config/Reset
    * If this is the first time running testing, configure the content and data
        * Run each request in the folder
            * Expected result: a 200 OK response
            * This indicates that the content has been posted to the server.   
    * If this is not the first time, reset the data
        * Open the Reset folder
            * Run "Reset GIC Procedure"
            * Expected result: a 200 OK response
3. For each of the subfolders, open the sub folder
    * Run "measure-numer"
        * Expected result: a MeasureReport, with a measureScore of 1.0
        * This indicates that the patient is in the measure population and meets the criteria of the measure (note, this is not a Care Gaps Report).
    * Run "open-gap"
        * Expected result: a Parameters Resource that contains a $care-gaps response, including a Measure report with a Numerator = 0, and Denominator = 1
        * This indicates that the patient is in the measure population, but does not meet the criteria of the measure.
    * Run "closed-gap"
        * Expected result: a Parameters Resource that contains a $care-gaps response, including a Measure report with a Numerator = 1, and Denominator = 1
        * This indicates that the patient is in the measure population and meets the criteria of the measure (closed gap).
      
#### Close Open Gap
1. Open the "Close Open Gap" folder in the "GIC Demo" folder
2. Config/Reset
    * If this is the first time running testing, configure the content and data
        * Open the Config folder
            * Run "Post EXM130 Bundle"
            * Expected result: a 201 created response
    * If this is not the first time, reset the data
        * Open the Reset folder
            * Run "Reset GIC Procedure"
            * Expected result: a 200 OK response
3. Run "Open Gap"
    * Expected result: a Parameters Resource that contains a $care-gaps response, including a Measure report with a Numerator = 0, and Denominator = 1
    * This indicates that the patient is in the measure population, but does not meet the criteria of the measure.
4.  Run "Close Gap"
    * Expected result: a 201 created response
    * This indicates that an additional Procedure resource was added.  The additional data meets the criteria of the measure (open gap).
5. Run "Closed Gap"
    * Expected result: a Parameters Resource that contains a $care-gaps response, including a Measure report with a Numerator = 1, and Denominator = 1
    * This indicates that the patient is in the measure population and meets the criteria of the measure (closed gap).
   
### Gaps In Care Testing

1. Open the "GIC Testing" folder in the Postman collection
2. Config (one time setup)
    * Run each request in the folder
        * Expected result: a 200 OK response
        * This indicates that the content has been posted to the server. 
3. Test 
    * Copy the Template request and name it the Scenario name from Connectathon Manager.
4. Parameters
    * On the Params tab of Postman
    * Check the Params applicable to your test and enter the desired Value(s).
5. Send request from Postman and check result for expected result
5. Connection Manager - Track Details and testing - edit Da Vinci DEQM Gaps in Care
    * Description tab, edit the Scenario, Links tab
        * Click + to add link
        * Copy the GET address from Postman into Link, prefix with: http://gic-sandbox.alphora.com/cqf-ruler-r4/fhir/
        * Name "Reference Implementation"
    * Add and Update 
    * Testing and feedback tab
        * Select the Scenario - add new result
        * Select Da Vinci Gaps in Care RI for the Server

### Gaps In Care Member Attribution

1. Open the "Member Attribution" folder in the Postman collection
2. Config
    * Run "Post EXM124 Bundle"
        * Expected result: a 200 OK response
        * This indicates that the content has been posted to the server.
    * Run "Post Member Attribution Bundle"
        * Expected result: a 200 OK response
        * This indicates that the precoordinated member attribution data has been posted to the server.
3. Run "subject-group-attribution"
    * Expected result: a Parameters Resource that contains a $care-gaps response, including 6 MeasureReports for the patients in the attribution group
    * This indicates that the $care-gaps operation was invoked using the pre-coordinated group as the subject
   
---
## Technical Info
* Sandbox build: 
1.  Travis build, triggered from GitHub commit:

    https://travis-ci.com/github/DBCG/cqf-ruler/builds - master

2.  Jenkins build, triggered manually:

        http://jenkins.alphora.com:8080/job/Sandbox%20Deployments%20(fhir.alphora.com,%20cqm-sandbox,%20etc.)/job/gic-sandbox.alphora.com%20deploy/

3.  CQF Tooling - RefreshIG, triggered manually from the IG, to load the content:

https://github.com/DBCG/davinci-gic/tree/master/fhir4

4. Postman Configuration/Post Bundle, triggered manually from Postman, to load the Organization. 

Note: this is a stopgap.  The Organization should be loaded in step 3.

Postman collection is shared above.
