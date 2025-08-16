# Recipes Collection

A static website powered by MkDocs containing a collection of recipes and cooking guides.

Website provided by [Github Pages](https://terryhowe.github.io/recipes/)

## Quick Start

### Using Make (Recommended)

1. Install dependencies:
   ```bash
   make install
   ```

2. Serve the site locally:
   ```bash
   make serve
   ```

3. Build the static site:
   ```bash
   make build
   ```

4. See all available commands:
   ```bash
   make help
   ```

## Development

### Available Make Targets

- `make install` - Install Python dependencies (with apt fallback)
- `make build` - Build the static documentation site
- `make serve` - Start development server with live reload
- `make clean` - Remove generated site files
- `make check` - Validate the documentation build
- `make info` - Show project information and available recipes
- `make help` - Display all available commands

### Adding Recipes

1. Create a new markdown file in the `docs/recipes/` directory
2. Write your recipe using markdown formatting
3. Update the navigation in `mkdocs.yml` if needed
4. Build and test your changes with `make build` and `make serve`

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
