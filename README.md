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
        docker pull contentgroup/cqf-ruler
        docker run -p 8080:8080 contentgroup/cqf-ruler
        ```
3. Code repository:
        
        https://github.com/DBCG/cqf-ruler/tree/davinci_gic
        clone: https://github.com/DBCG/cqf-ruler.git, switch to davinci_gic branch
        
    
* Postman scripts

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/993bb7029e7d7158948f)


---
## Technical Info
* Sandbox build: 


        http://jenkins.alphora.com:8080/job/Sandbox%20Deployments%20(fhir.alphora.com,%20cqm-sandbox,%20etc.)/job/gic-sandbox.alphora.com%20deploy/
