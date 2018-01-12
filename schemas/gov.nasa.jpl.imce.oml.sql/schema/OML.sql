--
-- Copyright 2016 California Institute of Technology ("Caltech").
-- U.S. Government sponsorship acknowledged.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- License Terms
--

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema OML
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `OML` DEFAULT CHARACTER SET utf8 ;
USE `OML` ;

-- Summary of abstract table names
-- 
-- BinSegFwdPropP       BinarySegmentForwardPropertyPredicates
-- BinSegPropP          BinarySegmentPropertyPredicates
-- BinSegRevPropP       BinarySegmentReversePropertyPredicates
-- CRBK                 CrossReferencableKinds
-- CRTK                 CrossReferencabilityKinds
-- CTreeDsju            ConceptTreeDisjunctions
-- CualESI              ConceptualEntitySingletonInstances
-- CualEs               ConceptualEntities
-- DBoxRels             DescriptionBoxRelationships
-- DRelDomains          DataRelationshipDomains
-- DRelFromEs           DataRelationshipFromEntities
-- DRelFromSts          DataRelationshipFromStructures
-- DRelRanges           DataRelationshipRanges
-- DRelToScs            DataRelationshipToScalars
-- DRelToSts            DataRelationshipToStructures
-- DRels                DataRelationships
-- DirBinRelKinds       DirectedBinaryRelationshipKinds
-- Drs                  DataRanges
-- DsjUOfCsAx           DisjointUnionOfConceptsAxioms
-- Dt                   Datatypes
-- EExRAx               EntityExistentialRestrictionAxioms
-- EIdK                 ExtrinsicIdentityKinds
-- ERAx                 EntityRestrictionAxioms
-- EReifiedRAx          EntityReifiedRestrictionAxioms
-- ERels                EntityRelationships
-- EScPRAx              EntityScalarDataPropertyRestrictionAxioms
-- EStPRAx              EntityStructuredDataPropertyRestrictionAxioms
-- EUnreifiedRAx        EntityUnreifiedRestrictionAxioms
-- EUxRAx               EntityUniversalRestrictionAxioms
-- EltCRefTs            ElementCrossReferenceTuples
-- Es                   Entities
-- IIdK                 IntrinsicIdentityKinds
-- Ik                   IdentityKinds
-- LogEs                LogicalElements
-- ModEdges             ModuleEdges
-- ModElts              ModuleElements
-- Mods                 Modules
-- NonCRBK              NonCrossReferencableKinds
-- NonLogEs             NonLogicalElements
-- RStPCtxts            RestrictionStructuredDataPropertyContexts
-- Ress                 Resources
-- RestDrs              RestrictedDataRanges
-- Rules                Rules
-- S1IStPCtxts          SingletonInstanceStructuredDataPropertyContexts
-- SegP                 SegmentPredicates
-- SpeAx                SpecializationAxioms
-- TBox                 TerminologyBoxes
-- TBoxAx               TerminologyBoxAxioms
-- TBoxSt               TerminologyBoxStatements
-- TermAx               TermAxioms
-- Terms                Terms
-- TlgyAx               TerminologyAxioms
-- TlgyBdlAx            TerminologyBundleAxioms
-- TlgyBdlSt            TerminologyBundleStatements
-- TlgyIAsts            TerminologyInstanceAssertions
-- UrySegP              UnarySegmentPredicates
-- UryTermKinds         UnaryTermKinds
-- ValCRefTs            ValueCrossReferenceTuples
		
-- Summary of concrete table names
-- 
-- AnnotPropVals        AnnotationPropertyValues
-- AnnotProps           AnnotationProperties
-- AnonymousCUnionAx    AnonymousConceptUnionAxioms
-- AspectP              AspectPredicates
-- AspectSpeAx          AspectSpecializationAxioms
-- Aspects              Aspects
-- BdldTlgyAx           BundledTerminologyAxioms
-- Bdls                 Bundles
-- BinScRs              BinaryScalarRestrictions
-- CDesTlgyAx           ConceptDesignationTerminologyAxioms
-- CIs                  ConceptInstances
-- CP                   ConceptPredicates
-- CSpeAx               ConceptSpecializationAxioms
-- ChainRules           ChainRules
-- Cs                   Concepts
-- DBoxExtCWDef         DescriptionBoxExtendsClosedWorldDefinitions
-- DBoxRfns             DescriptionBoxRefinements
-- DBoxes               DescriptionBoxes
-- EExFwdReifiedRAx     EntityExistentialForwardReifiedRestrictionAxioms
-- EExInvReifiedRAx     EntityExistentialInverseReifiedRestrictionAxioms
-- EExUnreifiedRAx      EntityExistentialUnreifiedRestrictionAxioms
-- EScPExRAx            EntityScalarDataPropertyExistentialRestrictionAxioms
-- EScPPtrRAx           EntityScalarDataPropertyParticularRestrictionAxioms
-- EScPUxRAx            EntityScalarDataPropertyUniversalRestrictionAxioms
-- EScPs                EntityScalarDataProperties
-- EStPPtrRAx           EntityStructuredDataPropertyParticularRestrictionAxioms
-- EStPs                EntityStructuredDataProperties
-- EUxFwdReifiedRAx     EntityUniversalForwardReifiedRestrictionAxioms
-- EUxInvReifiedRAx     EntityUniversalInverseReifiedRestrictionAxioms
-- EUxUnreifiedRAx      EntityUniversalUnreifiedRestrictionAxioms
-- IRIScRs              IRIScalarRestrictions
-- NumericScRs          NumericScalarRestrictions
-- PlainLitScRs         PlainLiteralScalarRestrictions
-- RRIDomains           ReifiedRelationshipInstanceDomains
-- RRIRanges            ReifiedRelationshipInstanceRanges
-- RRInvPropP           ReifiedRelationshipInversePropertyPredicates
-- RRIs                 ReifiedRelationshipInstances
-- RRP                  ReifiedRelationshipPredicates
-- RRPropP              ReifiedRelationshipPropertyPredicates
-- RRSpeAx              ReifiedRelationshipSpecializationAxioms
-- RRSrcInvPropP        ReifiedRelationshipSourceInversePropertyPredicates
-- RRSrcPropP           ReifiedRelationshipSourcePropertyPredicates
-- RRTgtInvPropP        ReifiedRelationshipTargetInversePropertyPredicates
-- RRTgtPropP           ReifiedRelationshipTargetPropertyPredicates
-- RRs                  ReifiedRelationships
-- RScPVals             RestrictionScalarDataPropertyValues
-- RStPTs               RestrictionStructuredDataPropertyTuples
-- RootCTaxonomyAx      RootConceptTaxonomyAxioms
-- RuleBodySegs         RuleBodySegments
-- S1IScPVals           SingletonInstanceScalarDataPropertyValues
-- S1IStPVals           SingletonInstanceStructuredDataPropertyValues
-- ScOneOfLitAx         ScalarOneOfLiteralAxioms
-- ScOneOfRs            ScalarOneOfRestrictions
-- ScPVals              ScalarDataPropertyValues
-- ScPs                 ScalarDataProperties
-- Scs                  Scalars
-- SpeDsjtCAx           SpecificDisjointConceptAxioms
-- StPTs                StructuredDataPropertyTuples
-- StPs                 StructuredDataProperties
-- StringScRs           StringScalarRestrictions
-- Sts                  Structures
-- SubDataPropOfAx      SubDataPropertyOfAxioms
-- SubObjectPropOfAx    SubObjectPropertyOfAxioms
-- SynonymScRs          SynonymScalarRestrictions
-- TimeScRs             TimeScalarRestrictions
-- TlgyExtensionAx      TerminologyExtensionAxioms
-- TlgyGraphs           TerminologyGraphs
-- TlgyNestingAx        TerminologyNestingAxioms
-- URITs                UnreifiedRelationshipInstanceTuples
-- URInvPropP           UnreifiedRelationshipInversePropertyPredicates
-- URPropP              UnreifiedRelationshipPropertyPredicates
-- URs                  UnreifiedRelationships

-- -----------------------------------------------------
-- Table `OML`.`BinSegFwdPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`BinSegFwdPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table BinarySegmentForwardPropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`BinSegPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`BinSegPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table BinarySegmentPropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`BinSegRevPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`BinSegRevPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table BinarySegmentReversePropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`CTreeDsju`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CTreeDsju` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ConceptTreeDisjunctions';

-- -----------------------------------------------------
-- Table `OML`.`CualEs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CualEs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ConceptualEntities';

-- -----------------------------------------------------
-- Table `OML`.`CualESI`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CualESI` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ConceptualEntitySingletonInstances';

-- -----------------------------------------------------
-- Table `OML`.`CRTK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CRTK` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table CrossReferencabilityKinds';

-- -----------------------------------------------------
-- Table `OML`.`CRBK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CRBK` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table CrossReferencableKinds';

-- -----------------------------------------------------
-- Table `OML`.`Drs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Drs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRanges';

-- -----------------------------------------------------
-- Table `OML`.`DRels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DRels` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRelationships';

-- -----------------------------------------------------
-- Table `OML`.`DRelDomains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DRelDomains` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRelationshipDomains';

-- -----------------------------------------------------
-- Table `OML`.`DRelFromEs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DRelFromEs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRelationshipFromEntities';

-- -----------------------------------------------------
-- Table `OML`.`DRelFromSts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DRelFromSts` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRelationshipFromStructures';

-- -----------------------------------------------------
-- Table `OML`.`DRelRanges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DRelRanges` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRelationshipRanges';

-- -----------------------------------------------------
-- Table `OML`.`DRelToScs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DRelToScs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRelationshipToScalars';

-- -----------------------------------------------------
-- Table `OML`.`DRelToSts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DRelToSts` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DataRelationshipToStructures';

-- -----------------------------------------------------
-- Table `OML`.`Dt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Dt` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table Datatypes';

-- -----------------------------------------------------
-- Table `OML`.`DBoxRels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DBoxRels` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DescriptionBoxRelationships';

-- -----------------------------------------------------
-- Table `OML`.`DirBinRelKinds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DirBinRelKinds` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DirectedBinaryRelationshipKinds';

-- -----------------------------------------------------
-- Table `OML`.`DsjUOfCsAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DsjUOfCsAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table DisjointUnionOfConceptsAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EltCRefTs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EltCRefTs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ElementCrossReferenceTuples';

-- -----------------------------------------------------
-- Table `OML`.`Es`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Es` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table Entities';

-- -----------------------------------------------------
-- Table `OML`.`EExRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EExRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityExistentialRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EReifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EReifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityReifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`ERels`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ERels` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityRelationships';

-- -----------------------------------------------------
-- Table `OML`.`ERAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ERAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EScPRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EScPRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityScalarDataPropertyRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EStPRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EStPRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityStructuredDataPropertyRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EUxRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EUxRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityUniversalRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EUnreifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EUnreifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table EntityUnreifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EIdK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EIdK` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ExtrinsicIdentityKinds';

-- -----------------------------------------------------
-- Table `OML`.`Ik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Ik` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table IdentityKinds';

-- -----------------------------------------------------
-- Table `OML`.`IIdK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`IIdK` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table IntrinsicIdentityKinds';

-- -----------------------------------------------------
-- Table `OML`.`LogEs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`LogEs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table LogicalElements';

-- -----------------------------------------------------
-- Table `OML`.`Mods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Mods` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table Modules';

-- -----------------------------------------------------
-- Table `OML`.`ModEdges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ModEdges` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ModuleEdges';

-- -----------------------------------------------------
-- Table `OML`.`ModElts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ModElts` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ModuleElements';

-- -----------------------------------------------------
-- Table `OML`.`NonCRBK`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`NonCRBK` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table NonCrossReferencableKinds';

-- -----------------------------------------------------
-- Table `OML`.`NonLogEs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`NonLogEs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table NonLogicalElements';

-- -----------------------------------------------------
-- Table `OML`.`Ress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Ress` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table Resources';

-- -----------------------------------------------------
-- Table `OML`.`RestDrs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RestDrs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table RestrictedDataRanges';

-- -----------------------------------------------------
-- Table `OML`.`RStPCtxts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RStPCtxts` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table RestrictionStructuredDataPropertyContexts';

-- -----------------------------------------------------
-- Table `OML`.`Rules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Rules` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table Rules';

-- -----------------------------------------------------
-- Table `OML`.`SegP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`SegP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table SegmentPredicates';

-- -----------------------------------------------------
-- Table `OML`.`S1IStPCtxts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`S1IStPCtxts` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table SingletonInstanceStructuredDataPropertyContexts';

-- -----------------------------------------------------
-- Table `OML`.`SpeAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`SpeAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table SpecializationAxioms';

-- -----------------------------------------------------
-- Table `OML`.`Terms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Terms` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table Terms';

-- -----------------------------------------------------
-- Table `OML`.`TermAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TermAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TermAxioms';

-- -----------------------------------------------------
-- Table `OML`.`TlgyAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TlgyAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TerminologyAxioms';

-- -----------------------------------------------------
-- Table `OML`.`TBox`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TBox` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TerminologyBoxes';

-- -----------------------------------------------------
-- Table `OML`.`TBoxAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TBoxAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TerminologyBoxAxioms';

-- -----------------------------------------------------
-- Table `OML`.`TBoxSt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TBoxSt` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TerminologyBoxStatements';

-- -----------------------------------------------------
-- Table `OML`.`TlgyBdlAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TlgyBdlAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TerminologyBundleAxioms';

-- -----------------------------------------------------
-- Table `OML`.`TlgyBdlSt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TlgyBdlSt` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TerminologyBundleStatements';

-- -----------------------------------------------------
-- Table `OML`.`TlgyIAsts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TlgyIAsts` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table TerminologyInstanceAssertions';

-- -----------------------------------------------------
-- Table `OML`.`UrySegP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`UrySegP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table UnarySegmentPredicates';

-- -----------------------------------------------------
-- Table `OML`.`UryTermKinds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`UryTermKinds` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table UnaryTermKinds';

-- -----------------------------------------------------
-- Table `OML`.`ValCRefTs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ValCRefTs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,		  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Abstract Classification Table ValueCrossReferenceTuples';


-- -----------------------------------------------------
-- Table `OML`.`TlgyGraphs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TlgyGraphs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `kind` INT NOT NULL COMMENT 'TerminologyKind',
  `iri` TEXT NOT NULL COMMENT 'IRI',
  
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table TerminologyGraphs';

-- -----------------------------------------------------
-- Table `OML`.`Bdls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Bdls` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `kind` INT NOT NULL COMMENT 'TerminologyKind',
  `iri` TEXT NOT NULL COMMENT 'IRI',
  
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table Bundles';

-- -----------------------------------------------------
-- Table `OML`.`DBoxes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DBoxes` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `kind` INT NOT NULL COMMENT 'DescriptionKind',
  `iri` TEXT NOT NULL COMMENT 'IRI',
  
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table DescriptionBoxes';

-- -----------------------------------------------------
-- Table `OML`.`AnnotProps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`AnnotProps` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `moduleUUID` CHAR(36) NOT NULL COMMENT 'Mods (Module)',
  `iri` TEXT NOT NULL COMMENT 'IRI',
  `abbrevIRI` TEXT NOT NULL COMMENT 'AbbrevIRI',
  
  CONSTRAINT `fk_AnnotProps_moduleUUID`
    FOREIGN KEY (`moduleUUID`)
    REFERENCES `OML`.`Mods`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table AnnotationProperties';

-- -----------------------------------------------------
-- Table `OML`.`Aspects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Aspects` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_Aspects_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table Aspects';

-- -----------------------------------------------------
-- Table `OML`.`Cs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Cs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_Cs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table Concepts';

-- -----------------------------------------------------
-- Table `OML`.`Scs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Scs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_Scs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table Scalars';

-- -----------------------------------------------------
-- Table `OML`.`Sts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`Sts` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_Sts_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table Structures';

-- -----------------------------------------------------
-- Table `OML`.`CDesTlgyAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CDesTlgyAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `designatedConceptUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  `designatedTerminologyIRI` TEXT NOT NULL COMMENT 'TBox (TerminologyBox)',
  
  CONSTRAINT `fk_CDesTlgyAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_CDesTlgyAx_designatedConceptUUID`
    FOREIGN KEY (`designatedConceptUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ConceptDesignationTerminologyAxioms';

-- -----------------------------------------------------
-- Table `OML`.`TlgyExtensionAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TlgyExtensionAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `extendedTerminologyIRI` TEXT NOT NULL COMMENT 'TBox (TerminologyBox)',
  
  CONSTRAINT `fk_TlgyExtensionAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table TerminologyExtensionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`TlgyNestingAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TlgyNestingAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `nestingContextUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  `nestingTerminologyIRI` TEXT NOT NULL COMMENT 'TBox (TerminologyBox)',
  
  CONSTRAINT `fk_TlgyNestingAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_TlgyNestingAx_nestingContextUUID`
    FOREIGN KEY (`nestingContextUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table TerminologyNestingAxioms';

-- -----------------------------------------------------
-- Table `OML`.`BdldTlgyAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`BdldTlgyAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bundleUUID` CHAR(36) NOT NULL COMMENT 'Bdls (Bundle)',
  `bundledTerminologyIRI` TEXT NOT NULL COMMENT 'TBox (TerminologyBox)',
  
  CONSTRAINT `fk_BdldTlgyAx_bundleUUID`
    FOREIGN KEY (`bundleUUID`)
    REFERENCES `OML`.`Bdls`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table BundledTerminologyAxioms';

-- -----------------------------------------------------
-- Table `OML`.`DBoxExtCWDef`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DBoxExtCWDef` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `closedWorldDefinitionsIRI` TEXT NOT NULL COMMENT 'TBox (TerminologyBox)',
  
  CONSTRAINT `fk_DBoxExtCWDef_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table DescriptionBoxExtendsClosedWorldDefinitions';

-- -----------------------------------------------------
-- Table `OML`.`DBoxRfns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`DBoxRfns` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `refiningDescriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `refinedDescriptionBoxIRI` TEXT NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  
  CONSTRAINT `fk_DBoxRfns_refiningDescriptionBoxUUID`
    FOREIGN KEY (`refiningDescriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table DescriptionBoxRefinements';

-- -----------------------------------------------------
-- Table `OML`.`BinScRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`BinScRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `length` TEXT COMMENT 'PositiveIntegerLiteral',
  `minLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `maxLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_BinScRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_BinScRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table BinaryScalarRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`IRIScRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`IRIScRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `length` TEXT COMMENT 'PositiveIntegerLiteral',
  `minLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `maxLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  `pattern` TEXT COMMENT 'LiteralPattern',
  
  CONSTRAINT `fk_IRIScRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_IRIScRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table IRIScalarRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`NumericScRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`NumericScRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `minExclusive` TEXT COMMENT '(LiteralNumber value)',
  `minExclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralNumber kind)',
  `minInclusive` TEXT COMMENT '(LiteralNumber value)',
  `minInclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralNumber kind)',
  `maxExclusive` TEXT COMMENT '(LiteralNumber value)',
  `maxExclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralNumber kind)',
  `maxInclusive` TEXT COMMENT '(LiteralNumber value)',
  `maxInclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralNumber kind)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_NumericScRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_NumericScRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table NumericScalarRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`PlainLitScRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`PlainLitScRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `length` TEXT COMMENT 'PositiveIntegerLiteral',
  `minLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `maxLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  `langRange` TEXT COMMENT 'LanguageTagDataType',
  `pattern` TEXT COMMENT 'LiteralPattern',
  
  CONSTRAINT `fk_PlainLitScRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_PlainLitScRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table PlainLiteralScalarRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`ScOneOfRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ScOneOfRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_ScOneOfRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ScOneOfRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ScalarOneOfRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`ScOneOfLitAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ScOneOfLitAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `axiomUUID` CHAR(36) NOT NULL COMMENT 'ScOneOfRs (ScalarOneOfRestriction)',
  `value` TEXT COMMENT '(LiteralValue value)',
  `valueLiteralType` VARCHAR(30) COMMENT '(LiteralValue kind)',
  `valueTypeUUID` CHAR(36) NULL COMMENT 'Drs (DataRange)',
  
  CONSTRAINT `fk_ScOneOfLitAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ScOneOfLitAx_axiomUUID`
    FOREIGN KEY (`axiomUUID`)
    REFERENCES `OML`.`ScOneOfRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ScOneOfLitAx_valueTypeUUID`
    FOREIGN KEY (`valueTypeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ScalarOneOfLiteralAxioms';

-- -----------------------------------------------------
-- Table `OML`.`StringScRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`StringScRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `length` TEXT COMMENT 'PositiveIntegerLiteral',
  `minLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `maxLength` TEXT COMMENT 'PositiveIntegerLiteral',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  `pattern` TEXT COMMENT 'LiteralPattern',
  
  CONSTRAINT `fk_StringScRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_StringScRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table StringScalarRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`SynonymScRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`SynonymScRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_SynonymScRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_SynonymScRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table SynonymScalarRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`TimeScRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`TimeScRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `minExclusive` TEXT COMMENT '(LiteralDateTime value)',
  `minExclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralDateTime kind)',
  `minInclusive` TEXT COMMENT '(LiteralDateTime value)',
  `minInclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralDateTime kind)',
  `maxExclusive` TEXT COMMENT '(LiteralDateTime value)',
  `maxExclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralDateTime kind)',
  `maxInclusive` TEXT COMMENT '(LiteralDateTime value)',
  `maxInclusiveLiteralType` VARCHAR(30) COMMENT '(LiteralDateTime kind)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_TimeScRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_TimeScRs_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table TimeScalarRestrictions';

-- -----------------------------------------------------
-- Table `OML`.`EScPs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EScPs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `domainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `rangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `isIdentityCriteria` BOOLEAN NOT NULL,
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_EScPs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPs_domainUUID`
    FOREIGN KEY (`domainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPs_rangeUUID`
    FOREIGN KEY (`rangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityScalarDataProperties';

-- -----------------------------------------------------
-- Table `OML`.`EStPs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EStPs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `domainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `rangeUUID` CHAR(36) NOT NULL COMMENT 'Sts (Structure)',
  `isIdentityCriteria` BOOLEAN NOT NULL,
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_EStPs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EStPs_domainUUID`
    FOREIGN KEY (`domainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EStPs_rangeUUID`
    FOREIGN KEY (`rangeUUID`)
    REFERENCES `OML`.`Sts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityStructuredDataProperties';

-- -----------------------------------------------------
-- Table `OML`.`ScPs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ScPs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `domainUUID` CHAR(36) NOT NULL COMMENT 'Sts (Structure)',
  `rangeUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_ScPs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ScPs_domainUUID`
    FOREIGN KEY (`domainUUID`)
    REFERENCES `OML`.`Sts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ScPs_rangeUUID`
    FOREIGN KEY (`rangeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ScalarDataProperties';

-- -----------------------------------------------------
-- Table `OML`.`StPs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`StPs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `domainUUID` CHAR(36) NOT NULL COMMENT 'Sts (Structure)',
  `rangeUUID` CHAR(36) NOT NULL COMMENT 'Sts (Structure)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_StPs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_StPs_domainUUID`
    FOREIGN KEY (`domainUUID`)
    REFERENCES `OML`.`Sts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_StPs_rangeUUID`
    FOREIGN KEY (`rangeUUID`)
    REFERENCES `OML`.`Sts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table StructuredDataProperties';

-- -----------------------------------------------------
-- Table `OML`.`RRs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `sourceUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `targetUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `isAsymmetric` BOOLEAN NOT NULL,
  `isEssential` BOOLEAN NOT NULL,
  `isFunctional` BOOLEAN NOT NULL,
  `isInverseEssential` BOOLEAN NOT NULL,
  `isInverseFunctional` BOOLEAN NOT NULL,
  `isIrreflexive` BOOLEAN NOT NULL,
  `isReflexive` BOOLEAN NOT NULL,
  `isSymmetric` BOOLEAN NOT NULL,
  `isTransitive` BOOLEAN NOT NULL,
  `name` TEXT NOT NULL COMMENT 'LocalName',
  `unreifiedPropertyName` TEXT NOT NULL COMMENT 'LocalName',
  `unreifiedInversePropertyName` TEXT COMMENT 'LocalName',
  
  CONSTRAINT `fk_RRs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRs_sourceUUID`
    FOREIGN KEY (`sourceUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRs_targetUUID`
    FOREIGN KEY (`targetUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationships';

-- -----------------------------------------------------
-- Table `OML`.`URs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`URs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `sourceUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `targetUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `isAsymmetric` BOOLEAN NOT NULL,
  `isEssential` BOOLEAN NOT NULL,
  `isFunctional` BOOLEAN NOT NULL,
  `isInverseEssential` BOOLEAN NOT NULL,
  `isInverseFunctional` BOOLEAN NOT NULL,
  `isIrreflexive` BOOLEAN NOT NULL,
  `isReflexive` BOOLEAN NOT NULL,
  `isSymmetric` BOOLEAN NOT NULL,
  `isTransitive` BOOLEAN NOT NULL,
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_URs_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_URs_sourceUUID`
    FOREIGN KEY (`sourceUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_URs_targetUUID`
    FOREIGN KEY (`targetUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table UnreifiedRelationships';

-- -----------------------------------------------------
-- Table `OML`.`ChainRules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ChainRules` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  `headUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  
  CONSTRAINT `fk_ChainRules_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ChainRules_headUUID`
    FOREIGN KEY (`headUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ChainRules';

-- -----------------------------------------------------
-- Table `OML`.`RuleBodySegs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RuleBodySegs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `previousSegmentUUID` CHAR(36) NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `ruleUUID` CHAR(36) NULL COMMENT 'ChainRules (ChainRule)',
  
  CONSTRAINT `fk_RuleBodySegs_previousSegmentUUID`
    FOREIGN KEY (`previousSegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RuleBodySegs_ruleUUID`
    FOREIGN KEY (`ruleUUID`)
    REFERENCES `OML`.`ChainRules`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table RuleBodySegments';

-- -----------------------------------------------------
-- Table `OML`.`AspectP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`AspectP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `aspectUUID` CHAR(36) NOT NULL COMMENT 'Aspects (Aspect)',
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  
  CONSTRAINT `fk_AspectP_aspectUUID`
    FOREIGN KEY (`aspectUUID`)
    REFERENCES `OML`.`Aspects`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_AspectP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table AspectPredicates';

-- -----------------------------------------------------
-- Table `OML`.`CP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `conceptUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  
  CONSTRAINT `fk_CP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_CP_conceptUUID`
    FOREIGN KEY (`conceptUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ConceptPredicates';

-- -----------------------------------------------------
-- Table `OML`.`RRP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `reifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRP_reifiedRelationshipUUID`
    FOREIGN KEY (`reifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipPredicates';

-- -----------------------------------------------------
-- Table `OML`.`RRPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `reifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRPropP_reifiedRelationshipUUID`
    FOREIGN KEY (`reifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipPropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`RRSrcPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRSrcPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `reifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRSrcPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRSrcPropP_reifiedRelationshipUUID`
    FOREIGN KEY (`reifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipSourcePropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`RRTgtPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRTgtPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `reifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRTgtPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRTgtPropP_reifiedRelationshipUUID`
    FOREIGN KEY (`reifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipTargetPropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`URPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`URPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `unreifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  
  CONSTRAINT `fk_URPropP_unreifiedRelationshipUUID`
    FOREIGN KEY (`unreifiedRelationshipUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_URPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table UnreifiedRelationshipPropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`RRInvPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRInvPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `reifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRInvPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRInvPropP_reifiedRelationshipUUID`
    FOREIGN KEY (`reifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipInversePropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`RRSrcInvPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRSrcInvPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `reifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRSrcInvPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRSrcInvPropP_reifiedRelationshipUUID`
    FOREIGN KEY (`reifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipSourceInversePropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`RRTgtInvPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRTgtInvPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  `reifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRTgtInvPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRTgtInvPropP_reifiedRelationshipUUID`
    FOREIGN KEY (`reifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipTargetInversePropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`URInvPropP`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`URInvPropP` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `unreifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  `bodySegmentUUID` CHAR(36) NOT NULL COMMENT 'RuleBodySegs (RuleBodySegment)',
  
  CONSTRAINT `fk_URInvPropP_unreifiedRelationshipUUID`
    FOREIGN KEY (`unreifiedRelationshipUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_URInvPropP_bodySegmentUUID`
    FOREIGN KEY (`bodySegmentUUID`)
    REFERENCES `OML`.`RuleBodySegs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table UnreifiedRelationshipInversePropertyPredicates';

-- -----------------------------------------------------
-- Table `OML`.`EExFwdReifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EExFwdReifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedDomainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedReifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_EExFwdReifiedRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExFwdReifiedRAx_restrictedDomainUUID`
    FOREIGN KEY (`restrictedDomainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExFwdReifiedRAx_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExFwdReifiedRAx_restrictedReifiedRelationshipUUID`
    FOREIGN KEY (`restrictedReifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityExistentialForwardReifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EExInvReifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EExInvReifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedDomainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedReifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_EExInvReifiedRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExInvReifiedRAx_restrictedDomainUUID`
    FOREIGN KEY (`restrictedDomainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExInvReifiedRAx_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExInvReifiedRAx_restrictedReifiedRelationshipUUID`
    FOREIGN KEY (`restrictedReifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityExistentialInverseReifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EExUnreifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EExUnreifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedDomainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedUnreifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  
  CONSTRAINT `fk_EExUnreifiedRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExUnreifiedRAx_restrictedDomainUUID`
    FOREIGN KEY (`restrictedDomainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExUnreifiedRAx_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EExUnreifiedRAx_restrictedUnreifiedRelationshipUUID`
    FOREIGN KEY (`restrictedUnreifiedRelationshipUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityExistentialUnreifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EUxFwdReifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EUxFwdReifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedDomainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedReifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_EUxFwdReifiedRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxFwdReifiedRAx_restrictedDomainUUID`
    FOREIGN KEY (`restrictedDomainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxFwdReifiedRAx_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxFwdReifiedRAx_restrictedReifiedRelationshipUUID`
    FOREIGN KEY (`restrictedReifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityUniversalForwardReifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EUxInvReifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EUxInvReifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedDomainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedReifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_EUxInvReifiedRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxInvReifiedRAx_restrictedDomainUUID`
    FOREIGN KEY (`restrictedDomainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxInvReifiedRAx_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxInvReifiedRAx_restrictedReifiedRelationshipUUID`
    FOREIGN KEY (`restrictedReifiedRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityUniversalInverseReifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EUxUnreifiedRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EUxUnreifiedRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedDomainUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedRangeUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `restrictedUnreifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  
  CONSTRAINT `fk_EUxUnreifiedRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxUnreifiedRAx_restrictedDomainUUID`
    FOREIGN KEY (`restrictedDomainUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxUnreifiedRAx_restrictedRangeUUID`
    FOREIGN KEY (`restrictedRangeUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EUxUnreifiedRAx_restrictedUnreifiedRelationshipUUID`
    FOREIGN KEY (`restrictedUnreifiedRelationshipUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityUniversalUnreifiedRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EScPExRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EScPExRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedEntityUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `scalarPropertyUUID` CHAR(36) NOT NULL COMMENT 'EScPs (EntityScalarDataProperty)',
  `scalarRestrictionUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  
  CONSTRAINT `fk_EScPExRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPExRAx_restrictedEntityUUID`
    FOREIGN KEY (`restrictedEntityUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPExRAx_scalarPropertyUUID`
    FOREIGN KEY (`scalarPropertyUUID`)
    REFERENCES `OML`.`EScPs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPExRAx_scalarRestrictionUUID`
    FOREIGN KEY (`scalarRestrictionUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityScalarDataPropertyExistentialRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EScPPtrRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EScPPtrRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedEntityUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `scalarPropertyUUID` CHAR(36) NOT NULL COMMENT 'EScPs (EntityScalarDataProperty)',
  `literalValue` TEXT COMMENT '(LiteralValue value)',
  `literalValueLiteralType` VARCHAR(30) COMMENT '(LiteralValue kind)',
  `valueTypeUUID` CHAR(36) NULL COMMENT 'Drs (DataRange)',
  
  CONSTRAINT `fk_EScPPtrRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPPtrRAx_restrictedEntityUUID`
    FOREIGN KEY (`restrictedEntityUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPPtrRAx_scalarPropertyUUID`
    FOREIGN KEY (`scalarPropertyUUID`)
    REFERENCES `OML`.`EScPs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPPtrRAx_valueTypeUUID`
    FOREIGN KEY (`valueTypeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityScalarDataPropertyParticularRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EScPUxRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EScPUxRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `restrictedEntityUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  `scalarPropertyUUID` CHAR(36) NOT NULL COMMENT 'EScPs (EntityScalarDataProperty)',
  `scalarRestrictionUUID` CHAR(36) NOT NULL COMMENT 'Drs (DataRange)',
  
  CONSTRAINT `fk_EScPUxRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPUxRAx_restrictedEntityUUID`
    FOREIGN KEY (`restrictedEntityUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPUxRAx_scalarPropertyUUID`
    FOREIGN KEY (`scalarPropertyUUID`)
    REFERENCES `OML`.`EScPs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EScPUxRAx_scalarRestrictionUUID`
    FOREIGN KEY (`scalarRestrictionUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityScalarDataPropertyUniversalRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`EStPPtrRAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`EStPPtrRAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `structuredDataPropertyUUID` CHAR(36) NOT NULL COMMENT 'DRelToSts (DataRelationshipToStructure)',
  `restrictedEntityUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  
  CONSTRAINT `fk_EStPPtrRAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EStPPtrRAx_structuredDataPropertyUUID`
    FOREIGN KEY (`structuredDataPropertyUUID`)
    REFERENCES `OML`.`DRelToSts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_EStPPtrRAx_restrictedEntityUUID`
    FOREIGN KEY (`restrictedEntityUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table EntityStructuredDataPropertyParticularRestrictionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`RStPTs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RStPTs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `structuredDataPropertyUUID` CHAR(36) NOT NULL COMMENT 'DRelToSts (DataRelationshipToStructure)',
  `structuredDataPropertyContextUUID` CHAR(36) NOT NULL COMMENT 'RStPCtxts (RestrictionStructuredDataPropertyContext)',
  
  CONSTRAINT `fk_RStPTs_structuredDataPropertyUUID`
    FOREIGN KEY (`structuredDataPropertyUUID`)
    REFERENCES `OML`.`DRelToSts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RStPTs_structuredDataPropertyContextUUID`
    FOREIGN KEY (`structuredDataPropertyContextUUID`)
    REFERENCES `OML`.`RStPCtxts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table RestrictionStructuredDataPropertyTuples';

-- -----------------------------------------------------
-- Table `OML`.`RScPVals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RScPVals` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `scalarDataPropertyUUID` CHAR(36) NOT NULL COMMENT 'DRelToScs (DataRelationshipToScalar)',
  `scalarPropertyValue` TEXT COMMENT '(LiteralValue value)',
  `scalarPropertyValueLiteralType` VARCHAR(30) COMMENT '(LiteralValue kind)',
  `structuredDataPropertyContextUUID` CHAR(36) NOT NULL COMMENT 'RStPCtxts (RestrictionStructuredDataPropertyContext)',
  `valueTypeUUID` CHAR(36) NULL COMMENT 'Drs (DataRange)',
  
  CONSTRAINT `fk_RScPVals_scalarDataPropertyUUID`
    FOREIGN KEY (`scalarDataPropertyUUID`)
    REFERENCES `OML`.`DRelToScs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RScPVals_structuredDataPropertyContextUUID`
    FOREIGN KEY (`structuredDataPropertyContextUUID`)
    REFERENCES `OML`.`RStPCtxts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RScPVals_valueTypeUUID`
    FOREIGN KEY (`valueTypeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table RestrictionScalarDataPropertyValues';

-- -----------------------------------------------------
-- Table `OML`.`AspectSpeAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`AspectSpeAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `superAspectUUID` CHAR(36) NOT NULL COMMENT 'Aspects (Aspect)',
  `subEntityUUID` CHAR(36) NOT NULL COMMENT 'Es (Entity)',
  
  CONSTRAINT `fk_AspectSpeAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_AspectSpeAx_superAspectUUID`
    FOREIGN KEY (`superAspectUUID`)
    REFERENCES `OML`.`Aspects`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_AspectSpeAx_subEntityUUID`
    FOREIGN KEY (`subEntityUUID`)
    REFERENCES `OML`.`Es`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table AspectSpecializationAxioms';

-- -----------------------------------------------------
-- Table `OML`.`CSpeAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CSpeAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `superConceptUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  `subConceptUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  
  CONSTRAINT `fk_CSpeAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_CSpeAx_superConceptUUID`
    FOREIGN KEY (`superConceptUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_CSpeAx_subConceptUUID`
    FOREIGN KEY (`subConceptUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ConceptSpecializationAxioms';

-- -----------------------------------------------------
-- Table `OML`.`RRSpeAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRSpeAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `superRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  `subRelationshipUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  
  CONSTRAINT `fk_RRSpeAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRSpeAx_superRelationshipUUID`
    FOREIGN KEY (`superRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRSpeAx_subRelationshipUUID`
    FOREIGN KEY (`subRelationshipUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipSpecializationAxioms';

-- -----------------------------------------------------
-- Table `OML`.`SubDataPropOfAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`SubDataPropOfAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `subPropertyUUID` CHAR(36) NOT NULL COMMENT 'EScPs (EntityScalarDataProperty)',
  `superPropertyUUID` CHAR(36) NOT NULL COMMENT 'EScPs (EntityScalarDataProperty)',
  
  CONSTRAINT `fk_SubDataPropOfAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_SubDataPropOfAx_subPropertyUUID`
    FOREIGN KEY (`subPropertyUUID`)
    REFERENCES `OML`.`EScPs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_SubDataPropOfAx_superPropertyUUID`
    FOREIGN KEY (`superPropertyUUID`)
    REFERENCES `OML`.`EScPs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table SubDataPropertyOfAxioms';

-- -----------------------------------------------------
-- Table `OML`.`SubObjectPropOfAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`SubObjectPropOfAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `tboxUUID` CHAR(36) NOT NULL COMMENT 'TBox (TerminologyBox)',
  `subPropertyUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  `superPropertyUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  
  CONSTRAINT `fk_SubObjectPropOfAx_tboxUUID`
    FOREIGN KEY (`tboxUUID`)
    REFERENCES `OML`.`TBox`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_SubObjectPropOfAx_subPropertyUUID`
    FOREIGN KEY (`subPropertyUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_SubObjectPropOfAx_superPropertyUUID`
    FOREIGN KEY (`superPropertyUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table SubObjectPropertyOfAxioms';

-- -----------------------------------------------------
-- Table `OML`.`RootCTaxonomyAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RootCTaxonomyAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `bundleUUID` CHAR(36) NOT NULL COMMENT 'Bdls (Bundle)',
  `rootUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  
  CONSTRAINT `fk_RootCTaxonomyAx_bundleUUID`
    FOREIGN KEY (`bundleUUID`)
    REFERENCES `OML`.`Bdls`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RootCTaxonomyAx_rootUUID`
    FOREIGN KEY (`rootUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table RootConceptTaxonomyAxioms';

-- -----------------------------------------------------
-- Table `OML`.`AnonymousCUnionAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`AnonymousCUnionAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `disjointTaxonomyParentUUID` CHAR(36) NOT NULL COMMENT 'CTreeDsju (ConceptTreeDisjunction)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_AnonymousCUnionAx_disjointTaxonomyParentUUID`
    FOREIGN KEY (`disjointTaxonomyParentUUID`)
    REFERENCES `OML`.`CTreeDsju`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table AnonymousConceptUnionAxioms';

-- -----------------------------------------------------
-- Table `OML`.`SpeDsjtCAx`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`SpeDsjtCAx` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `disjointTaxonomyParentUUID` CHAR(36) NOT NULL COMMENT 'CTreeDsju (ConceptTreeDisjunction)',
  `disjointLeafUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  
  CONSTRAINT `fk_SpeDsjtCAx_disjointTaxonomyParentUUID`
    FOREIGN KEY (`disjointTaxonomyParentUUID`)
    REFERENCES `OML`.`CTreeDsju`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_SpeDsjtCAx_disjointLeafUUID`
    FOREIGN KEY (`disjointLeafUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table SpecificDisjointConceptAxioms';

-- -----------------------------------------------------
-- Table `OML`.`CIs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`CIs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `singletonConceptClassifierUUID` CHAR(36) NOT NULL COMMENT 'Cs (Concept)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_CIs_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_CIs_singletonConceptClassifierUUID`
    FOREIGN KEY (`singletonConceptClassifierUUID`)
    REFERENCES `OML`.`Cs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ConceptInstances';

-- -----------------------------------------------------
-- Table `OML`.`RRIs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRIs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `singletonReifiedRelationshipClassifierUUID` CHAR(36) NOT NULL COMMENT 'RRs (ReifiedRelationship)',
  `name` TEXT NOT NULL COMMENT 'LocalName',
  
  CONSTRAINT `fk_RRIs_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRIs_singletonReifiedRelationshipClassifierUUID`
    FOREIGN KEY (`singletonReifiedRelationshipClassifierUUID`)
    REFERENCES `OML`.`RRs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipInstances';

-- -----------------------------------------------------
-- Table `OML`.`RRIDomains`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRIDomains` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `reifiedRelationshipInstanceUUID` CHAR(36) NOT NULL COMMENT 'RRIs (ReifiedRelationshipInstance)',
  `domainUUID` CHAR(36) NOT NULL COMMENT 'CualESI (ConceptualEntitySingletonInstance)',
  
  CONSTRAINT `fk_RRIDomains_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRIDomains_reifiedRelationshipInstanceUUID`
    FOREIGN KEY (`reifiedRelationshipInstanceUUID`)
    REFERENCES `OML`.`RRIs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRIDomains_domainUUID`
    FOREIGN KEY (`domainUUID`)
    REFERENCES `OML`.`CualESI`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipInstanceDomains';

-- -----------------------------------------------------
-- Table `OML`.`RRIRanges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`RRIRanges` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `reifiedRelationshipInstanceUUID` CHAR(36) NOT NULL COMMENT 'RRIs (ReifiedRelationshipInstance)',
  `rangeUUID` CHAR(36) NOT NULL COMMENT 'CualESI (ConceptualEntitySingletonInstance)',
  
  CONSTRAINT `fk_RRIRanges_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRIRanges_reifiedRelationshipInstanceUUID`
    FOREIGN KEY (`reifiedRelationshipInstanceUUID`)
    REFERENCES `OML`.`RRIs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_RRIRanges_rangeUUID`
    FOREIGN KEY (`rangeUUID`)
    REFERENCES `OML`.`CualESI`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ReifiedRelationshipInstanceRanges';

-- -----------------------------------------------------
-- Table `OML`.`URITs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`URITs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `unreifiedRelationshipUUID` CHAR(36) NOT NULL COMMENT 'URs (UnreifiedRelationship)',
  `domainUUID` CHAR(36) NOT NULL COMMENT 'CualESI (ConceptualEntitySingletonInstance)',
  `rangeUUID` CHAR(36) NOT NULL COMMENT 'CualESI (ConceptualEntitySingletonInstance)',
  
  CONSTRAINT `fk_URITs_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_URITs_unreifiedRelationshipUUID`
    FOREIGN KEY (`unreifiedRelationshipUUID`)
    REFERENCES `OML`.`URs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_URITs_domainUUID`
    FOREIGN KEY (`domainUUID`)
    REFERENCES `OML`.`CualESI`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_URITs_rangeUUID`
    FOREIGN KEY (`rangeUUID`)
    REFERENCES `OML`.`CualESI`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table UnreifiedRelationshipInstanceTuples';

-- -----------------------------------------------------
-- Table `OML`.`S1IStPVals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`S1IStPVals` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `singletonInstanceUUID` CHAR(36) NOT NULL COMMENT 'CualESI (ConceptualEntitySingletonInstance)',
  `structuredDataPropertyUUID` CHAR(36) NOT NULL COMMENT 'DRelToSts (DataRelationshipToStructure)',
  
  CONSTRAINT `fk_S1IStPVals_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_S1IStPVals_singletonInstanceUUID`
    FOREIGN KEY (`singletonInstanceUUID`)
    REFERENCES `OML`.`CualESI`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_S1IStPVals_structuredDataPropertyUUID`
    FOREIGN KEY (`structuredDataPropertyUUID`)
    REFERENCES `OML`.`DRelToSts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table SingletonInstanceStructuredDataPropertyValues';

-- -----------------------------------------------------
-- Table `OML`.`S1IScPVals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`S1IScPVals` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `descriptionBoxUUID` CHAR(36) NOT NULL COMMENT 'DBoxes (DescriptionBox)',
  `singletonInstanceUUID` CHAR(36) NOT NULL COMMENT 'CualESI (ConceptualEntitySingletonInstance)',
  `scalarDataPropertyUUID` CHAR(36) NOT NULL COMMENT 'EScPs (EntityScalarDataProperty)',
  `scalarPropertyValue` TEXT COMMENT '(LiteralValue value)',
  `scalarPropertyValueLiteralType` VARCHAR(30) COMMENT '(LiteralValue kind)',
  `valueTypeUUID` CHAR(36) NULL COMMENT 'Drs (DataRange)',
  
  CONSTRAINT `fk_S1IScPVals_descriptionBoxUUID`
    FOREIGN KEY (`descriptionBoxUUID`)
    REFERENCES `OML`.`DBoxes`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_S1IScPVals_singletonInstanceUUID`
    FOREIGN KEY (`singletonInstanceUUID`)
    REFERENCES `OML`.`CualESI`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_S1IScPVals_scalarDataPropertyUUID`
    FOREIGN KEY (`scalarDataPropertyUUID`)
    REFERENCES `OML`.`EScPs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_S1IScPVals_valueTypeUUID`
    FOREIGN KEY (`valueTypeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table SingletonInstanceScalarDataPropertyValues';

-- -----------------------------------------------------
-- Table `OML`.`StPTs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`StPTs` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `structuredDataPropertyUUID` CHAR(36) NOT NULL COMMENT 'DRelToSts (DataRelationshipToStructure)',
  `structuredDataPropertyContextUUID` CHAR(36) NOT NULL COMMENT 'S1IStPCtxts (SingletonInstanceStructuredDataPropertyContext)',
  
  CONSTRAINT `fk_StPTs_structuredDataPropertyUUID`
    FOREIGN KEY (`structuredDataPropertyUUID`)
    REFERENCES `OML`.`DRelToSts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_StPTs_structuredDataPropertyContextUUID`
    FOREIGN KEY (`structuredDataPropertyContextUUID`)
    REFERENCES `OML`.`S1IStPCtxts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table StructuredDataPropertyTuples';

-- -----------------------------------------------------
-- Table `OML`.`ScPVals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`ScPVals` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `scalarDataPropertyUUID` CHAR(36) NOT NULL COMMENT 'DRelToScs (DataRelationshipToScalar)',
  `scalarPropertyValue` TEXT COMMENT '(LiteralValue value)',
  `scalarPropertyValueLiteralType` VARCHAR(30) COMMENT '(LiteralValue kind)',
  `structuredDataPropertyContextUUID` CHAR(36) NOT NULL COMMENT 'S1IStPCtxts (SingletonInstanceStructuredDataPropertyContext)',
  `valueTypeUUID` CHAR(36) NULL COMMENT 'Drs (DataRange)',
  
  CONSTRAINT `fk_ScPVals_scalarDataPropertyUUID`
    FOREIGN KEY (`scalarDataPropertyUUID`)
    REFERENCES `OML`.`DRelToScs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ScPVals_structuredDataPropertyContextUUID`
    FOREIGN KEY (`structuredDataPropertyContextUUID`)
    REFERENCES `OML`.`S1IStPCtxts`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_ScPVals_valueTypeUUID`
    FOREIGN KEY (`valueTypeUUID`)
    REFERENCES `OML`.`Drs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table ScalarDataPropertyValues';

-- -----------------------------------------------------
-- Table `OML`.`AnnotPropVals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `OML`.`AnnotPropVals` (
  `uuid` CHAR(36) NOT NULL PRIMARY KEY,
  `subjectUUID` CHAR(36) NOT NULL COMMENT 'LogEs (LogicalElement)',
  `propertyUUID` CHAR(36) NOT NULL COMMENT 'AnnotProps (AnnotationProperty)',
  `value` TEXT COMMENT '(LiteralString value)',
  `valueLiteralType` VARCHAR(30) COMMENT '(LiteralString kind)',
  
  CONSTRAINT `fk_AnnotPropVals_subjectUUID`
    FOREIGN KEY (`subjectUUID`)
    REFERENCES `OML`.`LogEs`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  CONSTRAINT `fk_AnnotPropVals_propertyUUID`
    FOREIGN KEY (`propertyUUID`)
    REFERENCES `OML`.`AnnotProps`(`uuid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  
  UNIQUE INDEX `uuid_UNIQUE` (`uuid` ASC)	
)
COMMENT = 'Concrete Information Table AnnotationPropertyValues';


USE `OML`;
DELIMITER $$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`TlgyGraphs` (TerminologyGraphs)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TlgyGraphs_AFTER_INSERT` AFTER INSERT ON `TlgyGraphs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TerminologyGraphs(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if TerminologyGraphs(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if TerminologyGraphs(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if TerminologyGraphs(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if TerminologyGraphs(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- Modules(x) if TerminologyGraphs(x)
insert into `OML`.`Mods`(`uuid`) values(new.`uuid`);
-- Resources(x) if TerminologyGraphs(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxes(x) if TerminologyGraphs(x)
insert into `OML`.`TBox`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TlgyGraphs_AFTER_DELETE` AFTER DELETE ON `TlgyGraphs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TerminologyGraphs(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if TerminologyGraphs(x)
delete from `OML`.`CRTK`;
-- IntrinsicIdentityKinds(x) if TerminologyGraphs(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if TerminologyGraphs(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if TerminologyGraphs(x)
delete from `OML`.`LogEs`;
-- Modules(x) if TerminologyGraphs(x)
delete from `OML`.`Mods`;
-- Resources(x) if TerminologyGraphs(x)
delete from `OML`.`Ress`;
-- TerminologyBoxes(x) if TerminologyGraphs(x)
delete from `OML`.`TBox`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`Bdls` (Bundles)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Bdls_AFTER_INSERT` AFTER INSERT ON `Bdls` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Bundles(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if Bundles(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if Bundles(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if Bundles(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if Bundles(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- Modules(x) if Bundles(x)
insert into `OML`.`Mods`(`uuid`) values(new.`uuid`);
-- Resources(x) if Bundles(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxes(x) if Bundles(x)
insert into `OML`.`TBox`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Bdls_AFTER_DELETE` AFTER DELETE ON `Bdls` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Bundles(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if Bundles(x)
delete from `OML`.`CRTK`;
-- IntrinsicIdentityKinds(x) if Bundles(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if Bundles(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if Bundles(x)
delete from `OML`.`LogEs`;
-- Modules(x) if Bundles(x)
delete from `OML`.`Mods`;
-- Resources(x) if Bundles(x)
delete from `OML`.`Ress`;
-- TerminologyBoxes(x) if Bundles(x)
delete from `OML`.`TBox`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`DBoxes` (DescriptionBoxes)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`DBoxes_AFTER_INSERT` AFTER INSERT ON `DBoxes` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if DescriptionBoxes(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if DescriptionBoxes(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if DescriptionBoxes(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if DescriptionBoxes(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if DescriptionBoxes(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- Modules(x) if DescriptionBoxes(x)
insert into `OML`.`Mods`(`uuid`) values(new.`uuid`);
-- Resources(x) if DescriptionBoxes(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`DBoxes_AFTER_DELETE` AFTER DELETE ON `DBoxes` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if DescriptionBoxes(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if DescriptionBoxes(x)
delete from `OML`.`CRTK`;
-- IntrinsicIdentityKinds(x) if DescriptionBoxes(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if DescriptionBoxes(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if DescriptionBoxes(x)
delete from `OML`.`LogEs`;
-- Modules(x) if DescriptionBoxes(x)
delete from `OML`.`Mods`;
-- Resources(x) if DescriptionBoxes(x)
delete from `OML`.`Ress`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`AnnotProps` (AnnotationProperties)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AnnotProps_AFTER_INSERT` AFTER INSERT ON `AnnotProps` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AnnotationProperties(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if AnnotationProperties(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if AnnotationProperties(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if AnnotationProperties(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- NonLogicalElements(x) if AnnotationProperties(x)
insert into `OML`.`NonLogEs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AnnotProps_AFTER_DELETE` AFTER DELETE ON `AnnotProps` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AnnotationProperties(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if AnnotationProperties(x)
delete from `OML`.`CRTK`;
-- IntrinsicIdentityKinds(x) if AnnotationProperties(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if AnnotationProperties(x)
delete from `OML`.`Ik`;
-- NonLogicalElements(x) if AnnotationProperties(x)
delete from `OML`.`NonLogEs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`Aspects` (Aspects)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Aspects_AFTER_INSERT` AFTER INSERT ON `Aspects` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Aspects(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if Aspects(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- Entities(x) if Aspects(x)
insert into `OML`.`Es`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if Aspects(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if Aspects(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if Aspects(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if Aspects(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if Aspects(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if Aspects(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if Aspects(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
-- UnaryTermKinds(x) if Aspects(x)
insert into `OML`.`UryTermKinds`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Aspects_AFTER_DELETE` AFTER DELETE ON `Aspects` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Aspects(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if Aspects(x)
delete from `OML`.`CRTK`;
-- Entities(x) if Aspects(x)
delete from `OML`.`Es`;
-- IntrinsicIdentityKinds(x) if Aspects(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if Aspects(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if Aspects(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if Aspects(x)
delete from `OML`.`ModElts`;
-- Resources(x) if Aspects(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if Aspects(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if Aspects(x)
delete from `OML`.`Terms`;
-- UnaryTermKinds(x) if Aspects(x)
delete from `OML`.`UryTermKinds`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`Cs` (Concepts)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Cs_AFTER_INSERT` AFTER INSERT ON `Cs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Concepts(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if Concepts(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ConceptualEntities(x) if Concepts(x)
insert into `OML`.`CualEs`(`uuid`) values(new.`uuid`);
-- Entities(x) if Concepts(x)
insert into `OML`.`Es`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if Concepts(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if Concepts(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if Concepts(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if Concepts(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if Concepts(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if Concepts(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if Concepts(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
-- UnaryTermKinds(x) if Concepts(x)
insert into `OML`.`UryTermKinds`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Cs_AFTER_DELETE` AFTER DELETE ON `Cs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Concepts(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if Concepts(x)
delete from `OML`.`CRTK`;
-- ConceptualEntities(x) if Concepts(x)
delete from `OML`.`CualEs`;
-- Entities(x) if Concepts(x)
delete from `OML`.`Es`;
-- IntrinsicIdentityKinds(x) if Concepts(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if Concepts(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if Concepts(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if Concepts(x)
delete from `OML`.`ModElts`;
-- Resources(x) if Concepts(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if Concepts(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if Concepts(x)
delete from `OML`.`Terms`;
-- UnaryTermKinds(x) if Concepts(x)
delete from `OML`.`UryTermKinds`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`Scs` (Scalars)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Scs_AFTER_INSERT` AFTER INSERT ON `Scs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Scalars(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if Scalars(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if Scalars(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if Scalars(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if Scalars(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if Scalars(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if Scalars(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if Scalars(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if Scalars(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if Scalars(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if Scalars(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
-- UnaryTermKinds(x) if Scalars(x)
insert into `OML`.`UryTermKinds`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Scs_AFTER_DELETE` AFTER DELETE ON `Scs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Scalars(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if Scalars(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if Scalars(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if Scalars(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if Scalars(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if Scalars(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if Scalars(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if Scalars(x)
delete from `OML`.`ModElts`;
-- Resources(x) if Scalars(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if Scalars(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if Scalars(x)
delete from `OML`.`Terms`;
-- UnaryTermKinds(x) if Scalars(x)
delete from `OML`.`UryTermKinds`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`Sts` (Structures)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Sts_AFTER_INSERT` AFTER INSERT ON `Sts` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Structures(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if Structures(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if Structures(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if Structures(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if Structures(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if Structures(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if Structures(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if Structures(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if Structures(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if Structures(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
-- UnaryTermKinds(x) if Structures(x)
insert into `OML`.`UryTermKinds`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`Sts_AFTER_DELETE` AFTER DELETE ON `Sts` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if Structures(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if Structures(x)
delete from `OML`.`CRTK`;
-- Datatypes(x) if Structures(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if Structures(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if Structures(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if Structures(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if Structures(x)
delete from `OML`.`ModElts`;
-- Resources(x) if Structures(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if Structures(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if Structures(x)
delete from `OML`.`Terms`;
-- UnaryTermKinds(x) if Structures(x)
delete from `OML`.`UryTermKinds`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`CDesTlgyAx` (ConceptDesignationTerminologyAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CDesTlgyAx_AFTER_INSERT` AFTER INSERT ON `CDesTlgyAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleEdges(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`ModEdges`(`uuid`) values(new.`uuid`);
-- TerminologyBoxAxioms(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`TBoxAx`(`uuid`) values(new.`uuid`);
-- TerminologyAxioms(x) if ConceptDesignationTerminologyAxioms(x)
insert into `OML`.`TlgyAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CDesTlgyAx_AFTER_DELETE` AFTER DELETE ON `CDesTlgyAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleEdges(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`ModEdges`;
-- TerminologyBoxAxioms(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`TBoxAx`;
-- TerminologyAxioms(x) if ConceptDesignationTerminologyAxioms(x)
delete from `OML`.`TlgyAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`TlgyExtensionAx` (TerminologyExtensionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TlgyExtensionAx_AFTER_INSERT` AFTER INSERT ON `TlgyExtensionAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleEdges(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`ModEdges`(`uuid`) values(new.`uuid`);
-- TerminologyBoxAxioms(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`TBoxAx`(`uuid`) values(new.`uuid`);
-- TerminologyAxioms(x) if TerminologyExtensionAxioms(x)
insert into `OML`.`TlgyAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TlgyExtensionAx_AFTER_DELETE` AFTER DELETE ON `TlgyExtensionAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleEdges(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`ModEdges`;
-- TerminologyBoxAxioms(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`TBoxAx`;
-- TerminologyAxioms(x) if TerminologyExtensionAxioms(x)
delete from `OML`.`TlgyAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`TlgyNestingAx` (TerminologyNestingAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TlgyNestingAx_AFTER_INSERT` AFTER INSERT ON `TlgyNestingAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TerminologyNestingAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if TerminologyNestingAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if TerminologyNestingAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if TerminologyNestingAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if TerminologyNestingAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if TerminologyNestingAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleEdges(x) if TerminologyNestingAxioms(x)
insert into `OML`.`ModEdges`(`uuid`) values(new.`uuid`);
-- TerminologyBoxAxioms(x) if TerminologyNestingAxioms(x)
insert into `OML`.`TBoxAx`(`uuid`) values(new.`uuid`);
-- TerminologyAxioms(x) if TerminologyNestingAxioms(x)
insert into `OML`.`TlgyAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TlgyNestingAx_AFTER_DELETE` AFTER DELETE ON `TlgyNestingAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TerminologyNestingAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if TerminologyNestingAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if TerminologyNestingAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if TerminologyNestingAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if TerminologyNestingAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if TerminologyNestingAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleEdges(x) if TerminologyNestingAxioms(x)
delete from `OML`.`ModEdges`;
-- TerminologyBoxAxioms(x) if TerminologyNestingAxioms(x)
delete from `OML`.`TBoxAx`;
-- TerminologyAxioms(x) if TerminologyNestingAxioms(x)
delete from `OML`.`TlgyAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`BdldTlgyAx` (BundledTerminologyAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`BdldTlgyAx_AFTER_INSERT` AFTER INSERT ON `BdldTlgyAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if BundledTerminologyAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if BundledTerminologyAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if BundledTerminologyAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if BundledTerminologyAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if BundledTerminologyAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if BundledTerminologyAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleEdges(x) if BundledTerminologyAxioms(x)
insert into `OML`.`ModEdges`(`uuid`) values(new.`uuid`);
-- TerminologyAxioms(x) if BundledTerminologyAxioms(x)
insert into `OML`.`TlgyAx`(`uuid`) values(new.`uuid`);
-- TerminologyBundleAxioms(x) if BundledTerminologyAxioms(x)
insert into `OML`.`TlgyBdlAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`BdldTlgyAx_AFTER_DELETE` AFTER DELETE ON `BdldTlgyAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if BundledTerminologyAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if BundledTerminologyAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if BundledTerminologyAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if BundledTerminologyAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if BundledTerminologyAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if BundledTerminologyAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleEdges(x) if BundledTerminologyAxioms(x)
delete from `OML`.`ModEdges`;
-- TerminologyAxioms(x) if BundledTerminologyAxioms(x)
delete from `OML`.`TlgyAx`;
-- TerminologyBundleAxioms(x) if BundledTerminologyAxioms(x)
delete from `OML`.`TlgyBdlAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`DBoxExtCWDef` (DescriptionBoxExtendsClosedWorldDefinitions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`DBoxExtCWDef_AFTER_INSERT` AFTER INSERT ON `DBoxExtCWDef` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DescriptionBoxRelationships(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`DBoxRels`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleEdges(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
insert into `OML`.`ModEdges`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`DBoxExtCWDef_AFTER_DELETE` AFTER DELETE ON `DBoxExtCWDef` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`CRTK`;
-- DescriptionBoxRelationships(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`DBoxRels`;
-- ExtrinsicIdentityKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`LogEs`;
-- ModuleEdges(x) if DescriptionBoxExtendsClosedWorldDefinitions(x)
delete from `OML`.`ModEdges`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`DBoxRfns` (DescriptionBoxRefinements)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`DBoxRfns_AFTER_INSERT` AFTER INSERT ON `DBoxRfns` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if DescriptionBoxRefinements(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if DescriptionBoxRefinements(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DescriptionBoxRelationships(x) if DescriptionBoxRefinements(x)
insert into `OML`.`DBoxRels`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if DescriptionBoxRefinements(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if DescriptionBoxRefinements(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if DescriptionBoxRefinements(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if DescriptionBoxRefinements(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleEdges(x) if DescriptionBoxRefinements(x)
insert into `OML`.`ModEdges`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`DBoxRfns_AFTER_DELETE` AFTER DELETE ON `DBoxRfns` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if DescriptionBoxRefinements(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if DescriptionBoxRefinements(x)
delete from `OML`.`CRTK`;
-- DescriptionBoxRelationships(x) if DescriptionBoxRefinements(x)
delete from `OML`.`DBoxRels`;
-- ExtrinsicIdentityKinds(x) if DescriptionBoxRefinements(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if DescriptionBoxRefinements(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if DescriptionBoxRefinements(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if DescriptionBoxRefinements(x)
delete from `OML`.`LogEs`;
-- ModuleEdges(x) if DescriptionBoxRefinements(x)
delete from `OML`.`ModEdges`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`BinScRs` (BinaryScalarRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`BinScRs_AFTER_INSERT` AFTER INSERT ON `BinScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if BinaryScalarRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if BinaryScalarRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if BinaryScalarRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if BinaryScalarRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if BinaryScalarRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if BinaryScalarRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if BinaryScalarRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if BinaryScalarRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if BinaryScalarRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if BinaryScalarRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if BinaryScalarRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if BinaryScalarRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`BinScRs_AFTER_DELETE` AFTER DELETE ON `BinScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if BinaryScalarRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if BinaryScalarRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if BinaryScalarRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if BinaryScalarRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if BinaryScalarRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if BinaryScalarRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if BinaryScalarRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if BinaryScalarRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if BinaryScalarRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if BinaryScalarRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if BinaryScalarRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if BinaryScalarRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`IRIScRs` (IRIScalarRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`IRIScRs_AFTER_INSERT` AFTER INSERT ON `IRIScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if IRIScalarRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if IRIScalarRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if IRIScalarRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if IRIScalarRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if IRIScalarRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if IRIScalarRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if IRIScalarRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if IRIScalarRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if IRIScalarRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if IRIScalarRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if IRIScalarRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if IRIScalarRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`IRIScRs_AFTER_DELETE` AFTER DELETE ON `IRIScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if IRIScalarRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if IRIScalarRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if IRIScalarRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if IRIScalarRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if IRIScalarRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if IRIScalarRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if IRIScalarRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if IRIScalarRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if IRIScalarRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if IRIScalarRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if IRIScalarRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if IRIScalarRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`NumericScRs` (NumericScalarRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`NumericScRs_AFTER_INSERT` AFTER INSERT ON `NumericScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if NumericScalarRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if NumericScalarRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if NumericScalarRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if NumericScalarRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if NumericScalarRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if NumericScalarRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if NumericScalarRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if NumericScalarRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if NumericScalarRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if NumericScalarRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if NumericScalarRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if NumericScalarRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`NumericScRs_AFTER_DELETE` AFTER DELETE ON `NumericScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if NumericScalarRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if NumericScalarRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if NumericScalarRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if NumericScalarRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if NumericScalarRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if NumericScalarRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if NumericScalarRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if NumericScalarRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if NumericScalarRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if NumericScalarRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if NumericScalarRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if NumericScalarRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`PlainLitScRs` (PlainLiteralScalarRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`PlainLitScRs_AFTER_INSERT` AFTER INSERT ON `PlainLitScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if PlainLiteralScalarRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`PlainLitScRs_AFTER_DELETE` AFTER DELETE ON `PlainLitScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if PlainLiteralScalarRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`ScOneOfRs` (ScalarOneOfRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScOneOfRs_AFTER_INSERT` AFTER INSERT ON `ScOneOfRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if ScalarOneOfRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScOneOfRs_AFTER_DELETE` AFTER DELETE ON `ScOneOfRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if ScalarOneOfRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`ScOneOfLitAx` (ScalarOneOfLiteralAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScOneOfLitAx_AFTER_INSERT` AFTER INSERT ON `ScOneOfLitAx` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- NonCrossReferencableKinds(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`NonCRBK`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
-- ValueCrossReferenceTuples(x) if ScalarOneOfLiteralAxioms(x)
insert into `OML`.`ValCRefTs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScOneOfLitAx_AFTER_DELETE` AFTER DELETE ON `ScOneOfLitAx` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`EIdK`;
-- IdentityKinds(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`ModElts`;
-- NonCrossReferencableKinds(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`NonCRBK`;
-- TerminologyBoxStatements(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`TermAx`;
-- ValueCrossReferenceTuples(x) if ScalarOneOfLiteralAxioms(x)
delete from `OML`.`ValCRefTs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`StringScRs` (StringScalarRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`StringScRs_AFTER_INSERT` AFTER INSERT ON `StringScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if StringScalarRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if StringScalarRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if StringScalarRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if StringScalarRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if StringScalarRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if StringScalarRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if StringScalarRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if StringScalarRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if StringScalarRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if StringScalarRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if StringScalarRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if StringScalarRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`StringScRs_AFTER_DELETE` AFTER DELETE ON `StringScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if StringScalarRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if StringScalarRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if StringScalarRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if StringScalarRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if StringScalarRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if StringScalarRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if StringScalarRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if StringScalarRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if StringScalarRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if StringScalarRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if StringScalarRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if StringScalarRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`SynonymScRs` (SynonymScalarRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SynonymScRs_AFTER_INSERT` AFTER INSERT ON `SynonymScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SynonymScalarRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if SynonymScalarRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if SynonymScalarRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if SynonymScalarRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if SynonymScalarRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if SynonymScalarRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if SynonymScalarRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if SynonymScalarRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if SynonymScalarRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if SynonymScalarRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if SynonymScalarRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if SynonymScalarRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SynonymScRs_AFTER_DELETE` AFTER DELETE ON `SynonymScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SynonymScalarRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if SynonymScalarRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if SynonymScalarRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if SynonymScalarRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if SynonymScalarRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if SynonymScalarRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if SynonymScalarRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if SynonymScalarRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if SynonymScalarRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if SynonymScalarRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if SynonymScalarRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if SynonymScalarRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`TimeScRs` (TimeScalarRestrictions)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TimeScRs_AFTER_INSERT` AFTER INSERT ON `TimeScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TimeScalarRestrictions(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if TimeScalarRestrictions(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRanges(x) if TimeScalarRestrictions(x)
insert into `OML`.`Drs`(`uuid`) values(new.`uuid`);
-- Datatypes(x) if TimeScalarRestrictions(x)
insert into `OML`.`Dt`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if TimeScalarRestrictions(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if TimeScalarRestrictions(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if TimeScalarRestrictions(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if TimeScalarRestrictions(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if TimeScalarRestrictions(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- RestrictedDataRanges(x) if TimeScalarRestrictions(x)
insert into `OML`.`RestDrs`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if TimeScalarRestrictions(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if TimeScalarRestrictions(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`TimeScRs_AFTER_DELETE` AFTER DELETE ON `TimeScRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if TimeScalarRestrictions(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if TimeScalarRestrictions(x)
delete from `OML`.`CRTK`;
-- DataRanges(x) if TimeScalarRestrictions(x)
delete from `OML`.`Drs`;
-- Datatypes(x) if TimeScalarRestrictions(x)
delete from `OML`.`Dt`;
-- IntrinsicIdentityKinds(x) if TimeScalarRestrictions(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if TimeScalarRestrictions(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if TimeScalarRestrictions(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if TimeScalarRestrictions(x)
delete from `OML`.`ModElts`;
-- Resources(x) if TimeScalarRestrictions(x)
delete from `OML`.`Ress`;
-- RestrictedDataRanges(x) if TimeScalarRestrictions(x)
delete from `OML`.`RestDrs`;
-- TerminologyBoxStatements(x) if TimeScalarRestrictions(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if TimeScalarRestrictions(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EScPs` (EntityScalarDataProperties)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPs_AFTER_INSERT` AFTER INSERT ON `EScPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityScalarDataProperties(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityScalarDataProperties(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRelationshipDomains(x) if EntityScalarDataProperties(x)
insert into `OML`.`DRelDomains`(`uuid`) values(new.`uuid`);
-- DataRelationshipFromEntities(x) if EntityScalarDataProperties(x)
insert into `OML`.`DRelFromEs`(`uuid`) values(new.`uuid`);
-- DataRelationshipRanges(x) if EntityScalarDataProperties(x)
insert into `OML`.`DRelRanges`(`uuid`) values(new.`uuid`);
-- DataRelationshipToScalars(x) if EntityScalarDataProperties(x)
insert into `OML`.`DRelToScs`(`uuid`) values(new.`uuid`);
-- DataRelationships(x) if EntityScalarDataProperties(x)
insert into `OML`.`DRels`(`uuid`) values(new.`uuid`);
-- DirectedBinaryRelationshipKinds(x) if EntityScalarDataProperties(x)
insert into `OML`.`DirBinRelKinds`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if EntityScalarDataProperties(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityScalarDataProperties(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityScalarDataProperties(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityScalarDataProperties(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if EntityScalarDataProperties(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityScalarDataProperties(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if EntityScalarDataProperties(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPs_AFTER_DELETE` AFTER DELETE ON `EScPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityScalarDataProperties(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityScalarDataProperties(x)
delete from `OML`.`CRTK`;
-- DataRelationshipDomains(x) if EntityScalarDataProperties(x)
delete from `OML`.`DRelDomains`;
-- DataRelationshipFromEntities(x) if EntityScalarDataProperties(x)
delete from `OML`.`DRelFromEs`;
-- DataRelationshipRanges(x) if EntityScalarDataProperties(x)
delete from `OML`.`DRelRanges`;
-- DataRelationshipToScalars(x) if EntityScalarDataProperties(x)
delete from `OML`.`DRelToScs`;
-- DataRelationships(x) if EntityScalarDataProperties(x)
delete from `OML`.`DRels`;
-- DirectedBinaryRelationshipKinds(x) if EntityScalarDataProperties(x)
delete from `OML`.`DirBinRelKinds`;
-- IntrinsicIdentityKinds(x) if EntityScalarDataProperties(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if EntityScalarDataProperties(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityScalarDataProperties(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityScalarDataProperties(x)
delete from `OML`.`ModElts`;
-- Resources(x) if EntityScalarDataProperties(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if EntityScalarDataProperties(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if EntityScalarDataProperties(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EStPs` (EntityStructuredDataProperties)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EStPs_AFTER_INSERT` AFTER INSERT ON `EStPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityStructuredDataProperties(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityStructuredDataProperties(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRelationshipDomains(x) if EntityStructuredDataProperties(x)
insert into `OML`.`DRelDomains`(`uuid`) values(new.`uuid`);
-- DataRelationshipFromEntities(x) if EntityStructuredDataProperties(x)
insert into `OML`.`DRelFromEs`(`uuid`) values(new.`uuid`);
-- DataRelationshipRanges(x) if EntityStructuredDataProperties(x)
insert into `OML`.`DRelRanges`(`uuid`) values(new.`uuid`);
-- DataRelationshipToStructures(x) if EntityStructuredDataProperties(x)
insert into `OML`.`DRelToSts`(`uuid`) values(new.`uuid`);
-- DataRelationships(x) if EntityStructuredDataProperties(x)
insert into `OML`.`DRels`(`uuid`) values(new.`uuid`);
-- DirectedBinaryRelationshipKinds(x) if EntityStructuredDataProperties(x)
insert into `OML`.`DirBinRelKinds`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if EntityStructuredDataProperties(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityStructuredDataProperties(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityStructuredDataProperties(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityStructuredDataProperties(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if EntityStructuredDataProperties(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityStructuredDataProperties(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if EntityStructuredDataProperties(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EStPs_AFTER_DELETE` AFTER DELETE ON `EStPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityStructuredDataProperties(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityStructuredDataProperties(x)
delete from `OML`.`CRTK`;
-- DataRelationshipDomains(x) if EntityStructuredDataProperties(x)
delete from `OML`.`DRelDomains`;
-- DataRelationshipFromEntities(x) if EntityStructuredDataProperties(x)
delete from `OML`.`DRelFromEs`;
-- DataRelationshipRanges(x) if EntityStructuredDataProperties(x)
delete from `OML`.`DRelRanges`;
-- DataRelationshipToStructures(x) if EntityStructuredDataProperties(x)
delete from `OML`.`DRelToSts`;
-- DataRelationships(x) if EntityStructuredDataProperties(x)
delete from `OML`.`DRels`;
-- DirectedBinaryRelationshipKinds(x) if EntityStructuredDataProperties(x)
delete from `OML`.`DirBinRelKinds`;
-- IntrinsicIdentityKinds(x) if EntityStructuredDataProperties(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if EntityStructuredDataProperties(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityStructuredDataProperties(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityStructuredDataProperties(x)
delete from `OML`.`ModElts`;
-- Resources(x) if EntityStructuredDataProperties(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if EntityStructuredDataProperties(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if EntityStructuredDataProperties(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`ScPs` (ScalarDataProperties)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScPs_AFTER_INSERT` AFTER INSERT ON `ScPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ScalarDataProperties(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ScalarDataProperties(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRelationshipDomains(x) if ScalarDataProperties(x)
insert into `OML`.`DRelDomains`(`uuid`) values(new.`uuid`);
-- DataRelationshipFromStructures(x) if ScalarDataProperties(x)
insert into `OML`.`DRelFromSts`(`uuid`) values(new.`uuid`);
-- DataRelationshipRanges(x) if ScalarDataProperties(x)
insert into `OML`.`DRelRanges`(`uuid`) values(new.`uuid`);
-- DataRelationshipToScalars(x) if ScalarDataProperties(x)
insert into `OML`.`DRelToScs`(`uuid`) values(new.`uuid`);
-- DataRelationships(x) if ScalarDataProperties(x)
insert into `OML`.`DRels`(`uuid`) values(new.`uuid`);
-- DirectedBinaryRelationshipKinds(x) if ScalarDataProperties(x)
insert into `OML`.`DirBinRelKinds`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if ScalarDataProperties(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ScalarDataProperties(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ScalarDataProperties(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ScalarDataProperties(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if ScalarDataProperties(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if ScalarDataProperties(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if ScalarDataProperties(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScPs_AFTER_DELETE` AFTER DELETE ON `ScPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ScalarDataProperties(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ScalarDataProperties(x)
delete from `OML`.`CRTK`;
-- DataRelationshipDomains(x) if ScalarDataProperties(x)
delete from `OML`.`DRelDomains`;
-- DataRelationshipFromStructures(x) if ScalarDataProperties(x)
delete from `OML`.`DRelFromSts`;
-- DataRelationshipRanges(x) if ScalarDataProperties(x)
delete from `OML`.`DRelRanges`;
-- DataRelationshipToScalars(x) if ScalarDataProperties(x)
delete from `OML`.`DRelToScs`;
-- DataRelationships(x) if ScalarDataProperties(x)
delete from `OML`.`DRels`;
-- DirectedBinaryRelationshipKinds(x) if ScalarDataProperties(x)
delete from `OML`.`DirBinRelKinds`;
-- IntrinsicIdentityKinds(x) if ScalarDataProperties(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if ScalarDataProperties(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ScalarDataProperties(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ScalarDataProperties(x)
delete from `OML`.`ModElts`;
-- Resources(x) if ScalarDataProperties(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if ScalarDataProperties(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if ScalarDataProperties(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`StPs` (StructuredDataProperties)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`StPs_AFTER_INSERT` AFTER INSERT ON `StPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if StructuredDataProperties(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if StructuredDataProperties(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DataRelationshipDomains(x) if StructuredDataProperties(x)
insert into `OML`.`DRelDomains`(`uuid`) values(new.`uuid`);
-- DataRelationshipFromStructures(x) if StructuredDataProperties(x)
insert into `OML`.`DRelFromSts`(`uuid`) values(new.`uuid`);
-- DataRelationshipRanges(x) if StructuredDataProperties(x)
insert into `OML`.`DRelRanges`(`uuid`) values(new.`uuid`);
-- DataRelationshipToStructures(x) if StructuredDataProperties(x)
insert into `OML`.`DRelToSts`(`uuid`) values(new.`uuid`);
-- DataRelationships(x) if StructuredDataProperties(x)
insert into `OML`.`DRels`(`uuid`) values(new.`uuid`);
-- DirectedBinaryRelationshipKinds(x) if StructuredDataProperties(x)
insert into `OML`.`DirBinRelKinds`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if StructuredDataProperties(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if StructuredDataProperties(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if StructuredDataProperties(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if StructuredDataProperties(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if StructuredDataProperties(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if StructuredDataProperties(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if StructuredDataProperties(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`StPs_AFTER_DELETE` AFTER DELETE ON `StPs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if StructuredDataProperties(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if StructuredDataProperties(x)
delete from `OML`.`CRTK`;
-- DataRelationshipDomains(x) if StructuredDataProperties(x)
delete from `OML`.`DRelDomains`;
-- DataRelationshipFromStructures(x) if StructuredDataProperties(x)
delete from `OML`.`DRelFromSts`;
-- DataRelationshipRanges(x) if StructuredDataProperties(x)
delete from `OML`.`DRelRanges`;
-- DataRelationshipToStructures(x) if StructuredDataProperties(x)
delete from `OML`.`DRelToSts`;
-- DataRelationships(x) if StructuredDataProperties(x)
delete from `OML`.`DRels`;
-- DirectedBinaryRelationshipKinds(x) if StructuredDataProperties(x)
delete from `OML`.`DirBinRelKinds`;
-- IntrinsicIdentityKinds(x) if StructuredDataProperties(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if StructuredDataProperties(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if StructuredDataProperties(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if StructuredDataProperties(x)
delete from `OML`.`ModElts`;
-- Resources(x) if StructuredDataProperties(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if StructuredDataProperties(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if StructuredDataProperties(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRs` (ReifiedRelationships)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRs_AFTER_INSERT` AFTER INSERT ON `RRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationships(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationships(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ConceptualEntities(x) if ReifiedRelationships(x)
insert into `OML`.`CualEs`(`uuid`) values(new.`uuid`);
-- DirectedBinaryRelationshipKinds(x) if ReifiedRelationships(x)
insert into `OML`.`DirBinRelKinds`(`uuid`) values(new.`uuid`);
-- EntityRelationships(x) if ReifiedRelationships(x)
insert into `OML`.`ERels`(`uuid`) values(new.`uuid`);
-- Entities(x) if ReifiedRelationships(x)
insert into `OML`.`Es`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if ReifiedRelationships(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationships(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationships(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ReifiedRelationships(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if ReifiedRelationships(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if ReifiedRelationships(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if ReifiedRelationships(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRs_AFTER_DELETE` AFTER DELETE ON `RRs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationships(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationships(x)
delete from `OML`.`CRTK`;
-- ConceptualEntities(x) if ReifiedRelationships(x)
delete from `OML`.`CualEs`;
-- DirectedBinaryRelationshipKinds(x) if ReifiedRelationships(x)
delete from `OML`.`DirBinRelKinds`;
-- EntityRelationships(x) if ReifiedRelationships(x)
delete from `OML`.`ERels`;
-- Entities(x) if ReifiedRelationships(x)
delete from `OML`.`Es`;
-- IntrinsicIdentityKinds(x) if ReifiedRelationships(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if ReifiedRelationships(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationships(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ReifiedRelationships(x)
delete from `OML`.`ModElts`;
-- Resources(x) if ReifiedRelationships(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if ReifiedRelationships(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if ReifiedRelationships(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`URs` (UnreifiedRelationships)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URs_AFTER_INSERT` AFTER INSERT ON `URs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if UnreifiedRelationships(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if UnreifiedRelationships(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DirectedBinaryRelationshipKinds(x) if UnreifiedRelationships(x)
insert into `OML`.`DirBinRelKinds`(`uuid`) values(new.`uuid`);
-- EntityRelationships(x) if UnreifiedRelationships(x)
insert into `OML`.`ERels`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if UnreifiedRelationships(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if UnreifiedRelationships(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if UnreifiedRelationships(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if UnreifiedRelationships(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if UnreifiedRelationships(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if UnreifiedRelationships(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if UnreifiedRelationships(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URs_AFTER_DELETE` AFTER DELETE ON `URs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if UnreifiedRelationships(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if UnreifiedRelationships(x)
delete from `OML`.`CRTK`;
-- DirectedBinaryRelationshipKinds(x) if UnreifiedRelationships(x)
delete from `OML`.`DirBinRelKinds`;
-- EntityRelationships(x) if UnreifiedRelationships(x)
delete from `OML`.`ERels`;
-- IntrinsicIdentityKinds(x) if UnreifiedRelationships(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if UnreifiedRelationships(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if UnreifiedRelationships(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if UnreifiedRelationships(x)
delete from `OML`.`ModElts`;
-- Resources(x) if UnreifiedRelationships(x)
delete from `OML`.`Ress`;
-- TerminologyBoxStatements(x) if UnreifiedRelationships(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if UnreifiedRelationships(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`ChainRules` (ChainRules)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ChainRules_AFTER_INSERT` AFTER INSERT ON `ChainRules` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ChainRules(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ChainRules(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if ChainRules(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ChainRules(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ChainRules(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ChainRules(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if ChainRules(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- Rules(x) if ChainRules(x)
insert into `OML`.`Rules`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if ChainRules(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- Terms(x) if ChainRules(x)
insert into `OML`.`Terms`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ChainRules_AFTER_DELETE` AFTER DELETE ON `ChainRules` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ChainRules(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ChainRules(x)
delete from `OML`.`CRTK`;
-- IntrinsicIdentityKinds(x) if ChainRules(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if ChainRules(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ChainRules(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ChainRules(x)
delete from `OML`.`ModElts`;
-- Resources(x) if ChainRules(x)
delete from `OML`.`Ress`;
-- Rules(x) if ChainRules(x)
delete from `OML`.`Rules`;
-- TerminologyBoxStatements(x) if ChainRules(x)
delete from `OML`.`TBoxSt`;
-- Terms(x) if ChainRules(x)
delete from `OML`.`Terms`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RuleBodySegs` (RuleBodySegments)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RuleBodySegs_AFTER_INSERT` AFTER INSERT ON `RuleBodySegs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if RuleBodySegments(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if RuleBodySegments(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if RuleBodySegments(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if RuleBodySegments(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if RuleBodySegments(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if RuleBodySegments(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RuleBodySegs_AFTER_DELETE` AFTER DELETE ON `RuleBodySegs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if RuleBodySegments(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if RuleBodySegments(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if RuleBodySegments(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if RuleBodySegments(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if RuleBodySegments(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if RuleBodySegments(x)
delete from `OML`.`LogEs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`AspectP` (AspectPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AspectP_AFTER_INSERT` AFTER INSERT ON `AspectP` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AspectPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if AspectPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if AspectPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if AspectPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if AspectPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if AspectPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if AspectPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
-- UnarySegmentPredicates(x) if AspectPredicates(x)
insert into `OML`.`UrySegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AspectP_AFTER_DELETE` AFTER DELETE ON `AspectP` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AspectPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if AspectPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if AspectPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if AspectPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if AspectPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if AspectPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if AspectPredicates(x)
delete from `OML`.`SegP`;
-- UnarySegmentPredicates(x) if AspectPredicates(x)
delete from `OML`.`UrySegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`CP` (ConceptPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CP_AFTER_INSERT` AFTER INSERT ON `CP` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ConceptPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ConceptPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ConceptPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ConceptPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ConceptPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ConceptPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
-- UnarySegmentPredicates(x) if ConceptPredicates(x)
insert into `OML`.`UrySegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CP_AFTER_DELETE` AFTER DELETE ON `CP` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ConceptPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ConceptPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ConceptPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ConceptPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ConceptPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ConceptPredicates(x)
delete from `OML`.`SegP`;
-- UnarySegmentPredicates(x) if ConceptPredicates(x)
delete from `OML`.`UrySegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRP` (ReifiedRelationshipPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRP_AFTER_INSERT` AFTER INSERT ON `RRP` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
-- UnarySegmentPredicates(x) if ReifiedRelationshipPredicates(x)
insert into `OML`.`UrySegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRP_AFTER_DELETE` AFTER DELETE ON `RRP` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`SegP`;
-- UnarySegmentPredicates(x) if ReifiedRelationshipPredicates(x)
delete from `OML`.`UrySegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRPropP` (ReifiedRelationshipPropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRPropP_AFTER_INSERT` AFTER INSERT ON `RRPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`BinSegFwdPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ReifiedRelationshipPropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRPropP_AFTER_DELETE` AFTER DELETE ON `RRPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`BinSegFwdPropP`;
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- CrossReferencableKinds(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ReifiedRelationshipPropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRSrcPropP` (ReifiedRelationshipSourcePropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRSrcPropP_AFTER_INSERT` AFTER INSERT ON `RRSrcPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`BinSegFwdPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ReifiedRelationshipSourcePropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRSrcPropP_AFTER_DELETE` AFTER DELETE ON `RRSrcPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`BinSegFwdPropP`;
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- CrossReferencableKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ReifiedRelationshipSourcePropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRTgtPropP` (ReifiedRelationshipTargetPropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRTgtPropP_AFTER_INSERT` AFTER INSERT ON `RRTgtPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`BinSegFwdPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ReifiedRelationshipTargetPropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRTgtPropP_AFTER_DELETE` AFTER DELETE ON `RRTgtPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`BinSegFwdPropP`;
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- CrossReferencableKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ReifiedRelationshipTargetPropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`URPropP` (UnreifiedRelationshipPropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URPropP_AFTER_INSERT` AFTER INSERT ON `URPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`BinSegFwdPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentPropertyPredicates(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if UnreifiedRelationshipPropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URPropP_AFTER_DELETE` AFTER DELETE ON `URPropP` FOR EACH ROW
BEGIN
-- BinarySegmentForwardPropertyPredicates(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`BinSegFwdPropP`;
-- BinarySegmentPropertyPredicates(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- CrossReferencableKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if UnreifiedRelationshipPropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRInvPropP` (ReifiedRelationshipInversePropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRInvPropP_AFTER_INSERT` AFTER INSERT ON `RRInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentReversePropertyPredicates(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`BinSegRevPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ReifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRInvPropP_AFTER_DELETE` AFTER DELETE ON `RRInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- BinarySegmentReversePropertyPredicates(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`BinSegRevPropP`;
-- CrossReferencableKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ReifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRSrcInvPropP` (ReifiedRelationshipSourceInversePropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRSrcInvPropP_AFTER_INSERT` AFTER INSERT ON `RRSrcInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentReversePropertyPredicates(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`BinSegRevPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRSrcInvPropP_AFTER_DELETE` AFTER DELETE ON `RRSrcInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- BinarySegmentReversePropertyPredicates(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`BinSegRevPropP`;
-- CrossReferencableKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ReifiedRelationshipSourceInversePropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRTgtInvPropP` (ReifiedRelationshipTargetInversePropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRTgtInvPropP_AFTER_INSERT` AFTER INSERT ON `RRTgtInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentReversePropertyPredicates(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`BinSegRevPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRTgtInvPropP_AFTER_DELETE` AFTER DELETE ON `RRTgtInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- BinarySegmentReversePropertyPredicates(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`BinSegRevPropP`;
-- CrossReferencableKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if ReifiedRelationshipTargetInversePropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`URInvPropP` (UnreifiedRelationshipInversePropertyPredicates)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URInvPropP_AFTER_INSERT` AFTER INSERT ON `URInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`BinSegPropP`(`uuid`) values(new.`uuid`);
-- BinarySegmentReversePropertyPredicates(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`BinSegRevPropP`(`uuid`) values(new.`uuid`);
-- CrossReferencableKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SegmentPredicates(x) if UnreifiedRelationshipInversePropertyPredicates(x)
insert into `OML`.`SegP`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URInvPropP_AFTER_DELETE` AFTER DELETE ON `URInvPropP` FOR EACH ROW
BEGIN
-- BinarySegmentPropertyPredicates(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`BinSegPropP`;
-- BinarySegmentReversePropertyPredicates(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`BinSegRevPropP`;
-- CrossReferencableKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`LogEs`;
-- SegmentPredicates(x) if UnreifiedRelationshipInversePropertyPredicates(x)
delete from `OML`.`SegP`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EExFwdReifiedRAx` (EntityExistentialForwardReifiedRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EExFwdReifiedRAx_AFTER_INSERT` AFTER INSERT ON `EExFwdReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- EntityExistentialRestrictionAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EExRAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityRestrictionAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`ERAx`(`uuid`) values(new.`uuid`);
-- EntityReifiedRestrictionAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EReifiedRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EExFwdReifiedRAx_AFTER_DELETE` AFTER DELETE ON `EExFwdReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- EntityExistentialRestrictionAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EExRAx`;
-- ExtrinsicIdentityKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityRestrictionAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`ERAx`;
-- EntityReifiedRestrictionAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EReifiedRAx`;
-- ElementCrossReferenceTuples(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityExistentialForwardReifiedRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EExInvReifiedRAx` (EntityExistentialInverseReifiedRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EExInvReifiedRAx_AFTER_INSERT` AFTER INSERT ON `EExInvReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- EntityExistentialRestrictionAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EExRAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityRestrictionAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`ERAx`(`uuid`) values(new.`uuid`);
-- EntityReifiedRestrictionAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EReifiedRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EExInvReifiedRAx_AFTER_DELETE` AFTER DELETE ON `EExInvReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- EntityExistentialRestrictionAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EExRAx`;
-- ExtrinsicIdentityKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityRestrictionAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`ERAx`;
-- EntityReifiedRestrictionAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EReifiedRAx`;
-- ElementCrossReferenceTuples(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityExistentialInverseReifiedRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EExUnreifiedRAx` (EntityExistentialUnreifiedRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EExUnreifiedRAx_AFTER_INSERT` AFTER INSERT ON `EExUnreifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- EntityExistentialRestrictionAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`EExRAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityRestrictionAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`ERAx`(`uuid`) values(new.`uuid`);
-- EntityUnreifiedRestrictionAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`EUnreifiedRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EExUnreifiedRAx_AFTER_DELETE` AFTER DELETE ON `EExUnreifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- EntityExistentialRestrictionAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`EExRAx`;
-- ExtrinsicIdentityKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityRestrictionAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`ERAx`;
-- EntityUnreifiedRestrictionAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`EUnreifiedRAx`;
-- ElementCrossReferenceTuples(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityExistentialUnreifiedRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EUxFwdReifiedRAx` (EntityUniversalForwardReifiedRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EUxFwdReifiedRAx_AFTER_INSERT` AFTER INSERT ON `EUxFwdReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- EntityExistentialRestrictionAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EExRAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityRestrictionAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`ERAx`(`uuid`) values(new.`uuid`);
-- EntityReifiedRestrictionAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EReifiedRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EUxFwdReifiedRAx_AFTER_DELETE` AFTER DELETE ON `EUxFwdReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- EntityExistentialRestrictionAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EExRAx`;
-- ExtrinsicIdentityKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityRestrictionAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`ERAx`;
-- EntityReifiedRestrictionAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EReifiedRAx`;
-- ElementCrossReferenceTuples(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityUniversalForwardReifiedRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EUxInvReifiedRAx` (EntityUniversalInverseReifiedRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EUxInvReifiedRAx_AFTER_INSERT` AFTER INSERT ON `EUxInvReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- EntityExistentialRestrictionAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EExRAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityRestrictionAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`ERAx`(`uuid`) values(new.`uuid`);
-- EntityReifiedRestrictionAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EReifiedRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EUxInvReifiedRAx_AFTER_DELETE` AFTER DELETE ON `EUxInvReifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- EntityExistentialRestrictionAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EExRAx`;
-- ExtrinsicIdentityKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityRestrictionAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`ERAx`;
-- EntityReifiedRestrictionAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EReifiedRAx`;
-- ElementCrossReferenceTuples(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityUniversalInverseReifiedRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EUxUnreifiedRAx` (EntityUniversalUnreifiedRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EUxUnreifiedRAx_AFTER_INSERT` AFTER INSERT ON `EUxUnreifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- EntityExistentialRestrictionAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`EExRAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityRestrictionAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`ERAx`(`uuid`) values(new.`uuid`);
-- EntityUnreifiedRestrictionAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`EUnreifiedRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EUxUnreifiedRAx_AFTER_DELETE` AFTER DELETE ON `EUxUnreifiedRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- EntityExistentialRestrictionAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`EExRAx`;
-- ExtrinsicIdentityKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityRestrictionAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`ERAx`;
-- EntityUnreifiedRestrictionAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`EUnreifiedRAx`;
-- ElementCrossReferenceTuples(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityUniversalUnreifiedRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EScPExRAx` (EntityScalarDataPropertyExistentialRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPExRAx_AFTER_INSERT` AFTER INSERT ON `EScPExRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityScalarDataPropertyRestrictionAxioms(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`EScPRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPExRAx_AFTER_DELETE` AFTER DELETE ON `EScPExRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityScalarDataPropertyRestrictionAxioms(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`EScPRAx`;
-- ElementCrossReferenceTuples(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityScalarDataPropertyExistentialRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EScPPtrRAx` (EntityScalarDataPropertyParticularRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPPtrRAx_AFTER_INSERT` AFTER INSERT ON `EScPPtrRAx` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityScalarDataPropertyRestrictionAxioms(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`EScPRAx`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- NonCrossReferencableKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`NonCRBK`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
-- ValueCrossReferenceTuples(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`ValCRefTs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPPtrRAx_AFTER_DELETE` AFTER DELETE ON `EScPPtrRAx` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityScalarDataPropertyRestrictionAxioms(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`EScPRAx`;
-- IdentityKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- NonCrossReferencableKinds(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`NonCRBK`;
-- TerminologyBoxStatements(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`TermAx`;
-- ValueCrossReferenceTuples(x) if EntityScalarDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`ValCRefTs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EScPUxRAx` (EntityScalarDataPropertyUniversalRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPUxRAx_AFTER_INSERT` AFTER INSERT ON `EScPUxRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityScalarDataPropertyRestrictionAxioms(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`EScPRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EScPUxRAx_AFTER_DELETE` AFTER DELETE ON `EScPUxRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityScalarDataPropertyRestrictionAxioms(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`EScPRAx`;
-- ElementCrossReferenceTuples(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityScalarDataPropertyUniversalRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`EStPPtrRAx` (EntityStructuredDataPropertyParticularRestrictionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EStPPtrRAx_AFTER_INSERT` AFTER INSERT ON `EStPPtrRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- EntityStructuredDataPropertyRestrictionAxioms(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`EStPRAx`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- RestrictionStructuredDataPropertyContexts(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`RStPCtxts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`EStPPtrRAx_AFTER_DELETE` AFTER DELETE ON `EStPPtrRAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`EIdK`;
-- EntityStructuredDataPropertyRestrictionAxioms(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`EStPRAx`;
-- ElementCrossReferenceTuples(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`ModElts`;
-- RestrictionStructuredDataPropertyContexts(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`RStPCtxts`;
-- TerminologyBoxStatements(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if EntityStructuredDataPropertyParticularRestrictionAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RStPTs` (RestrictionStructuredDataPropertyTuples)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RStPTs_AFTER_INSERT` AFTER INSERT ON `RStPTs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- RestrictionStructuredDataPropertyContexts(x) if RestrictionStructuredDataPropertyTuples(x)
insert into `OML`.`RStPCtxts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RStPTs_AFTER_DELETE` AFTER DELETE ON `RStPTs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`ModElts`;
-- RestrictionStructuredDataPropertyContexts(x) if RestrictionStructuredDataPropertyTuples(x)
delete from `OML`.`RStPCtxts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RScPVals` (RestrictionScalarDataPropertyValues)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RScPVals_AFTER_INSERT` AFTER INSERT ON `RScPVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if RestrictionScalarDataPropertyValues(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if RestrictionScalarDataPropertyValues(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if RestrictionScalarDataPropertyValues(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if RestrictionScalarDataPropertyValues(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- NonCrossReferencableKinds(x) if RestrictionScalarDataPropertyValues(x)
insert into `OML`.`NonCRBK`(`uuid`) values(new.`uuid`);
-- ValueCrossReferenceTuples(x) if RestrictionScalarDataPropertyValues(x)
insert into `OML`.`ValCRefTs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RScPVals_AFTER_DELETE` AFTER DELETE ON `RScPVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if RestrictionScalarDataPropertyValues(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if RestrictionScalarDataPropertyValues(x)
delete from `OML`.`EIdK`;
-- IdentityKinds(x) if RestrictionScalarDataPropertyValues(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if RestrictionScalarDataPropertyValues(x)
delete from `OML`.`LogEs`;
-- NonCrossReferencableKinds(x) if RestrictionScalarDataPropertyValues(x)
delete from `OML`.`NonCRBK`;
-- ValueCrossReferenceTuples(x) if RestrictionScalarDataPropertyValues(x)
delete from `OML`.`ValCRefTs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`AspectSpeAx` (AspectSpecializationAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AspectSpeAx_AFTER_INSERT` AFTER INSERT ON `AspectSpeAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AspectSpecializationAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if AspectSpecializationAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if AspectSpecializationAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if AspectSpecializationAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if AspectSpecializationAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if AspectSpecializationAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if AspectSpecializationAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- SpecializationAxioms(x) if AspectSpecializationAxioms(x)
insert into `OML`.`SpeAx`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if AspectSpecializationAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if AspectSpecializationAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AspectSpeAx_AFTER_DELETE` AFTER DELETE ON `AspectSpeAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AspectSpecializationAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if AspectSpecializationAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if AspectSpecializationAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if AspectSpecializationAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if AspectSpecializationAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if AspectSpecializationAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if AspectSpecializationAxioms(x)
delete from `OML`.`ModElts`;
-- SpecializationAxioms(x) if AspectSpecializationAxioms(x)
delete from `OML`.`SpeAx`;
-- TerminologyBoxStatements(x) if AspectSpecializationAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if AspectSpecializationAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`CSpeAx` (ConceptSpecializationAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CSpeAx_AFTER_INSERT` AFTER INSERT ON `CSpeAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- SpecializationAxioms(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`SpeAx`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if ConceptSpecializationAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CSpeAx_AFTER_DELETE` AFTER DELETE ON `CSpeAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`ModElts`;
-- SpecializationAxioms(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`SpeAx`;
-- TerminologyBoxStatements(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if ConceptSpecializationAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRSpeAx` (ReifiedRelationshipSpecializationAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRSpeAx_AFTER_INSERT` AFTER INSERT ON `RRSpeAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- SpecializationAxioms(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`SpeAx`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if ReifiedRelationshipSpecializationAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRSpeAx_AFTER_DELETE` AFTER DELETE ON `RRSpeAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`ModElts`;
-- SpecializationAxioms(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`SpeAx`;
-- TerminologyBoxStatements(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if ReifiedRelationshipSpecializationAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`SubDataPropOfAx` (SubDataPropertyOfAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SubDataPropOfAx_AFTER_INSERT` AFTER INSERT ON `SubDataPropOfAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if SubDataPropertyOfAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SubDataPropOfAx_AFTER_DELETE` AFTER DELETE ON `SubDataPropOfAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if SubDataPropertyOfAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`SubObjectPropOfAx` (SubObjectPropertyOfAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SubObjectPropOfAx_AFTER_INSERT` AFTER INSERT ON `SubObjectPropOfAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBoxStatements(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`TBoxSt`(`uuid`) values(new.`uuid`);
-- TermAxioms(x) if SubObjectPropertyOfAxioms(x)
insert into `OML`.`TermAx`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SubObjectPropOfAx_AFTER_DELETE` AFTER DELETE ON `SubObjectPropOfAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBoxStatements(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`TBoxSt`;
-- TermAxioms(x) if SubObjectPropertyOfAxioms(x)
delete from `OML`.`TermAx`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RootCTaxonomyAx` (RootConceptTaxonomyAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RootCTaxonomyAx_AFTER_INSERT` AFTER INSERT ON `RootCTaxonomyAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ConceptTreeDisjunctions(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`CTreeDsju`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyBundleStatements(x) if RootConceptTaxonomyAxioms(x)
insert into `OML`.`TlgyBdlSt`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RootCTaxonomyAx_AFTER_DELETE` AFTER DELETE ON `RootCTaxonomyAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`CRTK`;
-- ConceptTreeDisjunctions(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`CTreeDsju`;
-- ExtrinsicIdentityKinds(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`ModElts`;
-- TerminologyBundleStatements(x) if RootConceptTaxonomyAxioms(x)
delete from `OML`.`TlgyBdlSt`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`AnonymousCUnionAx` (AnonymousConceptUnionAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AnonymousCUnionAx_AFTER_INSERT` AFTER INSERT ON `AnonymousCUnionAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ConceptTreeDisjunctions(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`CTreeDsju`(`uuid`) values(new.`uuid`);
-- DisjointUnionOfConceptsAxioms(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`DsjUOfCsAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if AnonymousConceptUnionAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AnonymousCUnionAx_AFTER_DELETE` AFTER DELETE ON `AnonymousCUnionAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`CRTK`;
-- ConceptTreeDisjunctions(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`CTreeDsju`;
-- DisjointUnionOfConceptsAxioms(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`DsjUOfCsAx`;
-- ExtrinsicIdentityKinds(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if AnonymousConceptUnionAxioms(x)
delete from `OML`.`LogEs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`SpeDsjtCAx` (SpecificDisjointConceptAxioms)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SpeDsjtCAx_AFTER_INSERT` AFTER INSERT ON `SpeDsjtCAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SpecificDisjointConceptAxioms(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if SpecificDisjointConceptAxioms(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- DisjointUnionOfConceptsAxioms(x) if SpecificDisjointConceptAxioms(x)
insert into `OML`.`DsjUOfCsAx`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if SpecificDisjointConceptAxioms(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if SpecificDisjointConceptAxioms(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if SpecificDisjointConceptAxioms(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if SpecificDisjointConceptAxioms(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`SpeDsjtCAx_AFTER_DELETE` AFTER DELETE ON `SpeDsjtCAx` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SpecificDisjointConceptAxioms(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if SpecificDisjointConceptAxioms(x)
delete from `OML`.`CRTK`;
-- DisjointUnionOfConceptsAxioms(x) if SpecificDisjointConceptAxioms(x)
delete from `OML`.`DsjUOfCsAx`;
-- ExtrinsicIdentityKinds(x) if SpecificDisjointConceptAxioms(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if SpecificDisjointConceptAxioms(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if SpecificDisjointConceptAxioms(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if SpecificDisjointConceptAxioms(x)
delete from `OML`.`LogEs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`CIs` (ConceptInstances)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CIs_AFTER_INSERT` AFTER INSERT ON `CIs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptInstances(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ConceptInstances(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ConceptualEntitySingletonInstances(x) if ConceptInstances(x)
insert into `OML`.`CualESI`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if ConceptInstances(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ConceptInstances(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ConceptInstances(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ConceptInstances(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if ConceptInstances(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyInstanceAssertions(x) if ConceptInstances(x)
insert into `OML`.`TlgyIAsts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`CIs_AFTER_DELETE` AFTER DELETE ON `CIs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ConceptInstances(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ConceptInstances(x)
delete from `OML`.`CRTK`;
-- ConceptualEntitySingletonInstances(x) if ConceptInstances(x)
delete from `OML`.`CualESI`;
-- IntrinsicIdentityKinds(x) if ConceptInstances(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if ConceptInstances(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ConceptInstances(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ConceptInstances(x)
delete from `OML`.`ModElts`;
-- Resources(x) if ConceptInstances(x)
delete from `OML`.`Ress`;
-- TerminologyInstanceAssertions(x) if ConceptInstances(x)
delete from `OML`.`TlgyIAsts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRIs` (ReifiedRelationshipInstances)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRIs_AFTER_INSERT` AFTER INSERT ON `RRIs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ConceptualEntitySingletonInstances(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`CualESI`(`uuid`) values(new.`uuid`);
-- IntrinsicIdentityKinds(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`IIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- Resources(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`Ress`(`uuid`) values(new.`uuid`);
-- TerminologyInstanceAssertions(x) if ReifiedRelationshipInstances(x)
insert into `OML`.`TlgyIAsts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRIs_AFTER_DELETE` AFTER DELETE ON `RRIs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`CRTK`;
-- ConceptualEntitySingletonInstances(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`CualESI`;
-- IntrinsicIdentityKinds(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`IIdK`;
-- IdentityKinds(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`ModElts`;
-- Resources(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`Ress`;
-- TerminologyInstanceAssertions(x) if ReifiedRelationshipInstances(x)
delete from `OML`.`TlgyIAsts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRIDomains` (ReifiedRelationshipInstanceDomains)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRIDomains_AFTER_INSERT` AFTER INSERT ON `RRIDomains` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyInstanceAssertions(x) if ReifiedRelationshipInstanceDomains(x)
insert into `OML`.`TlgyIAsts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRIDomains_AFTER_DELETE` AFTER DELETE ON `RRIDomains` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`ModElts`;
-- TerminologyInstanceAssertions(x) if ReifiedRelationshipInstanceDomains(x)
delete from `OML`.`TlgyIAsts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`RRIRanges` (ReifiedRelationshipInstanceRanges)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRIRanges_AFTER_INSERT` AFTER INSERT ON `RRIRanges` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyInstanceAssertions(x) if ReifiedRelationshipInstanceRanges(x)
insert into `OML`.`TlgyIAsts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`RRIRanges_AFTER_DELETE` AFTER DELETE ON `RRIRanges` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`ModElts`;
-- TerminologyInstanceAssertions(x) if ReifiedRelationshipInstanceRanges(x)
delete from `OML`.`TlgyIAsts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`URITs` (UnreifiedRelationshipInstanceTuples)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URITs_AFTER_INSERT` AFTER INSERT ON `URITs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- TerminologyInstanceAssertions(x) if UnreifiedRelationshipInstanceTuples(x)
insert into `OML`.`TlgyIAsts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`URITs_AFTER_DELETE` AFTER DELETE ON `URITs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`ModElts`;
-- TerminologyInstanceAssertions(x) if UnreifiedRelationshipInstanceTuples(x)
delete from `OML`.`TlgyIAsts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`S1IStPVals` (SingletonInstanceStructuredDataPropertyValues)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`S1IStPVals_AFTER_INSERT` AFTER INSERT ON `S1IStPVals` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- SingletonInstanceStructuredDataPropertyContexts(x) if SingletonInstanceStructuredDataPropertyValues(x)
insert into `OML`.`S1IStPCtxts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`S1IStPVals_AFTER_DELETE` AFTER DELETE ON `S1IStPVals` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`ModElts`;
-- SingletonInstanceStructuredDataPropertyContexts(x) if SingletonInstanceStructuredDataPropertyValues(x)
delete from `OML`.`S1IStPCtxts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`S1IScPVals` (SingletonInstanceScalarDataPropertyValues)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`S1IScPVals_AFTER_INSERT` AFTER INSERT ON `S1IScPVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if SingletonInstanceScalarDataPropertyValues(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- ModuleElements(x) if SingletonInstanceScalarDataPropertyValues(x)
insert into `OML`.`ModElts`(`uuid`) values(new.`uuid`);
-- NonCrossReferencableKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
insert into `OML`.`NonCRBK`(`uuid`) values(new.`uuid`);
-- ValueCrossReferenceTuples(x) if SingletonInstanceScalarDataPropertyValues(x)
insert into `OML`.`ValCRefTs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`S1IScPVals_AFTER_DELETE` AFTER DELETE ON `S1IScPVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
delete from `OML`.`EIdK`;
-- IdentityKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if SingletonInstanceScalarDataPropertyValues(x)
delete from `OML`.`LogEs`;
-- ModuleElements(x) if SingletonInstanceScalarDataPropertyValues(x)
delete from `OML`.`ModElts`;
-- NonCrossReferencableKinds(x) if SingletonInstanceScalarDataPropertyValues(x)
delete from `OML`.`NonCRBK`;
-- ValueCrossReferenceTuples(x) if SingletonInstanceScalarDataPropertyValues(x)
delete from `OML`.`ValCRefTs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`StPTs` (StructuredDataPropertyTuples)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`StPTs_AFTER_INSERT` AFTER INSERT ON `StPTs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if StructuredDataPropertyTuples(x)
insert into `OML`.`CRBK`(`uuid`) values(new.`uuid`);
-- CrossReferencabilityKinds(x) if StructuredDataPropertyTuples(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if StructuredDataPropertyTuples(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- ElementCrossReferenceTuples(x) if StructuredDataPropertyTuples(x)
insert into `OML`.`EltCRefTs`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if StructuredDataPropertyTuples(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if StructuredDataPropertyTuples(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- SingletonInstanceStructuredDataPropertyContexts(x) if StructuredDataPropertyTuples(x)
insert into `OML`.`S1IStPCtxts`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`StPTs_AFTER_DELETE` AFTER DELETE ON `StPTs` FOR EACH ROW
BEGIN
-- CrossReferencableKinds(x) if StructuredDataPropertyTuples(x)
delete from `OML`.`CRBK`;
-- CrossReferencabilityKinds(x) if StructuredDataPropertyTuples(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if StructuredDataPropertyTuples(x)
delete from `OML`.`EIdK`;
-- ElementCrossReferenceTuples(x) if StructuredDataPropertyTuples(x)
delete from `OML`.`EltCRefTs`;
-- IdentityKinds(x) if StructuredDataPropertyTuples(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if StructuredDataPropertyTuples(x)
delete from `OML`.`LogEs`;
-- SingletonInstanceStructuredDataPropertyContexts(x) if StructuredDataPropertyTuples(x)
delete from `OML`.`S1IStPCtxts`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`ScPVals` (ScalarDataPropertyValues)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScPVals_AFTER_INSERT` AFTER INSERT ON `ScPVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if ScalarDataPropertyValues(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if ScalarDataPropertyValues(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if ScalarDataPropertyValues(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- LogicalElements(x) if ScalarDataPropertyValues(x)
insert into `OML`.`LogEs`(`uuid`) values(new.`uuid`);
-- NonCrossReferencableKinds(x) if ScalarDataPropertyValues(x)
insert into `OML`.`NonCRBK`(`uuid`) values(new.`uuid`);
-- ValueCrossReferenceTuples(x) if ScalarDataPropertyValues(x)
insert into `OML`.`ValCRefTs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`ScPVals_AFTER_DELETE` AFTER DELETE ON `ScPVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if ScalarDataPropertyValues(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if ScalarDataPropertyValues(x)
delete from `OML`.`EIdK`;
-- IdentityKinds(x) if ScalarDataPropertyValues(x)
delete from `OML`.`Ik`;
-- LogicalElements(x) if ScalarDataPropertyValues(x)
delete from `OML`.`LogEs`;
-- NonCrossReferencableKinds(x) if ScalarDataPropertyValues(x)
delete from `OML`.`NonCRBK`;
-- ValueCrossReferenceTuples(x) if ScalarDataPropertyValues(x)
delete from `OML`.`ValCRefTs`;
END$$

-- -----------------------------------------------------
-- Concrete Information Table `OML`.`AnnotPropVals` (AnnotationPropertyValues)
-- -----------------------------------------------------

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AnnotPropVals_AFTER_INSERT` AFTER INSERT ON `AnnotPropVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if AnnotationPropertyValues(x)
insert into `OML`.`CRTK`(`uuid`) values(new.`uuid`);
-- ExtrinsicIdentityKinds(x) if AnnotationPropertyValues(x)
insert into `OML`.`EIdK`(`uuid`) values(new.`uuid`);
-- IdentityKinds(x) if AnnotationPropertyValues(x)
insert into `OML`.`Ik`(`uuid`) values(new.`uuid`);
-- NonCrossReferencableKinds(x) if AnnotationPropertyValues(x)
insert into `OML`.`NonCRBK`(`uuid`) values(new.`uuid`);
-- NonLogicalElements(x) if AnnotationPropertyValues(x)
insert into `OML`.`NonLogEs`(`uuid`) values(new.`uuid`);
-- ValueCrossReferenceTuples(x) if AnnotationPropertyValues(x)
insert into `OML`.`ValCRefTs`(`uuid`) values(new.`uuid`);
END$$

DELIMITER $$
USE `OML`$$
CREATE DEFINER = CURRENT_USER TRIGGER `OML`.`AnnotPropVals_AFTER_DELETE` AFTER DELETE ON `AnnotPropVals` FOR EACH ROW
BEGIN
-- CrossReferencabilityKinds(x) if AnnotationPropertyValues(x)
delete from `OML`.`CRTK`;
-- ExtrinsicIdentityKinds(x) if AnnotationPropertyValues(x)
delete from `OML`.`EIdK`;
-- IdentityKinds(x) if AnnotationPropertyValues(x)
delete from `OML`.`Ik`;
-- NonCrossReferencableKinds(x) if AnnotationPropertyValues(x)
delete from `OML`.`NonCRBK`;
-- NonLogicalElements(x) if AnnotationPropertyValues(x)
delete from `OML`.`NonLogEs`;
-- ValueCrossReferenceTuples(x) if AnnotationPropertyValues(x)
delete from `OML`.`ValCRefTs`;
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
