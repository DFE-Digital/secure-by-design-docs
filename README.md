# Docs for Secure by Design

## Install mkdocs

```shell
$ python3 -m venv venv
$ source venv/bin/activate
$ pip install mkdocs mkdocs-material pymdown-extensions
```

## Host docs locally

```shell
$ mkdocs serve
```

## Build docs

```shell
$ mkdocs build -d site/
```

## Push docs to storage

```shell
$ az storage blob upload-batch --account-name 'storage_account_name' -d '$web' --overwrite --source ./site
$ az storage blob upload-batch --account-name 'storage_account_name' -d '$web' --overwrite --source ./useful_docs # used for attachments
```