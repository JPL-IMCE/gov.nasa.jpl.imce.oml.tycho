/*
 * Copyright 2016 California Institute of Technology ("Caltech").
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
package gov.nasa.jpl.imce.oml.zip

import gov.nasa.jpl.imce.oml.model.common.Extent
import gov.nasa.jpl.imce.oml.model.extensions.CatalogURIConverter
import gov.nasa.jpl.imce.oml.model.extensions.OMLCatalog
import gov.nasa.jpl.imce.oml.model.extensions.OMLExtensions
import java.io.File
import java.io.IOException
import java.io.OutputStream
import java.util.ArrayList
import java.util.HashMap
import java.util.Map
import java.util.regex.Pattern
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream
import org.eclipse.core.runtime.Assert
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.URIConverter
import org.eclipse.emf.ecore.resource.impl.ResourceImpl

import static extension gov.nasa.jpl.imce.oml.model.extensions.OMLExtensions.getCatalog
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.core.runtime.FileLocator
import java.net.URL

/**
 * An OMLZipResource is a kind of Resource that is loaded from and saved to an *.omlzip file
 * whose location corresponds to the mapping of the Resource URI according to the OMLCatalog
 * associated with its OMLZipResourceSet.
 * 
 * Similar to OMLXtextResource, an OMLZipResource specifies in default load/save options
 * the `file.extension' for OMLZipResource, i.e., 'omlzip'.
 */
class OMLZipResource extends ResourceImpl {

	static val String OML_SPECIFICATION_TABLES = "OMLSpecificationTables"

	static def OMLSpecificationTables getOrInitializeOMLSpecificationTables(ResourceSet rs) {
		if (!rs.loadOptions.containsKey(OML_SPECIFICATION_TABLES)) {
			val tables = new OMLSpecificationTables
			rs.loadOptions.put(OML_SPECIFICATION_TABLES, tables)
			rs.resources.forEach [ r |
				r.contents.forEach [ e |
					switch e {
						Extent: {
							e.modules.forEach[m|tables.queueModule(m)]
						}
					}
				]
			]
			tables.processQueue(rs)
		}
		val tables = rs.loadOptions.get(OML_SPECIFICATION_TABLES)
		switch tables {
			OMLSpecificationTables:
				tables
			default:
				throw new IllegalArgumentException('''OMLZipResource.initializeOMLSpecificationTables: should be already initialized, instead got: «tables»''')
		}
	}

	static def void clearOMLSpecificationTables(ResourceSet rs) {
		if (!rs.loadOptions.containsKey(OML_SPECIFICATION_TABLES))
			throw new IllegalArgumentException('''OMLZipResource.initializeOMLSpecificationTables: not initialized!''')
		rs.loadOptions.remove(OML_SPECIFICATION_TABLES)
	}

	static val Map<Object, Object> defaultOptions = {
		val options = new HashMap<Object, Object>()
		options.put("file.extension", "omlzip")
		options
	}

	var CatalogURIConverter uriConverter = null

	new() {
		super()
		this.defaultLoadOptions = defaultOptions
		this.defaultSaveOptions = defaultOptions
	}

	/**
	 * The URIConverter of an OMLZipResource is 
	 * the CatalogURIConverter associated with its OMLZipResourceSet.
	 */
	override protected URIConverter getURIConverter() {
		val rs = getResourceSet
		switch rs {
			OMLZipResourceSet:
				uriConverter = rs.getCatalogURIConverter
			default: {
				val omlCatalog = rs.getCatalog
				if (null === omlCatalog)
					throw new IllegalArgumentException('''OMLZipResource.getURIConverter: there must be an OMLCatalog on the resource set!''')
				uriConverter = new CatalogURIConverter(omlCatalog)
			}
		}
		uriConverter
	}

	/**
	 * Loading an OMLZipResource involves mapping its URI to an *.omlzip file according to the CatalogURIConverter associated with its ResourceSet.
	 * If successful, the contents of the loaded OMLZipResource is a single toplevel OML Extent whose contents
	 * is the result of parsing all the tables in the *.omlzip file.
	 */
	override void load(Map<?, ?> options) throws IOException {
		synchronized(this) {
			if (!loaded)
				loadInternal(options)
		}
	}
	
	protected def void loadInternal(Map<?, ?> options) throws IOException {
		System.out.println("OMLZip. Loading: " + uri)
		val started = System.currentTimeMillis
		val response = if (null === options)
				new HashMap<Object, Object>()
			else {
				val r = options.get(URIConverter::OPTION_RESPONSE) ?: new HashMap<Object, Object>()
				switch r {
					Map<?, ?>:
						r
					default:
						throw new IllegalArgumentException('''OMLZipResource.load(options) the entry for «URIConverter::OPTION_RESPONSE» must be a Map<Object,Object>!''')
				}
			}
		val effectiveOptions = new CatalogURIConverter.OptionsMap(URIConverter::OPTION_RESPONSE, response, options,
			defaultLoadOptions)
		val rs = getResourceSet
		switch rs {
			OMLZipResourceSet: {
				val File omlFile = switch uri.scheme {
					case "http": {
						val normalized = rs.getCatalogURIConverter.normalize(uri)
						val normalizedExt = normalized.fileExtension
						val fileExtension = effectiveOptions?.get("file.extension")
						switch fileExtension {
							String:
								if (!fileExtension.nullOrEmpty) {
									val normalizedFileURI = if (null === normalizedExt)
											normalized.appendFileExtension(fileExtension)
										else if (normalizedExt == fileExtension)
											normalized
										else
											throw new IllegalArgumentException('''OMLZipResource.load(options) invalid URI file extension «normalizedExt» should be instead «fileExtension» in normalized URI: «normalized»''')

									new File(normalizedFileURI.toFileString)
								} else
									throw new IllegalArgumentException(
										"OMLZipResource.load() requires a non-null 'file.extension' option: " + uri)
						}
					}
					case "platform": {
						val purl = new URL(uri.toString)
						val furl = FileLocator.toFileURL(purl)
						if (furl != purl)
							new File(furl.file)
						else
							throw new IllegalArgumentException(
								"OMLZipResource.load() failed to resolve platform URL: " + uri)
					}
					default:
						if (uri.file)
							new File(uri.toFileString)
						else
							throw new IllegalArgumentException('''OMLZipResource.load(): unrecognized URI scheme in: «uri» (must be either http or file): «uri.isFile»''')
				}
				
				if (!omlFile.exists)
					throw new IllegalArgumentException('''OMLZipResource.load(): URI: «uri» resolves to a non-existent file: «omlFile»''')
				OMLSpecificationTables.load(rs, this, omlFile)
			}
			default: {
				val OMLCatalog c = OMLExtensions.getCatalog(rs)
				if (null === c)
					throw new IllegalArgumentException(
						"OMLZipResource.load(): requires an OMLCatalog on this resource set!")

				val File omlFile = switch uri.scheme {
					case "http": {
						val resolved = c.resolveURI(uri.toString)
						if (null === resolved || !resolved.startsWith("file:"))
							throw new IllegalArgumentException('''OMLZipResource.load(): No catalog mapping for URI: «uri»''')
						val resolvedURI = URI::createURI(resolved)
						val resolvedExt = resolvedURI.fileExtension
						val fileExtension = effectiveOptions?.get("file.extension")
						switch fileExtension {
							String:
								if (!fileExtension.nullOrEmpty) {
									val normalizedFileURI = if (null === resolvedExt)
											resolvedURI.appendFileExtension(fileExtension)
										else if (resolvedExt == fileExtension)
											resolvedURI
										else
											throw new IllegalArgumentException('''OMLZipResource.load(options) invalid URI file extension «resolvedExt» should be instead «fileExtension» in resolved URI: «resolvedURI»''')
									new File(normalizedFileURI.toFileString)
								} else
									throw new IllegalArgumentException(
										"OMLZipResource.load() requires a non-null 'file.extension' option: " + uri)
						}
					}
					case "platform": {
						val purl = new URL(uri.toString)
						val furl = FileLocator.toFileURL(purl)
						if (furl != purl)
							new File(furl.file)
						else
							throw new IllegalArgumentException(
								"OMLZipResource.load() failed to resolve platform URL: " + uri)
					}
					default:
						if (uri.file)
							new File(uri.toFileString)
						else
							throw new IllegalArgumentException('''OMLZipResource.load(): unrecognized URI scheme in: «uri» (must be either http or file): «uri.isFile»''')
				}

				if (!omlFile.exists)
					throw new IllegalArgumentException('''OMLZipResource.load(): URI: «uri» resolves to a non-existent file: «omlFile»''')
				OMLSpecificationTables.load(rs, this, omlFile)
				
				val done = System.currentTimeMillis
				val delta = done - started
				System.out.println("OMLZip: Loaded "+uri+" in: "+delta+"ms")
			}
		}
	}

	/**
	 * Saving an OMLZipResource involves producing a zip archive with multiple Json lines files, one for
	 * each OML concrete metaclass and whose contents is precisely the Json serialization of each instance
	 * of that concrete metaclass in the OMLZipResource contents.
	 */
	override protected void doSave(OutputStream outputStream, Map<?, ?> options) throws IOException {
		val ZipArchiveOutputStream os = new ZipArchiveOutputStream(outputStream)
		try {
			val extents = contents.filter(Extent)
			if (1 != extents.size)
				throw new IllegalArgumentException(
					'''OMLZipResource should have 1 OML Extent but it has «extents.size» toplevel Extents instead.''')
					
			val root = extents.get(0)
			OMLSpecificationTables.save(root, os)
		} finally {
			os.close
		}
	}

	public static val Pattern KeyValue = Pattern.compile(
		'''"([^"]*)":(true|false|null|"(.*?)"|\{"literalType":"([^"]*)","value":("[^"]*"|\["(\\"|\n|\r|[^"]+?)"(,"(\\"|\n|\r|[^"]*?)")*\])\}|\["(\\"|\n|\r|[^"]*?)"(,"(\\"|\n|\r|[^"]*?)")*\]),?''')

	protected static def ArrayList<Map<String, String>> lines2tuples(ArrayList<String> lines) {
		val list = new ArrayList<Map<String, String>>()
		while (!lines.empty) {
			val line = lines.remove(lines.size - 1)
			val map = new HashMap<String, String>()
			Assert.isTrue(line.startsWith("{"))
			Assert.isTrue(line.endsWith("}"))
			val keyValues = line.substring(1, line.length - 1)
			val m = KeyValue.matcher(keyValues)
			while (m.find()) {
				val key = m.group(1)
				val value = m.group(3) ?: m.group(2)	
				map.put(key, value)
			}
			list.add(map)
		}
		return list
	}

}
