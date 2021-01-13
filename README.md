# HL7 CMS/FHIR Da Vinci Gaps in Care

Resources for use at HL7/CMS FHIR Connectathon, Da Vinci Gaps in Care Track.


* GIC IG:
    
        clone: https://github.com/DBCG/davinci-gic.git

* CQF-Ruler

1. Hosted Sandbox:

        https://gic-sandbox.alphora.com/cqf-ruler-r4/fhir/

2. Docker Container:

        R4
        ```
        docker pull contentgroup/cqf-ruler:gic
        docker run -p 8080:8080 contentgroup/cqf-ruler:gic
        ```
3. Code repository:
        
        https://github.com/DBCG/cqf-ruler/tree/davinci_gic
        clone: https://github.com/DBCG/cqf-ruler.git, switch to davinci_gic branch
        
    
* Postman scripts:

fhir401\docs\postman-collection\Connectathon 26 Da Vinci GIC.postman_collection.json



## Gaps In Care Scenarios

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


## Sessions:
### Gaps In Care Testing

1.   Open the "GIC Testing" folder in the Postman collection
2.   Config/Reset
* If this is the first time running testing, configure the content and data
   * Open the Config folder
   * Run "Post EXM130 Bundle"
   * Expected result: a 201 created response
* If this is not the first time, reset the data
   * Open the Reset folder
   * Run "Reset GIC Procedure"
   * Expected result: a 200 OK response
3.   Run "check-gap"
* Expected result: a Parameters Resource that contains a $care-gaps response, including a Measure report with a Numerator = 0, and Denominator = 1
* This indicates that the patient is in the measure population, but does not meet the criteria of the measure.
4.   Run "post gap data"
* Expected result: a 201 created response
* This indicates that an additional Procedure resource was added.  The additional data meets the criteria of the measure (open gap).
5.   Run "re-check gap"
* Expected result: a Parameters Resource that contains a $care-gaps response, including a Measure report with a Numerator = 1, and Denominator = 1
* This indicates that the patient is in the measure population and meets the criteria of the measure (closed gap).

---
## Technical Info
* Sandbox build: 
1.  Travis build, triggered from GitHub commit:

    https://travis-ci.com/github/DBCG/cqf-ruler/builds - davinci_gic

2.  Jenkins build, triggered manually:

        http://jenkins.alphora.com:8080/job/Sandbox%20Deployments%20(fhir.alphora.com,%20cqm-sandbox,%20etc.)/job/gic-sandbox.alphora.com%20deploy/

3.  CQF Tooling - RefreshIG, triggered manually from the IG, to load the content:

https://github.com/DBCG/davinci-gic/tree/master/fhir4

4. Postman Configuration/Post Bundle, triggered manually from Postman, to load the Organization. 

Note: this is a stopgap.  The Organization should be loaded in step 3.

Postman collection is shared above.
