# Terraform State and Workflow Strategy

## Purpose

This document explains how Terraform state, backend configuration, locking, import, drift detection, and CI/CD workflow should be handled for AWS platform infrastructure.

## Remote State

Terraform state should be stored remotely for team-based infrastructure management.

For AWS, the recommended backend is S3 with:

- encryption enabled
- versioning enabled
- restricted IAM access
- separate state paths per environment

Example state paths:

- dev/platform/terraform.tfstate
- qa/platform/terraform.tfstate
- staging/platform/terraform.tfstate
- prod/platform/terraform.tfstate

## State Locking

State locking prevents multiple engineers or pipelines from modifying infrastructure state at the same time.

DynamoDB can be used for Terraform state locking when using an S3 backend.

## Environment Separation

Each environment should have separate configuration and separate state.

This reduces blast radius and prevents dev changes from accidentally affecting production.

## Terraform Modules

Reusable Terraform modules should be used for standard platform components such as:

- VPC
- ECS cluster
- ECS service
- ECR
- RDS
- ALB
- IAM
- CloudWatch

Modules allow the platform team to define approved infrastructure patterns and reuse them across environments.

## Terraform Import Strategy

Existing AWS resources should be imported carefully.

Safe import process:

1. Identify the existing AWS resource.
2. Write the matching Terraform resource block.
3. Run terraform import.
4. Run terraform plan.
5. Adjust Terraform code until the plan is safe.
6. Review through pull request.
7. Apply only after approval.

Terraform import should not be done blindly against production resources.

## Drift Detection

Drift happens when infrastructure is changed manually outside Terraform.

Drift can be detected using:

terraform plan

If drift is found, either the Terraform code should be updated to match the approved real-world configuration, or the manual change should be reverted.

## CI/CD Workflow

Recommended workflow:

1. Create pull request.
2. Run terraform fmt.
3. Run terraform validate.
4. Run terraform plan.
5. Review the plan output.
6. Require approval for protected environments.
7. Run terraform apply only after approval.

## Production Safety Controls

Production infrastructure should be protected using:

- branch protection
- pull request reviews
- manual approval before apply
- restricted IAM permissions
- separate production state
- lifecycle prevent_destroy for critical resources
- S3 state versioning
- clear rollback plan