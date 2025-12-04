# Tech Stack

## Programming Languages

- **Primary**: [Language] [Version]
- **Secondary**: [Language] [Version] (for [purpose])

## Frameworks & Libraries

### Frontend

- **Framework**: [e.g., React 18.2]
- **UI Library**: [e.g., Material-UI v5]
- **State Management**: [e.g., Redux Toolkit]
- **Routing**: [e.g., React Router v6]
- **Form Handling**: [e.g., React Hook Form]

### Backend

- **Framework**: [e.g., Express.js 4.18]
- **Authentication**: [e.g., Passport.js, JWT]
- **Validation**: [e.g., Joi, Zod]
- **ORM/Database Access**: [e.g., Prisma, TypeORM]

### Testing

- **Unit Testing**: [e.g., Jest]
- **Integration Testing**: [e.g., Supertest]
- **E2E Testing**: [e.g., Playwright, Cypress]
- **Coverage**: [Tool used]

## Development Tools

### Build System

- **Bundler**: [e.g., Webpack, Vite, esbuild]
- **Transpiler**: [e.g., Babel, SWC]
- **Task Runner**: [e.g., npm scripts, Turbo]

### Code Quality

- **Linter**: [e.g., ESLint]
- **Formatter**: [e.g., Prettier]
- **Type Checking**: [e.g., TypeScript 5.0]

### Development Server

- **Dev Server**: [e.g., Vite dev server, webpack-dev-server]
- **Hot Reload**: [Enabled/configuration]

## Database

- **Type**: [e.g., PostgreSQL 15]
- **ORM**: [e.g., Prisma]
- **Migrations**: [Tool/pattern used]
- **Connection Pooling**: [If applicable]

## External Services & APIs

- **[Service 1]**: [Purpose - e.g., "Stripe for payments"]
- **[Service 2]**: [Purpose - e.g., "SendGrid for emails"]
- **[Service 3]**: [Purpose - e.g., "AWS S3 for file storage"]

## Infrastructure & Deployment

### Hosting

- **Platform**: [e.g., Vercel, AWS, Railway]
- **Environment**: [e.g., Node.js 18 on Ubuntu]

### Containerization

- **Docker**: [Yes/No, version if applicable]
- **Orchestration**: [e.g., Docker Compose, Kubernetes]

### CI/CD

- **Platform**: [e.g., GitHub Actions, CircleCI]
- **Pipeline**: [Brief description of build/deploy process]

## Package Management

- **Package Manager**: [e.g., npm, pnpm, yarn]
- **Version**: [e.g., npm 9.6.4]
- **Lockfile**: [e.g., package-lock.json, pnpm-lock.yaml]

## Key Dependencies

| Package     | Version   | Purpose        |
| ----------- | --------- | -------------- |
| [package-1] | [version] | [What it does] |
| [package-2] | [version] | [What it does] |
| [package-3] | [version] | [What it does] |

## Development Setup

### Prerequisites

```bash
# Required software
- Node.js >= [version]
- [Database] >= [version]
- [Other tool]
```

### Installation

```bash
# Clone and install
git clone [repository]
cd [project]
npm install
```

### Environment Variables

```bash
# Required .env variables
DATABASE_URL="[connection string]"
API_KEY="[service API key]"
```

### Running Locally

```bash
# Development mode
npm run dev

# Build
npm run build

# Production
npm start
```

## Technical Constraints

- **Browser Support**: [e.g., "Modern browsers only (ES6+), no IE11"]
- **Node Version**: [e.g., "Requires Node.js 18+"]
- **Database**: [e.g., "PostgreSQL only, no MySQL support"]
- **Memory Limits**: [If applicable]
- **Rate Limits**: [For external APIs]

## Tool Usage Patterns

### Code Style

- [Pattern 1 - e.g., "Use functional components with hooks"]
- [Pattern 2 - e.g., "Prefer async/await over promises"]
- [Pattern 3 - e.g., "Use absolute imports with @ alias"]

### Testing Patterns

- [Pattern 1 - e.g., "Test files colocated with source"]
- [Pattern 2 - e.g., "Mock external services in unit tests"]

### Build Patterns

- [Pattern 1 - e.g., "Separate client and server builds"]
- [Pattern 2 - e.g., "Environment-specific configs"]

## Version History

| Date         | Major Change                  |
| ------------ | ----------------------------- |
| [YYYY-MM-DD] | Upgraded to React 18          |
| [YYYY-MM-DD] | Migrated from REST to GraphQL |

---

**Last updated**: [YYYY-MM-DD]
