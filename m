Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8E6CD1292
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 17:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED892113394;
	Thu,  4 Apr 2024 17:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FY8UKFhJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F0C113394
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712252518; x=1743788518;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vrDz/IMU7DcRsBfB53IlXA0JS4NpLQvR6mEYaJQlv4w=;
 b=FY8UKFhJVv1/qcG+e6w3p5DpA0Z1Em5wgflwb0QVWpbyM701H1zUPcp8
 o+HsZHMIzYeo4oT1bGxXRAEPZYOrFKXjbAwdhXEu82gsBWPqJmZNPd5qz
 z9v8KbiG5ne/wMmcU4CHxanpC7PIeF+bbFXO0xJilMeJjN5GMhj3WdEIo
 wJOk5NTTF1diTh19BekAFE4mgFzfpbfX/TCwOkXdnYbBMvQHoufW1Q6+V
 mRDChzUj3Gph9reAX1lPYuxFSPkNEe5SiuFI75oDJuDazJAEIIP/o7GzU
 +NJ5CnaeIuCnNObw3Dt4LzO7wCmjOCmmm9YyWyR7oTCMafmARqTrkrSnK g==;
X-CSE-ConnectionGUID: 6mB5y0kjTjK2DkdGFNEnnA==
X-CSE-MsgGUID: AALhx9WsT7mYDceT7gmcPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="8133701"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="8133701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 10:41:58 -0700
X-CSE-ConnectionGUID: +XhHFhVQTP2QzFNNKKjrXQ==
X-CSE-MsgGUID: yFMJS3w4TXy9BjMMEKRRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="49820601"
Received: from unknown (HELO localhost) ([10.245.246.95])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 10:41:56 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t] scripts/doc-tests-cross-check: allow whitespace in
 keywords
Date: Thu,  4 Apr 2024 19:41:52 +0200
Message-ID: <20240404174152.107265-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

When main field name had whitespace, script incorrectly split it
into two separate words, for example when used with
"Mega feature" it treats it as two words: "Mega" and "feature".
This is not what we want it so fix it, also use "Mega feature"
in main call.

Also while at this, add additional verification step that
conflicting words are consistent and improve example of usage.

Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/doc-tests-cross-check.sh | 33 ++++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/scripts/doc-tests-cross-check.sh b/scripts/doc-tests-cross-check.sh
index 174b14807..3f1dc7a83 100755
--- a/scripts/doc-tests-cross-check.sh
+++ b/scripts/doc-tests-cross-check.sh
@@ -34,10 +34,10 @@ grep_test ()
 	myout=$2
 
 	echo "running: $myout file: $test"
-	grep $myout: $test | sed -e "s/...$2: //" \
+	grep -E $myout: $test | sed -e "s/...$2: //" \
 		| tr '[:upper:]' '[:lower:]' | sed -e 's/, /\n/g' \
 		| sed -e 's/ /Y/g' >> b.$myout
-	grep -r $myout: ../tests/* >> n.$myout
+	grep -E -r $myout: ../tests/* >> n.$myout
 }
 
 
@@ -61,8 +61,12 @@ scan_dirs ()
 {
 	rm a.columns
 
-	for todo in $@; do
-		echo $todo >> a.columns
+        for todo in "$@"; do
+                echo "$todo" | sed -e 's/ /./g' >> a.columns
+	done
+
+	SCANWORDS=`cat a.columns`
+	for todo in $SCANWORDS; do
 		echo "Scanning name: $todo"
 		one_scan_dir $todo
 	done
@@ -89,7 +93,20 @@ check_test ()
 		grep -i -w "$test" w.$1 >> .tmp_check
 	done
 
-	sort -u < .tmp_check > e.$1
+	sort -u < .tmp_check > .tmp_ck2
+
+	# it is a match only when is a column in our original c.$1
+	# as a word could be shorter and grep will match it then
+	rm .tmp_ck3
+	CKWORDS=`cat .tmp_ck2`
+	for test in $CKWORDS; do
+		grep -E -i -w "$test" c.$1
+		if [ $? -eq 0 ]; then
+			echo $test >> .tmp_ck3
+		fi
+	done
+
+	sort -u < .tmp_ck3 > e.$1
 }
 
 # will use .tmpcols and create w.$1
@@ -134,7 +151,7 @@ echo "=============================================="
 
 # Mega feature / Category / Sub-category / Functionality
 # Mega-feature is not used now
-scan_dirs Category Sub-category Functionality
+scan_dirs Category Sub-category Functionality "Mega feature"
 
 echo "=============================================="
 echo "checking..."
@@ -153,8 +170,8 @@ wc -l e.[A-Za-z]*
 echo ""
 echo "=============================================="
 echo "example useage: take a word from e.* file and grep it in c*"
-echo "grep -i word c.*"
+echo "grep -E -i word c.*"
 echo "to see where it is used in tests, use:"
-echo "grep -i word n.*"
+echo "grep -E -i ':.*word' n.*"
 echo "=============================================="
 
-- 
2.42.0

