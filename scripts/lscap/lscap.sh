#!/bin/bash
lscap () {
    echo ""
    echo "  [*] Search capabilities"
    echo "  [\$] getcap -r / 2>/dev/null"
    echo ""
    getcap -r / 2>/dev/null
    echo ""
    echo "  [*] Visit the following link to check the possible vulnerabilities"
    echo "      [*] https://gtfobins.github.io/#+capabilities"
    echo ""
    echo "  [*] \"Why is it dangerous?\" "
    echo "      [*] en: https://www.incibe-cert.es/en/blog/linux-capabilities-en"
    echo "      [*] es: https://www.incibe-cert.es/blog/linux-capabilities"
    echo ""
}
