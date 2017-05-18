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
package gov.nasa.jpl.imce.oml.runtime.provider;

import gov.nasa.jpl.imce.oml.runtime.OMLRuntimePackage;

import gov.nasa.jpl.imce.oml.runtime.util.OMLRuntimeAdapterFactory;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.notify.Notification;
import org.eclipse.emf.common.notify.Notifier;

import org.eclipse.emf.common.util.ResourceLocator;

import org.eclipse.emf.edit.domain.EditingDomain;

import org.eclipse.emf.edit.provider.ChangeNotifier;
import org.eclipse.emf.edit.provider.ChildCreationExtenderManager;
import org.eclipse.emf.edit.provider.ComposeableAdapterFactory;
import org.eclipse.emf.edit.provider.ComposedAdapterFactory;
import org.eclipse.emf.edit.provider.IChangeNotifier;
import org.eclipse.emf.edit.provider.IChildCreationExtender;
import org.eclipse.emf.edit.provider.IDisposable;
import org.eclipse.emf.edit.provider.IEditingDomainItemProvider;
import org.eclipse.emf.edit.provider.IItemLabelProvider;
import org.eclipse.emf.edit.provider.IItemPropertySource;
import org.eclipse.emf.edit.provider.INotifyChangedListener;
import org.eclipse.emf.edit.provider.IStructuredItemContentProvider;
import org.eclipse.emf.edit.provider.ITreeItemContentProvider;

/**
 * This is the factory that is used to provide the interfaces needed to support Viewers.
 * The adapters generated by this factory convert EMF adapter notifications into calls to {@link #fireNotifyChanged fireNotifyChanged}.
 * The adapters also support Eclipse property sheets.
 * Note that most of the adapters are shared among multiple instances.
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @generated
 */
public class OMLRuntimeItemProviderAdapterFactory extends OMLRuntimeAdapterFactory implements ComposeableAdapterFactory, IChangeNotifier, IDisposable, IChildCreationExtender {
	/**
	 * This keeps track of the root adapter factory that delegates to this adapter factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected ComposedAdapterFactory parentAdapterFactory;

	/**
	 * This is used to implement {@link org.eclipse.emf.edit.provider.IChangeNotifier}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected IChangeNotifier changeNotifier = new ChangeNotifier();

	/**
	 * This helps manage the child creation extenders.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected ChildCreationExtenderManager childCreationExtenderManager = new ChildCreationExtenderManager(OMLRuntimeEditPlugin.INSTANCE, OMLRuntimePackage.eNS_URI);

	/**
	 * This keeps track of all the supported types checked by {@link #isFactoryForType isFactoryForType}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected Collection<Object> supportedTypes = new ArrayList<Object>();

	/**
	 * This constructs an instance.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public OMLRuntimeItemProviderAdapterFactory() {
		supportedTypes.add(IEditingDomainItemProvider.class);
		supportedTypes.add(IStructuredItemContentProvider.class);
		supportedTypes.add(ITreeItemContentProvider.class);
		supportedTypes.add(IItemLabelProvider.class);
		supportedTypes.add(IItemPropertySource.class);
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLDescription} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLDescriptionItemProvider omlDescriptionItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLDescription}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLDescriptionAdapter() {
		if (omlDescriptionItemProvider == null) {
			omlDescriptionItemProvider = new OMLDescriptionItemProvider(this);
		}

		return omlDescriptionItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLStructure} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLStructureItemProvider omlStructureItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLStructure}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLStructureAdapter() {
		if (omlStructureItemProvider == null) {
			omlStructureItemProvider = new OMLStructureItemProvider(this);
		}

		return omlStructureItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLAspect} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLAspectItemProvider omlAspectItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLAspect}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLAspectAdapter() {
		if (omlAspectItemProvider == null) {
			omlAspectItemProvider = new OMLAspectItemProvider(this);
		}

		return omlAspectItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLConcept} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLConceptItemProvider omlConceptItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLConcept}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLConceptAdapter() {
		if (omlConceptItemProvider == null) {
			omlConceptItemProvider = new OMLConceptItemProvider(this);
		}

		return omlConceptItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLReifiedRelationship} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLReifiedRelationshipItemProvider omlReifiedRelationshipItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLReifiedRelationship}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLReifiedRelationshipAdapter() {
		if (omlReifiedRelationshipItemProvider == null) {
			omlReifiedRelationshipItemProvider = new OMLReifiedRelationshipItemProvider(this);
		}

		return omlReifiedRelationshipItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLUnreifiedRelationship} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLUnreifiedRelationshipItemProvider omlUnreifiedRelationshipItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLUnreifiedRelationship}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLUnreifiedRelationshipAdapter() {
		if (omlUnreifiedRelationshipItemProvider == null) {
			omlUnreifiedRelationshipItemProvider = new OMLUnreifiedRelationshipItemProvider(this);
		}

		return omlUnreifiedRelationshipItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLEntityDataPropertyToScalar} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLEntityDataPropertyToScalarItemProvider omlEntityDataPropertyToScalarItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLEntityDataPropertyToScalar}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLEntityDataPropertyToScalarAdapter() {
		if (omlEntityDataPropertyToScalarItemProvider == null) {
			omlEntityDataPropertyToScalarItemProvider = new OMLEntityDataPropertyToScalarItemProvider(this);
		}

		return omlEntityDataPropertyToScalarItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLEntityDataPropertyToStructure} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLEntityDataPropertyToStructureItemProvider omlEntityDataPropertyToStructureItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLEntityDataPropertyToStructure}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLEntityDataPropertyToStructureAdapter() {
		if (omlEntityDataPropertyToStructureItemProvider == null) {
			omlEntityDataPropertyToStructureItemProvider = new OMLEntityDataPropertyToStructureItemProvider(this);
		}

		return omlEntityDataPropertyToStructureItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLStructureDataPropertyToScalar} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLStructureDataPropertyToScalarItemProvider omlStructureDataPropertyToScalarItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLStructureDataPropertyToScalar}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLStructureDataPropertyToScalarAdapter() {
		if (omlStructureDataPropertyToScalarItemProvider == null) {
			omlStructureDataPropertyToScalarItemProvider = new OMLStructureDataPropertyToScalarItemProvider(this);
		}

		return omlStructureDataPropertyToScalarItemProvider;
	}

	/**
	 * This keeps track of the one adapter used for all {@link gov.nasa.jpl.imce.oml.runtime.OMLStructureDataPropertyToStructure} instances.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected OMLStructureDataPropertyToStructureItemProvider omlStructureDataPropertyToStructureItemProvider;

	/**
	 * This creates an adapter for a {@link gov.nasa.jpl.imce.oml.runtime.OMLStructureDataPropertyToStructure}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter createOMLStructureDataPropertyToStructureAdapter() {
		if (omlStructureDataPropertyToStructureItemProvider == null) {
			omlStructureDataPropertyToStructureItemProvider = new OMLStructureDataPropertyToStructureItemProvider(this);
		}

		return omlStructureDataPropertyToStructureItemProvider;
	}

	/**
	 * This returns the root adapter factory that contains this factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ComposeableAdapterFactory getRootAdapterFactory() {
		return parentAdapterFactory == null ? this : parentAdapterFactory.getRootAdapterFactory();
	}

	/**
	 * This sets the composed adapter factory that contains this factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void setParentAdapterFactory(ComposedAdapterFactory parentAdapterFactory) {
		this.parentAdapterFactory = parentAdapterFactory;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public boolean isFactoryForType(Object type) {
		return supportedTypes.contains(type) || super.isFactoryForType(type);
	}

	/**
	 * This implementation substitutes the factory itself as the key for the adapter.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Adapter adapt(Notifier notifier, Object type) {
		return super.adapt(notifier, this);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	@Override
	public Object adapt(Object object, Object type) {
		if (isFactoryForType(type)) {
			Object adapter = super.adapt(object, type);
			if (!(type instanceof Class<?>) || (((Class<?>)type).isInstance(adapter))) {
				return adapter;
			}
		}

		return null;
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public List<IChildCreationExtender> getChildCreationExtenders() {
		return childCreationExtenderManager.getChildCreationExtenders();
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public Collection<?> getNewChildDescriptors(Object object, EditingDomain editingDomain) {
		return childCreationExtenderManager.getNewChildDescriptors(object, editingDomain);
	}

	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public ResourceLocator getResourceLocator() {
		return childCreationExtenderManager;
	}

	/**
	 * This adds a listener.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void addListener(INotifyChangedListener notifyChangedListener) {
		changeNotifier.addListener(notifyChangedListener);
	}

	/**
	 * This removes a listener.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void removeListener(INotifyChangedListener notifyChangedListener) {
		changeNotifier.removeListener(notifyChangedListener);
	}

	/**
	 * This delegates to {@link #changeNotifier} and to {@link #parentAdapterFactory}.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void fireNotifyChanged(Notification notification) {
		changeNotifier.fireNotifyChanged(notification);

		if (parentAdapterFactory != null) {
			parentAdapterFactory.fireNotifyChanged(notification);
		}
	}

	/**
	 * This disposes all of the item providers created by this factory. 
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void dispose() {
		if (omlDescriptionItemProvider != null) omlDescriptionItemProvider.dispose();
		if (omlStructureItemProvider != null) omlStructureItemProvider.dispose();
		if (omlAspectItemProvider != null) omlAspectItemProvider.dispose();
		if (omlConceptItemProvider != null) omlConceptItemProvider.dispose();
		if (omlReifiedRelationshipItemProvider != null) omlReifiedRelationshipItemProvider.dispose();
		if (omlUnreifiedRelationshipItemProvider != null) omlUnreifiedRelationshipItemProvider.dispose();
		if (omlEntityDataPropertyToScalarItemProvider != null) omlEntityDataPropertyToScalarItemProvider.dispose();
		if (omlEntityDataPropertyToStructureItemProvider != null) omlEntityDataPropertyToStructureItemProvider.dispose();
		if (omlStructureDataPropertyToScalarItemProvider != null) omlStructureDataPropertyToScalarItemProvider.dispose();
		if (omlStructureDataPropertyToStructureItemProvider != null) omlStructureDataPropertyToStructureItemProvider.dispose();
	}

}
