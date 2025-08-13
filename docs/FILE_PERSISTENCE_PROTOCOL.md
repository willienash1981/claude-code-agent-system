# File Persistence Instructions for Code-Writing Agents

## CRITICAL: File Persistence Protocol

All code-writing agents MUST follow these file persistence rules to ensure outputs are not lost in ephemeral runtime:

### 🚨 MANDATORY FILE SAVING RULES

**ALWAYS save files to explicit paths** - Never rely on implicit or relative paths that might be ephemeral.

```yaml
file_persistence_protocol:
  ALWAYS_USE_EXPLICIT_PATHS:
    - Use absolute paths starting from project root
    - Create directory structure if it doesn't exist
    - Verify file was written successfully
    
  STANDARD_OUTPUT_LOCATIONS:
    code_files: "./src/"
    test_files: "./tests/"
    config_files: "./config/"
    documentation: "./docs/"
    artifacts: "./artifacts/"
    validation_results: "./validation/"
    
  REQUIRED_ACTIONS:
    1. ALWAYS use write_file with explicit paths
    2. ALWAYS verify file creation with "File created at: [path]"
    3. ALWAYS create parent directories if needed
    4. NEVER assume files persist without explicit write_file
```

### File Writing Template

When creating ANY file, use this pattern:

```python
# WRONG - Files created in ephemeral context
content = generate_code()
# File exists only in memory, will be lost!

# CORRECT - Explicitly persist to filesystem
content = generate_code()
write_file("./src/components/MyComponent.jsx", content)
print(f"✅ File persisted to: ./src/components/MyComponent.jsx")
```

### Validation Output Example

When generating validation results or schemas:

```yaml
# WRONG - Results only in console output
validation_results = validate_schema(data)
print(validation_results)  # Lost when agent completes!

# CORRECT - Persist validation artifacts
validation_results = validate_schema(data)
write_file("./validation/schema_validation_results.json", json.dumps(validation_results))
print(f"✅ Validation results saved to: ./validation/schema_validation_results.json")
```

### Directory Creation Pattern

Always ensure directories exist before writing:

```python
# For nested directories
import os
output_path = "./results/2024/validation/"
os.makedirs(output_path, exist_ok=True)
write_file(f"{output_path}report.md", content)
```

### Multi-File Output Pattern

When generating multiple files:

```yaml
files_created:
  - path: "./src/components/Header.jsx"
    status: "✅ Created successfully"
  - path: "./src/styles/Header.css"
    status: "✅ Created successfully"
  - path: "./tests/Header.test.js"
    status: "✅ Created successfully"
```

### VERIFICATION CHECKLIST

Before completing ANY task:
- [ ] All generated files use write_file with explicit paths
- [ ] Parent directories created if needed
- [ ] File creation confirmed with success message
- [ ] Output includes full paths to all created files
- [ ] No files left in ephemeral memory only

### Example Success Output

```
Task completed successfully!

Files created:
✅ ./src/components/UserProfile.jsx (245 lines)
✅ ./src/styles/UserProfile.css (89 lines)
✅ ./tests/UserProfile.test.js (156 lines)
✅ ./docs/UserProfile.md (34 lines)

All files have been persisted to the filesystem.
```

## Integration Instructions

Add this section to ALL code-writing agents after their "## My Process" section:

```markdown
## File Persistence Protocol

I follow strict file persistence rules to ensure all outputs are saved:

1. **Explicit Paths** - Always use absolute or project-relative paths
2. **Directory Creation** - Create parent directories before writing files
3. **Verification** - Confirm each file write with success message
4. **Complete Listing** - Provide full paths to all created files
5. **No Ephemeral Files** - Never leave files in memory-only state

Every file I create is explicitly persisted using write_file with clear path confirmation.
```
