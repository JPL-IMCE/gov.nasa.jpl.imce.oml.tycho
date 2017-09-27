/*
 * Copyright 2017 California Institute of Technology ("Caltech").
 * U.S. Government sponsorship acknowledged.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * License Terms
 */

package gov.nasa.jpl.imce.oml.viewpoint

import gov.nasa.jpl.imce.oml.model.graphs.TerminologyGraph
import gov.nasa.jpl.imce.oml.model.terminologies.Aspect
import gov.nasa.jpl.imce.oml.model.terminologies.Entity
import gov.nasa.jpl.imce.oml.model.terminologies.SpecializationAxiom
import gov.nasa.jpl.imce.oml.model.terminologies.TerminologyBox
import java.util.HashSet
import java.util.Set
import org.eclipse.emf.ecore.EObject
import org.eclipse.sirius.tree.DTree

class SpecializationHierarchyService {
	
	/**
	 * Returns all of the {@link Entity}s which have the passed {@link Aspect} c
	 * as its superAspect for all {@link SpecializationAxiom}s in this
	 * {@link TerminologyBox}
	 * 
	 * @param c The {@link Entity} which is the superConcept
	 * @return Set of {@link Entity}s that are children to the passed {@link Entity}
	 */
	def Set<Entity> getSubEntities(Entity e, DTree tree){
		
		val entities  = new HashSet<Entity>()
		
		val tb = tree.target as TerminologyGraph
         tb.boxStatements
		.filter(SpecializationAxiom)
		.filter[s | s.parent == e]
		.forEach[s | entities.add(s.child)]
		
		return entities
	}
	
	/**
	 * 
	 */
	def Set<Entity> getVisualTreeItems(EObject eObj){
		
		val entities  = new HashSet<Entity>()
		
		val tb = eObj as TerminologyBox
		
		tb.boxStatements
		.filter(SpecializationAxiom)
		.forEach[s | entities.add(s.parent)]
		
		return entities
	}
	
}