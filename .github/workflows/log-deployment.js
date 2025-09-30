// .github/scripts/log-deployment.js
const fs = require("fs");
const path = require("path");

const args = process.argv.slice(2);
const argsObj = {};
args.forEach((arg, i) => {
  if (arg.startsWith("--")) {
    argsObj[arg.replace("--", "")] = args[i + 1];
  }
});

const logPath = path.resolve(__dirname, "../deployment-logs.json");
let logs = [];

if (fs.existsSync(logPath)) {
  logs = JSON.parse(fs.readFileSync(logPath, "utf8"));
}

const newEntry = {
  deployment_id: new Date().toISOString(),
  version: argsObj.version || "unknown",
  status: argsObj.status || "unknown",
  rollback: argsObj.rollback === "true",
  reverted_to: argsObj.reverted_to || null,
  timestamp: new Date().toISOString(),
};

logs.push(newEntry);
fs.writeFileSync(logPath, JSON.stringify(logs, null, 2));
console.log("Deployment log updated.");
