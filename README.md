# node-tools.el

[![Build Status](https://travis-ci.org/cowboyd/node-tools.el.svg?branch=master)](https://travis-ci.org/cowboyd/node-tools.el)

A collection of Node.js utilities for emacs.

## Stack Traces

node-tools.el gives Emacs the ability to parse v8 stack traces in compilation buffers
so that you can use the `(next-error)` and `(previous-error)` functions to
navigate JavaScript sources in a stack trace.
