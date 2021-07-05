# Secretary

A tool to sync kubernetes secrets and also set image pull secrets for default service accounts in namespaces

## Apply secret

To apply a secret to secretary add this annotation `service.beta.kubernetes.io/secretary-sync: "true"`, an example
below:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: random-name
  annotations:
    service.beta.kubernetes.io/secretary-sync: "true"
```

If the secret is of type: `kubernetes.io/dockerconfigjson` you can add this
annotation: `service.beta.kubernetes.io/secretary-pull-secret: "true"` to let it sync across each default serviceaccount
in each applicable namespace

## ENV variables
| ENV Variable          | Description                                   | Default |
|-----------------------|-----------------------------------------------|---------|
| `EXCLUDED_NAMESPACES` | A comma separated list of excluded namespaces | Empty   |
| `SYNC_DELAY`          | Delay between each sync in seconds            | `15`    |
|                       |                                               |         |