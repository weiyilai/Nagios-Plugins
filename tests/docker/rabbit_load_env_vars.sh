#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2020-04-17 19:55:29 +0100 (Fri, 17 Apr 2020)
#
#  https://github.com/harisekhon/nagios-plugins
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

# Source in shell to load env vars from rabbitmq-common.yml for manual debugging

#set -euo pipefail
#[ -n "${DEBUG:-}" ] && set -x
srcdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while read line; do
    export "$line"
done < <(yq r "$srcdir/rabbitmq-common.yml" 'services.rabbitmq-common.environment' |
         sed 's/#.*//; s/^-[[:space:]]*//; /^[[:space:]]*$/d')
