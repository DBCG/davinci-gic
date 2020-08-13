# HL7 CMS/FHIR CDa Vinci Gaps in Care

### Local Build:
1. Download tooling

   a.  run _updatePublisher

   b.  run _updateRefreshIG

2.  Set local settings

    a.  edit _refresh to point to a local FHIR server

Change `SET fsoption=-fs https://gic-sandbox.alphora.com/cqf-ruler-r4/fhir/`
to   `SET fsoption=-fs http://localhost:8080/cqf-ruler-r4/fhir/`

3.  run _refresh

4. results are posted to the configured FHIR serer and to the bundles folder
