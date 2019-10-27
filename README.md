# Docker Hub Hooks Example

The scripts in this respository are intended to provide auto-updating builds based on tags.

## Introduction

The key words “MUST”, “MUST NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “RECOMMENDED”, “MAY”, and “OPTIONAL” in this document are to be interpreted as described in [RFC 2119](http://tools.ietf.org/html/rfc2119).

## Preamble

For best practices on Docker Hub, when you push a patch version of your container, you should be updating the major and minor versions of your release to point to this new build.  Additionally, when pushing a new minor release, you should be updating the major container version.

Grabbing `:1` of your container, should always pull the most up-to-date release, be it v1.3.1 or v1.99.99.  If you wanted v1.0.0 specifically, best practices means you should grab `:1.0.0`. If someone always wants the latest version, they can download `:latest`.  However, if they always want v1.2 and all patches of v1.2 (e.g. v1.2.4, v1.2.219), but never v1.3, they can download `:1.2`.

Example:

When you tag and push v1.2.3 of your repository, the scripts will create a new tag, `:1.2.3`, for your container.  It will also automatically update `:1.2` and `:1` for you.  Keeping all releases up to date.

## How To Use

**Click "Use This Template" on Github, do NOT "Fork".**

In order to use these scripts, you **MUST** tag your commits following [semantic version standards](https://semver.org).

The format is "vMAJOR.MINOR.PATCH" (please note the lowercase "v").  Examples: `v0.0.4`, `v1.0.0`, `v2.0.103`.

If you wish to use lightweight tags within git, it is recommended to push your tag **PRIOR** to pushing the commit so that Docker Hub does not label your build incorrectly.  Yes, there is a delay prior to Docker Hub building your release, however, you should not rely on it.

To properly version your releases, increment the:

1. MAJOR version when you make incompatible API changes,
1. MINOR version when you add functionality in a backwards-compatible manner, and
1. PATCH version when you make backwards-compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.  Examples: `v1.0.0-rc10`, `v1.9.0-alpha`

### Shallow Pulls

When Docker Cloud pulls a branch from a source code repository, it performs a shallow clone (only the tip of the specified branch). This has the advantage of minimizing the amount of data transfer necessary from the repository and speeding up the build because it pulls only the minimal code necessary.

Because of this, in order to get the tags, a full "unshallow" clone needs to be fetched.  This can potentially take a very long time and transfers a lot of data depending on your repository.  It is not recommended to use these scripts on a large repository.  Sorry.
