# Claude AI Assistant Behavior Rules

## Commit Behavior Rules

### Automatic Commit After Significant Changes

**Rule**: Claude should proactively create commits after completing significant development work and confirm implementation status with the user.

**Definition of "Significant Changes"**:

- Adding new components or features
- Refactoring existing functionality
- Fixing bugs or resolving issues
- Updating component interfaces or APIs
- Making structural changes to the codebase
- Completing multi-step tasks or implementations

**Required Process**:

1. **After Significant Implementation**:

   - Run quality checks: `npm run lint` and `npm run typecheck` (if available)
   - Fix any linting or type errors before committing
   - Create a descriptive commit following the project's conventional commit format

2. **Commit Message Requirements**:

   - Follow the conventional commit format specified in `CLAUDE.md`
   - Use appropriate type (feat, fix, refactor, etc.)
   - Include scope when relevant
   - Keep description concise but descriptive
   - Include the required Claude Code signature

3. **User Confirmation Process**:
   - After creating the commit, explicitly ask the user to confirm the implementation is working as expected
   - Suggest specific testing steps if applicable
   - Wait for user feedback before proceeding with additional changes

**Example Workflow**:

```
1. Complete significant implementation
2. Run: npm run lint && npm run typecheck
3. Fix any issues found
4. Create commit with proper message
5. Ask user: "I've committed the changes. Please test the [specific functionality] to confirm it's working as expected. Are you ready to proceed with the next steps?"
```

### Exceptions:

- **Minor changes**: Documentation updates, small style tweaks, single-line fixes
- **User explicitly requests no commits**: When user says to hold off on committing
- **Work-in-progress**: When explicitly working on incomplete features

### Quality Gates:

- All commits must pass linting (no errors)
- All commits must pass TypeScript compilation
- No console.log statements in production code
- Follow existing code patterns and conventions
- Maintain consistent formatting and style
- Ensure all tests pass before committing

### Commit Attribution Rules:

- **Never add AI co-author** unless explicitly requested by the user
- Do not include "Co-Authored-By: Claude" or similar AI attribution
- Do not add "Generated with Claude Code" unless specifically asked
- Keep commits professional and focused on the technical changes
- Only include attribution if the user explicitly requests it

## Code Quality Standards

### General Development Practices:

- **Follow existing patterns**: Always examine existing code before implementing new features
- **Maintain consistency**: Use the same libraries, frameworks, and patterns already in the codebase
- **Security first**: Never expose secrets, API keys, or sensitive information
- **Performance aware**: Consider performance implications of changes
- **Accessibility compliance**: Ensure UI changes meet accessibility standards

### Code Style Guidelines:

- Follow the project's established coding conventions
- Use TypeScript strictly (no `any` types without justification)
- Implement proper error handling and validation
- Write self-documenting code with clear variable and function names
- Add comments only when necessary to explain complex logic

### File Management:

- **Prefer editing over creating**: Always edit existing files rather than creating new ones when possible
- **Clean up unused code**: Remove unused imports, functions, and files
- **Organize imports**: Keep imports organized and remove unused ones
- **Consistent file structure**: Follow the project's file and folder organization patterns

## Implementation Verification Rules

### User Confirmation Requirements:

- **New Components**: Ask user to test component functionality and visual appearance
- **Bug Fixes**: Ask user to verify the specific issue is resolved
- **Refactoring**: Ask user to confirm no regressions in existing functionality
- **API Changes**: Ask user to test affected integrations

### Testing Recommendations:

- Suggest specific user actions to test new functionality
- Recommend browser refresh for UI changes
- Mention any configuration changes that might be needed
- Point out any breaking changes that require attention

## Communication Style:

- Be proactive about commits but respectful of user workflow
- Clearly explain what was committed and why
- Provide specific testing instructions
- Ask for explicit confirmation before major next steps
