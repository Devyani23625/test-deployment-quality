const fs = require('fs');
const args = require('minimist')(process.argv.slice(2));

const log = {
  deployment_id: process.env.GITHUB_RUN_ID,
  repo: process.env.GITHUB_REPOSITORY,
  status: args.status || 'failed',
  rollback: args.rollback === 'true',
  reverted_to: args.reverted_to || null,
  version: args.version || null,
  timestamp: new Date().toISOString()
};

fs.writeFileSync('deployment_logs.json', JSON.stringify([log], null, 2));
