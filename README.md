# ark-schedule-repro

Small sample of a heptio ark deployment in order to reproduce a possible bug of the scheduler.
Core problem: the scheduling stops working if the deploy is executed again.

Tested with ark 0.10 (current stable version)

To reproduce:

1. deploy with `make k8s-deploy S3_BUCKET=<MY-BUCKET> CLUSTER_NAME=<mycluster.k8s.mydomain-or-something.com>`
2. watch ark doing backups as intended (every 2 minutes according to the schedule yml)
3. deploy again with the command from the first step
4. schedule stops working, observable via Prometheus or `ark schedule get` in the "last backup"-column.
   In the logs the line "scheduler is due, submitting backup" is not appearing anymore.
