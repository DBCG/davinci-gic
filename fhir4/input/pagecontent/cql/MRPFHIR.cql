library MRPFHIR version '1.0.000'

/*
Medication reconciliation postdischarge (MRP)
*/

using FHIR version '4.0.0'

include FHIRHelpers version '4.0.0' called FHIRHelpers
include NCQACommonLogic version '3.10.000' called Common
include ParticipationLogic version '1.0.0' called Participation

// Prescribing Practitioner, Clinical Pharmacist or Registered Nurse
// http://hl7.org/fhir/v2/0360/2.7/index.html { CANP, CNP, CNM, CNS, CRN, DO, MD, NP, PharmD, RN, RPH, PA, FPNP, PN }
valueset "Valid Medication Reconciliation Performer Qualifications": 'http://ncqa.org/fhir/hedis/ValueSet/hedis-med-rec-practitioner'
valueset "Medication Reconciliation Value Set": 'http://ncqa.org/fhir/hedis/ValueSet/hedismedrecvalueset' // HEDIS IG

parameter "Measurement Period" default Interval[@2019-01-01T00:00, @2020-01-01T00:00)

context Patient

define "Encounters Ending Before December 2nd":
  [Encounter: Common."Encounter Inpatient"] E1
    where E1.status ~ 'finished'
     and E1.period ends during Interval[start of "Measurement Period", end of "Measurement Period" - 30 days]

define "Encounters in Measurement Period":
  [Encounter: Common."Encounter Inpatient"] E2
    where E2.status ~ 'finished'
     and E2.period ends during Interval[start of "Measurement Period", end of "Measurement Period"]

define "Encounters without 30 Day Readmission":
	"Encounters Ending Before December 2nd" E1
    where not exists(
      "Encounters in Measurement Period" E2
        where difference in days between end of E1.period and start of E2.period < 30
        and end of E1.period < start of E2.period
    )

define "Initial Population":
  "Encounters without 30 Day Readmission" E
    where AgeInYearsAt(end of "Measurement Period") >= 18
    /* and Participation."Is Enrolled"(Participation."Medicare Product",
		  end of E.period + 30 days, Interval[start of E.period, end of E.period + 30 days], 0) */
		and not Common."Has Hospice"

define Denominator:
  "Initial Population"

define Practitioners:
  [Practitioner] P
    where P.active //This indicates the practitioner record was not created in error
      and exists (P.qualification Q where Q.code in "Valid Medication Reconciliation Performer Qualifications") //Practitioner is qualified to reconcile medications

//note: consider adding the following additional values
define Tasks:
  [Task: "Medication Reconciliation Value Set"] T
    where T.intent in { 'original-order', 'order' }
      and T.status in { 'accepted', 'completed' }
      and exists (Practitioners P where EndsWith(T.owner.reference, P.id))

define Observations:
  [Observation:  "Medication Reconciliation Value Set"] O
    with Practitioners P
    such that O.status in { 'final', 'amended', 'corrected' }
      and exists (O.performer OP where EndsWith(OP.reference, P.id))

//note: consider requiring that the med rec occured on the subsequent visit
define Numerator:
  "Encounters without 30 Day Readmission" E
   where exists (Tasks T where T.executionPeriod during Interval[E.period."end", E.period."end" + 30 days])
     or exists (Observations O where O.effective as dateTime during Interval[E.period."end", E.period."end" + 30 days])

define "Denominator Exclusion": false
