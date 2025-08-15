# Recipes Collection

A static website powered by MkDocs containing a collection of recipes and cooking guides.

Website provided by [Github Pages](https://terryhowe.github.io/recipes/)

## Quick Start

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

2. Serve the site locally:
   ```bash
   mkdocs serve
   ```

3. Build the static site:
   ```bash
   mkdocs build
   ```

## Adding Recipes

1. Create a new markdown file in the `docs/` directory
2. Write your recipe using markdown formatting
3. Update the navigation in `mkdocs.yml` if needed
4. Build and test your changes

## Structure

- `docs/` - All markdown content
- `mkdocs.yml` - MkDocs configuration
- `site/` - Generated static website (after build)

## Features

- Fast static site generation with MkDocs
- Responsive design
- Full-text search
- Easy markdown-based content editing
- Automatic navigation generation
