# Terraform Project: Deploy Static Website on S3 Bucket

## Overview

This Terraform project demonstrates how to deploy a static website on an AWS S3 bucket. It covers setting up the S3 bucket, configuring its access control, uploading static files, and enabling static website hosting using S3.

### Resources Configured

The following AWS resources are created by this project:

- **AWS S3 Bucket**: Stores the static website files.
- **AWS S3 Bucket Ownership Controls**: Configures ownership controls for objects stored in the bucket.
- **AWS S3 Bucket Public Access Block**: Manages public access to the S3 bucket and allows access for the website.
- **AWS S3 Bucket ACL**: Sets the access control list (ACL) for the bucket to `public-read` for public access to files.
- **AWS S3 Object**: Uploads the website files (HTML, CSS, JS, images, etc.) from the specified folder.
- **AWS S3 Bucket Website Configuration**: Configures the bucket for static website hosting, specifying the index document (`index.html`).

## Prerequisites

Before using this project, make sure you have:

- **Terraform** installed on your local machine.
- An **AWS Account** with sufficient permissions to create and manage S3 resources.
- **AWS CLI** configured on your machine, or the AWS credentials set using environment variables.

## Project Structure

This project includes the following key files:

- **main.tf**: The main configuration file that defines resources (S3 bucket, ACL, etc.).
- **variables.tf**: Defines input variables for dynamic configuration (e.g., bucket name, folder for website files).
- **terraform.tfvars**: Provides values for the input variables (e.g., bucket name, file path).
- **outputs.tf**: Optional output configuration to display the bucket URL or other details after deployment.

## Configuration

### Input Variables

This project requires two variables:

- **bucketname**: The name of the S3 bucket (this must be globally unique).
- **folder_name**: The local folder containing the website files to upload (HTML, CSS, JS, images, etc.).

Example of `terraform.tfvars`:

```hcl
bucketname = "my-static-website-bucket-2025-01-20"
folder_name = "Applight" 
```
