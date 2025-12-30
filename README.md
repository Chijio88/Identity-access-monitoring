# Identity & Access Monitoring

This repository contains Azure deployment artifacts for an "Identity & Access Monitoring" solution (workbook, alerts, and a simple deployment script).

Structure (proposed)
- scripts/
  - Deploy-IdentityAccessMonitoring.ps1 — deployment helper script (run from repo root or directly from scripts/)
- solution/
  - identity-access-monitoring-solution.json — ARM template for the solution
- workbooks/
  - identity-access-monitoring-workbook.json — workbook content (deployment template)
- README.md
- .gitignore
- LICENSE

Quick usage
1. Ensure you have the Azure PowerShell Az modules installed and are authenticated:
   - Connect-AzAccount
2. From the repository root run (example):
   - PowerShell: `.\scripts\Deploy-IdentityAccessMonitoring.ps1 -SubscriptionId <sub> -ResourceGroupName <rg> -WorkspaceName <workspace> -Location <location>`
3. The script deploys the ARM template located at `solution/identity-access-monitoring-solution.json`. The solution template includes or references the workbook resource from `workbooks/identity-access-monitoring-workbook.json`.
