/**
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
package gov.nasa.jpl.imce.oml.model.datatypes;

/**
 * Corresponds to the tokens resulting from the disjoint union of DIGITS + DECIMAL where:
 * 
 * terminal DIGITS returns PositiveIntegerLiteral:			DIGIT+;
 * terminal DECIMAL returns DecimalDataType: 				DEC | HEX;
 * 
 * DIGITS has higher priority than DECIMAL because it is defined before the latter in the grammar.
 */
@SuppressWarnings("all")
public abstract class AbstractDecimalValue {
  public String value;
  
  public AbstractDecimalValue(final String value) {
    this.value = value;
  }
  
  @Override
  public String toString() {
    return this.value;
  }
}
