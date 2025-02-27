Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F1DC1B0FF
	for <igt-dev@archiver.kernel.org>; Thu, 27 Feb 2025 10:19:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9735A10EA92;
	Thu, 27 Feb 2025 10:19:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mh/YVkry";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF0F10EA89
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Feb 2025 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740651585; x=1772187585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0t3cc2VDe8xW6kKYNNijMFvSltD5Ow7+arlKBC/xbyA=;
 b=Mh/YVkry8SEX0rJPD1nFGL+UPmBpbI+U9NA/TzEslJs0sfRWqabwrlle
 7hwC5TrEAWNUUQrV/vFb7syaTjGLgz6dhU4ea2OJ8KWPcmZrkjAVLwOZV
 la/SqI6HZRfvtP8CwJK3vgSC2fB88+JrkA99Vs74w6kNflAsHQy9hxaVu
 HYkDRovKX1WFa15IaqqHYwwA4cCWoGQAbuaU9jN9vG4J70qv7Kr8r377Y
 dgLsutD7qY4wN1Z5fTwp9t4oDrTFO9BjaX2Nea9O32qy2AS7icwbHVb8W
 EgcU12r/zQZCGRSgj7Poo8R1CUd58evzE1HJcMhF6XqoSW7U1KibsNSb0 w==;
X-CSE-ConnectionGUID: vgyfOOAeTeSVXvlqV4rGNw==
X-CSE-MsgGUID: SvXVbTQdSxSK9ZkrhUOrmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45185586"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; d="scan'208";a="45185586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:19:45 -0800
X-CSE-ConnectionGUID: mlAabsQ2RCiYSSmrx5TRzg==
X-CSE-MsgGUID: CWlQEah5Rn26sbPn8qSuVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="122230167"
Received: from mviannax-mobl.amr.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.80.7])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 02:19:44 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH v7 i-g-t 3/3] scripts/run-tests.sh: Add support to kmemleak
 reports and igt_facts
Date: Thu, 27 Feb 2025 11:18:53 +0100
Message-Id: <20250227101853.361504-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250227101853.361504-1-peter.senna@linux.intel.com>
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
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

Updates scripts/run-tests.sh to include the following options:

 -f:        enable igt_facts on igt_runner
 -K <mode>: Linux Kernel kmemleak reports
            - once: run a kmemleak scan after all tests
            - each: run a kmemleak scan after each test

These options are simply relayed to igt_runner.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 scripts/run-tests.sh | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index 082ebaa5a..1fb9be478 100755
--- a/scripts/run-tests.sh
+++ b/scripts/run-tests.sh
@@ -132,9 +132,13 @@ print_help() {
 	echo "  -P              store code coverage results per each test. Should be"
 	echo "                  used together with -k option"
 	echo "  -d              download Piglit to $ROOT/piglit"
+	echo "  -f              enable igt_facts on igt_runner"
 	echo "  -h              display this help message"
 	echo "  -k <kernel_dir> Linux Kernel source code directory used to generate code"
 	echo "                  coverage builds."
+	echo "  -K <mode>       Linux Kernel kmemleak reports"
+	echo "                   - once: run a kmemleak scan after all tests"
+	echo "                   - each: run a kmemleak scan after each test"
 	echo "  -l              list all available tests"
 	echo "  -r <directory>  store the results in directory"
 	echo "                  (default: $RESULTS)"
@@ -160,12 +164,14 @@ print_help() {
 	echo "Useful patterns for test filtering are described in the API documentation."
 }
 
-while getopts ":c:dhk:lPr:st:T:vx:Rnpb:m:" opt; do
+while getopts ":c:dfhk:K:lPr:st:T:vx:Rnpb:m:" opt; do
 	case $opt in
 		c) COV_ARGS="$COV_ARGS --collect-code-cov --collect-script $OPTARG " ;;
 		d) download_piglit; exit ;;
+		f) IGT_FACTS="-f" ;;
 		h) print_help; exit ;;
 		k) IGT_KERNEL_TREE="$OPTARG" ;;
+		K) KMEMLEAK="--kmemleak=$OPTARG" ;;
 		l) LIST_TESTS="true" ;;
 		P) COV_ARGS="$COV_ARGS --coverage-per-test"; COV_PER_TEST=1 ;;
 		r) RESULTS="$OPTARG" ;;
@@ -256,7 +262,7 @@ if [ "x$RESUME_RUN" != "x" ]; then
 	execute_runner 1 $RESUME $RESUME_ARGS $COV_ARGS "$RESULTS"
 else
 	mkdir -p "$RESULTS"
-	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
+	execute_runner 1 $RUNNER $RUN_ARGS -o $IGT_FACTS $KMEMLEAK -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
 fi
 
 if [ "$SUMMARY" = "html" ]; then
-- 
2.34.1

