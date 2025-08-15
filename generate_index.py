"""
Generate dynamic navigation for the recipes collection.

This script works with mkdocs-gen-files and mkdocs-literate-nav 
to provide automatic navigation generation functionality.
"""

import mkdocs_gen_files
from pathlib import Path

# Define the docs directory
docs_dir = Path("docs") 
recipes_dir = docs_dir / "recipes"

# Generate navigation for recipes
if recipes_dir.exists():
    with mkdocs_gen_files.open("index.md", "w") as nav_file:
        nav_file.write("# Recipe Collection\n\n")
        
        # Sort and add recipe files
        recipe_files = sorted(recipes_dir.glob("*.md"))
        for recipe_file in recipe_files:
            # Convert filename to title (remove .md and format nicely)
            title = recipe_file.stem.replace("-", " ").title()
            nav_file.write(f"* [{title}](recipes/{recipe_file.name})\n")

    # Set edit path for the generated file
    mkdocs_gen_files.set_edit_path("index.md", "generate_index.py")