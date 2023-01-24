# Approval Testing For LabVIEW

This is a project to implement approval testing in LabVIEW. It is based off the work of Llewellyn Falco, which can be found [here](https://approvaltests.com/). 

If you are already familiar with approval testing then jump right to getting started NEEDS LINK.

## What Is Approval Testing?

It is basically the Golden Template Method. You run the code you are testing once and observe the output and then compare each subsequent run of the code to that first run to make sure nothing has changed. If nothing changed, the test passes. If anything changes, then the test fails until the change is approved.

## How Does It Work

This particular implementation works with any unit testing framework. There is one VI, Approval Test. You drop that into your test. You wire the output of the code you are testing into the test data input (if the output of the code you are testing is not a string, see the Printers section. NEEDS LINK). You should only call Approval Test.vi once per unit test. Having more will cause problems since it stores the approved results using the name of the test VI.

### The First Run

The very first run passes and stores the test data in a .approved file. If your unit test was called test_inputA_produces_outputb.vi then the approved results would be test_inputA_produces_outputb.vi.approved

### Passing Tests

On subsequent runs if the test data matches the approved data, then the test passes and nothing else happens.

### Failing Tests

On subsequent runs if the test data does not match the approved data, then the test fails and the test data is stored in the actual file. At that point you can use the diff command to see the differences and decide to approve the new data or not. To approve it just simply copy the actual file over the approved file.

## Why Is Approval Testing Useful?

Approval Testing is very useful for dealing with legacy code that does not have tests. You can quickly create a "software vise" around the code you intend to refactor to make sure the functionality does not change. Often you can setup up a variety of input vectors and put the code you want to test into a For Loop. Collect the results into a giant string and wire that into the Approval Tests VI. You don't even have to care exactly what the results are. In this case you are not necessarily checking that the results are correct but rather verifying that don't change as you refactor. There may be other legitimate use cases, but I find myself most often using it for Legacy Code.

## Printers

The approval test method takes an string input called Test Data. If the code you are testing already outputs a string, then it is easy. You just wire the string into the Approval Test VI and you are done. However it is not a always that easy. Often we need a printer. A printer is what takes the output of the code you are testing and turns it into a string.

### What If My Output Is Not A String? or I Have Multiple Outputs?

You'll need to use a printer function to turn your output or outputs into text. The easiest way to do that is to bundle all your outputs together and then flatten them to json. Pretty printing is useful here. It makes it easier later when you need to approve changes.

### Getting Fancy - Dealing With Test Data That Varies.

You can get a little fancy with printer functions and do things like replacing things that may vary from one test run to another such as dates or file references. You could replace a date with a generic 'date' string. That way the output wouldn't vary from run to run. Of course, in that case your test is not checking that your code outputs the correct date. For a file reference you could see if it is open or closed and  just replace the reference value with 'open' or 'closed'. In this case the test is only checking that the file is closed or remains open. Using json makes this easy. You just flatten everything to json and then do a json replace on specific elements.

## Getting Started

You can get the latest version off of VIPM. NEEDS LINK. 

### Source Code Control Notes

- Make sure you are committing the .approved files and tracking those.
- Add *.actual to your .gitignore file. There is no need to keep track of these files.

## Contributing

This written in LV2020. If you have ideas for improvement, please feel free to open an issue or pull request.
