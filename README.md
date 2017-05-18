# Tycho organization for OML

# Process notes

## To set versions everywhere

Execute from the `gov.nasa.jpl.imce.oml.tycho` folder:

```shell
 mvn org.eclipse.tycho:tycho-versions-plugin:set-version -DnewVersion={VERSION} -Dtycho.mode=maven
```

where `{VERSION}` follows [semantic versioning](http://semver.org) (e.g., `Major.Minor.Patch` or `Major.Minor.Patch-SNAPSHOT`).

Note that this *should* update all versions in the following locations:

- `pom.xml//project/version`
- `pom.xml//project/parent/version`
- `META-INF/MANIFEST.MF//Bundle-Version`
- `feature.xml//feature/@version`
- `*.product//product/@version`
- `*.product//product/features/feature/@id`
- `category.xml//site/feature[@id=...]/@url`
- `category.xml//site/feature[@id=...]/@version`

Check carefully the log to make sure all versions have been properly updated.
Check with `git status` and/or `git diff` to confirm the changes.

## Deployment

TODO: Explore using maven profiles to decouple deployment info.

### Artifactory publishing

In `~/.m2/settings.xml` include, replacing `{ARTIFACTORY USERNAME}` and `{ARTIFACTORY APIKEY}` with appropriate credentials.

```
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd/"> 
  <servers>
    <server>
      <id>artifactory</id>
      <username>{ARTIFACTORY USERNAME}</username>
      <password>{ARTIFACTORY APIKEY}</password>
    </server>
  </servers>
</settings>
```

## Bintray publishing (currently disabled because some artifacts exceed the size limit on bintray)

In `~/.m2/settings.xml` include, replacing `{BINTRAY USERNAME}` and `{BINTRAY APIKEY}` with appropriate credentials.

```
<?xml version="1.0" encoding="UTF-8"?>
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                      http://maven.apache.org/xsd/settings-1.0.0.xsd/"> 
  <servers>
    <server>
      <id>bintray</id>
      <username>{BINTRAY USERNAME}</username>
      <password>{BINTRAY APIKEY}</password>
    </server>
  </servers>
</settings>
```

