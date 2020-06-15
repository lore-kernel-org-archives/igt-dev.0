Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9520B89CDE
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2020 10:25:25 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 15 Jun 2020 13:25:15 +0300
Message-Id: <20200615102516.7376-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 1/2] scripts/verify-blacklist: Script for
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

tests/intel-ci/blacklist*.txt files can collect bitrot unless there's
an easy way to check for lines that are no longer needed due to the
tests being renamed or removed. Therefore, a script just for that.

v2: Use long options for readability, exit with 1 if something found

v3: Verify manually against the list of all tests instead of trying
    with igt_runner's --include-tests

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com> #v1
---
 scripts/verify-blacklist.sh | 54 +++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100755 scripts/verify-blacklist.sh

diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
new file mode 100755
index 00000000..93dca495
--- /dev/null
+++ b/scripts/verify-blacklist.sh
@@ -0,0 +1,54 @@
+#!/bin/sh
+
+# Verify that all entries in a blacklist file are still valid
+
+usage() {
+    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blacklist-file>"
+    echo
+    echo " path-to-igt-runner: For example build/runner/igt_runner"
+    echo " test-binary-directory: For example build/tests"
+    echo " blacklist-file: For example tests/intel-ci/blacklist.txt"
+    exit 2
+}
+
+if [ $# -ne 3 ]; then
+    usage
+fi
+
+RUNNER="$1"
+BINDIR="$2"
+BLFILE="$3"
+
+if [ ! -x "$RUNNER" ]; then
+    echo "$RUNNER not found"
+    echo
+    usage
+fi
+
+if [ ! -f "$BINDIR/test-list.txt" ]; then
+    echo "$BINDIR doesn't look like a test-binary directory"
+    echo
+    usage
+fi
+
+if [ ! -f "$BLFILE" ]; then
+    echo "$BLFILE not found"
+    echo
+    usage
+fi
+
+STATUS=0
+
+TESTLIST="$("$RUNNER" --list-all "$BINDIR")"
+
+cat "$BLFILE" | while read line; do
+    blentry=$(echo "$line" | sed 's/#.*//' | tr -d '[:space:]')
+    if [ "$blentry" = "" ]; then continue; fi
+
+    if ! (echo "$TESTLIST" | grep -Pq "$blentry") >/dev/null 2>/dev/null; then
+	echo Useless blacklist entry: "$blentry"
+	STATUS=1
+    fi
+done
+
+exit $STATUS
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
