[![Image](https://gitlab.com/sas-blog/approval-testing/-/badges/release.svg)](https://gitlab.com/sas-blog/approval-testing/-/releases) [![Image](https://www.vipm.io/package/sas_lib_approval_tests/badge.svg?metric=installs)](https://www.vipm.io/package/sas_lib_approval_tests/) [![Image](https://www.vipm.io/package/sas_lib_approval_tests/badge.svg?metric=stars)](https://www.vipm.io/package/sas_lib_approval_tests/)
# Approval Testing For LabVIEW


This is a project to implement approval testing in LabVIEW. It is based off the work of Llewellyn Falco, which can be found [here](https://approvaltests.com/). 

If you are already familiar with approval testing then jump right to [Getting Started](#getting-started)

[TOC]

## What Is Approval Testing?

It is basically the Golden Template Method. You run the code you are testing once and observe the output and then compare each subsequent run of the code to that first run to make sure nothing has changed. If nothing changed, the test passes. If anything changes, then the test fails until the change is approved.

This method is unit testing framework agnostic. Pass If Approved simply outputs a boolean indicating if the test passed and a failure message if the test fails. The failure message simply explains how to determine what changed and how to approve the change. You can then pass these outputs to your unit testing framework of choice.

## How Does It Work

This particular implementation works with any unit testing framework. There is one main API VI, Pass If Appoved. You drop that into your test. You wire the output of the code you are testing into the test data input (if the output of the code you are testing is not a string, see the [Printers Section](#printers). You should only call Pass If Approved.vi once per unit test. Having more will cause problems since it stores the approved results using the name of the test VI.

### The First Run

The very first run fails and stores the test data in a .actual file. If your unit test was called test_inputA_produces_outputb.vi then the actual results would be test_inputA_produces_outputb.actual file. To approve the results, simply change the extension to .approved. Run the test again and it should pass (assuming the code you are testing outputs the same data).

### Passing Tests

On subsequent runs if the test data matches the approved data, that is stored in the .approved file, then the test passes and nothing else happens.

### Failing Tests

On subsequent runs if the test data does not match the approved data in the .approved file or there is no .approved file, then the test fails and the test data is stored in the .actual file. At that point you can use the diff command in Git Bash or your favorite text diff tool to see the differences and decide to approve the new data or not. To approve it just simply copy the .actual file over the .approved file so that the .approved file contains the newly approved result.

## Why Is Approval Testing Useful?

Approval Testing is very useful for dealing with legacy code that does not have tests. You can quickly create a "software vise" around the code you intend to refactor to make sure the functionality does not change. Often you can setup up a variety of input vectors and put the code you want to test into a For Loop. Collect the results into a giant string and wire that into the Pass If Approved VI. You don't even have to care exactly what the results are. In this case you are not necessarily checking that the results are "correct" but rather verifying that they simply don't change as you refactor. There may be other legitimate use cases, but I find myself most often using it for Legacy Code.

## Printers

The Pass If Approved VI takes an string input called Test Data. If the code you are testing already outputs a string, then it is easy. You just wire the string into the Pass If Approved VI and you are done. However it is not a always that easy. Often we need a printer. A printer is what takes the output of the code you are testing and turns it into a string.

### What If My Output Is Not A String? or I Have Multiple Outputs?

You'll need to use a printer function to turn your output or outputs into text. The easiest way to do that is to bundle all your outputs together and then flatten them to json. Pretty printing is useful here. It makes it easier later when you need to approve changes. Just wire the json result into the Test Data input on the Pass If Approved VI.

### Getting Fancy - Dealing With Test Data That Varies.

You can get a little fancy with printer functions and do things like replacing data that may vary from one test run to another such as dates or file references. You could replace a date with a generic 'date' string. That way the output wouldn't vary from run to run. Of course, in that case your test is not checking that your code outputs the correct date. It is basically ignoring the date output. For a file reference you could see if it is open or closed and  just replace the reference value with 'open' or 'closed'. In this case the test is only checking that the file is closed or remains open. Using json makes this easy. You just flatten everything to json and then do a json replace on specific elements where you don't necessarily care about the exact value of the elements just some property or where you expect the elements to change from one test run to the next.

## Getting Started

You can download the latest officially released version off of [VIPM](https://www.vipm.io/package/sas_lib_approval_tests/). If you like living dangerously and want the latest and greatest, you can find that on our release page [here](https://gitlab.com/sas-blog/approval-testing/-/releases). 

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

`g-cli vitester -- -r UnitTestReport.xml 
Approval\ Testing.lvproj`

Build the package. You'll want to use this to get the version correct. The g-cl script will automatically calculate it. You'll also want to update the release-notes.txt before you run this command. I usually put a bulleted list of features.

`g-cli vipb -- -av -b Approval\ Tests\\Approval\ Tests.vipb -rn release-notes.txt`

