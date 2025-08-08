
## Terraform Error-1: `Error acquiring the state lock`

### What Does This Mean?

Terraform couldn’t obtain a lock on the remote state file (commonly in S3 with a DynamoDB lock table). This lock prevents simultaneous operations on your infrastructure.

---

### Why Did This Happen?

- Manual interruption of a `terraform plan` (e.g., Ctrl+C).
- The DynamoDB state lock wasn’t released, blocking future commands.

---

### How to Fix

Release the lock with:

```bash
terraform force-unlock <lock-id>
```

Only use this after confirming no other Terraform operation is running.

---

### Other Common Causes

- CI/CD job fails during `plan` or `apply`.
- Terminal closed before Terraform finished.
- Multiple users run Terraform at the same time.
- Network issues while updating the state file.

---

### Best Practices

- Avoid interrupting Terraform runs.
- Pull the latest code before running any plan.
- Enable state lock protection (DynamoDB).
- Monitor the lock table for stuck locks.
- Set up CI alerts for failed jobs.

---

### Risks

- Corrupted `.tfstate` file.
- Accidental resource deletion or overwrites.
- Team conflicts.
- Infrastructure drift or downtime.

## Terraform Error-2: `state data in S3 does not have the expected content`

```text
The checksum calculated for the state stored in S3 does not match the checksum
stored in DynamoDB.

Calculated checksum: fa6f7a4ca23cbfd52a45d176d77d2b2c
Stored checksum:     20bb69142bf5c90c91a6421f5d8e9c73
```

### What Does It Mean?

- Terraform uses **DynamoDB** to store the **digest/checksum** of the `.tfstate` file for locking and consistency.
- When you restore a previous version of `.tfstate` from S3, the checksum changes.
- DynamoDB still holds the old checksum, which no longer matches the file in S3.

---

### Solution

Update the digest manually:

1. Go to AWS DynamoDB Console.
2. Open your table (e.g., `terraform-locks`).
3. Find the item with `LockID = webinfra/terraform.tfstate`.
4. Update the `Digest` value to match the new Calculated checksum shown in the `terraform plan` error.

---

### Is It Required Every Time?

Yes whenever you restore an older version of the `terraform.tfstate` file, the checksum will differ, and you'll need to manually update the digest in DynamoDB.

---
