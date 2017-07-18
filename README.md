# Metfrag-CLI-Batch
Version: 0.1

## Short Description

Run MetFrag in batch mode in a container.

## Description

MetFrag is a freely available software for the annotation of high precision tandem mass spectra of metabolites which is a first and critical step for the identification of a molecule's structure. Candidate molecules of different databases are fragmented in silico and matched against mass to charge values. A score calculated using the fragment peak matches gives hints to the quality of the candidate spectrum assignment.
The Metfrag-CLI-Batch container gets either a file or folder containing parameter inputs for MetFrag-CLI (https://github.com/c-ruttkies/MetFragRelaunched) to process them in batch mode.

## Key features

- Annotation of fragments

## Functionality

- Annotation / MS

## Approaches

- Metabolomics
  
## Instrument Data Types

- LC-MS/MS

## Tool Authors

- Christoph Ruttkies (IPB-Halle)

## Container Contributors

- [Christoph Ruttkies](https://github.com/c-ruttkies) (IPB-Halle)

## Git Repository

- https://github.com/c-ruttkies/MetFragRelaunched


## Installation 

```bash
docker build -t metfrag-cli-batch .
```

## Usage Instructions

For direct docker usage:

```bash
docker run -v /data:/data metfrag-cli-batch InputFile=/data/parameters.txt
```
## Publications
