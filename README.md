# Minimal `napi-rs` Starter Project 🦀

This is a minimal starter project for napi-rs that uses the absolute minimum tools possible. 

It does not use the napi-rs build tooling to rename/move the Rust build artifacts, instead does so manually and explicitly.

This template is for people who want to know what's happening behind the scenes, prefer an explicit build flow or otherwise appreciate fewer dependencies in their project.

_Note: It does not generate TypeScript types because `napi-rs` does not have a command to generate types without running the entire build_

## Dependencies

You need:
- Cargo
- NPM
- [Just](https://github.com/casey/just)

## Getting Started

### Building Project

```bash
just build

# For optimised binaries
env profile=release just build
```

### Running Locally

```bash
just run
```
