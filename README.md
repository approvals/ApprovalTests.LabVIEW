[![Image](https://www.vipm.io/package/sas_lib_approval_tests/badge.svg?metric=installs)](https://www.vipm.io/package/sas_lib_approval_tests/) [![Image](https://www.vipm.io/package/sas_lib_approval_tests/badge.svg?metric=stars)](https://www.vipm.io/package/sas_lib_approval_tests/)

[![CI - Test&Build](https://github.com/approvals/ApprovalTests.LabVIEW/actions/workflows/build.yml/badge.svg)](https://github.com/approvals/ApprovalTests.LabVIEW/actions/workflows/build.yml)
# Approval Testing For LabVIEW


This is a project to implement approval testing in LabVIEW. It is based off the work of Llewellyn Falco, which can be found [here](https://approvaltests.com/). 

If you are already familiar with approval testing then jump right to [Getting Started](#getting-started)

<!-- toc -->
## Contents

  * [What Is Approval Testing?](#what-is-approval-testing)
  * [How Does It Work](#how-does-it-work)
  * [Getting Started](#getting-started)
    * [New Project](#new-project)
    * [Existing Projects](#existing-projects)
    * [Source Code Control Notes](#source-code-control-notes)
    * [Available Verify Methods](#available-verify-methods)
    * [Reporters](#reporters)
  * [Contributing](#contributing)<!-- endToc -->

## What Is Approval Testing?

## How Does It Work

## Getting Started

###  New Project

The easiest way to use Approval Tests in a new project is to clone the [Starter Project](https://github.com/approvals/ApprovalTests.LabVIEW.StarterProject/blob/main/README.md)

### Existing Projects

You can download the latest officially released version off of [VIPM](https://www.vipm.io/package/sas_lib_approval_tests/). 

### Source Code Control Notes

- Make sure you are committing the `*.approved.*` files and tracking those.
- Add `*.actual.*` to your .gitignore file. There is no need to keep track of these files.

### Available Verify Methods

There are a variety of verify methods available depending on what you want to verify.

#### Verify

Takes in anything. With default printer, it needs to be a string or it will error out. With the correct printer, you can pass in anything, in that case you are responsible for providing the printer class that will decode the variant in and flatten to some reasonable string.

#### Verify as JSON

Takes in anything. Flattens it to JSON.

#### Verify File

Takes in a file path. In general compares to approved using the filehash. If it detects a .vi or .ctl file, it uses the built-in comparison function in LabVIEW. In LabVIEW 2020, It is buggy. Apparently some of those bugs have been fixed in newer versions.

#### Verify Parameterized

You pass in a reference to the function you want to test. You also pass in a set of maps. Each map maps each control label to a variant value (You must use the "to Variant" primitive or you'll get a broken run arrow due to the type mismatch). The control must be connected to the connector pane. Ideally you would have the same number of elements in your map as controls connected to the connector pane. If you don't specify a value for a control, it just stays whatever the default is set at. The underlying code will cycle through the set and for each map, will set the control values appropriately and then run the vi and capture any indicators connected to the connector pane. The control and corresponding indicator values are all stored in the approved file.

#### Verify Combinations

This is similar to the verify parameterized (in fact it calls it behind the scenes). Instead of specifying each set of parameters, you specify a single map which maps each control label to an array of variant values (there is a utility vi, "array to array of variants.vim) to assist with this. From this, the verify function calculates each set of parameters from all the possible combinations and verifies all the combinations.

### Reporters

Reporters are automatically launched when a test fails. This makes it easy to see what has changed and approve the changes if desired.

- Beyond Compare - This the preferred reporter but it is not free.
- WinMerge - This is free.
- LVCompare - If you try to verify a VI or ctl, it will launch LVCompare

#### Reporters and CI

If no reporter is detected then nothing is reported. This works well for CI - simply don't install Beyond Compare or WinMerge on your CI machine. For LVCompare we need to figure out a solution...

## Contributing

This is written in LV2020. If you want to contribute, reach out.

##

If you happen to clone the repo and want to run the unit tests for the extensions, there is a run_unittests.sh script.

<!-- snippet: run_tests -->
<a id='snippet-run_tests'></a>
```sh
SECONDS=0
echo "Running Basic Mechanics Tests"
g-cli caraya -- -s "Tests\\Basic.Mechanics.Tests\\Basic.Mechanics.Tests.lvclass" -x "reports\\Basic.Mechanics.UnitTestReport.xml"
echo "Test Time: $SECONDS"
SECONDS=0
echo "Running Caraya Tests" # needed because caray tool is not very verbose.
g-cli caraya -- -s "Tests\\Caraya.Tests\\Caraya Extension Tests\\Caraya Extension Tests.lvclass" -x "reports\\Caraya.UnitTestReport.xml"
echo "Test Time: $SECONDS"
SECONDS=0
echo "Running Scrubber Tests"
g-cli caraya -- -s "Tests\\Scrubber.Tests\\Scrubber.Tests.lvclass" -x "reports\\Scrubber.UnitTestReport.xml"
echo "Test Time: $SECONDS"
g-cli vitester -- -r "reports\\VITester.UnitTestReport.xml" "Approval Testing.lvproj"
g-cli lunit -- -r "reports\\LUnit.UnitTestReport.xml" "Approval Testing.lvproj"
```
<sup><a href='/_run_unittests.sh#L13-L28' title='Snippet source file'>snippet source</a> | <a href='#snippet-run_tests' title='Start of snippet'>anchor</a></sup>
<!-- endSnippet -->

