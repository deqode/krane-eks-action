# krane-eks-action

Github Action for executing [Krane](https://github.com/Shopify/krane) commands on on EKS (using aws-iam-authenticator).

This action was inspired by [kubernetes-action](https://github.com/Jberlinsky/kubernetes-action).

# Instructions

This Github Action was created with EKS in mind, therefore the following example refers to it.

## Example

```yaml
name: deploy

on:
  push:
    branches:
      - master
      - develop

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: AWS Credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-east-1

      - name: krane deploy
        uses: deqode/krane-eks-action@master
        env:
          KUBE_CONFIG_DATA: ${{ secrets.KUBE_CONFIG_DATA }}
        with:
          command: krane deploy <app's namespace> <kube context>
```

# Secrets

Create a GitHub Secret for each of the following values:

* `KUBE_CONFIG_DATA`
Your kube config file in base64-encrypted form. You can do that with

```
cat $HOME/.kube/config | base64
```

* `AWS_ACCESS_KEY_ID`

* `AWS_SECRET_ACCESS_KEY`

# Contributions

Pull requests, issues or feedback of any kind are more than welcome by anyone!
