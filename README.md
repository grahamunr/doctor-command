runcommand/doctor
=================

Run a series of checks against WordPress to diagnose issues.

[![Build Status](https://travis-ci.org/runcommand/doctor.svg?branch=master)](https://travis-ci.org/runcommand/doctor)

Quick links: [Using](#using) | [Installing](#installing) | [Contributing](#contributing)

## Using

This package implements the following commands:

### wp doctor diagnose

Run a series of checks against WordPress to diagnose issues.

~~~
wp doctor diagnose <checks>... [--format=<format>]
~~~

**OPTIONS**

A check is a routine run against some scope of WordPress that reports
a 'status' and a 'message'. The status can be 'success', 'warning', or
'error'. The message should be a human-readable explanation of the
status.

	<checks>...
		Names of one or more checks to run.

	[--format=<format>]
		Render results in a particular format.
		---
		default: table
		options:
		  - table
		  - json
		  - csv
		  - yaml
		---

**EXAMPLES**

    $ wp doctor diagnose core-update
    +-------------+---------+-----------------------------------------------------------+
    | name        | status  | message                                                   |
    +-------------+---------+-----------------------------------------------------------+
    | core-update | warning | A new major version of WordPress is available for update. |
    +-------------+---------+-----------------------------------------------------------+



### wp doctor checks

List available checks to run.

~~~
wp doctor checks [--format=<format>]
~~~

**OPTIONS**

	[--format=<format>]
		Render output in a specific format.
		---
		default: table
		options:
		  - table
		  - json
		  - csv
		---

**EXAMPLES**

    $ wp doctor checks
    +-------------+---------------------------------------------+
    | name        | description                                 |
    +-------------+---------------------------------------------+
    | core-update | Check whether WordPress core is up to date. |
    +-------------+---------------------------------------------+



## Installing

Installing this package requires WP-CLI v0.23.0 or greater. Update to the latest stable release with `wp cli update`.

Once you've done so, you can install this package with `wp package install runcommand/doctor`.

## Contributing

We appreciate you taking the initiative to contribute to this project.

Contributing isn’t limited to just code. We encourage you to contribute in the way that best fits your abilities, by writing tutorials, giving a demo at your local meetup, helping other users with their support questions, or revising our documentation.

### Reporting a bug

Think you’ve found a bug? We’d love for you to help us get it fixed.

Before you create a new issue, you should [search existing issues](https://github.com/runcommand/doctor/issues?q=label%3Abug%20) to see if there’s an existing resolution to it, or if it’s already been fixed in a newer version.

Once you’ve done a bit of searching and discovered there isn’t an open or fixed issue for your bug, please [create a new issue](https://github.com/runcommand/doctor/issues/new) with the following:

1. What you were doing (e.g. "When I run `wp post list`").
2. What you saw (e.g. "I see a fatal about a class being undefined.").
3. What you expected to see (e.g. "I expected to see the list of posts.")

Include as much detail as you can, and clear steps to reproduce if possible.

### Creating a pull request

Want to contribute a new feature? Please first [open a new issue](https://github.com/runcommand/doctor/issues/new) to discuss whether the feature is a good fit for the project.

Once you've decided to commit the time to seeing your pull request through, please follow our guidelines for creating a pull request to make sure it's a pleasant experience:

1. Create a feature branch for each contribution.
2. Submit your pull request early for feedback.
3. Include functional tests with your changes. [Read the WP-CLI documentation](https://wp-cli.org/docs/pull-requests/#functional-tests) for an introduction.
4. Follow the [WordPress Coding Standards](http://make.wordpress.org/core/handbook/coding-standards/).