#! /usr/bin/env bash

# needs to all be in 2020
vi_validate \
  --path Source \
  --path Tests \
  --gt 20 --lt 21 \
  --no-code \
  --breakpoints \
  --no-suspend-on-run

#need separate call here for autoerror because I got false positive on 2 files. - hence the skip"
vi_validate \
  --path Source \
  --path Tests \
  --skip "Source/Approval Tests/LVCompare Options.ctl" \
  --skip "Source/Approval Tests/Global.vi" \
  --autoerror