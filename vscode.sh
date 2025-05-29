#!/usr/bin/env bash
echo "🪛 Installing VSCode Extensions:"
echo "--------------------------------"


# Ensure .vscode directory exists
mkdir -p .vscode
mkdir -p .vscode-extensions
# Define the settings.json file path
SETTINGS_FILE=".vscode/settings.json"

# Ensure settings.json exists
if [[ ! -f "$SETTINGS_FILE" ]]; then
    echo "{}" > "$SETTINGS_FILE"
fi

# Update settings.json non-destructively
echo "Updating VSCode settings.json..."
jq '.["git.enableCommitSigning"] = true' \
   "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"

# Ensure markdown formatter is set if not already present
if ! jq -e '."[markdown]".editor.defaultFormatter' "$SETTINGS_FILE" >/dev/null; then
    echo "Setting [markdown].editor.defaultFormatter..."
    jq '."[markdown]" += {"editor.defaultFormatter": "DavidAnson.vscode-markdownlint"}' \
       "$SETTINGS_FILE" > "$SETTINGS_FILE.tmp" && mv "$SETTINGS_FILE.tmp" "$SETTINGS_FILE"
else
    echo "[markdown].editor.defaultFormatter already set, skipping..."
fi

echo "✅ VSCode settings.json updated successfully!"
echo "Contents of settings.json:"
cat "$SETTINGS_FILE"

# Install required extensions
code --user-data-dir='.vscode' \
--profile='geosight' \
--extensions-dir='.vscode-extensions' . \
--install-extension aikebang.mkdocs-syntax-highlight@0.2.1 \
--install-extension bierner.markdown-mermaid@1.28.0 \
--install-extension bpruitt-goddard.mermaid-markdown-syntax-highlighting@1.7.1 \
--install-extension DavidAnson.vscode-markdownlint@0.60.0 \
--install-extension GitHub.copilot@1.250.0 \
--install-extension GitHub.copilot-chat@0.25.1 \
--install-extension joffreykern.markdown-toc@1.4.0 \
--install-extension JorgeBertocchini.mkdocs-alias-navigator@0.0.2 \
--install-extension MermaidChart.vscode-mermaid-chart@2.3.0 \
--install-extension mkhl.direnv@0.17.0 \
--install-extension naumovs.color-highlight@2.8.0
--install-extension rpinski.shebang-snippets@1.1.0 \
--install-extension shd101wyy.markdown-preview-enhanced@0.8.15 \
--install-extension timonwong.shellcheck@0.37.7 \
--install-extension waderyan.gitblame@11.1.2 \
--install-extension yzhang.markdown-all-in-one@3.6.3 

# Launch VSCode with the sandboxed environment
code --user-data-dir='.vscode' \
--profile='geosight' \
--extensions-dir='.vscode-extensions' .
