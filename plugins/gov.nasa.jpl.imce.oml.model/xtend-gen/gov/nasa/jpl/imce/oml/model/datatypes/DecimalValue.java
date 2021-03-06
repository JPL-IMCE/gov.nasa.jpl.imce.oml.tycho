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

import com.google.common.base.Objects;
import gov.nasa.jpl.imce.oml.model.datatypes.AbstractDecimalValue;

/**
 * Corresponds to the tokens resulting from DECIMAL - DIGITS where:
 * 
 * terminal DIGITS returns PositiveIntegerLiteral:			DIGIT+;
 * terminal DECIMAL returns DecimalDataType: 				DEC | HEX;
 * 
 * DIGITS has higher priority than DECIMAL because it is defined before the latter in the grammar.
 */
@SuppressWarnings("all")
public class DecimalValue extends AbstractDecimalValue {
  public DecimalValue(final String value) {
    super(value);
    boolean _matches = value.matches("[0-9]+");
    if (_matches) {
      throw new IllegalArgumentException((("Construct the AbstractDecimalValue " + value) + " as a PositiveIntegerValue instead of a DecimalValue"));
    }
  }
  
  @Override
  public boolean equals(final Object that) {
    boolean _switchResult = false;
    boolean _matched = false;
    if (that instanceof DecimalValue) {
      _matched=true;
      _switchResult = Objects.equal(this.value, ((DecimalValue)that).value);
    }
    if (!_matched) {
      _switchResult = false;
    }
    return _switchResult;
  }
}
