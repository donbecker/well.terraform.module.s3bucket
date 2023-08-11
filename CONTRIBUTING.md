# Contribution Guide
This doc explains how to contribute to this module. 

## Generating / Updating README.md
- Do not manually update README.md
- README.md is generated via Terraform Docs:
```
terraform-docs markdown table --output-file ./README.md --output-mode inject ./
```