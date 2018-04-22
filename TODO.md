* Handle images without version (implicit :latest)
* No CVE should result in empty output
* Add wrapper script aroung docker-compose to show only interesting output and automatic cleanup
* Filter clair-db and clair-local-scan vulnerabilities or use non-vulnerable images
* Ensure that clair-db and clair-local-scan started successfully, before running scan (clair-local-scan has to wait for clair-db to be ready)
