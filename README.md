# <img src=".repo/assets/icon-512x512.png"  width="52" height="52"> Trivial Security User Documentation

[![pipeline status](https://gitlab.com/trivialsec/docs/badges/main/pipeline.svg)](https://gitlab.com/trivialsec/docs/commits/main)

# Using this repo

[MkDocs](https://www.mkdocs.org/) pages are [authored in Markdown](https://www.mkdocs.org/user-guide/writing-your-docs/#writing-with-markdown) placed in `./src`.

## Preview dev server

Assuming you have seen the `Makefile` and have installed the `deps`. Just run `mkdocs serve` and visit the page in the output.

## Development and Production deployment

Unless you know what you're doing with Terraform and AWS (and therefore the IaC is self-documenting), just put your changes into a branch or fork, and then create a PR from your branch to our `main`, they'll be deployed to [our dev site](dev-docs.trivialsec.com), but be aware the next PR will clobber yours so stay coordinated with the team. An accepted merge into `main` will deploy to production.

Don't forget to run the `pre-commit` git hooks, they'll have checks that will be part of the PR review. There's also a `semgrep` static check defined in the `Makefile` that is encouraged.

## Theme

Uses [mkdocs Material](https://squidfunk.github.io/mkdocs-material/) with extensions

## Styling

Overload the CSS classes here `./src/stylesheets/extra.css`, but the theme variables are a better option when possible - check out the [changing colors](https://squidfunk.github.io/mkdocs-material/setup/changing-the-colors/) guide.

## Custom HTML

Customising the HTML is done my placing [one of these file](https://github.com/squidfunk/mkdocs-material/tree/23730a1f150d25d8fa899417d6cba02139650793/material/partials) into the `./overrides` directory.

## favicon

Overwrite the theme default favicon with our own via `cp src/img/favicon.png dist/assets/images/favicon.png` after each `mkdocs build`.

## Emoji

It's all setup in `mkdocs.yml` and the theme extensions. See [Shortname Autocomplete](https://demos.joypixels.com/latest/autocomplete.html) for available names and previews.
