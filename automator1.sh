GNU nano 7.2                                                                                                       sc2.sh                                                                                                                
#!/bin/bash

perform_nmap_scan() {
    echo "Starting Nmap scan on $1..."
    sudo nmap -A -p- $1  # Note: sudo might be needed for privileged port scanning
}

perform_dirsearch() {
    echo "Starting Dirsearch on $1..."
    python3 /root/dirsearch/dirsearch.py -u $1 -e php,html,js -t 100 --timeout 10
}

perform_sqlmap() {
    echo "Starting SQLMap scan on $1..."
    sqlmap -u $1 --batch --crawl=3 --random-agent
}

# Main script
read -p "Enter target IP address or URL (e.g., 192.168.1.1 or http://example.com): " target

# Perform Nmap scan
perform_nmap_scan $target

# Perform Dirsearch for web directory enumeration
perform_dirsearch $target

# Perform SQLMap scan for SQL injection vulnerabilities
perform_sqlmap $target