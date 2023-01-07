# TDengine Action

This action downloads, installs, and configures an TDengine OSS instance and CLI tooling that can be used in your automation.

This downloads the specified version (or `latest`  ).

# Usage

See [action.yml](action.yml)

### Setup and configure TDengine and CLI Tools
```yaml
steps:
  - name: Check out repo
    uses: actions/checkout@v2
  - name: Setup TDengine
    uses: iotsharp/tdengine-action@v1
    with:
      influxdb_version: latest
```

### Install but don't start TDengine ( CLI Tooling Only)
```yaml
steps:
  - name: Check out repo
    uses: actions/checkout@v2
  - name: Setup TDengine
    uses: iotsharp/tdengine-action@v1
    with:
      influxdb_version: latest
      influxdb_start: false
```

### Use a specific version of TDengine
```yaml
steps:
  - name: Check out repo
    uses: actions/checkout@v2
  - name: Setup TDengine
    uses: iotsharp/tdengine-action@v1
    with:
      influxdb_version: 3.0.2.1

```
