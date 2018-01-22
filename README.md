# Metfrag-CLI-Batch
Version: 2.4.3

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
- [Payam Emami](https://github.com/PayamEmami) (Uppsala University)

## Git Repository

- https://github.com/c-ruttkies/MetFragRelaunched


## Installation 

metfrag-cli-batch is present on all PhenoMeNal Galaxy instances on deployed Cloud Research Environments, under the MS category in the tool bar to the left of the screen. No installation is needed hence on PhenoMeNal Cloud Research Environments.

For advanced Docker usage:

- Go to the directory where the dockerfile is.
- Create container from dockerfile:

```
docker build -t metfrag-cli-batch .
```

Alternatively, pull from repo:

```
docker pull container-registry.phenomenal-h2020.eu/phnmnl/metfrag-cli-batch
```

## Usage Instructions

On a PhenoMeNal Cloud Research Environment Galaxy environment, go to MS tools tool category, and then click on metfrag-cli-batch.

Through docker

```
docker run -v /data:/data metfrag-cli-batch InputFile=/data/parameters.txt
```


## Publications

## References

O. Tange (2011): GNU Parallel - The Command-Line Power Tool, ;login: The USENIX Magazine, February 2011:42-47.
