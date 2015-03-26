# flacco Tutorial

This repository contains the GitHub pages contents for the tutorial for [flacco](https://github.com/kerschke/flacco/).

The tutorial is created using MkDocs. You can see the generated tutorial at 
http://kerschke.github.io/flacco-tutorial/site/.

Please only edit files below `docs/`. The remaining contents are generated automatically by MkDocs.

## Installing mkdocs
```{bash}
# install python, e.g. using apt-get install python
# install pip, e.g. using apt-get install pip
pip install mkdocs
pip install mdx_smartypants
```

## Commands

* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
* `mkdocs build` - Build the documentation site.
* `mkdocs help` - Print this help message.

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
    site/         # Automatically generated pages.
