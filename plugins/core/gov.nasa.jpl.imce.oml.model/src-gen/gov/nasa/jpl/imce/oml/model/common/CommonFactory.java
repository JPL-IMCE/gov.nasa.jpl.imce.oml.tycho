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
package gov.nasa.jpl.imce.oml.model.common;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc -->
 * @see gov.nasa.jpl.imce.oml.model.common.CommonPackage
 * @generated
 */
public interface CommonFactory extends EFactory {
	/**
	 * The singleton instance of the factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	CommonFactory eINSTANCE = gov.nasa.jpl.imce.oml.model.common.impl.CommonFactoryImpl.init();

	/**
	 * Returns a new object of class '<em>Literal Pattern</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Literal Pattern</em>'.
	 * @generated
	 */
	LiteralPattern createLiteralPattern();

	/**
	 * Returns a new object of class '<em>Literal Date Time</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Literal Date Time</em>'.
	 * @generated
	 */
	LiteralDateTime createLiteralDateTime();

	/**
	 * Returns a new object of class '<em>Literal Language Tag</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Literal Language Tag</em>'.
	 * @generated
	 */
	LiteralLanguageTag createLiteralLanguageTag();

	/**
	 * Returns a new object of class '<em>Literal String</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Literal String</em>'.
	 * @generated
	 */
	LiteralString createLiteralString();

	/**
	 * Returns a new object of class '<em>Literal UUID</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Literal UUID</em>'.
	 * @generated
	 */
	LiteralUUID createLiteralUUID();

	/**
	 * Returns a new object of class '<em>Literal URI</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Literal URI</em>'.
	 * @generated
	 */
	LiteralURI createLiteralURI();

	/**
	 * Returns a new object of class '<em>Literal Number</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Literal Number</em>'.
	 * @generated
	 */
	LiteralNumber createLiteralNumber();

	/**
	 * Returns a new object of class '<em>Annotation Property Value</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Annotation Property Value</em>'.
	 * @generated
	 */
	AnnotationPropertyValue createAnnotationPropertyValue();

	/**
	 * Returns a new object of class '<em>Annotation Property</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Annotation Property</em>'.
	 * @generated
	 */
	AnnotationProperty createAnnotationProperty();

	/**
	 * Returns a new object of class '<em>Extent</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Extent</em>'.
	 * @generated
	 */
	Extent createExtent();

	/**
	 * Returns the package supported by this factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the package supported by this factory.
	 * @generated
	 */
	CommonPackage getCommonPackage();

} //CommonFactory
