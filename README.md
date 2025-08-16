# Recipes Collection

A static website powered by MkDocs containing a collection of recipes and cooking guides.

Website provided by [Github Pages](https://terryhowe.github.io/recipes/)

## Quick Start

### Using Make (Recommended)

1. Build the static site:
   ```bash
   make build
   ```

2. Test the site locally:
   ```bash
   make serve
   ```

4. Deploy the site:
   ```bash
   make deploy
   ```

## Development

Use `make help` to display all available commands.

### Adding Recipes

1. Create a new markdown file in the `docs/recipes/` directory
2. Write your recipe using markdown formatting
3. Build and test your changes with `make build` and `make serve`

## Structure

- `docs/` - All markdown content
- `mkdocs.yml` - MkDocs configuration
- `site/` - Generated static website (after build)
