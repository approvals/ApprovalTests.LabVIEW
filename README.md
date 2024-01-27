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

It is basically the Golden Template Method. You run the code you are testing once and observe the output and then compare each subsequent run of the code to that first run to make sure nothing has changed. If nothing changed, the test passes. If anything changes, then the test fails until the change is approved.

This method is unit testing framework agnostic. Pass If Approved simply outputs a boolean indicating if the test passed and a failure message if the test fails. The failure message simply explains how to determine what changed and how to approve the change. You can then pass these outputs to your unit testing framework of choice.

## How Does It Work

The base library will work with any unit testing framework. The VIPM package includes Extensions for VI Tester, LUnit, and Caraya. You should the extensions. If you prefer a different unit test framework, then let's talk about creating an extension for it.

### Getting Fancy - Dealing With Test Data That Varies.

You can get a little fancy with printer functions and do things like replacing data that may vary from one test run to another such as dates or file references. You could replace a date with a generic 'date' string. That way the output wouldn't vary from run to run. Of course, in that case your test is not checking that your code outputs the correct date. It is basically ignoring the date output. For a file reference you could see if it is open or closed and  just replace the reference value with 'open' or 'closed'. In this case the test is only checking that the file is closed or remains open. Using json makes this easy. You just flatten everything to json and then do a json replace on specific elements where you don't necessarily care about the exact value of the elements just some property or where you expect the elements to change from one test run to the next.

## Getting Started

You can download the latest officially released version off of [VIPM](https://www.vipm.io/package/sas_lib_approval_tests/). 

### Source Code Control Notes

- Make sure you are committing the .approved files and tracking those.
- Add *.actual to your .gitignore file. There is no need to keep track of these files.

### NOTE on Line Endings

Often if you are a running a parameterized test - ie a single test VI that has a for loop and runs through multiple sets of inputs - it can be useful to add a line ending at the end so each result shows up on its own line. This makes diffing easier. That is a great idea. However don't just drop the line-ending constant. For some reason I was having issues with it on Windows with tests not passing when they should -ie diffing the text files showed no difference. I think it has something to do with LabVIEW converting EOLs when it writes to files. I will admit I am not expert on this. Line endings can get complicated especially when taking into account git autocrlf settings. 

What I can tell you, is if you want each of your parameterized test results on a seperate line, then use a string constant, set it to display slash codes and use \n. That seems to work - at least on Windows. I haven't tried it on other Operating Systems. If you encounter other issues with tests not passing when they should, please enter an issue and I'll look at it.

## Contributing

This is written in LV2020. If possible submit your changes in LV2020. If you have ideas for improvement, please feel free to open an issue or pull request. I will add a .vipc file for necesesary development dependencies (the installed package should have no dependencies).

### Local Git Hooks
There is a Setup_Local_Git_Hooks script which will setup a hook to check for an issue number in the commit message and will run the unit tests before pushing. You can use them if you want.

### Running CI Locally
To run the CI locally, just copy the appropriate lines of the script section in the build step, being careful with the --kill flag for G-CLI. 

Here are the appropriate lines with the kill flag removed.

Run the unit tests

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

