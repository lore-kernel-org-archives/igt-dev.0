Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 645E289D58
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 13:30:22 +0000 (UTC)
Date: Thu, 5 Mar 2020 15:30:17 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200305133017.2sruexv3w2no2ons@ahiler-desk1.fi.intel.com>
References: <20200304121044.26908-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304121044.26908-1-petri.latvala@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] scripts/verify-blacklist: Script for
 checking blacklist files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 04, 2020 at 02:10:44PM +0200, Petri Latvala wrote:
> tests/intel-ci/blacklist*.txt files can collect bitrot unless there's
> an easy way to check for lines that are no longer needed due to the
> tests being renamed or removed. Therefore, a script just for that.

You can add that as a pieline step so you get the check pre-merge and
people removing the tests can remove them from the blacklist too.

This would be even more helpful when things are getting renamed -
loweres the chance of people forgeting to tweak the blacklists.

> Signed-off-by: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> ---
>  scripts/verify-blacklist.sh | 47 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100755 scripts/verify-blacklist.sh
> 
> diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
> new file mode 100755
> index 00000000..a88b32be
> --- /dev/null
> +++ b/scripts/verify-blacklist.sh
> @@ -0,0 +1,47 @@
> +#!/bin/sh
> +
> +# Verify that all entries in a blacklist file are still valid
> +
> +usage() {
> +    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blacklist-file>"
> +    echo
> +    echo " path-to-igt-runner: For example build/runner/igt_runner"
> +    echo " test-binary-directory: For example build/tests"
> +    echo " blacklist-file: For example tests/intel-ci/blacklist.txt"
> +    exit 1
> +}
> +
> +if [ $# -ne 3 ]; then
> +    usage
> +fi
> +
> +RUNNER="$1"
> +BINDIR="$2"
> +BLFILE="$3"
> +
> +if [ ! -x "$RUNNER" ]; then
> +    echo "$RUNNER not found"
> +    echo
> +    usage
> +fi
> +
> +if [ ! -f "$BINDIR/test-list.txt" ]; then
> +    echo "$BINDIR doesn't look like a test-binary directory"
> +    echo
> +    usage
> +fi
> +
> +if [ ! -f "$BLFILE" ]; then
> +    echo "$BLFILE not found"
> +    echo
> +    usage
> +fi
> +
> +cat "$BLFILE" | while read line; do
> +    test=$(echo "$line" | sed 's/#.*//' | tr -d '[:space:]')
> +    if [ "$test" = "" ]; then continue; fi
> +
> +    if ! "$RUNNER" -L -t "$test" "$BINDIR" >/dev/null 2>/dev/null; then
> +	echo Useless blacklist entry: "$test"
> +    fi
> +done

Looks good, although running 'runner -L' in a loop for a size of a blacklist may
be a bit slow for bigger blacklists.

Also using the --long-options would make it a bit more readable.

Anyway,
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
