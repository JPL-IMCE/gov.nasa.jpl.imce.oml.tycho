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
package gov.nasa.jpl.imce.oml.model.descriptions;

import gov.nasa.jpl.imce.oml.model.common.ElementCrossReferenceTuple;
import gov.nasa.jpl.imce.oml.model.common.LogicalElement;

import gov.nasa.jpl.imce.oml.model.terminologies.DataRelationshipToStructure;

import org.eclipse.emf.common.util.EList;

/**
 * <!-- begin-user-doc -->
 * A representation of the model object '<em><b>Singleton Instance Structured Data Property Context</b></em>'.
 * <!-- end-user-doc -->
 *
 * <!-- begin-model-doc -->
 * An OML SingletonInstanceStructuredDataPropertyContext defines the context of
 * an OML DataRelationshipToStructure for an insance of either an OML Concept or OML Structure
 * for specifying values of its data properties
 * via nested OML StructuredDataPropertyTuple(s) and OML ScalarDataPropertyValue(s).
 * <!-- end-model-doc -->
 *
 * <p>
 * The following features are supported:
 * </p>
 * <ul>
 *   <li>{@link gov.nasa.jpl.imce.oml.model.descriptions.SingletonInstanceStructuredDataPropertyContext#getStructuredDataProperty <em>Structured Data Property</em>}</li>
 *   <li>{@link gov.nasa.jpl.imce.oml.model.descriptions.SingletonInstanceStructuredDataPropertyContext#getStructuredPropertyTuples <em>Structured Property Tuples</em>}</li>
 *   <li>{@link gov.nasa.jpl.imce.oml.model.descriptions.SingletonInstanceStructuredDataPropertyContext#getScalarDataPropertyValues <em>Scalar Data Property Values</em>}</li>
 * </ul>
 *
 * @see gov.nasa.jpl.imce.oml.model.descriptions.DescriptionsPackage#getSingletonInstanceStructuredDataPropertyContext()
 * @model abstract="true"
 * @generated
 */
public interface SingletonInstanceStructuredDataPropertyContext extends ElementCrossReferenceTuple {
	/**
	 * Returns the value of the '<em><b>Structured Data Property</b></em>' reference.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Structured Data Property</em>' reference isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Structured Data Property</em>' reference.
	 * @see #setStructuredDataProperty(DataRelationshipToStructure)
	 * @see gov.nasa.jpl.imce.oml.model.descriptions.DescriptionsPackage#getSingletonInstanceStructuredDataPropertyContext_StructuredDataProperty()
	 * @model required="true"
	 * @generated
	 */
	DataRelationshipToStructure getStructuredDataProperty();

	/**
	 * Sets the value of the '{@link gov.nasa.jpl.imce.oml.model.descriptions.SingletonInstanceStructuredDataPropertyContext#getStructuredDataProperty <em>Structured Data Property</em>}' reference.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param value the new value of the '<em>Structured Data Property</em>' reference.
	 * @see #getStructuredDataProperty()
	 * @generated
	 */
	void setStructuredDataProperty(DataRelationshipToStructure value);

	/**
	 * Returns the value of the '<em><b>Structured Property Tuples</b></em>' containment reference list.
	 * The list contents are of type {@link gov.nasa.jpl.imce.oml.model.descriptions.StructuredDataPropertyTuple}.
	 * It is bidirectional and its opposite is '{@link gov.nasa.jpl.imce.oml.model.descriptions.StructuredDataPropertyTuple#getStructuredDataPropertyContext <em>Structured Data Property Context</em>}'.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Structured Property Tuples</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Structured Property Tuples</em>' containment reference list.
	 * @see gov.nasa.jpl.imce.oml.model.descriptions.DescriptionsPackage#getSingletonInstanceStructuredDataPropertyContext_StructuredPropertyTuples()
	 * @see gov.nasa.jpl.imce.oml.model.descriptions.StructuredDataPropertyTuple#getStructuredDataPropertyContext
	 * @model opposite="structuredDataPropertyContext" containment="true"
	 *        annotation="http://imce.jpl.nasa.gov/oml/Collection kind='Set'"
	 * @generated
	 */
	EList<StructuredDataPropertyTuple> getStructuredPropertyTuples();

	/**
	 * Returns the value of the '<em><b>Scalar Data Property Values</b></em>' containment reference list.
	 * The list contents are of type {@link gov.nasa.jpl.imce.oml.model.descriptions.ScalarDataPropertyValue}.
	 * It is bidirectional and its opposite is '{@link gov.nasa.jpl.imce.oml.model.descriptions.ScalarDataPropertyValue#getStructuredDataPropertyContext <em>Structured Data Property Context</em>}'.
	 * <!-- begin-user-doc -->
	 * <p>
	 * If the meaning of the '<em>Scalar Data Property Values</em>' containment reference list isn't clear,
	 * there really should be more of a description here...
	 * </p>
	 * <!-- end-user-doc -->
	 * @return the value of the '<em>Scalar Data Property Values</em>' containment reference list.
	 * @see gov.nasa.jpl.imce.oml.model.descriptions.DescriptionsPackage#getSingletonInstanceStructuredDataPropertyContext_ScalarDataPropertyValues()
	 * @see gov.nasa.jpl.imce.oml.model.descriptions.ScalarDataPropertyValue#getStructuredDataPropertyContext
	 * @model opposite="structuredDataPropertyContext" containment="true"
	 *        annotation="http://imce.jpl.nasa.gov/oml/Collection kind='Set'"
	 * @generated
	 */
	EList<ScalarDataPropertyValue> getScalarDataPropertyValues();

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @model unique="false"
	 * @generated
	 */
	DescriptionBox descriptionBox();

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @model unique="false"
	 *        annotation="http://www.eclipse.org/emf/2002/GenModel body='return this.descriptionBox();'"
	 * @generated
	 */
	gov.nasa.jpl.imce.oml.model.common.Module moduleContext();

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @model unique="false"
	 *        annotation="http://imce.jpl.nasa.gov/oml/Scala code='extent.lookupStructuredPropertyTuples(this).flatMap{ r =&gt; scala.collection.immutable.Set.empty[resolver.api.LogicalElement] + r ++ r.allNestedRestrictionElements() } ++\n\t\textent.lookupScalarDataPropertyValues(this)'"
	 *        annotation="http://imce.jpl.nasa.gov/oml/Collection kind='Set'"
	 *        annotation="http://www.eclipse.org/emf/2002/GenModel body='&lt;%org.eclipse.emf.common.util.BasicEList%&gt;&lt;&lt;%gov.nasa.jpl.imce.oml.model.common.LogicalElement%&gt;&gt; _xblockexpression = null;\n{\n\tfinal &lt;%org.eclipse.emf.common.util.BasicEList%&gt;&lt;&lt;%gov.nasa.jpl.imce.oml.model.common.LogicalElement%&gt;&gt; nres = new &lt;%org.eclipse.emf.common.util.BasicEList%&gt;&lt;&lt;%gov.nasa.jpl.imce.oml.model.common.LogicalElement%&gt;&gt;();\n\tnres.addAll(this.getStructuredPropertyTuples());\n\tfinal &lt;%java.util.function.Consumer%&gt;&lt;&lt;%gov.nasa.jpl.imce.oml.model.descriptions.StructuredDataPropertyTuple%&gt;&gt; _function = new &lt;%java.util.function.Consumer%&gt;&lt;&lt;%gov.nasa.jpl.imce.oml.model.descriptions.StructuredDataPropertyTuple%&gt;&gt;()\n\t{\n\t\tpublic void accept(final &lt;%gov.nasa.jpl.imce.oml.model.descriptions.StructuredDataPropertyTuple%&gt; it)\n\t\t{\n\t\t\tnres.addAll(it.allNestedRestrictionElements());\n\t\t}\n\t};\n\tthis.getStructuredPropertyTuples().forEach(_function);\n\tnres.addAll(this.getScalarDataPropertyValues());\n\t_xblockexpression = nres;\n}\nreturn _xblockexpression;'"
	 * @generated
	 */
	EList<LogicalElement> allNestedRestrictionElements();

} // SingletonInstanceStructuredDataPropertyContext
