#!/bin/bash
# Sync a new research report to the briefs repository

set -e

BRIEFS_DIR="$HOME/clawd/briefs"
RESEARCH_DIR="$HOME/Documents/Obsidian/Captures/Stock Research"

if [ -z "$1" ]; then
    echo "Usage: sync-report.sh <report-filename.md>"
    echo "Example: sync-report.sh 'New-Stock-Analysis.md'"
    exit 1
fi

REPORT="$1"
SOURCE="$RESEARCH_DIR/$REPORT"

if [ ! -f "$SOURCE" ]; then
    echo "Error: Report not found at $SOURCE"
    exit 1
fi

cd "$BRIEFS_DIR"

# Copy the report
cp "$SOURCE" .

# Commit and push
git add "$REPORT"
git commit -m "Add research report: $REPORT"
git push origin main

echo "✓ Published $REPORT to https://github.com/guybombadil25-boop/briefs"
