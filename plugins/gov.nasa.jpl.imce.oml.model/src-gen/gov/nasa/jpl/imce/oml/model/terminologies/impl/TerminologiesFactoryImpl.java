/**
 * 
 * Copyright 2017 California Institute of Technology ("Caltech").
 * U.S. Government sponsorship acknowledged.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * 
 */
package gov.nasa.jpl.imce.oml.model.terminologies.impl;

import gov.nasa.jpl.imce.oml.model.terminologies.*;

import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EDataType;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;

import org.eclipse.emf.ecore.impl.EFactoryImpl;

import org.eclipse.emf.ecore.plugin.EcorePlugin;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Factory</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class TerminologiesFactoryImpl extends EFactoryImpl implements TerminologiesFactory {
	/**
	 * Creates the default factory implementation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public static TerminologiesFactory init() {
		try {
			TerminologiesFactory theTerminologiesFactory = (TerminologiesFactory)EPackage.Registry.INSTANCE.getEFactory(TerminologiesPackage.eNS_URI);
			if (theTerminologiesFactory != null) {
				return theTerminologiesFactory;
			}
		}
		catch (Exception exception) {
			EcorePlugin.INSTANCE.log(exception);
		}
		return new TerminologiesFactoryImpl();
	}

	/**
	 * Creates an instance of the factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public TerminologiesFactoryImpl() {
		super();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public EObject create(EClass eClass) {
		switch (eClass.getClassifierID()) {
			case TerminologiesPackage.TERMINOLOGY_EXTENSION_AXIOM: return createTerminologyExtensionAxiom();
			case TerminologiesPackage.ASPECT: return createAspect();
			case TerminologiesPackage.CARDINALITY_RESTRICTED_ASPECT: return createCardinalityRestrictedAspect();
			case TerminologiesPackage.CONCEPT: return createConcept();
			case TerminologiesPackage.CARDINALITY_RESTRICTED_CONCEPT: return createCardinalityRestrictedConcept();
			case TerminologiesPackage.FORWARD_PROPERTY: return createForwardProperty();
			case TerminologiesPackage.INVERSE_PROPERTY: return createInverseProperty();
			case TerminologiesPackage.REIFIED_RELATIONSHIP: return createReifiedRelationship();
			case TerminologiesPackage.REIFIED_RELATIONSHIP_RESTRICTION: return createReifiedRelationshipRestriction();
			case TerminologiesPackage.CARDINALITY_RESTRICTED_REIFIED_RELATIONSHIP: return createCardinalityRestrictedReifiedRelationship();
			case TerminologiesPackage.UNREIFIED_RELATIONSHIP: return createUnreifiedRelationship();
			case TerminologiesPackage.SCALAR: return createScalar();
			case TerminologiesPackage.ENTITY_STRUCTURED_DATA_PROPERTY: return createEntityStructuredDataProperty();
			case TerminologiesPackage.ENTITY_SCALAR_DATA_PROPERTY: return createEntityScalarDataProperty();
			case TerminologiesPackage.STRUCTURED_DATA_PROPERTY: return createStructuredDataProperty();
			case TerminologiesPackage.SCALAR_DATA_PROPERTY: return createScalarDataProperty();
			case TerminologiesPackage.STRUCTURE: return createStructure();
			case TerminologiesPackage.CHAIN_RULE: return createChainRule();
			case TerminologiesPackage.RULE_BODY_SEGMENT: return createRuleBodySegment();
			case TerminologiesPackage.SEGMENT_PREDICATE: return createSegmentPredicate();
			case TerminologiesPackage.ENTITY_EXISTENTIAL_RESTRICTION_AXIOM: return createEntityExistentialRestrictionAxiom();
			case TerminologiesPackage.ENTITY_UNIVERSAL_RESTRICTION_AXIOM: return createEntityUniversalRestrictionAxiom();
			case TerminologiesPackage.ASPECT_SPECIALIZATION_AXIOM: return createAspectSpecializationAxiom();
			case TerminologiesPackage.CONCEPT_SPECIALIZATION_AXIOM: return createConceptSpecializationAxiom();
			case TerminologiesPackage.REIFIED_RELATIONSHIP_SPECIALIZATION_AXIOM: return createReifiedRelationshipSpecializationAxiom();
			case TerminologiesPackage.SUB_OBJECT_PROPERTY_OF_AXIOM: return createSubObjectPropertyOfAxiom();
			case TerminologiesPackage.SUB_DATA_PROPERTY_OF_AXIOM: return createSubDataPropertyOfAxiom();
			case TerminologiesPackage.ENTITY_SCALAR_DATA_PROPERTY_EXISTENTIAL_RESTRICTION_AXIOM: return createEntityScalarDataPropertyExistentialRestrictionAxiom();
			case TerminologiesPackage.ENTITY_SCALAR_DATA_PROPERTY_UNIVERSAL_RESTRICTION_AXIOM: return createEntityScalarDataPropertyUniversalRestrictionAxiom();
			case TerminologiesPackage.ENTITY_SCALAR_DATA_PROPERTY_PARTICULAR_RESTRICTION_AXIOM: return createEntityScalarDataPropertyParticularRestrictionAxiom();
			case TerminologiesPackage.ENTITY_STRUCTURED_DATA_PROPERTY_PARTICULAR_RESTRICTION_AXIOM: return createEntityStructuredDataPropertyParticularRestrictionAxiom();
			case TerminologiesPackage.RESTRICTION_STRUCTURED_DATA_PROPERTY_TUPLE: return createRestrictionStructuredDataPropertyTuple();
			case TerminologiesPackage.RESTRICTION_SCALAR_DATA_PROPERTY_VALUE: return createRestrictionScalarDataPropertyValue();
			case TerminologiesPackage.BINARY_SCALAR_RESTRICTION: return createBinaryScalarRestriction();
			case TerminologiesPackage.IRI_SCALAR_RESTRICTION: return createIRIScalarRestriction();
			case TerminologiesPackage.NUMERIC_SCALAR_RESTRICTION: return createNumericScalarRestriction();
			case TerminologiesPackage.PLAIN_LITERAL_SCALAR_RESTRICTION: return createPlainLiteralScalarRestriction();
			case TerminologiesPackage.STRING_SCALAR_RESTRICTION: return createStringScalarRestriction();
			case TerminologiesPackage.TIME_SCALAR_RESTRICTION: return createTimeScalarRestriction();
			case TerminologiesPackage.SYNONYM_SCALAR_RESTRICTION: return createSynonymScalarRestriction();
			case TerminologiesPackage.SCALAR_ONE_OF_RESTRICTION: return createScalarOneOfRestriction();
			case TerminologiesPackage.SCALAR_ONE_OF_LITERAL_AXIOM: return createScalarOneOfLiteralAxiom();
			default:
				throw new IllegalArgumentException("The class '" + eClass.getName() + "' is not a valid classifier");
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object createFromString(EDataType eDataType, String initialValue) {
		switch (eDataType.getClassifierID()) {
			case TerminologiesPackage.TERMINOLOGY_KIND:
				return createTerminologyKindFromString(eDataType, initialValue);
			case TerminologiesPackage.CARDINALITY_RESTRICTION_KIND:
				return createCardinalityRestrictionKindFromString(eDataType, initialValue);
			default:
				throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public String convertToString(EDataType eDataType, Object instanceValue) {
		switch (eDataType.getClassifierID()) {
			case TerminologiesPackage.TERMINOLOGY_KIND:
				return convertTerminologyKindToString(eDataType, instanceValue);
			case TerminologiesPackage.CARDINALITY_RESTRICTION_KIND:
				return convertCardinalityRestrictionKindToString(eDataType, instanceValue);
			default:
				throw new IllegalArgumentException("The datatype '" + eDataType.getName() + "' is not a valid classifier");
		}
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public TerminologyExtensionAxiom createTerminologyExtensionAxiom() {
		TerminologyExtensionAxiomImpl terminologyExtensionAxiom = new TerminologyExtensionAxiomImpl();
		return terminologyExtensionAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Aspect createAspect() {
		AspectImpl aspect = new AspectImpl();
		return aspect;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public CardinalityRestrictedAspect createCardinalityRestrictedAspect() {
		CardinalityRestrictedAspectImpl cardinalityRestrictedAspect = new CardinalityRestrictedAspectImpl();
		return cardinalityRestrictedAspect;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Concept createConcept() {
		ConceptImpl concept = new ConceptImpl();
		return concept;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public CardinalityRestrictedConcept createCardinalityRestrictedConcept() {
		CardinalityRestrictedConceptImpl cardinalityRestrictedConcept = new CardinalityRestrictedConceptImpl();
		return cardinalityRestrictedConcept;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ForwardProperty createForwardProperty() {
		ForwardPropertyImpl forwardProperty = new ForwardPropertyImpl();
		return forwardProperty;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public InverseProperty createInverseProperty() {
		InversePropertyImpl inverseProperty = new InversePropertyImpl();
		return inverseProperty;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ReifiedRelationship createReifiedRelationship() {
		ReifiedRelationshipImpl reifiedRelationship = new ReifiedRelationshipImpl();
		return reifiedRelationship;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ReifiedRelationshipRestriction createReifiedRelationshipRestriction() {
		ReifiedRelationshipRestrictionImpl reifiedRelationshipRestriction = new ReifiedRelationshipRestrictionImpl();
		return reifiedRelationshipRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public CardinalityRestrictedReifiedRelationship createCardinalityRestrictedReifiedRelationship() {
		CardinalityRestrictedReifiedRelationshipImpl cardinalityRestrictedReifiedRelationship = new CardinalityRestrictedReifiedRelationshipImpl();
		return cardinalityRestrictedReifiedRelationship;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public UnreifiedRelationship createUnreifiedRelationship() {
		UnreifiedRelationshipImpl unreifiedRelationship = new UnreifiedRelationshipImpl();
		return unreifiedRelationship;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Scalar createScalar() {
		ScalarImpl scalar = new ScalarImpl();
		return scalar;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityStructuredDataProperty createEntityStructuredDataProperty() {
		EntityStructuredDataPropertyImpl entityStructuredDataProperty = new EntityStructuredDataPropertyImpl();
		return entityStructuredDataProperty;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityScalarDataProperty createEntityScalarDataProperty() {
		EntityScalarDataPropertyImpl entityScalarDataProperty = new EntityScalarDataPropertyImpl();
		return entityScalarDataProperty;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public StructuredDataProperty createStructuredDataProperty() {
		StructuredDataPropertyImpl structuredDataProperty = new StructuredDataPropertyImpl();
		return structuredDataProperty;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ScalarDataProperty createScalarDataProperty() {
		ScalarDataPropertyImpl scalarDataProperty = new ScalarDataPropertyImpl();
		return scalarDataProperty;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Structure createStructure() {
		StructureImpl structure = new StructureImpl();
		return structure;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ChainRule createChainRule() {
		ChainRuleImpl chainRule = new ChainRuleImpl();
		return chainRule;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public RuleBodySegment createRuleBodySegment() {
		RuleBodySegmentImpl ruleBodySegment = new RuleBodySegmentImpl();
		return ruleBodySegment;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public SegmentPredicate createSegmentPredicate() {
		SegmentPredicateImpl segmentPredicate = new SegmentPredicateImpl();
		return segmentPredicate;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityExistentialRestrictionAxiom createEntityExistentialRestrictionAxiom() {
		EntityExistentialRestrictionAxiomImpl entityExistentialRestrictionAxiom = new EntityExistentialRestrictionAxiomImpl();
		return entityExistentialRestrictionAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityUniversalRestrictionAxiom createEntityUniversalRestrictionAxiom() {
		EntityUniversalRestrictionAxiomImpl entityUniversalRestrictionAxiom = new EntityUniversalRestrictionAxiomImpl();
		return entityUniversalRestrictionAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public AspectSpecializationAxiom createAspectSpecializationAxiom() {
		AspectSpecializationAxiomImpl aspectSpecializationAxiom = new AspectSpecializationAxiomImpl();
		return aspectSpecializationAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ConceptSpecializationAxiom createConceptSpecializationAxiom() {
		ConceptSpecializationAxiomImpl conceptSpecializationAxiom = new ConceptSpecializationAxiomImpl();
		return conceptSpecializationAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ReifiedRelationshipSpecializationAxiom createReifiedRelationshipSpecializationAxiom() {
		ReifiedRelationshipSpecializationAxiomImpl reifiedRelationshipSpecializationAxiom = new ReifiedRelationshipSpecializationAxiomImpl();
		return reifiedRelationshipSpecializationAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public SubObjectPropertyOfAxiom createSubObjectPropertyOfAxiom() {
		SubObjectPropertyOfAxiomImpl subObjectPropertyOfAxiom = new SubObjectPropertyOfAxiomImpl();
		return subObjectPropertyOfAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public SubDataPropertyOfAxiom createSubDataPropertyOfAxiom() {
		SubDataPropertyOfAxiomImpl subDataPropertyOfAxiom = new SubDataPropertyOfAxiomImpl();
		return subDataPropertyOfAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityScalarDataPropertyExistentialRestrictionAxiom createEntityScalarDataPropertyExistentialRestrictionAxiom() {
		EntityScalarDataPropertyExistentialRestrictionAxiomImpl entityScalarDataPropertyExistentialRestrictionAxiom = new EntityScalarDataPropertyExistentialRestrictionAxiomImpl();
		return entityScalarDataPropertyExistentialRestrictionAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityScalarDataPropertyUniversalRestrictionAxiom createEntityScalarDataPropertyUniversalRestrictionAxiom() {
		EntityScalarDataPropertyUniversalRestrictionAxiomImpl entityScalarDataPropertyUniversalRestrictionAxiom = new EntityScalarDataPropertyUniversalRestrictionAxiomImpl();
		return entityScalarDataPropertyUniversalRestrictionAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityScalarDataPropertyParticularRestrictionAxiom createEntityScalarDataPropertyParticularRestrictionAxiom() {
		EntityScalarDataPropertyParticularRestrictionAxiomImpl entityScalarDataPropertyParticularRestrictionAxiom = new EntityScalarDataPropertyParticularRestrictionAxiomImpl();
		return entityScalarDataPropertyParticularRestrictionAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EntityStructuredDataPropertyParticularRestrictionAxiom createEntityStructuredDataPropertyParticularRestrictionAxiom() {
		EntityStructuredDataPropertyParticularRestrictionAxiomImpl entityStructuredDataPropertyParticularRestrictionAxiom = new EntityStructuredDataPropertyParticularRestrictionAxiomImpl();
		return entityStructuredDataPropertyParticularRestrictionAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public RestrictionStructuredDataPropertyTuple createRestrictionStructuredDataPropertyTuple() {
		RestrictionStructuredDataPropertyTupleImpl restrictionStructuredDataPropertyTuple = new RestrictionStructuredDataPropertyTupleImpl();
		return restrictionStructuredDataPropertyTuple;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public RestrictionScalarDataPropertyValue createRestrictionScalarDataPropertyValue() {
		RestrictionScalarDataPropertyValueImpl restrictionScalarDataPropertyValue = new RestrictionScalarDataPropertyValueImpl();
		return restrictionScalarDataPropertyValue;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public BinaryScalarRestriction createBinaryScalarRestriction() {
		BinaryScalarRestrictionImpl binaryScalarRestriction = new BinaryScalarRestrictionImpl();
		return binaryScalarRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public IRIScalarRestriction createIRIScalarRestriction() {
		IRIScalarRestrictionImpl iriScalarRestriction = new IRIScalarRestrictionImpl();
		return iriScalarRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public NumericScalarRestriction createNumericScalarRestriction() {
		NumericScalarRestrictionImpl numericScalarRestriction = new NumericScalarRestrictionImpl();
		return numericScalarRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public PlainLiteralScalarRestriction createPlainLiteralScalarRestriction() {
		PlainLiteralScalarRestrictionImpl plainLiteralScalarRestriction = new PlainLiteralScalarRestrictionImpl();
		return plainLiteralScalarRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public StringScalarRestriction createStringScalarRestriction() {
		StringScalarRestrictionImpl stringScalarRestriction = new StringScalarRestrictionImpl();
		return stringScalarRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public TimeScalarRestriction createTimeScalarRestriction() {
		TimeScalarRestrictionImpl timeScalarRestriction = new TimeScalarRestrictionImpl();
		return timeScalarRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public SynonymScalarRestriction createSynonymScalarRestriction() {
		SynonymScalarRestrictionImpl synonymScalarRestriction = new SynonymScalarRestrictionImpl();
		return synonymScalarRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ScalarOneOfRestriction createScalarOneOfRestriction() {
		ScalarOneOfRestrictionImpl scalarOneOfRestriction = new ScalarOneOfRestrictionImpl();
		return scalarOneOfRestriction;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ScalarOneOfLiteralAxiom createScalarOneOfLiteralAxiom() {
		ScalarOneOfLiteralAxiomImpl scalarOneOfLiteralAxiom = new ScalarOneOfLiteralAxiomImpl();
		return scalarOneOfLiteralAxiom;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public TerminologyKind createTerminologyKindFromString(EDataType eDataType, String initialValue) {
		TerminologyKind result = TerminologyKind.get(initialValue);
		if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String convertTerminologyKindToString(EDataType eDataType, Object instanceValue) {
		return instanceValue == null ? null : instanceValue.toString();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public CardinalityRestrictionKind createCardinalityRestrictionKindFromString(EDataType eDataType, String initialValue) {
		CardinalityRestrictionKind result = CardinalityRestrictionKind.get(initialValue);
		if (result == null) throw new IllegalArgumentException("The value '" + initialValue + "' is not a valid enumerator of '" + eDataType.getName() + "'");
		return result;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public String convertCardinalityRestrictionKindToString(EDataType eDataType, Object instanceValue) {
		return instanceValue == null ? null : instanceValue.toString();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public TerminologiesPackage getTerminologiesPackage() {
		return (TerminologiesPackage)getEPackage();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @deprecated
	 * @generated
	 */
	@Deprecated
	public static TerminologiesPackage getPackage() {
		return TerminologiesPackage.eINSTANCE;
	}

} //TerminologiesFactoryImpl
