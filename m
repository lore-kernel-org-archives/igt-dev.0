Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55EFAF46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0905A10E4A7;
	Mon, 16 Mar 2026 11:20:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SRxnU6/7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BC010E4A7
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773660003; x=1805196003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NHSuQiKX8UbrWw1Uf29aoD/xkX/bFzOJvCR7lcx1PaM=;
 b=SRxnU6/7VgIiphzbAl2ELFqnSpoF6j5BnbhNDTDASLX4C9JeSTttXq1M
 j/dENrrzDcEW5qbhDiTOWLiduY8not3Qs31HVEWL1D+4uilXKnmkCYj49
 a1jQXTJX7UsTrXhV7z9dz6vU9xOD9g18fLRoiYRnyB1Mzk05hvnhIjn4R
 YHOngQtnr76c/TiF3S4KFM5jqv85Rpyr4F/EU+dwKaMs5uZ87JaymBaPQ
 yRk64AvvK5j1bS4lE9WBI+T8uBsNV7x1qnRuXDG/qHKpK/TuGR1kGuplA
 WPDtqSQRw//sh/2LDMmV97T35cAGlaQqLE0ZSym8JmnenhSUEzrSLIfoM Q==;
X-CSE-ConnectionGUID: hvedmhDoT8G3ZQ1DQ7sH0w==
X-CSE-MsgGUID: SpY4mvOJSAWEE5ZVMvXd2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74562430"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74562430"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:20:03 -0700
X-CSE-ConnectionGUID: ppu3k3wPQzO2Za5L3/ZidQ==
X-CSE-MsgGUID: NMbonoRCSlak3eWw8XXwMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221832965"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:20:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 09/12] tests/kms_bw: clarify what's going on with proper
 variable naming
Date: Mon, 16 Mar 2026 13:19:11 +0200
Message-ID: <479fd66e46ee9d97e5ff846078625c132dbddc23.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Use "n_crtc" to mean the number of CRTCs, and pass that around instead
of "pipe" that was actually the number of CRTCs minus one. Small things
like this make a huge difference in the readability, especially when the
-1 is embedded into >= comparisons.

Note: I would've preferred to pull the n_crtcs into the top level loop,
but unfortunately that leads into a discrepancy with the supposedly
dynamic test documentation generation, which has pipes up to 16. The
simple but dumb way appears to be to just generate all the subtests, and
then skip.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_bw.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 1c339f252a3e..056aa667d795 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -216,7 +216,7 @@ static bool output_mode_supported(igt_output_t *output, const drmModeModeInfo *m
 	return false;
 }
 
-static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo *mode, bool physical) {
+static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeInfo *mode, bool physical) {
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	struct igt_fb buffer[IGT_MAX_PIPES];
@@ -230,16 +230,16 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
 	for_each_crtc(display, crtc) num_pipes++;
 
-	igt_skip_on_f(pipe >= num_pipes,
-                      "ASIC does not have %d pipes\n", pipe + 1);
+	igt_skip_on_f(n_crtcs > num_pipes,
+                      "ASIC does not have %d pipes\n", n_crtcs);
 
 	test_init(data, physical);
 
-	igt_skip_on_f(physical && pipe >= data->connected_outputs,
-		      "Only %d connected need %d connected\n", data->connected_outputs, pipe + 1);
+	igt_skip_on_f(physical && n_crtcs > data->connected_outputs,
+		      "Only %d connected need %d connected\n", data->connected_outputs, n_crtcs);
 
 	/* create buffers */
-	for (i = 0; i <= pipe; i++) {
+	for (i = 0; i < n_crtcs; i++) {
 		crtc = igt_crtc_for_pipe(display, i);
 
 		output = physical ? data->connected_output[i] : data->output[i];
@@ -272,7 +272,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	for (i = 0; i <= pipe; i++) {
+	for (i = 0; i < n_crtcs; i++) {
 		output = physical ? data->connected_output[i] : data->output[i];
 		if (!output || !output_mode_supported(output, mode)) {
 			continue;
@@ -283,7 +283,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 			     "CRC is zero\n");
 	}
 
-	for (i = pipe; i >= 0; i--) {
+	for (i = n_crtcs - 1; i >= 0; i--) {
 		output = physical ? data->connected_output[i] : data->output[i];
 		if (!output || !output_mode_supported(output, mode))
 			continue;
@@ -297,6 +297,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 int igt_main()
 {
 	data_t data;
+	int n_crtcs;
 	int i = 0, j = 0;
 
 	memset(&data, 0, sizeof(data));
@@ -316,16 +317,20 @@ int igt_main()
 	/* We're not using for_each_pipe_static because we need the
 	 * _amount_ of pipes */
 	for (i = 0; i < IGT_MAX_PIPES; i++) {
+		n_crtcs = i + 1;
+
 		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-			igt_subtest_f("linear-tiling-%d-displays-%s", i+1, test_mode[j].name)
-				run_test_linear_tiling(&data, i, &test_mode[j], false);
+			igt_subtest_f("linear-tiling-%d-displays-%s", n_crtcs, test_mode[j].name)
+				run_test_linear_tiling(&data, n_crtcs, &test_mode[j], false);
 		}
 	}
 
         for (i = 0; i < IGT_MAX_PIPES; i++) {
+		n_crtcs = i + 1;
+
                 for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
-                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", i+1, test_mode[j].name)
-				run_test_linear_tiling(&data, i, &test_mode[j], true);
+                        igt_subtest_f("connected-linear-tiling-%d-displays-%s", n_crtcs, test_mode[j].name)
+				run_test_linear_tiling(&data, n_crtcs, &test_mode[j], true);
                 }
         }
 
-- 
2.47.3

