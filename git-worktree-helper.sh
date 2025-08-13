#!/bin/bash

# Git worktree helper function
# Usage: wt <feature-name>
wt() {
    # Enable strict error handling
    set -e

    # Verify we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Error: Not in a git repository" >&2
        return 1
    fi

    # Get the feature name from arguments
    local branch_name="${1}"

    # Validate feature name was provided
    if [ -z "${branch_name}" ]; then
        echo "Error: Please provide a feature/branch name" >&2
        echo "Usage: wt <feature-name>" >&2
        return 1
    fi

    # Get the repository root directory
    local repo_root
    repo_root=$(git rev-parse --show-toplevel)

    # Get the repository's directory name
    local repo_name
    repo_name=$(basename "${repo_root}")

    # Determine the parent directory of the repository
    local repo_parent
    repo_parent=$(dirname "${repo_root}")

    # Set up the worktree directory path - organized by repository name
    local worktree_base="${repo_parent}/${repo_name}-worktrees"
    local worktree_dir="${worktree_base}/${branch_name}"

    # Create the worktrees directory for this specific repo if needed
    if [ ! -d "${worktree_base}" ]; then
        mkdir -p "${worktree_base}"
        echo "Created worktrees directory: ${worktree_base}"
    fi

    # Check if worktree already exists
    if [ -d "${worktree_dir}" ]; then
        echo "Error: Worktree '${branch_name}' already exists at ${worktree_dir}" >&2
        return 1
    fi

    # Create the worktree with the new branch
    echo "Creating worktree for branch '${branch_name}'..."
    git worktree add -b "${branch_name}" "${worktree_dir}"

    # Copy environment file if it exists
    if [ -f "${repo_root}/.env" ]; then
        cp "${repo_root}/.env" "${worktree_dir}/.env"
        echo "✓ Copied .env file to worktree"
    fi

    cd "${worktree_dir}"
    newtab
    cd -

    # Success message
    echo ""
    echo "✅ Worktree '${branch_name}' created successfully!"
    echo "📁 Location: ${worktree_dir}"
    echo "🌿 Branch: ${branch_name}"
    echo "📦 Repository: ${repo_name}"

    # Show current directory
    echo "📍 Current directory: $(pwd)"
}

# Helper function to list all worktrees for the current repository
wt-list() {
    # Verify we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Error: Not in a git repository" >&2
        return 1
    fi

    echo "Worktrees for current repository:"
    git worktree list
}

# Helper function to remove a worktree
wt-remove() {
    local branch_name="${1}"

    if [ -z "${branch_name}" ]; then
        echo "Error: Please provide a worktree/branch name to remove" >&2
        echo "Usage: wt-remove <feature-name>" >&2
        return 1
    fi

    # Verify we're in a git repository
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        echo "Error: Not in a git repository" >&2
        return 1
    fi

    echo "Removing worktree '${branch_name}'..."
    git worktree remove "${branch_name}" 2>/dev/null || git worktree remove --force "${branch_name}"

    echo "✅ Worktree '${branch_name}' removed successfully!"
}
