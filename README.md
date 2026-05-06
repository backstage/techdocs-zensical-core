# techdocs-zensical-core

Minimal Docker image with [Zensical](https://zensical.org) for Backstage TechDocs generation.

This image is intended for use with Backstage TechDocs, not standalone. Config preprocessing is handled by the `TechdocsZensicalGenerator` in TypeScript.

## Usage

Configure Backstage to use the Zensical generator:

```yaml
# app-config.yaml
techdocs:
  generator:
    runIn: docker
    dockerImage: ghcr.io/backstage/techdocs-zensical:latest
```

## Features

- Faster builds with Zensical's ZRX engine
- All markdown extensions pre-installed (pymdown-extensions, PlantUML, Graphviz)
- Compatible with existing `mkdocs.yml` configurations

## How It Works

This is a thin image containing only Zensical and markdown extensions. All preprocessing (config merging, theme defaults, post-processing) is handled by `TechdocsZensicalGenerator` in `@backstage/plugin-techdocs-node`.

## Building Locally

```bash
docker build -t techdocs-zensical .
```

## License

Apache 2.0 - See [LICENSE](./LICENSE)
