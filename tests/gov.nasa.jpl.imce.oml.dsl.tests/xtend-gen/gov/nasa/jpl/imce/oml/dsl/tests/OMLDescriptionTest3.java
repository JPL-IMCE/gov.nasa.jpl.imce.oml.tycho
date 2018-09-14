/**
 * Copyright 2017 California Institute of Technology (\"Caltech\").
 * U.S. Government sponsorship acknowledged.
 * 
 * Licensed under the Apache License, Version 2.0 (the \"License\");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an \"AS IS\" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package gov.nasa.jpl.imce.oml.dsl.tests;

import com.google.inject.Inject;
import com.google.inject.Provider;
import gov.nasa.jpl.imce.oml.dsl.tests.OMLInjectorProvider;
import gov.nasa.jpl.imce.oml.model.common.CommonFactory;
import gov.nasa.jpl.imce.oml.model.common.Extent;
import gov.nasa.jpl.imce.oml.model.common.LiteralBoolean;
import gov.nasa.jpl.imce.oml.model.common.LiteralDecimal;
import gov.nasa.jpl.imce.oml.model.common.LiteralFloat;
import gov.nasa.jpl.imce.oml.model.common.LiteralQuotedString;
import gov.nasa.jpl.imce.oml.model.datatypes.FloatValue;
import gov.nasa.jpl.imce.oml.model.datatypes.PositiveIntegerValue;
import gov.nasa.jpl.imce.oml.model.datatypes.QuotedStringValue;
import gov.nasa.jpl.imce.oml.model.descriptions.ConceptInstance;
import gov.nasa.jpl.imce.oml.model.descriptions.DescriptionBox;
import gov.nasa.jpl.imce.oml.model.descriptions.DescriptionBoxExtendsClosedWorldDefinitions;
import gov.nasa.jpl.imce.oml.model.descriptions.DescriptionsFactory;
import gov.nasa.jpl.imce.oml.model.descriptions.InstanceRelationshipExistentialRangeRestriction;
import gov.nasa.jpl.imce.oml.model.descriptions.InstanceRelationshipUniversalRangeRestriction;
import gov.nasa.jpl.imce.oml.model.descriptions.InstanceRelationshipValueRestriction;
import gov.nasa.jpl.imce.oml.model.descriptions.SingletonInstanceScalarDataPropertyValue;
import gov.nasa.jpl.imce.oml.model.graphs.GraphsFactory;
import gov.nasa.jpl.imce.oml.model.graphs.TerminologyGraph;
import gov.nasa.jpl.imce.oml.model.terminologies.Concept;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityScalarDataProperty;
import gov.nasa.jpl.imce.oml.model.terminologies.NumericScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.Scalar;
import gov.nasa.jpl.imce.oml.model.terminologies.StringScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.TerminologiesFactory;
import gov.nasa.jpl.imce.oml.model.terminologies.UnreifiedRelationship;
import java.io.ByteArrayOutputStream;
import org.eclipse.emf.common.util.URI;
import org.eclipse.emf.ecore.resource.Resource;
import org.eclipse.xtend2.lib.StringConcatenation;
import org.eclipse.xtext.resource.SaveOptions;
import org.eclipse.xtext.resource.XtextResourceSet;
import org.eclipse.xtext.testing.InjectWith;
import org.eclipse.xtext.testing.XtextRunner;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;

@RunWith(XtextRunner.class)
@InjectWith(OMLInjectorProvider.class)
@SuppressWarnings("all")
public class OMLDescriptionTest3 {
  @Inject
  private Provider<XtextResourceSet> resourceSetProvider;
  
  private final CommonFactory commonF = CommonFactory.eINSTANCE;
  
  private final TerminologiesFactory terminologiesF = TerminologiesFactory.eINSTANCE;
  
  private final GraphsFactory graphsF = GraphsFactory.eINSTANCE;
  
  private final DescriptionsFactory descriptionsF = DescriptionsFactory.eINSTANCE;
  
  @Test
  public void test() {
    final XtextResourceSet rs = this.resourceSetProvider.get();
    final Resource r1 = rs.createResource(URI.createFileURI("file:OMLDescriptionTest3A.oml"));
    final Extent e1 = this.commonF.createExtent();
    r1.getContents().add(e1);
    final TerminologyGraph g = this.graphsF.createTerminologyGraph();
    g.setExtent(e1);
    g.setIri("http://www.example.org/OMLDescriptionTest3A");
    final Concept c = this.terminologiesF.createConcept();
    c.setTbox(g);
    c.setName("Box");
    final Concept d = this.terminologiesF.createConcept();
    d.setTbox(g);
    d.setName("Boite");
    final UnreifiedRelationship r = this.terminologiesF.createUnreifiedRelationship();
    r.setTbox(g);
    r.setName("translation");
    r.setSource(c);
    r.setTarget(d);
    final Scalar sc = this.terminologiesF.createScalar();
    sc.setTbox(g);
    sc.setName("String");
    final StringScalarRestriction scr = this.terminologiesF.createStringScalarRestriction();
    scr.setTbox(g);
    scr.setName("NonEmptyString");
    scr.setRestrictedRange(sc);
    PositiveIntegerValue _positiveIntegerValue = new PositiveIntegerValue("1");
    scr.setMinLength(_positiveIntegerValue);
    final Scalar sc_double = this.terminologiesF.createScalar();
    sc_double.setTbox(g);
    sc_double.setName("Double");
    final Scalar sc_boolean = this.terminologiesF.createScalar();
    sc_boolean.setTbox(g);
    sc_boolean.setName("Boolean");
    final LiteralDecimal zero = this.commonF.createLiteralDecimal();
    PositiveIntegerValue _positiveIntegerValue_1 = new PositiveIntegerValue("0");
    zero.setDecimal(_positiveIntegerValue_1);
    final NumericScalarRestriction sc_positive_double = this.terminologiesF.createNumericScalarRestriction();
    sc_positive_double.setTbox(g);
    sc_positive_double.setName("PositiveDouble");
    sc_positive_double.setRestrictedRange(sc_double);
    sc_positive_double.setMinInclusive(zero);
    final EntityScalarDataProperty dp1 = this.terminologiesF.createEntityScalarDataProperty();
    dp1.setTbox(g);
    dp1.setName("name");
    dp1.setDomain(c);
    dp1.setRange(sc);
    final EntityScalarDataProperty dp2 = this.terminologiesF.createEntityScalarDataProperty();
    dp2.setTbox(g);
    dp2.setName("length");
    dp2.setDomain(c);
    dp2.setRange(sc_positive_double);
    final EntityScalarDataProperty dp3 = this.terminologiesF.createEntityScalarDataProperty();
    dp3.setTbox(g);
    dp3.setName("isSmall");
    dp3.setDomain(c);
    dp3.setRange(sc_boolean);
    final String text1 = this.serialize(r1);
    StringConcatenation _builder = new StringConcatenation();
    _builder.append("open terminology <http://www.example.org/OMLDescriptionTest3A> {");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("concept Box");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("concept Boite");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("unreifiedRelationship translation {");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("source = Box");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("target = Boite }");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("scalar String");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("stringScalarRestriction NonEmptyString {");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("minLength 1");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("restrictedRange String");
    _builder.newLine();
    _builder.append("\t");
    _builder.append("}");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("scalar Double");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("scalar Boolean");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("numericScalarRestriction PositiveDouble {");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("minInclusive 0");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("restrictedRange Double");
    _builder.newLine();
    _builder.append("\t");
    _builder.append("}");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("entityScalarDataProperty name {");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("domain Box");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("range String");
    _builder.newLine();
    _builder.append("\t");
    _builder.append("}");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("entityScalarDataProperty ^length {");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("domain Box");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("range PositiveDouble");
    _builder.newLine();
    _builder.append("\t");
    _builder.append("}");
    _builder.newLine();
    _builder.newLine();
    _builder.append("\t");
    _builder.append("entityScalarDataProperty isSmall {");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("domain Box");
    _builder.newLine();
    _builder.append("\t\t");
    _builder.append("range Boolean");
    _builder.newLine();
    _builder.append("\t");
    _builder.append("}");
    _builder.newLine();
    _builder.newLine();
    _builder.append("}");
    _builder.newLine();
    final String expected1 = _builder.toString();
    Assert.assertEquals(text1, expected1);
    final Resource r2 = rs.createResource(URI.createFileURI("file:OMLDescriptionTest3B.oml"));
    final Extent e2 = this.commonF.createExtent();
    r2.getContents().add(e2);
    final DescriptionBox db = this.descriptionsF.createDescriptionBox();
    db.setExtent(e2);
    db.setIri("http://www.example.org/OMLDescriptionTest3B");
    final DescriptionBoxExtendsClosedWorldDefinitions ext = this.descriptionsF.createDescriptionBoxExtendsClosedWorldDefinitions();
    ext.setDescriptionBox(db);
    ext.setClosedWorldDefinitions(g);
    final ConceptInstance ci = this.descriptionsF.createConceptInstance();
    ci.setDescriptionBox(db);
    ci.setName("box0");
    ci.setSingletonConceptClassifier(c);
    final SingletonInstanceScalarDataPropertyValue ci_name = this.descriptionsF.createSingletonInstanceScalarDataPropertyValue();
    ci_name.setDescriptionBox(db);
    ci_name.setScalarDataProperty(dp1);
    ci_name.setSingletonInstance(ci);
    final LiteralQuotedString ci_name_lit = this.commonF.createLiteralQuotedString();
    QuotedStringValue _quotedStringValue = new QuotedStringValue("box #0");
    ci_name_lit.setString(_quotedStringValue);
    ci_name.setValueType(scr);
    ci_name.setScalarPropertyValue(ci_name_lit);
    final ConceptInstance di = this.descriptionsF.createConceptInstance();
    di.setDescriptionBox(db);
    di.setName("boite0");
    di.setSingletonConceptClassifier(d);
    final SingletonInstanceScalarDataPropertyValue ci_length = this.descriptionsF.createSingletonInstanceScalarDataPropertyValue();
    ci_length.setDescriptionBox(db);
    ci_length.setScalarDataProperty(dp2);
    ci_length.setSingletonInstance(ci);
    final LiteralFloat ci_length_lit = this.commonF.createLiteralFloat();
    FloatValue _floatValue = new FloatValue("123.45");
    ci_length_lit.setFloat(_floatValue);
    ci_length.setScalarPropertyValue(ci_length_lit);
    ci_length.setValueType(sc_positive_double);
    final SingletonInstanceScalarDataPropertyValue ci_isSmall = this.descriptionsF.createSingletonInstanceScalarDataPropertyValue();
    ci_isSmall.setDescriptionBox(db);
    ci_isSmall.setScalarDataProperty(dp3);
    ci_isSmall.setSingletonInstance(ci);
    final LiteralBoolean ci_isSmall_lit = this.commonF.createLiteralBoolean();
    ci_isSmall_lit.setBool(false);
    ci_isSmall.setScalarPropertyValue(ci_isSmall_lit);
    final InstanceRelationshipValueRestriction i0 = this.descriptionsF.createInstanceRelationshipValueRestriction();
    i0.setDescriptionBox(db);
    i0.setDomain(ci);
    i0.setRestrictedRelationship(r);
    i0.setRange(di);
    final InstanceRelationshipExistentialRangeRestriction i1 = this.descriptionsF.createInstanceRelationshipExistentialRangeRestriction();
    i1.setDescriptionBox(db);
    i1.setDomain(ci);
    i1.setRestrictedRelationship(r);
    i1.setRange(d);
    final InstanceRelationshipUniversalRangeRestriction i2 = this.descriptionsF.createInstanceRelationshipUniversalRangeRestriction();
    i2.setDescriptionBox(db);
    i2.setDomain(ci);
    i2.setRestrictedRelationship(r);
    i2.setRange(d);
    final String text2 = this.serialize(r2);
    StringConcatenation _builder_1 = new StringConcatenation();
    _builder_1.append("final descriptionBox <http://www.example.org/OMLDescriptionTest3B> {");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("extends <http://www.example.org/OMLDescriptionTest3A>");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("conceptInstance(box0 is-a OMLDescriptionTest3A:Box)");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("conceptInstance(boite0 is-a OMLDescriptionTest3A:Boite)");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("box0.OMLDescriptionTest3A:translation = boite0");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("someEntities box0.OMLDescriptionTest3A:translation in OMLDescriptionTest3A:Boite");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("allEntities OMLDescriptionTest3B:box0.OMLDescriptionTest3A:translation in OMLDescriptionTest3A:Boite");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("box0 . OMLDescriptionTest3A:name = \"box #0\" ^^ OMLDescriptionTest3A:NonEmptyString");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("box0 . OMLDescriptionTest3A:length = 123.45 ^^ OMLDescriptionTest3A:PositiveDouble");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("\t");
    _builder_1.append("box0 . OMLDescriptionTest3A:isSmall = false");
    _builder_1.newLine();
    _builder_1.newLine();
    _builder_1.append("}");
    _builder_1.newLine();
    final String expected2 = _builder_1.toString();
    Assert.assertEquals(text2, expected2);
  }
  
  public String serialize(final Resource r) {
    try {
      String _xblockexpression = null;
      {
        final ByteArrayOutputStream bos = new ByteArrayOutputStream();
        final SaveOptions.Builder builder = SaveOptions.newBuilder();
        builder.format();
        final SaveOptions s = builder.getOptions();
        r.save(bos, s.toOptionsMap());
        _xblockexpression = bos.toString();
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
}
