# WrapSheet Public (Multi-Tenant SaaS)

A multi-tenant version of the WrapSheet application for organizations to manage their staff tasks and goals.

## Overview

WrapSheet Public allows multiple organizations to have their own isolated:
- **Daily Task Management** - Calendar-based task tracking
- **Monthly & Annual Goals** - Goal tracking with progress
- **Project Management** - Multi-step projects
- **Board Ideas & Voting** - Staff suggestion system

## Tech Stack

- **Frontend**: Single-page HTML application with vanilla JavaScript
- **Backend**: Cloudflare Workers
- **Database**: Cloudflare D1 (SQLite) - shared with org_id isolation
- **Hosting**: Cloudflare Pages

## Project Structure

```
├── src/
│   └── index.js          # Multi-tenant Cloudflare Worker API
├── public/
│   └── index.html        # Frontend application
└── wrangler.toml         # Wrangler configuration
```

## Deployment

```bash
# Deploy the worker
npx wrangler deploy -c wrangler.toml

# The frontend is served via Cloudflare Pages
```

## Multi-Tenancy

Organizations are identified by:
- `org_id` in all database queries
- Org slug in URLs (e.g., `wrapsheet.app/ber`, `wrapsheet.app/acme`)
- User sessions include org context

## License

Commercial - Contact for licensing
