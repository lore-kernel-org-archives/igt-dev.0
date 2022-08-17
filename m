Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAE411B773
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 14:23:14 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p184so7340775iod.6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Aug 2022 07:23:14 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org,
	petri.latvala@intel.com
Date: Wed, 17 Aug 2022 09:21:29 -0500
Message-Id: <20220817142129.1639394-1-jfree@freebsd.org>
In-Reply-To: <20220816154750.1366623-1-jfree@freebsd.org>
References: <20220816154750.1366623-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] added newline to 'END TESTLIST' to
 comply with runner string comparison
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

---
 scripts/code_cov_gen_report | 9 +++------
 tests/generate_testlist.sh  | 2 +-
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
index ffc8142e..b0696c51 100755
--- a/scripts/code_cov_gen_report
+++ b/scripts/code_cov_gen_report
@@ -138,8 +138,7 @@ if [ "$MODE" != "info" ]; then
 		echo "Creating per-file info files..."
 		echo -n "" >${MERGED_INFO}.info
 		for i in $RESULTS/*.tar.gz; do
-			TITLE=$(basename $i)
-			TITLE=$(basename $TITLE .tar.gz)
+			TITLE=$(basename "$i" .tar.gz)
 
 			echo "Adding results from $i..."
 			tar xf $i
@@ -155,8 +154,7 @@ if [ "$MODE" != "info" ]; then
 
 		TITLE=${MERGED_INFO}
 	else
-		TITLE=$(basename $RESULTS)
-		TITLE=$(basename $TITLE .tar.gz)
+		TITLE=$(basename "$RESULTS" .tar.gz)
 
 		echo "Adding results from $RESULTS..."
 		tar xf $RESULTS
@@ -177,8 +175,7 @@ else
 		echo "Copying $RESULTS to $DEST_DIR..."
 		cp $RESULTS .
 
-		TITLE=$(basename $RESULTS)
-		TITLE=$(basename $TITLE .info)
+		TITLE=$(basename "$RESULTS" .info)
 	fi
 fi
 
diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh
index 240a7eb5..ea999a45 100755
--- a/tests/generate_testlist.sh
+++ b/tests/generate_testlist.sh
@@ -15,4 +15,4 @@ while [ $# -gt 0 ] ; do
 	shift
 done
 
-printf "\nEND TESTLIST" >> $OUTPUT
+printf "\nEND TESTLIST\n" >> $OUTPUT
-- 
2.37.2
