Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0339EF532FA
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:02:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A94B510E639;
	Tue, 24 Mar 2026 09:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GNr4kst2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D7C810E636
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774342926; x=1805878926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KKBvasSD6l4XsAKN1cbMg/sPiqOQoxyVPuBBpX/11I4=;
 b=GNr4kst2FViWHf71OMfrdyeBupVPH6VQ/iV/iUYpolpzYPHsliYJL2IX
 FcM5r6O3GXhLtFFw8zdwWOQA6B+U4qwAt/nb1lUUUs27bZFKgp2anHTdJ
 cbGUvzkB24+qkjD8cacyxehGwb1IoiwgYyf45xV6xoRBLl2VS+tg2VfdS
 /eqtRmwcSCA5IAmn6e716A+TBiaIEvMBYRpZdHWvdGaCfRmzqVU4JHsLd
 BO5mGY2L2LtOYneqLY03Ky+D+MKDwetcGWJjTXNRouL2yKz2yZW921RLx
 yIH23fS+LRuO0cdURiANVA5/XlQp/yijOJo9YuiHSu9rNSBXXRY83b6w/ A==;
X-CSE-ConnectionGUID: M1tJbKNeQLiRkNQYntFqpA==
X-CSE-MsgGUID: wB2upKbzTSS6mumTi1bRNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86722593"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86722593"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:06 -0700
X-CSE-ConnectionGUID: rxibU+CzQWOGid4p7jAqVQ==
X-CSE-MsgGUID: YY1YVCsAQgeA3Q3wI/KsEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229222631"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [CI 2/5] tests/kms_bw: clarify what's going on with proper variable
 naming
Date: Tue, 24 Mar 2026 11:01:48 +0200
Message-ID: <ba3bd002ff97f523d0b4181abda60ba6306adac1.1774342824.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774342824.git.jani.nikula@intel.com>
References: <cover.1774342824.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

