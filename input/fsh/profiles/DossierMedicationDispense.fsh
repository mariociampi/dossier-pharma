Profile: MedicationDispenseItDossierPharma
Parent: MedicationDispense
Id:       MedicationDispense-it-dossierPharma
Title:    "MedicationDispense - Dossier Farmaceutico"
Description: "Profilo MedicationDispense per Dossier Farmaceutico"
//=================================================================

/* === TO DO 
- add vocabulary bindings instead of filtering per coding.system
- 
=== */

* extension contains Recorded named recorded 1..1
* extension[recorded] ^min = 1

* identifier 0..1  
* identifier.system 0..1
* identifier.value 0..1
* identifier ^short = "Identificativo univoco della risorsa"

* ^text.status = #additional
* ^text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><a>Profilazione della MedicationDispense per il Dossier Farmaceutico</a></div>"
* status MS
* status ^short = "Valorizzato con complete"

* medicationCodeableConcept 0..1
* medicationCodeableConcept ^short = "Prodotto farmaceutico erogato"

* medicationCodeableConcept.coding 1.. MS
  * system 1.. MS
  * code 1.. MS
  * display MS
  
* medicationCodeableConcept.coding ^slicing.discriminator.type = #value
* medicationCodeableConcept.coding ^slicing.discriminator.path = "system"
* medicationCodeableConcept.coding ^slicing.ordered = false
* medicationCodeableConcept.coding ^slicing.rules = #open
* medicationCodeableConcept.coding ^short = "Riferimento/i terminologico/i del prodotto farmaceutico erogato"

* medicationCodeableConcept.coding contains
    ATC 0..1 and AIC 0..1 and
    gruppoEquivalenza 0..1  and eccezioni 0..1

* medicationCodeableConcept.coding[ATC] MS
* medicationCodeableConcept.coding[ATC] ^sliceName = "ATC"
// * medicationCodeableConcept.coding[ATC].system 1..
* medicationCodeableConcept.coding[ATC].system = $ATC (exactly)
* medicationCodeableConcept.coding[ATC].system ^short = "CodeSystem ATC"
// * medicationCodeableConcept.coding[ATC].code 1..
// * medicationCodeableConcept.coding[ATC].display 1..

// * medicationCodeableConcept.coding[AIC].system 1..
* medicationCodeableConcept.coding[AIC].system = $AIC (exactly)
* medicationCodeableConcept.coding[ATC].system ^short = "CodeSystem AIC"
// * medicationCodeableConcept.coding[AIC].code 1..
// * medicationCodeableConcept.coding[AIC].display 1..

// * medicationCodeableConcept.coding[gruppoEquivalenza].system 1..
* medicationCodeableConcept.coding[gruppoEquivalenza].system = $gruppo-equivalenza (exactly)
* medicationCodeableConcept.coding[ATC].system ^short = "CodeSystem Gruppo di Equivalenza"
// * medicationCodeableConcept.coding[gruppoEquivalenza].code 1..
// * medicationCodeableConcept.coding[gruppoEquivalenza].display 1..

// * medicationCodeableConcept.coding[eccezioni].system 1..
* medicationCodeableConcept.coding[eccezioni].system = $UNK (exactly)
// * medicationCodeableConcept.coding[eccezioni].code 1..
* medicationCodeableConcept.coding[eccezioni].code = #UNK
// * medicationCodeableConcept.coding[eccezioni].display 1..
* medicationCodeableConcept.text ^short = "Descrizione testuale del farmaco"




* medicationCodeableConcept.text ^short = "Descrizione testuale del farmaco"
* medicationReference only Reference(MedicationRef)
* medicationReference.reference 0..
* medicationReference ^short = "Veicola carrier identifier"
* subject MS
* subject only Reference(PatientItBase)
* subject.type 0..
* subject.type = "Patient" (exactly)
* subject.identifier 1..
* subject.identifier.system 1..
* subject.identifier.system = $CF (exactly)
* subject.identifier.value 1..
* subject.identifier.value ^short = "Codice Fiscale"
* subject.display 0.. 
* subject ^short = "Riferimento al paziente per il quale il prodotto farmaceutico è stato erogato"
* performer 1..
* performer ^slicing.discriminator.type = #type
* performer ^slicing.discriminator.path = "$this"
* performer ^slicing.rules = #open
* performer contains
    CFErogatore 1..1 
	// and    CodiceStrutturaErogatore 1..1 and    ASLErogatore 1..1
* performer[CFErogatore] ^short = "Identificativo dell'erogatore del farmaco"
* performer[CFErogatore].actor.identifier 1..
* performer[CFErogatore].actor.identifier.system 1..
* performer[CFErogatore].actor.identifier.system = $CF (exactly)
* performer[CFErogatore].actor.identifier.value 1..
* performer[CFErogatore].actor.identifier.value ^short = "CF dell'erogatore"
// * performer[CodiceStrutturaErogatore].actor.identifier 1..
// * performer[CodiceStrutturaErogatore].actor.identifier.system 1..
// * performer[CodiceStrutturaErogatore].actor.identifier.system ^short = "urn:oid:2.16.840.1.113883.2.9.2.codISTATazienda/presidio/codFarm"
// * performer[CodiceStrutturaErogatore].actor.identifier.value 1..
// * performer[CodiceStrutturaErogatore].actor.identifier.value ^short = "Codice Struttura dell'erogatore"
// * performer[ASLErogatore].actor.identifier 1..
// * performer[ASLErogatore].actor.identifier.system 1..
// * performer[ASLErogatore].actor.identifier.system = $FLS11 (exactly)
// * performer[ASLErogatore].actor.identifier.value 1..
// * performer[ASLErogatore].actor.identifier.value ^short = "Codice FLS11 dell'erogatore"
* location  only Reference(LocationErogazione) 
* location.reference 0..1
* location.reference ^short = "Riferimento all'ubicazione dell'erogatore"
* quantity 1..
* quantity.value 1..
* quantity.value ^short = "Numero confezioni erogate"
// * whenPrepared 1..
// * whenPrepared ^short = "Data inizio erogazione"
* whenHandedOver 1..
* whenHandedOver ^short = "Data erogazione ricetta"
* substitution.type 1..
* substitution.type.coding 1..
* substitution.type.coding.system 1..
* substitution.type.coding.system = $DIZ_Sostituzione (exactly)
* substitution.type.coding.code 1..
* substitution.reason 1..
* substitution.reason.coding 1..
* substitution.reason.coding.system 1..
* substitution.reason.coding.system ^short = "OID flagErog"
* substitution.reason.coding.code 1..
