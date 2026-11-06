# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-11-06
### Fixed
- Confirmed working with PureOS Crimson by:
  - Using 1.2.1 version of Music Dir Player whose launch script now supports Java 17 as used by Crimson
  - Installing OpenJDK JRE rather than default JRE
  - Eliminating mdp.desktop from repo now that Music Dir Player provides it's own
