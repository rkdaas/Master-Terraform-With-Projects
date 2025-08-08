
## Scenario: Recovering Accidentally Destroyed EC2 Instance Using S3 State Backup

You had **two EC2 instances** managed by Terraform. One was **accidentally destroyed**. Your remote backend was configured with:

- An **S3 bucket** for storing the `terraform.tfstate` file.
- A **DynamoDB table** for state locking and integrity (checksum via digest).

You needed to **recover the deleted EC2 instance** by restoring a previous state file from S3.

---

## Step-by-Step Recovery Process

### 1. Setup Assumption

Your Terraform backend configuration:

```hcl
terraform {
    backend "s3" {
        bucket         = "terraform-backend-2k25-bucket"
        key            = "webinfra/terraform.tfstate"
        region         = "us-east-1"
        dynamodb_table = "terraform-locks"
    }
}
```

---

### 2. Verified EC2 Instance Deletion

You noticed via AWS Console or CLI that one EC2 instance was missing, but both were still defined in your `.tf` files.

---

### 3. Checked State File Versions in S3

To list all state file versions (with S3 versioning enabled):

```bash
aws s3api list-object-versions \
    --bucket terraform-backend-2k25-bucket \
    --prefix webinfra/terraform.tfstate
```

Locate the **second latest version**—this is the state before the accidental destroy.

---

### 4. Restored the Desired State File from S3

Restore the older version to overwrite the current one:

```bash
aws s3api copy-object \
    --bucket terraform-backend-2k25-bucket \
    --copy-source terraform-backend-2k25-bucket/webinfra/terraform.tfstate?versionId=s02_dkhgCcN.54qacryvpxZQ6vwiRvgG \
    --key webinfra/terraform.tfstate
```

Now, your **current state file** in S3 reflects the pre-destroy state.

---

### 5. Faced Digest Mismatch Error (DynamoDB)

When running:

```bash
terraform plan
```

You encountered:

```
Error: error loading state: state data in S3 does not have the expected content.

The checksum calculated for the state stored in S3 does not match the checksum
stored in DynamoDB.
```

This means the **DynamoDB table's digest** (checksum) is outdated and doesn't match the restored S3 state.

---

### 6. Extracted New Digest from Error Output

The error message displayed:

- `Calculated checksum`: from the new S3 state file
- `Stored checksum`: from DynamoDB (outdated)

Copy the **new checksum** from the error.

---

### 7. Manually Updated the Digest in DynamoDB

In the DynamoDB table (`terraform-locks`):

- Find the item with `LockID = webinfra/terraform.tfstate`
- Edit the `Digest` field to the **new checksum**

---

### 8. Successfully Ran Terraform Plan and Apply

With DynamoDB's digest updated:

```bash
terraform plan
terraform apply
```

Terraform detected the **missing EC2 instance** and recreated it.

---

## Final Outcome

The accidentally destroyed EC2 instance was **restored** using the recovered `.tfstate` file.

---
