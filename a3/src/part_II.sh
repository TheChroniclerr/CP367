# File: part_II.sh
# Author: Hubert Bao
# Student ID: 169077248
# Date: 2026-02-26

awk -F, '{print $2, $4}' cleaned.csv > q6.txt

awk -F, '$5 != "SUCCESS" {errors++} END {print errors}' cleaned.csv > q7.txt

awk -F, '{sum += $6} END {print sum/NR}' cleaned.csv > q8.txt

awk -F, '{
    requests[$2]++
} END {
    for (ip in requests)
        print ip, requests[ip]
}' cleaned.csv > q9.txt

awk -F, '{
    traffic[$2] += $6
} END {
    max = 0
    for (ip in traffic)
        if (traffic[ip] > max) {
            max = traffic[ip]
            max_ip = ip
        }
    print max_ip, max
}' cleaned.csv > q10.txt

awk -F, '{
    if ($6 > max) {
        max = $6
        ip = $2
    }
} END {
    print ip, max
}' cleaned.csv > q11.txt

awk -F, '{requests[$3]++} END {
    for (method in requests)
        print method, requests[method]
}' cleaned.csv > q12.txt

awk -F, '{
    requests[$2]++
} END {
    for (ip in requests)
        if (requests[ip] > 3)
            print ip
}' cleaned.csv > q13.txt

awk -F, '{
    access[$4]++
} END {
    max = 0
    for (url in access)
        if (access[url] > max) {
            max = access[url]
            max_url = url
        }
    print max_url
}' cleaned.csv > q14.txt
