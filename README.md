# template-packer

This repository is a template repository.

## Files

Template files:

1. .github/
    1. ISSUE\_TEMPLATE/
        1. [bug\_report.md](#githubissue_templatebug_reportmd)
        1. [feature\_request.md](#githubissue_templatefeature_requestmd)
1. [LICENSE](#license)
1. [PULL\_REQUEST\_TEMPLATE.md](#pull_request_templatemd)
1. [README.md](#readmemd)

## PULL\_REQUEST\_TEMPLATE.md

The `PULL_REQUEST_TEMPLATE.md` file asks a pull requester for information about the pull request.

The [PULL_REQUEST_TEMPLATE.md](PULL_REQUEST_TEMPLATE.md) file in this repository
is an example that can be modified.

### How to create PULL\_REQUEST\_TEMPLATE.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Pull request template > "Add" button
1. Option #2: Manual file creation
    1. See GitHub's [Creating a pull request template for your repository](https://help.github.com/articles/creating-a-pull-request-template-for-your-repository/)

## .github/ISSUE\_TEMPLATE/bug\_report.md

A template presented to the Contributor when creating an issue that reports a bug.

The [bug_report.md](.github/ISSUE_TEMPLATE/bug_report.md) file in this repository
is an example that can be modified.

### How to create .github/ISSUE\_TEMPLATE/bug\_report.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Issue templates > "Add" button > Add template: Bug report

## .github/ISSUE\_TEMPLATE/feature\_request.md

A template presented to the Contributor when creating an issue that requests a feature.

The [feature_request.md](.github/ISSUE_TEMPLATE/feature_request.md) file in this repository
is an example that can be modified.

### How to create .github/ISSUE\_TEMPLATE/feature\_request.md

1. Option #1: Using GitHub's "Wizard"
    1. [github.com](https://github.com/) > (choose repository) > Insights > Community > Issue templates > "Add" button > Add template: Feature request

## HCL Code Organization

- Packer leverages Go Lang's natural file block mechanism.
- The main file blocks are
    - Variables: used to expose inputs to the build process when it is invoked.
    - Locals: private variables and logic within the build process.
    - Sources: the builder type.
        - Amazon
        - Azure
        - VirtualBox
        - VMWare
        - Etc.
    - Builds: the builder logic referencing configurations defined in sources and apply provisioner logic.

![HCL Code Organization](assets/hcl_code_organization.png)

## Build Process Sequence

![sequence diagram](assets/sequence_diagram.png)

## License

[GPLv3](LICENSE)

## References

* [Markdownlint](https://dlaa.me/markdownlint/) used to verify markdowns follow good formatting standards.
* [Software installed on GitHub-hosted runners](https://github.com/actions/virtual-environments/blob/master/images/linux/Ubuntu2004-README.md)
* [Debian ISO Download](https://cdimage.debian.org/cdimage/archive/)
* [Centos ISO Download](https://www.centos.org/download/)
