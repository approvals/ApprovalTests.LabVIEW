[![Image](https://gitlab.com/sas-blog/approval-testing/-/badges/release.svg)](https://gitlab.com/sas-blog/approval-testing/-/releases) [![Image](https://www.vipm.io/package/sas_lib_approval_tests/badge.svg?metric=installs)](https://www.vipm.io/package/sas_lib_approval_tests/) [![Image](https://www.vipm.io/package/sas_lib_approval_tests/badge.svg?metric=stars)](https://www.vipm.io/package/sas_lib_approval_tests/)

[![CI - Test&Build](https://github.com/approvals/ApprovalTests.LabVIEW/actions/workflows/build.yml/badge.svg)](https://github.com/approvals/ApprovalTests.LabVIEW/actions/workflows/build.yml)
# Approval Testing For LabVIEW


This is a project to implement approval testing in LabVIEW. It is based off the work of Llewellyn Falco, which can be found [here](https://approvaltests.com/). 

If you are already familiar with approval testing then jump right to [Getting Started](#getting-started)

<!-- toc -->
## Contents

  * [What Is Approval Testing?](#what-is-approval-testing)
  * [How Does It Work](#how-does-it-work)
    * [The First Run](#the-first-run)
    * [Passing Tests](#passing-tests)
    * [Failing Tests](#failing-tests)
  * [Why Is Approval Testing Useful?](#why-is-approval-testing-useful)
  * [Printers](#printers)
    * [What If My Output Is Not A String? or I Have Multiple Outputs?](#what-if-my-output-is-not-a-string-or-i-have-multiple-outputs)
    * [Getting Fancy - Dealing With Test Data That Varies.](#getting-fancy---dealing-with-test-data-that-varies)
  * [Getting Started](#getting-started)
    * [Source Code Control Notes](#source-code-control-notes)
    * [NOTE on Line Endings](#note-on-line-endings)
  * [Contributing](#contributing)
    * [Local Git Hooks](#local-git-hooks)
    * [Running CI Locally](#running-ci-locally)<!-- endToc -->

## What Is Approval Testing?

## How Does It Work

## Getting Started

You can download the latest officially released version off of [VIPM](https://www.vipm.io/package/sas_lib_approval_tests/). 

### Source Code Control Notes

- Make sure you are committing the *.approved.* files and tracking those.
- Add *.actual.* to your .gitignore file. There is no need to keep track of these files.

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

This is similar to the verify parameterized (in fact it calls it behind the scenes). Instead of specifying each set of parameters, you specify a single map which maps each control label to an array of variant values (there is a utility vi, "array to array of variants.vim) to assist with this. From this, the verify function calculates each set of parameters from all the possible combinations.

Often if you are a running a parameterized test - ie a single test VI that has a for loop and runs through multiple sets of inputs - it can be useful to add a line ending at the end so each result shows up on its own line. This makes diffing easier. That is a great idea. However don't just drop the line-ending constant. For some reason I was having issues with it on Windows with tests not passing when they should -ie diffing the text files showed no difference. I think it has something to do with LabVIEW converting EOLs when it writes to files. I will admit I am not expert on this. Line endings can get complicated especially when taking into account git autocrlf settings. 

What I can tell you, is if you want each of your parameterized test results on a seperate line, then use a string constant, set it to display slash codes and use \n. That seems to work - at least on Windows. I haven't tried it on other Operating Systems. If you encounter other issues with tests not passing when they should, please enter an issue and I'll look at it.

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
echo "Running Caraya Tests" # needed because caray tool is not very verbose.
g-cli caraya -- -s "Tests\\Caraya.Tests\\Caraya Extension Tests\\Caraya Extension Tests.lvclass" -x "reports\\Caraya.UnitTestReport.xml"
echo "Test Time: $SECONDS"
g-cli vitester -- -r "reports\\VITester.UnitTestReport.xml" "Approval Testing.lvproj"
g-cli lunit -- -r "reports\\LUnit.UnitTestReport.xml" "Approval Testing.lvproj"
```
<sup><a href='/run_unittests.sh#L12-L19' title='Snippet source file'>snippet source</a> | <a href='#snippet-run_tests' title='Start of snippet'>anchor</a></sup>
<!-- endSnippet -->

Build the package. You'll want to use this to get the version correct. The g-cl script will automatically calculate it. You'll also want to update the release-notes.txt before you run this command. I usually put a bulleted list of features.

`g-cli vipb -- -av -b Approval\ Tests\\Approval\ Tests.vipb -rn release-notes.txt`
