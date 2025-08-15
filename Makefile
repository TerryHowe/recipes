# Makefile for Recipes Collection MkDocs Site
# 
# This Makefile provides common development tasks for the recipe collection
# static site built with MkDocs.

# Configuration
PYTHON := python3
PIP := pip
MKDOCS := mkdocs
SITE_DIR := site
HOST := 127.0.0.1
PORT := 8000

# Check if mkdocs is available
MKDOCS_AVAILABLE := $(shell command -v $(MKDOCS) 2> /dev/null)

# Default target
.DEFAULT_GOAL := help

# Phony targets (don't correspond to files)
.PHONY: help install build serve clean build-strict check watch deps

##@ Help

help: ## Display this help message
	@echo "Recipes Collection - MkDocs Development Commands"
	@echo ""
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Development

install: ## Install Python dependencies
	@echo "Installing dependencies..."
	@if $(PIP) install -r requirements.txt; then \
		echo "✓ Dependencies installed successfully via pip"; \
	else \
		echo "⚠ pip install failed (likely network issue), trying apt fallback..."; \
		if command -v apt >/dev/null 2>&1; then \
			sudo apt update && sudo apt install -y mkdocs && \
			echo "✓ MkDocs installed via apt (basic functionality available)"; \
		else \
			echo "✗ Failed to install dependencies. Please install manually."; \
			exit 1; \
		fi; \
	fi

deps: install ## Alias for install

build: ## Build the static documentation site
	@echo "Building documentation..."
	@if [ -z "$(MKDOCS_AVAILABLE)" ]; then \
		echo "✗ MkDocs not found. Run 'make install' first."; \
		exit 1; \
	fi
	$(MKDOCS) build
	@echo "✓ Documentation built successfully in $(SITE_DIR)/"

build-strict: ## Build with strict mode (exits on warnings)
	@echo "Building documentation with strict mode..."
	@if [ -z "$(MKDOCS_AVAILABLE)" ]; then \
		echo "✗ MkDocs not found. Run 'make install' first."; \
		exit 1; \
	fi
	$(MKDOCS) build --strict
	@echo "✓ Documentation built successfully with strict mode"

serve: ## Start the development server with live reload
	@echo "Starting development server at http://$(HOST):$(PORT)"
	@echo "Press Ctrl+C to stop the server"
	@if [ -z "$(MKDOCS_AVAILABLE)" ]; then \
		echo "✗ MkDocs not found. Run 'make install' first."; \
		exit 1; \
	fi
	$(MKDOCS) serve --dev-addr $(HOST):$(PORT)

watch: serve ## Alias for serve

##@ Maintenance

clean: ## Remove generated site files
	@echo "Cleaning generated files..."
	@if [ -d "$(SITE_DIR)" ]; then \
		rm -rf $(SITE_DIR); \
		echo "✓ Removed $(SITE_DIR)/ directory"; \
	else \
		echo "✓ $(SITE_DIR)/ directory already clean"; \
	fi

check: build-strict ## Validate the documentation build
	@echo "✓ Documentation validation complete"

##@ Information

info: ## Show project information
	@echo "Recipes Collection MkDocs Project"
	@echo "================================="
	@echo "Python: $(shell $(PYTHON) --version 2>/dev/null || echo 'Not found')"
	@echo "MkDocs: $(shell $(MKDOCS) --version 2>/dev/null || echo 'Not installed')"
	@echo "Site directory: $(SITE_DIR)/"
	@echo "Dev server: http://$(HOST):$(PORT)"
	@echo ""
	@echo "Available recipes:"
	@find docs/recipes -name "*.md" -not -name "getting-started.md" 2>/dev/null | sed 's/docs\/recipes\///; s/\.md//; s/-/ /g; s/\b\w/\U&/g' | sed 's/^/  - /' || echo "  No recipes found"

##@ Advanced

rebuild: clean build ## Clean and rebuild the documentation
	@echo "✓ Complete rebuild finished"

serve-clean: clean ## Clean build and serve (pure build, then serve)
	@if [ -z "$(MKDOCS_AVAILABLE)" ]; then \
		echo "✗ MkDocs not found. Run 'make install' first."; \
		exit 1; \
	fi
	$(MKDOCS) serve --clean --dev-addr $(HOST):$(PORT)

serve-all: ## Serve on all network interfaces (0.0.0.0)
	@echo "Starting development server accessible from any IP at http://0.0.0.0:$(PORT)"
	@echo "Press Ctrl+C to stop the server"
	@if [ -z "$(MKDOCS_AVAILABLE)" ]; then \
		echo "✗ MkDocs not found. Run 'make install' first."; \
		exit 1; \
	fi
	$(MKDOCS) serve --dev-addr 0.0.0.0:$(PORT)