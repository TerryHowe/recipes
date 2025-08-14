# Recipes Collection - MkDocs Static Site

This is a recipe collection website built with MkDocs - a fast, simple static site generator for documentation written in Python. The site contains markdown-based recipes with a responsive design, full-text search, and easy content management.

**ALWAYS follow these instructions first. Only search for additional information or run bash commands if the information here is incomplete or incorrect.**

## Quick Setup and Validation

Bootstrap and validate the entire project:

1. **Install dependencies:**
   ```bash
   # Primary method: pip install (takes ~8 seconds when working)
   pip install -r requirements.txt
   
   # Alternative if pip fails due to network issues:
   sudo apt update && sudo apt install -y mkdocs
   ```
   **Note:** pip install may fail due to network timeouts. Use apt as fallback.

2. **Build the static site (takes ~2 seconds, NEVER CANCEL):**
   ```bash
   mkdocs build
   ```
   Timeout: Set to 30+ seconds. Build is extremely fast but be conservative.

3. **Start development server (instant startup):**
   ```bash
   mkdocs serve
   ```
   Server starts on http://127.0.0.1:8000/ within 2 seconds.

4. **Validate the site is working:**
   ```bash
   curl -s http://127.0.0.1:8000/ | grep -i "recipes collection"
   curl -s http://127.0.0.1:8000/recipes/chocolate-chip-cookies/ | grep -i "chocolate"
   ```

## Working Effectively

### Build and Test Process
- **Dependencies**: Python 3.12+ with pip. MkDocs 1.6.1 via pip or 1.5.3 via apt.
- **Installation issues**: pip install may timeout due to network connectivity. Use `sudo apt install mkdocs` as reliable fallback.
- **Build time**: ~2 seconds (measured). NEVER CANCEL. Set timeout to 30+ seconds for safety.
- **Development server**: Instant startup with live reload. Access at http://127.0.0.1:8000/
- **No CI/CD**: No GitHub Actions workflows exist. Manual validation required.

### Adding New Recipes
1. **Create recipe markdown file:**
   ```bash
   # Create in docs/recipes/ directory
   touch docs/recipes/new-recipe-name.md
   ```

2. **Use the recipe template format:**
   ```markdown
   # Recipe Name

   Description of the recipe.

   ## Information
   - **Prep Time**: X minutes
   - **Cook Time**: Y minutes  
   - **Total Time**: Z minutes
   - **Servings**: N people
   - **Difficulty**: Easy/Medium/Hard

   ## Ingredients
   - Ingredient 1
   - Ingredient 2

   ## Instructions
   1. **Step 1**: Description
   2. **Step 2**: Description

   ## Tips
   !!! tip "Pro Tips"
       - Helpful tip 1
       - Helpful tip 2
   ```

3. **Update navigation in mkdocs.yml:**
   ```yaml
   nav:
     - Home: index.md
     - Recipes:
       - Getting Started: recipes/getting-started.md
       - Your New Recipe: recipes/new-recipe-name.md
     - About: about.md
   ```

4. **Build and test your changes:**
   ```bash
   mkdocs build && mkdocs serve
   # Verify at http://127.0.0.1:8000/recipes/new-recipe-name/
   ```

## Validation Requirements

**ALWAYS validate changes by testing complete user scenarios:**

1. **After adding/modifying recipes:**
   - Build the site: `mkdocs build`
   - Start server: `mkdocs serve` 
   - Access homepage: `curl -s http://127.0.0.1:8000/`
   - Access specific recipe: `curl -s http://127.0.0.1:8000/recipes/recipe-name/`
   - Verify navigation shows new content
   - Test search functionality works

2. **Content validation:**
   - Markdown syntax renders correctly
   - Admonition blocks (`!!! tip`) display properly  
   - Navigation links work
   - Search index includes new content

3. **No automated testing exists** - manual verification is required for all changes.

## Repository Structure

```
recipes/
├── docs/                     # All markdown content
│   ├── index.md             # Homepage
│   ├── about.md             # About page
│   └── recipes/             # Recipe collection
│       ├── getting-started.md
│       └── chocolate-chip-cookies.md
├── mkdocs.yml               # MkDocs configuration
├── requirements.txt         # Python dependencies (mkdocs>=1.6.0)
├── README.md               # Repository documentation
└── site/                   # Generated static site (gitignored)
```

## Key Configuration

### MkDocs Settings (mkdocs.yml)
- **Theme**: mkdocs (default theme)
- **Markdown Extensions**: admonition, codehilite, toc with permalinks
- **Features**: Full-text search, responsive design, automatic navigation

### Dependencies (requirements.txt)
- **mkdocs>=1.6.0**: Core static site generator
- **Installation time**: ~8 seconds via pip (when network allows)
- **Fallback**: Use `sudo apt install mkdocs` for reliable installation (provides 1.5.3)

## Common Commands Reference

### Frequently Used Operations
```bash
# View repository structure
ls -la docs/

# Check MkDocs version
mkdocs --version

# Get dependency requirements  
mkdocs get-deps

# Build site (output to site/ directory)
mkdocs build

# Serve locally with live reload
mkdocs serve

# Check built site structure
ls -la site/
```

### File Locations
- **Content**: All in `docs/` directory as markdown files
- **Configuration**: `mkdocs.yml` in repository root
- **Generated site**: `site/` directory (created by build, gitignored)
- **Assets**: Automatically handled by MkDocs theme

## Troubleshooting

### Common Issues
- **pip install fails**: Network timeouts are common. Use `sudo apt install mkdocs` as reliable alternative.
- **Build fails**: Verify MkDocs is installed via either pip or apt
- **Server won't start**: Check port 8000 is available, or specify different port with `mkdocs serve -a 127.0.0.1:8080`
- **Content not showing**: Verify markdown files are in `docs/` and navigation is updated in `mkdocs.yml`
- **Search not working**: Rebuild site with `mkdocs build` to regenerate search index

### Timing Expectations
- **Dependency installation**: ~8 seconds
- **Site build**: ~2 seconds  
- **Server startup**: <2 seconds
- **NEVER CANCEL**: All operations are very fast, but always set conservative timeouts (30+ seconds)

Always run the validation steps after making any changes to ensure the site builds and serves correctly.