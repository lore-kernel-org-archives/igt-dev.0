Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1AF10E870
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 19:06:27 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Tue, 18 Apr 2023 21:06:03 +0200
Message-Id: <20230418190603.56196-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] scripts/verify-blacklist: Handle multiple
 given blacklists
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Petri Latvala <petri.latvala@intel.com>

Also change the message for useless entry to not say blacklist; this
script is incidentally useful for checking testlist files too.

Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/verify-blacklist.sh | 40 +++++++++++++++++++++----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/scripts/verify-blacklist.sh b/scripts/verify-blacklist.sh
index 93dca495b..05383f13f 100755
--- a/scripts/verify-blacklist.sh
+++ b/scripts/verify-blacklist.sh
@@ -3,21 +3,23 @@
 # Verify that all entries in a blacklist file are still valid
 
 usage() {
-    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blacklist-file>"
+    echo "Usage: $0 <path-to-igt-runner> <test-binary-directory> <blacklist-files ...>"
     echo
     echo " path-to-igt-runner: For example build/runner/igt_runner"
     echo " test-binary-directory: For example build/tests"
-    echo " blacklist-file: For example tests/intel-ci/blacklist.txt"
+    echo " blacklist-files: For example tests/intel-ci/blacklist.txt"
     exit 2
 }
 
-if [ $# -ne 3 ]; then
+if [ $# -lt 3 ]; then
     usage
 fi
 
 RUNNER="$1"
-BINDIR="$2"
-BLFILE="$3"
+shift
+BINDIR="$1"
+shift
+BLFILES="$*"
 
 if [ ! -x "$RUNNER" ]; then
     echo "$RUNNER not found"
@@ -31,24 +33,28 @@ if [ ! -f "$BINDIR/test-list.txt" ]; then
     usage
 fi
 
-if [ ! -f "$BLFILE" ]; then
-    echo "$BLFILE not found"
-    echo
-    usage
-fi
+for BLFILE in $BLFILES; do
+    if [ ! -f "$BLFILE" ]; then
+	echo "$BLFILE not found"
+	echo
+	usage
+    fi
+done
 
 STATUS=0
 
 TESTLIST="$("$RUNNER" --list-all "$BINDIR")"
 
-cat "$BLFILE" | while read line; do
-    blentry=$(echo "$line" | sed 's/#.*//' | tr -d '[:space:]')
-    if [ "$blentry" = "" ]; then continue; fi
+for BLFILE in $BLFILES; do
+    cat "$BLFILE" | while read line; do
+	blentry=$(echo "$line" | sed 's/#.*//' | tr -d '[:space:]')
+	if [ "$blentry" = "" ]; then continue; fi
 
-    if ! (echo "$TESTLIST" | grep -Pq "$blentry") >/dev/null 2>/dev/null; then
-	echo Useless blacklist entry: "$blentry"
-	STATUS=1
-    fi
+	if ! (echo "$TESTLIST" | grep -Pq "$blentry") >/dev/null 2>/dev/null; then
+	    echo "$BLFILE: Useless entry: $blentry"
+	    STATUS=1
+	fi
+    done
 done
 
 exit $STATUS
-- 
2.37.2


