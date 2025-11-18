About zlib-ng-feedstock
=======================

Feedstock license: [BSD-3-Clause](https://github.com/conda-forge/zlib-ng-feedstock/blob/main/LICENSE.txt)

Home: https://github.com/zlib-ng/zlib-ng

Package license: Zlib

Summary: zlib data compression library for the next generation systems

Current build status
====================


<table>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-libzlib-green.svg)](https://anaconda.org/jaimergp/libzlib) | [![Conda Downloads](https://img.shields.io/conda/dn/jaimergp/libzlib.svg)](https://anaconda.org/jaimergp/libzlib) | [![Conda Version](https://img.shields.io/conda/vn/jaimergp/libzlib.svg)](https://anaconda.org/jaimergp/libzlib) | [![Conda Platforms](https://img.shields.io/conda/pn/jaimergp/libzlib.svg)](https://anaconda.org/jaimergp/libzlib) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-zlib-green.svg)](https://anaconda.org/jaimergp/zlib) | [![Conda Downloads](https://img.shields.io/conda/dn/jaimergp/zlib.svg)](https://anaconda.org/jaimergp/zlib) | [![Conda Version](https://img.shields.io/conda/vn/jaimergp/zlib.svg)](https://anaconda.org/jaimergp/zlib) | [![Conda Platforms](https://img.shields.io/conda/pn/jaimergp/zlib.svg)](https://anaconda.org/jaimergp/zlib) |
| [![Conda Recipe](https://img.shields.io/badge/recipe-zlib--ng-green.svg)](https://anaconda.org/jaimergp/zlib-ng) | [![Conda Downloads](https://img.shields.io/conda/dn/jaimergp/zlib-ng.svg)](https://anaconda.org/jaimergp/zlib-ng) | [![Conda Version](https://img.shields.io/conda/vn/jaimergp/zlib-ng.svg)](https://anaconda.org/jaimergp/zlib-ng) | [![Conda Platforms](https://img.shields.io/conda/pn/jaimergp/zlib-ng.svg)](https://anaconda.org/jaimergp/zlib-ng) |

Installing zlib-ng
==================

Installing `zlib-ng` from the `jaimergp/label/zlib-ng-compat` channel can be achieved by adding `jaimergp/label/zlib-ng-compat` to your channels with:

```
conda config --add channels jaimergp/label/zlib-ng-compat
conda config --set channel_priority strict
```

Once the `jaimergp/label/zlib-ng-compat` channel has been enabled, `libzlib, zlib, zlib-ng` can be installed with `conda`:

```
conda install libzlib zlib zlib-ng
```

or with `mamba`:

```
mamba install libzlib zlib zlib-ng
```

It is possible to list all of the versions of `libzlib` available on your platform with `conda`:

```
conda search libzlib --channel jaimergp/label/zlib-ng-compat
```

or with `mamba`:

```
mamba search libzlib --channel jaimergp/label/zlib-ng-compat
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search libzlib --channel jaimergp/label/zlib-ng-compat

# List packages depending on `libzlib`:
mamba repoquery whoneeds libzlib --channel jaimergp/label/zlib-ng-compat

# List dependencies of `libzlib`:
mamba repoquery depends libzlib --channel jaimergp/label/zlib-ng-compat
```




Updating zlib-ng-feedstock
==========================

If you would like to improve the zlib-ng recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`jaimergp` channel, whereupon the built conda packages will be available for
everybody to install and use from the `jaimergp` channel.
Note that all branches in the conda-forge/zlib-ng-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks, and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@hmaarrfk](https://github.com/hmaarrfk/)

