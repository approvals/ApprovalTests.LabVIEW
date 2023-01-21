# Approval Testing For LabVIEW

This is a project to implement approval testing in LabVIEW. It is based off the work of Llewellyn Falco, which can be found [here](https://approvaltests.com/). 


If you are already familiar with approval testing then jump right to getting started.

## What Is Approval Testing?

It is basically the Golden Template Method. You run the code you are testing once and observe the output and then compare each subsequent run of the code to that first run to make sure nothing has changed. If nothing changed, the test passes. If anything changes, then the test fails until the change is approved.

## Why Is It Useful?

Approval Testing is very useful for dealing with legacy code that does not have tests.

## Printers

The approval test method takes an string input called Test Data. If the code you are testing outputs a string, then it is easy. You just wire the string into the Approval Test VI and you are done. However it is not a always that easy. Often we need a printer. A printer is what takes the output of the code you are testing and turns it into a string.

### What If My Output Is Not A String? or I Have Multiple Outputs?

You'll need to use a printer function to turn your output or outputs into text. The easiest way to do that is to bundle all your outputs together and then flatten them to json. Pretty printing is useful here. It makes it easier later when you need to approve changes.

### Getting Fancy - Dealing With Test Data That Varies.

You can get a little fancy with printer functions and do things like replacing things that may vary from one test run to another such as dates or file references. You could replace a date with a generic 'date' string. That way the output wouldn't vary from run to run. Of course, in that case your test is not checking that your code outputs the correct date. For a file reference you could see if it is open or closed and  just replace the reference value with 'open' or 'closed'. In this case the test is only checking that the file is closed or remains open. Using json makes this easy. You just flatten everything to json and then do a json replace on specific elements.

## Getting Started

You can get the latest version off of VIPM. NEEDS LINK.
