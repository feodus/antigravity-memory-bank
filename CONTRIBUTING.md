# Contributing to Antigravity Memory Bank

> **Disclaimer**: This project allows for compatibility with the Kilocode Memory Bank structure but is an independent implementation. "Kilocode" is a trademark of Kilo.Ai (or respective owners). This project is not affiliated with, endorsed by, or sponsored by Kilocode or Kilo.Ai.

Thank you for your interest in the project! 🎉

## 🤝 How to Contribute

### 1. Fork the Repository

```bash
# Fork via GitHub UI, then clone
git clone https://github.com/YOUR_USERNAME/antigravity-memory-bank.git
cd antigravity-memory-bank
```

### 2. Create a Feature Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

### 3. Make Your Changes

Follow the existing code and documentation style:

- Templates should be clear and concise
- Workflow files should contain clear instructions
- Documentation should be up-to-date

### 4. Test Your Changes

```bash
# Test installation locally
./install.sh

# Verify all files are created correctly
ls -la .agent/memory/
ls -la .agent/workflows/
```

### 5. Create a Pull Request

- Describe what changed and why
- Attach screenshots (if applicable)
- Reference related issues

## 📋 Development Setup

```bash
# Clone your fork
git clone your-fork
cd antigravity-memory-bank

# Make changes
# ...

# Test installation script
./install.sh
```

## 🎯 Contribution Priorities

### High Priority

- 🐛 Bug fixes in install.sh
- 📝 Documentation improvements
- 🧩 New templates for common scenarios
- 🔧 Workflow file improvements

### Medium Priority

- ✨ New features for installation script
- 🌐 Documentation translations
- 📊 Usage examples

### Low Priority

- 🎨 Cosmetic changes
- 📖 Additional documentation

## ✅ Guidelines

### Templates (templates/)

- Should be understandable for beginners
- Contain examples and comments
- Follow consistent format

### Workflows (workflows/)

- Clear step-by-step instructions
- Specify expected results
- Document potential issues

### Installation Script (install.sh)

- Test on macOS and Linux
- Check edge cases
- Add clear error messages

### Documentation

- Update when functionality changes
- Check links
- Use clear language

## 🔍 Review Process

1. Automated checks (if configured)
2. Code review from maintainers
3. Discussion and iterations
4. Merge after approval

## 📝 Commit Messages

Use conventional commits:

```
feat: add new template for API documentation
fix: correct install path in script
docs: update README with new examples
chore: update dependencies
```

## ❓ Questions?

- Open an Issue with your question
- Discuss in Pull Request
- Contact maintainers

## 📄 License

By contributing, you agree that your code will be licensed under the MIT License.

---

Thank you for your contribution! 🙏
