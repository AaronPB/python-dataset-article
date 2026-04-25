# python-dataset-article
A template using python and jupyter notebook to analize datasets for articles

## Setup
Create a new repository using this template. You can click the upper-right button that says `Use this template`.

When created, modify the following before building the devcontainer:

- [`Dockerfile`](https://github.com/AaronPB/python-dataset-article/blob/1eb0f997dc26498796d84a4f5bedc75b86c1d669/Dockerfile#L3-L4) maintainer information.
- [`devcontainer.json`](https://github.com/AaronPB/python-dataset-article/blob/1eb0f997dc26498796d84a4f5bedc75b86c1d669/.devcontainer/devcontainer.json#L13) project and docker container names, and check extensions.
- [`pyproject.toml`](https://github.com/AaronPB/python-dataset-article/blob/master/pyproject.toml) information and dependencies.

## Export options

To generate a HTML file from a jupyter notebook, write the following in the notebooks path:

```bash
jupyter nbconvert \
  --to html \
  --TemplateExporter.exclude_input=True \
  --embed-images \
  FILE.ipynb
```

> If you want to export plotly images, the following has to be declared inside the notebook.
> 
> ```python
> import plotly.io as pio
> pio.renderers.default = "notebook_connected"
> ```
