Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9898CC282D0
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 09:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A08710EB25;
	Fri,  7 Mar 2025 09:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Utk/EtkM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF9E10EB25
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 09:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741340139; x=1772876139;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fjTLnb8901pdMZXVGhYVvZkRTLIM5v78cLSPIeHcTXQ=;
 b=Utk/EtkMpRDfvBRk4rE10ZyqrD0qykGuaLX/Tz6kGXGKPN3Rlb4YFApW
 0wbklT8KpK6yVieF8vyEuUsTq7uIIgLUVZQqefuGt1bzVawcm0qsiEAaK
 P6qgBFzc/AZi1fVorSVAypnsD1MrMNku47CbwHX8r93BNRRTn9NrDVsCq
 Yc75NhAbiV8HbfeSRJThK52VmlQSri5BxvKc8ZUJ01maHhkEsfesGKpYq
 OuU1GqvuyOwA7+TW05NxOQY1bMq9rpSRNrFgo4PQ1xeJFpXkVHAs21PCZ
 b/7ITuE2C34VJjOe9HYwpiWWRUfIOZOnbO2IlWGZxWRFY+oKv4x8u5VuG g==;
X-CSE-ConnectionGUID: inloElIXTiq6N4ndWmPIWw==
X-CSE-MsgGUID: C0NU3nD+RQ6hPh9R8hawAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53772619"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="53772619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 01:35:39 -0800
X-CSE-ConnectionGUID: 0Js8wBP+Rc+sm2W0IXcJUQ==
X-CSE-MsgGUID: Bzu4w5HGQlOHgm/dumKSeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="124497009"
Received: from jledworo-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.114.21])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 01:35:35 -0800
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>, vitaly.prosyak@amd.com,
 christian.koenig@amd.com, alexander.deucher@amd.com, jesse.zhang@amd.com,
 harry.wentland@amd.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, ryszard.knop@intel.com,
 lucas.demarchi@intel.com, katarzyna.piecielska@intel.com
Subject: [PATCH v8 i-g-t 3/3] scripts/run-tests.sh: Add support to kmemleak
 and igt_facts
Date: Fri,  7 Mar 2025 10:34:26 +0100
Message-Id: <20250307093426.90479-4-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250307093426.90479-1-peter.senna@linux.intel.com>
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
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

Cc: vitaly.prosyak@amd.com
Cc: christian.koenig@amd.com
Cc: alexander.deucher@amd.com
Cc: jesse.zhang@amd.com
Cc: harry.wentland@amd.com
Cc: zbigniew.kempczynski@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: ryszard.knop@intel.com
Cc: lucas.demarchi@intel.com
Cc: katarzyna.piecielska@intel.com
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
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

