# HL7 CMS/FHIR CDa Vinci Gaps in Care

Resources for use at HL7/CMS FHIR Connectathon, Da Vinci Gaps in Care Track.

* [Track Description](https://confluence.hl7.org/display/FHIR/2020-05+Da+Vinci+Gaps+in+Care)
* [Zulip Stream](https://chat.fhir.org/#narrow/stream/179207-connectathon-mgmt/topic/Da.20Vinci.20Gaps.20In.20Care.20Track)

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
        
    
* Postman scripts

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/993bb7029e7d7158948f)

```
Note: the Postman scripts do not include bundles to post.  To post bundles, run the _refresh script in the IG.  By default the script will post to the GIC sandbox, but you can edit it to post to any FHIR server.
```


## Gaps In Care Scenarios

### Cervical Cancer Screening - EXM124

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM124_FHIR4-8.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/measure-EXM124_FHIR4-8.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/valuesets-EXM124_FHIR4-8.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/tests-denom-EXM124_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM124-FHI4
* [Numerator Test Bundle](fhir4/bundles/EXM124_FHIR4-8.2.000/EXM124_FHIR4-8.2.000-files/tests-numer-EXM124_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM124-FHIR4


### Breast Cancer Screening - EXM125

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM125_FHIR4-7.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/measure-EXM125_FHIR4-7.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/valuesets-EXM125_FHIR4-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/tests-denom-EXM125_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM125-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM125_FHIR4-7.2.000/EXM125_FHIR4-7.2.000-files/tests-numer-EXM125_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM125-FHIR4
    


### Colorectal Cancer Screening - EXM130

#### FHIR4

* [Measure CQL](fhir4/input/pagecontent/cql/EXM130_FHIR4-7.2.000.cql)
* [Master Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-bundle.json)  (includes all the Individual bundles)

Individual bundles:
* [Measure Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/measure-EXM130_FHIR4-7.2.000.json)
* [Terminology Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/valuesets-EXM130_FHIR4-7.2.000-bundle.json)
* [Denominator Test Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/tests-denom-EXM130_FHIR4-bundle.json)
    * Denominator Patient ID: denom-EXM130-FHIR4
* [Numerator Test Bundle](fhir4/bundles/EXM130_FHIR4-7.2.000/EXM130_FHIR4-7.2.000-files/tests-numer-EXM130_FHIR4-bundle.json)
    * Numerator Patient ID: numer-EXM130-FHIR4


---
## Technical Info
* Sandbox build: 


        http://jenkins.alphora.com:8080/job/Sandbox%20Deployments%20(fhir.alphora.com,%20cqm-sandbox,%20etc.)/job/gic-sandbox.alphora.com%20deploy/
