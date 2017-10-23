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
package gov.nasa.jpl.imce.oml.dsl.formatting2;

import com.google.common.base.Objects;
import com.google.inject.Inject;
import gov.nasa.jpl.imce.oml.dsl.services.OMLGrammarAccess;
import gov.nasa.jpl.imce.oml.model.bundles.AnonymousConceptUnionAxiom;
import gov.nasa.jpl.imce.oml.model.bundles.Bundle;
import gov.nasa.jpl.imce.oml.model.bundles.BundledTerminologyAxiom;
import gov.nasa.jpl.imce.oml.model.bundles.DisjointUnionOfConceptsAxiom;
import gov.nasa.jpl.imce.oml.model.bundles.RootConceptTaxonomyAxiom;
import gov.nasa.jpl.imce.oml.model.bundles.SpecificDisjointConceptAxiom;
import gov.nasa.jpl.imce.oml.model.bundles.TerminologyBundleAxiom;
import gov.nasa.jpl.imce.oml.model.bundles.TerminologyBundleStatement;
import gov.nasa.jpl.imce.oml.model.common.AnnotationProperty;
import gov.nasa.jpl.imce.oml.model.common.AnnotationPropertyValue;
import gov.nasa.jpl.imce.oml.model.common.Extent;
import gov.nasa.jpl.imce.oml.model.common.Module;
import gov.nasa.jpl.imce.oml.model.descriptions.ConceptInstance;
import gov.nasa.jpl.imce.oml.model.descriptions.DescriptionBox;
import gov.nasa.jpl.imce.oml.model.descriptions.DescriptionBoxExtendsClosedWorldDefinitions;
import gov.nasa.jpl.imce.oml.model.descriptions.DescriptionBoxRefinement;
import gov.nasa.jpl.imce.oml.model.descriptions.DescriptionsPackage;
import gov.nasa.jpl.imce.oml.model.descriptions.ReifiedRelationshipInstance;
import gov.nasa.jpl.imce.oml.model.descriptions.ReifiedRelationshipInstanceDomain;
import gov.nasa.jpl.imce.oml.model.descriptions.ReifiedRelationshipInstanceRange;
import gov.nasa.jpl.imce.oml.model.descriptions.ScalarDataPropertyValue;
import gov.nasa.jpl.imce.oml.model.descriptions.SingletonInstanceScalarDataPropertyValue;
import gov.nasa.jpl.imce.oml.model.descriptions.SingletonInstanceStructuredDataPropertyValue;
import gov.nasa.jpl.imce.oml.model.descriptions.StructuredDataPropertyTuple;
import gov.nasa.jpl.imce.oml.model.descriptions.UnreifiedRelationshipInstanceTuple;
import gov.nasa.jpl.imce.oml.model.graphs.ConceptDesignationTerminologyAxiom;
import gov.nasa.jpl.imce.oml.model.graphs.TerminologyGraph;
import gov.nasa.jpl.imce.oml.model.graphs.TerminologyNestingAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.Aspect;
import gov.nasa.jpl.imce.oml.model.terminologies.AspectPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.AspectSpecializationAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.BinaryScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.ChainRule;
import gov.nasa.jpl.imce.oml.model.terminologies.Concept;
import gov.nasa.jpl.imce.oml.model.terminologies.ConceptPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.ConceptSpecializationAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityExistentialRestrictionAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityScalarDataProperty;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityScalarDataPropertyExistentialRestrictionAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityScalarDataPropertyParticularRestrictionAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityScalarDataPropertyUniversalRestrictionAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityStructuredDataProperty;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityStructuredDataPropertyParticularRestrictionAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.EntityUniversalRestrictionAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.IRIScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.NumericScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.PlainLiteralScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationship;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipInversePropertyPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipPropertyPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipSourceInversePropertyPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipSourcePropertyPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipSpecializationAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipTargetInversePropertyPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.ReifiedRelationshipTargetPropertyPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.RestrictionScalarDataPropertyValue;
import gov.nasa.jpl.imce.oml.model.terminologies.RestrictionStructuredDataPropertyTuple;
import gov.nasa.jpl.imce.oml.model.terminologies.RuleBodySegment;
import gov.nasa.jpl.imce.oml.model.terminologies.Scalar;
import gov.nasa.jpl.imce.oml.model.terminologies.ScalarDataProperty;
import gov.nasa.jpl.imce.oml.model.terminologies.ScalarOneOfLiteralAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.ScalarOneOfRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.SegmentPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.StringScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.Structure;
import gov.nasa.jpl.imce.oml.model.terminologies.StructuredDataProperty;
import gov.nasa.jpl.imce.oml.model.terminologies.SynonymScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.TerminologiesPackage;
import gov.nasa.jpl.imce.oml.model.terminologies.TerminologyBoxAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.TerminologyBoxStatement;
import gov.nasa.jpl.imce.oml.model.terminologies.TerminologyExtensionAxiom;
import gov.nasa.jpl.imce.oml.model.terminologies.TimeScalarRestriction;
import gov.nasa.jpl.imce.oml.model.terminologies.UnreifiedRelationship;
import gov.nasa.jpl.imce.oml.model.terminologies.UnreifiedRelationshipInversePropertyPredicate;
import gov.nasa.jpl.imce.oml.model.terminologies.UnreifiedRelationshipPropertyPredicate;
import java.util.Arrays;
import java.util.function.Consumer;
import org.eclipse.emf.ecore.EObject;
import org.eclipse.xtext.formatting2.AbstractFormatter2;
import org.eclipse.xtext.formatting2.IFormattableDocument;
import org.eclipse.xtext.formatting2.IHiddenRegionFormatter;
import org.eclipse.xtext.formatting2.regionaccess.ISemanticRegion;
import org.eclipse.xtext.resource.XtextResource;
import org.eclipse.xtext.xbase.lib.Extension;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

@SuppressWarnings("all")
public class OMLFormatter extends AbstractFormatter2 {
  @Inject
  @Extension
  private OMLGrammarAccess _oMLGrammarAccess;
  
  protected void _format(final Extent extent, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.<Extent>prepend(extent, _function);
    final Consumer<AnnotationProperty> _function_1 = (AnnotationProperty it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<AnnotationProperty>append(document.<AnnotationProperty>format(it), _function_2);
    };
    extent.getAnnotationProperties().forEach(_function_1);
    final Module lastM = IterableExtensions.<Module>last(extent.getModules());
    final Consumer<Module> _function_2 = (Module m) -> {
      final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
        int _xifexpression = (int) 0;
        boolean _equals = Objects.equal(lastM, m);
        if (_equals) {
          _xifexpression = 1;
        } else {
          _xifexpression = 2;
        }
        it.setNewLines(_xifexpression);
      };
      document.<Module>append(document.<Module>format(m), _function_3);
    };
    extent.getModules().forEach(_function_2);
  }
  
  protected void _format(final AnnotationProperty annotationProperty, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(annotationProperty).keyword("annotationProperty"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(annotationProperty).keyword("="), _function_1);
  }
  
  protected void _format(final AnnotationPropertyValue annotation, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(annotation).keyword("@"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(annotation).keyword("="), _function_1);
  }
  
  protected void _format(final TerminologyGraph terminologyGraph, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(terminologyGraph).feature(TerminologiesPackage.eINSTANCE.getTerminologyBox_Kind()), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(terminologyGraph).keyword("terminology"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(terminologyGraph).ruleCall(this._oMLGrammarAccess.getTerminologyGraphAccess().getIriIRITerminalRuleCall_3_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(terminologyGraph).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(terminologyGraph).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.setNewLines(2);
    };
    document.append(lcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Consumer<AnnotationPropertyValue> _function_6 = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_7);
    };
    terminologyGraph.getAnnotations().forEach(_function_6);
    final Consumer<TerminologyBoxAxiom> _function_7 = (TerminologyBoxAxiom it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<TerminologyBoxAxiom>append(document.<TerminologyBoxAxiom>format(it), _function_8);
    };
    terminologyGraph.getBoxAxioms().forEach(_function_7);
    final Consumer<TerminologyBoxStatement> _function_8 = (TerminologyBoxStatement it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<TerminologyBoxStatement>append(document.<TerminologyBoxStatement>format(it), _function_9);
    };
    terminologyGraph.getBoxStatements().forEach(_function_8);
  }
  
  protected void _format(final Bundle bundle, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(bundle).feature(TerminologiesPackage.eINSTANCE.getTerminologyBox_Kind()), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(bundle).keyword("bundle"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(bundle).ruleCall(this._oMLGrammarAccess.getBundleAccess().getIriIRITerminalRuleCall_3_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(bundle).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(bundle).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.setNewLines(2);
    };
    document.append(lcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Consumer<AnnotationPropertyValue> _function_6 = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_7);
    };
    bundle.getAnnotations().forEach(_function_6);
    final Consumer<TerminologyBoxAxiom> _function_7 = (TerminologyBoxAxiom it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<TerminologyBoxAxiom>append(document.<TerminologyBoxAxiom>format(it), _function_8);
    };
    bundle.getBoxAxioms().forEach(_function_7);
    final Consumer<TerminologyBoxStatement> _function_8 = (TerminologyBoxStatement it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<TerminologyBoxStatement>append(document.<TerminologyBoxStatement>format(it), _function_9);
    };
    bundle.getBoxStatements().forEach(_function_8);
    final Consumer<TerminologyBundleAxiom> _function_9 = (TerminologyBundleAxiom it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<TerminologyBundleAxiom>append(document.<TerminologyBundleAxiom>format(it), _function_10);
    };
    bundle.getBundleAxioms().forEach(_function_9);
    final Consumer<TerminologyBundleStatement> _function_10 = (TerminologyBundleStatement it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<TerminologyBundleStatement>append(document.<TerminologyBundleStatement>format(it), _function_11);
    };
    bundle.getBundleStatements().forEach(_function_10);
  }
  
  protected void _format(final DescriptionBox descriptionBox, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(descriptionBox).feature(DescriptionsPackage.eINSTANCE.getDescriptionBox_Kind()), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(descriptionBox).keyword("descriptionBox"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(descriptionBox).ruleCall(this._oMLGrammarAccess.getDescriptionBoxAccess().getIriIRITerminalRuleCall_3_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(descriptionBox).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(descriptionBox).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.setNewLines(2);
    };
    document.append(lcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Consumer<AnnotationPropertyValue> _function_6 = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_7);
    };
    descriptionBox.getAnnotations().forEach(_function_6);
    final Consumer<DescriptionBoxExtendsClosedWorldDefinitions> _function_7 = (DescriptionBoxExtendsClosedWorldDefinitions it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<DescriptionBoxExtendsClosedWorldDefinitions>append(document.<DescriptionBoxExtendsClosedWorldDefinitions>format(it), _function_8);
    };
    descriptionBox.getClosedWorldDefinitions().forEach(_function_7);
    final Consumer<DescriptionBoxRefinement> _function_8 = (DescriptionBoxRefinement it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<DescriptionBoxRefinement>append(document.<DescriptionBoxRefinement>format(it), _function_9);
    };
    descriptionBox.getDescriptionBoxRefinements().forEach(_function_8);
    final Consumer<ConceptInstance> _function_9 = (ConceptInstance it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<ConceptInstance>append(document.<ConceptInstance>format(it), _function_10);
    };
    descriptionBox.getConceptInstances().forEach(_function_9);
    final Consumer<ReifiedRelationshipInstance> _function_10 = (ReifiedRelationshipInstance it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<ReifiedRelationshipInstance>append(document.<ReifiedRelationshipInstance>format(it), _function_11);
    };
    descriptionBox.getReifiedRelationshipInstances().forEach(_function_10);
    final Consumer<ReifiedRelationshipInstanceDomain> _function_11 = (ReifiedRelationshipInstanceDomain it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<ReifiedRelationshipInstanceDomain>append(document.<ReifiedRelationshipInstanceDomain>format(it), _function_12);
    };
    descriptionBox.getReifiedRelationshipInstanceDomains().forEach(_function_11);
    final Consumer<ReifiedRelationshipInstanceRange> _function_12 = (ReifiedRelationshipInstanceRange it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<ReifiedRelationshipInstanceRange>append(document.<ReifiedRelationshipInstanceRange>format(it), _function_13);
    };
    descriptionBox.getReifiedRelationshipInstanceRanges().forEach(_function_12);
    final Consumer<UnreifiedRelationshipInstanceTuple> _function_13 = (UnreifiedRelationshipInstanceTuple it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<UnreifiedRelationshipInstanceTuple>append(document.<UnreifiedRelationshipInstanceTuple>format(it), _function_14);
    };
    descriptionBox.getUnreifiedRelationshipInstanceTuples().forEach(_function_13);
    final Consumer<SingletonInstanceScalarDataPropertyValue> _function_14 = (SingletonInstanceScalarDataPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<SingletonInstanceScalarDataPropertyValue>append(document.<SingletonInstanceScalarDataPropertyValue>format(it), _function_15);
    };
    descriptionBox.getSingletonScalarDataPropertyValues().forEach(_function_14);
    final Consumer<SingletonInstanceStructuredDataPropertyValue> _function_15 = (SingletonInstanceStructuredDataPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_16 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(2);
      };
      document.<SingletonInstanceStructuredDataPropertyValue>append(document.<SingletonInstanceStructuredDataPropertyValue>format(it), _function_16);
    };
    descriptionBox.getSingletonStructuredDataPropertyValues().forEach(_function_15);
  }
  
  protected void _format(final Aspect aspect, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    aspect.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(aspect).keyword("aspect"), _function_1);
    this.textRegionExtensions.regionFor(aspect).ruleCall(this._oMLGrammarAccess.getAspectAccess().getNameIDTerminalRuleCall_2_0());
  }
  
  protected void _format(final Concept concept, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    concept.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(concept).keyword("concept"), _function_1);
    this.textRegionExtensions.regionFor(concept).ruleCall(this._oMLGrammarAccess.getConceptAccess().getNameIDTerminalRuleCall_2_0());
  }
  
  protected void _format(final ReifiedRelationship rr, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    rr.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(rr).keyword("reifiedRelationship"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(rr).ruleCall(this._oMLGrammarAccess.getReifiedRelationshipAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(rr).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(rr).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("functional"), _function_6);
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("inverseFunctional"), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("essential"), _function_8);
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("inverseEssential"), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("symmetric"), _function_10);
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("asymmetric"), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("reflexive"), _function_12);
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("irreflexive"), _function_13);
    final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("transitive"), _function_14);
    final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("unreified"), _function_15);
    final Procedure1<IHiddenRegionFormatter> _function_16 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("inverse"), _function_16);
    final Procedure1<IHiddenRegionFormatter> _function_17 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("source"), _function_17);
    final Procedure1<IHiddenRegionFormatter> _function_18 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(rr).keyword("target"), _function_18);
  }
  
  protected void _format(final UnreifiedRelationship ur, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ur.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ur).keyword("unreifiedRelationship"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ur).ruleCall(this._oMLGrammarAccess.getUnreifiedRelationshipAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(ur).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(ur).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("functional"), _function_6);
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("inverseFunctional"), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("essential"), _function_8);
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("inverseEssential"), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("symmetric"), _function_10);
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("asymmetric"), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("reflexive"), _function_12);
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("irreflexive"), _function_13);
    final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("transitive"), _function_14);
    final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("source"), _function_15);
    final Procedure1<IHiddenRegionFormatter> _function_16 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(this.textRegionExtensions.regionFor(ur).keyword("target"), _function_16);
  }
  
  protected void _format(final Scalar scalar, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    scalar.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(scalar).keyword("scalar"), _function_1);
  }
  
  protected void _format(final Structure structure, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    structure.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(structure).keyword("structure"), _function_1);
  }
  
  protected void _format(final ChainRule chainRule, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    chainRule.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(chainRule).keyword("rule"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(chainRule).keyword("infers"), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(document.prepend(document.prepend(this.textRegionExtensions.regionFor(chainRule).keyword("if"), _function_3), _function_4), _function_5);
    RuleBodySegment _firstSegment = chainRule.getFirstSegment();
    if (_firstSegment!=null) {
      document.<RuleBodySegment>format(_firstSegment);
    }
  }
  
  protected void _format(final RuleBodySegment tailSegment, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    tailSegment.getAnnotations().forEach(_function);
    SegmentPredicate _predicate = tailSegment.getPredicate();
    if (_predicate!=null) {
      document.<SegmentPredicate>format(_predicate);
    }
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(document.prepend(document.prepend(this.textRegionExtensions.regionFor(tailSegment).keyword("&&"), _function_1), _function_2), _function_3);
    RuleBodySegment _nextSegment = tailSegment.getNextSegment();
    if (_nextSegment!=null) {
      document.<RuleBodySegment>format(_nextSegment);
    }
  }
  
  protected void _format(final AspectPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("aspect"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_2);
  }
  
  protected void _format(final ConceptPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("aspect"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_2);
  }
  
  protected void _format(final ReifiedRelationshipPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("reifiedRelationship"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_2);
  }
  
  protected void _format(final ReifiedRelationshipPropertyPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("property"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_2);
  }
  
  protected void _format(final ReifiedRelationshipInversePropertyPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("inv"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("property"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_3);
  }
  
  protected void _format(final ReifiedRelationshipSourcePropertyPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("source"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_2);
  }
  
  protected void _format(final ReifiedRelationshipSourceInversePropertyPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("inv"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("source"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_3);
  }
  
  protected void _format(final ReifiedRelationshipTargetPropertyPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("target"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_2);
  }
  
  protected void _format(final ReifiedRelationshipTargetInversePropertyPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("inv"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("target"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_3);
  }
  
  protected void _format(final UnreifiedRelationshipPropertyPredicate ep, @Extension final IFormattableDocument document) {
  }
  
  protected void _format(final UnreifiedRelationshipInversePropertyPredicate ep, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ep).keyword("inv"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword("("), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ep).keyword(")"), _function_2);
  }
  
  protected void _format(final AspectSpecializationAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("extendsAspect"), _function_1);
  }
  
  protected void _format(final ConceptSpecializationAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("extendsConcept"), _function_1);
  }
  
  protected void _format(final ReifiedRelationshipSpecializationAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("extendsRelationship"), _function_1);
  }
  
  protected void _format(final ConceptDesignationTerminologyAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("conceptDesignationTerminologyAxiom"), _function_1);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(ax).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(ax).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(ax).keyword("designatedTerminology"), _function_5), _function_6);
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(ax).keyword("designatedConcept"), _function_7), _function_8);
  }
  
  protected void _format(final TerminologyExtensionAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("extends"), _function_1);
  }
  
  protected void _format(final TerminologyNestingAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("terminologyNestingAxiom"), _function_1);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(ax).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(ax).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(ax).keyword("nestingTerminology"), _function_5), _function_6);
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(ax).keyword("nestingContext"), _function_7), _function_8);
  }
  
  protected void _format(final BundledTerminologyAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("bundles"), _function_1);
  }
  
  protected void _format(final EntityStructuredDataProperty t, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    t.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(t).keyword("entityStructuredDataProperty"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(t).assignment(this._oMLGrammarAccess.getEntityStructuredDataPropertyAccess().getIsIdentityCriteriaAssignment_2()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(t).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(t).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("domain"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("range"), _function_8), _function_9);
  }
  
  protected void _format(final EntityScalarDataProperty t, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    t.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(t).keyword("entityScalarDataProperty"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(t).assignment(this._oMLGrammarAccess.getEntityScalarDataPropertyAccess().getIsIdentityCriteriaAssignment_2()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(t).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(t).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("domain"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("range"), _function_8), _function_9);
  }
  
  protected void _format(final StructuredDataProperty t, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    t.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(t).keyword("structuredDataProperty"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(t).ruleCall(this._oMLGrammarAccess.getStructuredDataPropertyAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(t).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(t).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("domain"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("range"), _function_8), _function_9);
  }
  
  protected void _format(final ScalarDataProperty t, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    t.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(t).keyword("scalarDataProperty"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(t).ruleCall(this._oMLGrammarAccess.getScalarDataPropertyAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(t).keyword(this._oMLGrammarAccess.getScalarDataPropertyAccess().getLeftCurlyBracketKeyword_3());
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(t).keyword(this._oMLGrammarAccess.getScalarDataPropertyAccess().getRightCurlyBracketKeyword_8());
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("domain"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(t).keyword("range"), _function_8), _function_9);
  }
  
  protected void _format(final RootConceptTaxonomyAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("rootConceptTaxonomy"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.prepend(this.textRegionExtensions.regionFor(ax).keyword(")"), _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword(")"), _function_4);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(ax).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(ax).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_6);
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("root"), _function_8);
    final Consumer<DisjointUnionOfConceptsAxiom> _function_9 = (DisjointUnionOfConceptsAxiom it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it_1) -> {
        it_1.newLine();
      };
      document.<DisjointUnionOfConceptsAxiom>append(document.<DisjointUnionOfConceptsAxiom>format(it), _function_10);
    };
    ax.getDisjunctions().forEach(_function_9);
  }
  
  protected void _format(final AnonymousConceptUnionAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("anonymousConceptUnion"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.prepend(this.textRegionExtensions.regionFor(ax).keyword(")"), _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword(")"), _function_4);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(ax).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(ax).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_6);
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("root"), _function_8);
    final Consumer<DisjointUnionOfConceptsAxiom> _function_9 = (DisjointUnionOfConceptsAxiom it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it_1) -> {
        it_1.newLine();
      };
      document.<DisjointUnionOfConceptsAxiom>append(document.<DisjointUnionOfConceptsAxiom>format(it), _function_10);
    };
    ax.getDisjunctions().forEach(_function_9);
  }
  
  protected void _format(final SpecificDisjointConceptAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("disjointLeaf"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.prepend(this.textRegionExtensions.regionFor(ax).keyword(")"), _function_3);
  }
  
  protected void _format(final EntityExistentialRestrictionAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("someEntities"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("."), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("in"), _function_3);
  }
  
  protected void _format(final EntityUniversalRestrictionAxiom ax, @Extension final IFormattableDocument document) {
    final Procedure1<IHiddenRegionFormatter> _function = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("allEntities"), _function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("."), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("in"), _function_2);
  }
  
  protected void _format(final EntityScalarDataPropertyExistentialRestrictionAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("someData"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("."), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("in"), _function_3);
  }
  
  protected void _format(final EntityScalarDataPropertyParticularRestrictionAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("every"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("."), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("="), _function_3);
  }
  
  protected void _format(final EntityScalarDataPropertyUniversalRestrictionAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("allData"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("."), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("in"), _function_3);
  }
  
  protected void _format(final EntityStructuredDataPropertyParticularRestrictionAxiom ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(ax).keyword("every"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("."), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("="), _function_3);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(ax).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(ax).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_6);
    final Consumer<RestrictionStructuredDataPropertyTuple> _function_7 = (RestrictionStructuredDataPropertyTuple it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<RestrictionStructuredDataPropertyTuple>append(document.<RestrictionStructuredDataPropertyTuple>format(it), _function_8);
    };
    ax.getStructuredDataPropertyRestrictions().forEach(_function_7);
    final Consumer<RestrictionScalarDataPropertyValue> _function_8 = (RestrictionScalarDataPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<RestrictionScalarDataPropertyValue>append(document.<RestrictionScalarDataPropertyValue>format(it), _function_9);
    };
    ax.getScalarDataPropertyRestrictions().forEach(_function_8);
  }
  
  protected void _format(final RestrictionStructuredDataPropertyTuple t, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    t.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(t).keyword("="), _function_1);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(t).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(t).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_4);
    final Consumer<RestrictionStructuredDataPropertyTuple> _function_5 = (RestrictionStructuredDataPropertyTuple it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<RestrictionStructuredDataPropertyTuple>append(document.<RestrictionStructuredDataPropertyTuple>format(it), _function_6);
    };
    t.getStructuredDataPropertyRestrictions().forEach(_function_5);
    final Consumer<RestrictionScalarDataPropertyValue> _function_6 = (RestrictionScalarDataPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<RestrictionScalarDataPropertyValue>append(document.<RestrictionScalarDataPropertyValue>format(it), _function_7);
    };
    t.getScalarDataPropertyRestrictions().forEach(_function_6);
  }
  
  protected void _format(final RestrictionScalarDataPropertyValue s, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    s.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("."), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("="), _function_2);
  }
  
  protected void _format(final BinaryScalarRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("binaryScalarRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getBinaryScalarRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("length"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minLength"), _function_8), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxLength"), _function_10), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_12), _function_13);
  }
  
  protected void _format(final IRIScalarRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("iriScalarRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getIRIScalarRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("length"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minLength"), _function_8), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxLength"), _function_10), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("pattern"), _function_12), _function_13);
    final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_14), _function_15);
  }
  
  protected void _format(final NumericScalarRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("numericScalarRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getNumericScalarRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minInclusive"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxInclusive"), _function_8), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minExclusive"), _function_10), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxExclusive"), _function_12), _function_13);
    final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_14), _function_15);
  }
  
  protected void _format(final PlainLiteralScalarRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("plainLiteralScalarRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getIRIScalarRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("length"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minLength"), _function_8), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxLength"), _function_10), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("pattern"), _function_12), _function_13);
    final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("langRange"), _function_14), _function_15);
    final Procedure1<IHiddenRegionFormatter> _function_16 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_17 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_16), _function_17);
  }
  
  protected void _format(final ScalarOneOfRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("scalarOneOfRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getScalarOneOfRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_6), _function_7);
  }
  
  protected void _format(final ScalarOneOfLiteralAxiom sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("oneOf"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).keyword("="), _function_2);
  }
  
  protected void _format(final StringScalarRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("stringScalarRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getStringScalarRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("length"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minLength"), _function_8), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxLength"), _function_10), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("pattern"), _function_12), _function_13);
    final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_14), _function_15);
  }
  
  protected void _format(final SynonymScalarRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("synonymScalarRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getSynonymScalarRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_6), _function_7);
  }
  
  protected void _format(final TimeScalarRestriction sc, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    sc.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(sc).keyword("timeScalarRestriction"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(sc).ruleCall(this._oMLGrammarAccess.getTimeScalarRestrictionAccess().getNameIDTerminalRuleCall_2_0()), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(sc).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(sc).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(rcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minInclusive"), _function_6), _function_7);
    final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_9 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxInclusive"), _function_8), _function_9);
    final Procedure1<IHiddenRegionFormatter> _function_10 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_11 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("minExclusive"), _function_10), _function_11);
    final Procedure1<IHiddenRegionFormatter> _function_12 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_13 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("maxExclusive"), _function_12), _function_13);
    final Procedure1<IHiddenRegionFormatter> _function_14 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    final Procedure1<IHiddenRegionFormatter> _function_15 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.prepend(document.append(this.textRegionExtensions.regionFor(sc).keyword("restrictedRange"), _function_14), _function_15);
  }
  
  protected void _format(final DescriptionBoxExtendsClosedWorldDefinitions ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("extends"), _function_1);
  }
  
  protected void _format(final DescriptionBoxRefinement ax, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    ax.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(ax).keyword("refines"), _function_1);
  }
  
  protected void _format(final SingletonInstanceScalarDataPropertyValue s, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    s.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("."), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("="), _function_2);
  }
  
  protected void _format(final SingletonInstanceStructuredDataPropertyValue s, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    s.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("."), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("="), _function_2);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(s).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(s).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_5);
    final Consumer<StructuredDataPropertyTuple> _function_6 = (StructuredDataPropertyTuple it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<StructuredDataPropertyTuple>append(document.<StructuredDataPropertyTuple>format(it), _function_7);
    };
    s.getStructuredPropertyTuples().forEach(_function_6);
    final Consumer<ScalarDataPropertyValue> _function_7 = (ScalarDataPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_8 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<ScalarDataPropertyValue>append(document.<ScalarDataPropertyValue>format(it), _function_8);
    };
    s.getScalarDataPropertyValues().forEach(_function_7);
  }
  
  protected void _format(final StructuredDataPropertyTuple t, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    t.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(t).keyword("="), _function_1);
    final ISemanticRegion lcurly = this.textRegionExtensions.regionFor(t).keyword("{");
    final ISemanticRegion rcurly = this.textRegionExtensions.regionFor(t).keyword("}");
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.prepend(lcurly, _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.newLine();
    };
    document.append(lcurly, _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.indent();
    };
    document.<ISemanticRegion, ISemanticRegion>interior(lcurly, rcurly, _function_4);
    final Consumer<StructuredDataPropertyTuple> _function_5 = (StructuredDataPropertyTuple it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_6 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<StructuredDataPropertyTuple>append(document.<StructuredDataPropertyTuple>format(it), _function_6);
    };
    t.getStructuredPropertyTuples().forEach(_function_5);
    final Consumer<ScalarDataPropertyValue> _function_6 = (ScalarDataPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_7 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<ScalarDataPropertyValue>append(document.<ScalarDataPropertyValue>format(it), _function_7);
    };
    t.getScalarDataPropertyValues().forEach(_function_6);
  }
  
  protected void _format(final ScalarDataPropertyValue s, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    s.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("."), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(s).keyword("="), _function_2);
  }
  
  protected void _format(final ConceptInstance i, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    i.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(i).keyword("conceptInstance"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(i).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(i).keyword("is-a"), _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.prepend(this.textRegionExtensions.regionFor(i).keyword(")"), _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(i).keyword(")"), _function_5);
  }
  
  protected void _format(final ReifiedRelationshipInstance i, @Extension final IFormattableDocument document) {
    final Consumer<AnnotationPropertyValue> _function = (AnnotationPropertyValue it) -> {
      final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it_1) -> {
        it_1.setNewLines(1);
      };
      document.<AnnotationPropertyValue>append(document.<AnnotationPropertyValue>format(it), _function_1);
    };
    i.getAnnotations().forEach(_function);
    final Procedure1<IHiddenRegionFormatter> _function_1 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.append(this.textRegionExtensions.regionFor(i).keyword("reifiedRelationshipInstance"), _function_1);
    final Procedure1<IHiddenRegionFormatter> _function_2 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(i).keyword("("), _function_2);
    final Procedure1<IHiddenRegionFormatter> _function_3 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.surround(this.textRegionExtensions.regionFor(i).keyword("is-a"), _function_3);
    final Procedure1<IHiddenRegionFormatter> _function_4 = (IHiddenRegionFormatter it) -> {
      it.noSpace();
    };
    document.prepend(this.textRegionExtensions.regionFor(i).keyword(")"), _function_4);
    final Procedure1<IHiddenRegionFormatter> _function_5 = (IHiddenRegionFormatter it) -> {
      it.oneSpace();
    };
    document.append(this.textRegionExtensions.regionFor(i).keyword(")"), _function_5);
  }
  
  public void format(final Object sc, final IFormattableDocument document) {
    if (sc instanceof BinaryScalarRestriction) {
      _format((BinaryScalarRestriction)sc, document);
      return;
    } else if (sc instanceof IRIScalarRestriction) {
      _format((IRIScalarRestriction)sc, document);
      return;
    } else if (sc instanceof NumericScalarRestriction) {
      _format((NumericScalarRestriction)sc, document);
      return;
    } else if (sc instanceof PlainLiteralScalarRestriction) {
      _format((PlainLiteralScalarRestriction)sc, document);
      return;
    } else if (sc instanceof ScalarOneOfRestriction) {
      _format((ScalarOneOfRestriction)sc, document);
      return;
    } else if (sc instanceof StringScalarRestriction) {
      _format((StringScalarRestriction)sc, document);
      return;
    } else if (sc instanceof SynonymScalarRestriction) {
      _format((SynonymScalarRestriction)sc, document);
      return;
    } else if (sc instanceof TimeScalarRestriction) {
      _format((TimeScalarRestriction)sc, document);
      return;
    } else if (sc instanceof Scalar) {
      _format((Scalar)sc, document);
      return;
    } else if (sc instanceof Aspect) {
      _format((Aspect)sc, document);
      return;
    } else if (sc instanceof AspectSpecializationAxiom) {
      _format((AspectSpecializationAxiom)sc, document);
      return;
    } else if (sc instanceof ChainRule) {
      _format((ChainRule)sc, document);
      return;
    } else if (sc instanceof Concept) {
      _format((Concept)sc, document);
      return;
    } else if (sc instanceof ConceptSpecializationAxiom) {
      _format((ConceptSpecializationAxiom)sc, document);
      return;
    } else if (sc instanceof EntityExistentialRestrictionAxiom) {
      _format((EntityExistentialRestrictionAxiom)sc, document);
      return;
    } else if (sc instanceof EntityScalarDataProperty) {
      _format((EntityScalarDataProperty)sc, document);
      return;
    } else if (sc instanceof EntityScalarDataPropertyExistentialRestrictionAxiom) {
      _format((EntityScalarDataPropertyExistentialRestrictionAxiom)sc, document);
      return;
    } else if (sc instanceof EntityScalarDataPropertyParticularRestrictionAxiom) {
      _format((EntityScalarDataPropertyParticularRestrictionAxiom)sc, document);
      return;
    } else if (sc instanceof EntityScalarDataPropertyUniversalRestrictionAxiom) {
      _format((EntityScalarDataPropertyUniversalRestrictionAxiom)sc, document);
      return;
    } else if (sc instanceof EntityStructuredDataProperty) {
      _format((EntityStructuredDataProperty)sc, document);
      return;
    } else if (sc instanceof EntityStructuredDataPropertyParticularRestrictionAxiom) {
      _format((EntityStructuredDataPropertyParticularRestrictionAxiom)sc, document);
      return;
    } else if (sc instanceof EntityUniversalRestrictionAxiom) {
      _format((EntityUniversalRestrictionAxiom)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationship) {
      _format((ReifiedRelationship)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipSpecializationAxiom) {
      _format((ReifiedRelationshipSpecializationAxiom)sc, document);
      return;
    } else if (sc instanceof ScalarDataProperty) {
      _format((ScalarDataProperty)sc, document);
      return;
    } else if (sc instanceof Structure) {
      _format((Structure)sc, document);
      return;
    } else if (sc instanceof StructuredDataProperty) {
      _format((StructuredDataProperty)sc, document);
      return;
    } else if (sc instanceof UnreifiedRelationship) {
      _format((UnreifiedRelationship)sc, document);
      return;
    } else if (sc instanceof BundledTerminologyAxiom) {
      _format((BundledTerminologyAxiom)sc, document);
      return;
    } else if (sc instanceof ConceptInstance) {
      _format((ConceptInstance)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipInstance) {
      _format((ReifiedRelationshipInstance)sc, document);
      return;
    } else if (sc instanceof ConceptDesignationTerminologyAxiom) {
      _format((ConceptDesignationTerminologyAxiom)sc, document);
      return;
    } else if (sc instanceof TerminologyNestingAxiom) {
      _format((TerminologyNestingAxiom)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipInversePropertyPredicate) {
      _format((ReifiedRelationshipInversePropertyPredicate)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipPropertyPredicate) {
      _format((ReifiedRelationshipPropertyPredicate)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipSourceInversePropertyPredicate) {
      _format((ReifiedRelationshipSourceInversePropertyPredicate)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipSourcePropertyPredicate) {
      _format((ReifiedRelationshipSourcePropertyPredicate)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipTargetInversePropertyPredicate) {
      _format((ReifiedRelationshipTargetInversePropertyPredicate)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipTargetPropertyPredicate) {
      _format((ReifiedRelationshipTargetPropertyPredicate)sc, document);
      return;
    } else if (sc instanceof ScalarOneOfLiteralAxiom) {
      _format((ScalarOneOfLiteralAxiom)sc, document);
      return;
    } else if (sc instanceof TerminologyExtensionAxiom) {
      _format((TerminologyExtensionAxiom)sc, document);
      return;
    } else if (sc instanceof UnreifiedRelationshipInversePropertyPredicate) {
      _format((UnreifiedRelationshipInversePropertyPredicate)sc, document);
      return;
    } else if (sc instanceof UnreifiedRelationshipPropertyPredicate) {
      _format((UnreifiedRelationshipPropertyPredicate)sc, document);
      return;
    } else if (sc instanceof Bundle) {
      _format((Bundle)sc, document);
      return;
    } else if (sc instanceof RootConceptTaxonomyAxiom) {
      _format((RootConceptTaxonomyAxiom)sc, document);
      return;
    } else if (sc instanceof DescriptionBoxExtendsClosedWorldDefinitions) {
      _format((DescriptionBoxExtendsClosedWorldDefinitions)sc, document);
      return;
    } else if (sc instanceof DescriptionBoxRefinement) {
      _format((DescriptionBoxRefinement)sc, document);
      return;
    } else if (sc instanceof TerminologyGraph) {
      _format((TerminologyGraph)sc, document);
      return;
    } else if (sc instanceof AspectPredicate) {
      _format((AspectPredicate)sc, document);
      return;
    } else if (sc instanceof ConceptPredicate) {
      _format((ConceptPredicate)sc, document);
      return;
    } else if (sc instanceof ReifiedRelationshipPredicate) {
      _format((ReifiedRelationshipPredicate)sc, document);
      return;
    } else if (sc instanceof RestrictionStructuredDataPropertyTuple) {
      _format((RestrictionStructuredDataPropertyTuple)sc, document);
      return;
    } else if (sc instanceof AnonymousConceptUnionAxiom) {
      _format((AnonymousConceptUnionAxiom)sc, document);
      return;
    } else if (sc instanceof SpecificDisjointConceptAxiom) {
      _format((SpecificDisjointConceptAxiom)sc, document);
      return;
    } else if (sc instanceof DescriptionBox) {
      _format((DescriptionBox)sc, document);
      return;
    } else if (sc instanceof SingletonInstanceScalarDataPropertyValue) {
      _format((SingletonInstanceScalarDataPropertyValue)sc, document);
      return;
    } else if (sc instanceof SingletonInstanceStructuredDataPropertyValue) {
      _format((SingletonInstanceStructuredDataPropertyValue)sc, document);
      return;
    } else if (sc instanceof StructuredDataPropertyTuple) {
      _format((StructuredDataPropertyTuple)sc, document);
      return;
    } else if (sc instanceof ScalarDataPropertyValue) {
      _format((ScalarDataPropertyValue)sc, document);
      return;
    } else if (sc instanceof RestrictionScalarDataPropertyValue) {
      _format((RestrictionScalarDataPropertyValue)sc, document);
      return;
    } else if (sc instanceof RuleBodySegment) {
      _format((RuleBodySegment)sc, document);
      return;
    } else if (sc instanceof XtextResource) {
      _format((XtextResource)sc, document);
      return;
    } else if (sc instanceof AnnotationProperty) {
      _format((AnnotationProperty)sc, document);
      return;
    } else if (sc instanceof AnnotationPropertyValue) {
      _format((AnnotationPropertyValue)sc, document);
      return;
    } else if (sc instanceof Extent) {
      _format((Extent)sc, document);
      return;
    } else if (sc instanceof EObject) {
      _format((EObject)sc, document);
      return;
    } else if (sc == null) {
      _format((Void)null, document);
      return;
    } else if (sc != null) {
      _format(sc, document);
      return;
    } else {
      throw new IllegalArgumentException("Unhandled parameter types: " +
        Arrays.<Object>asList(sc, document).toString());
    }
  }
}
