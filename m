Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E090A108B8E9
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:40:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9564510E97C;
	Fri, 20 Mar 2026 10:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iIGFqbFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CC310E97C
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003217; x=1805539217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KKBvasSD6l4XsAKN1cbMg/sPiqOQoxyVPuBBpX/11I4=;
 b=iIGFqbFNmm8p8m/02lsPJfQSbYxgWz+IVVI8xpqAgoeIDrFwArD4IOpN
 pIvLm2Ui61fWEiCy4rMcay2vrihtwxWikf4BE5bsabqMvXUtU8RGXyfiN
 r7r6gFTAKFMKe+DgpelhM8+cnjsx4RonY0lBT4KemrsgAx6NphxOdljuS
 0FMxIV8iz4U4QK2Dpz7CmoXL136q+z8MBV14vr9YHLgyQC+j9NkuThLGL
 kY5z0JBE9wtWKOVz4+n5oVckpH2XZU0JkWHH/StDNEJ+2UdPtZO5w1DML
 bp7XyCpTfip98+ghqOl3Y5EIktM0xHkQTfx0K/2e3Dpmtt9yF1SB4tEmI w==;
X-CSE-ConnectionGUID: 8OUI940fQfSXVaqCOtZN2Q==
X-CSE-MsgGUID: 3iu/7JCnRxydg02SzilVtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75052781"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75052781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:17 -0700
X-CSE-ConnectionGUID: a1YlYkuxR4+bW5bQN8zlrQ==
X-CSE-MsgGUID: Ll7nyYiIQwuLY1yhqIvUIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="223276321"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 08/11] tests/kms_bw: clarify what's going on with
 proper variable naming
Date: Fri, 20 Mar 2026 12:39:28 +0200
Message-ID: <bc837f3160bd6baf354e86da6ebc4816a8bc92cd.1774002591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774002591.git.jani.nikula@intel.com>
References: <cover.1774002591.git.jani.nikula@intel.com>
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

