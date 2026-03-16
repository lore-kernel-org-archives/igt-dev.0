Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1FEBF46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BBA610E4A6;
	Mon, 16 Mar 2026 11:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSTViO9o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C88810E4A5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773659998; x=1805195998;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nEEqsXsuOvXGBhNpQweiFsc/YYNA2I5KkGehyQTIZVk=;
 b=aSTViO9oqYx2h+wyfWAU8aGppIznpjthTbNxOu0i+2K5dPV1YEGJ3eM5
 PyU08aqdkp+8kqmKBP/2I46dG6bM2upB2BefafxL+vLdtvYcApTy4fpeB
 VEq+AbTgsfu0rDB/2fb8lEViGLFTKVdH27v/OQAIfktdeNd3DZCkfX2wg
 Riwx3Pp7w7nNFfXmsMo2EokFDpFawsRwlCz79VONANjGSxWA6vbP0u7Yf
 R6th3wQhb8c/LOqnqneDf7IfYLpAR+/LLZG2zmD6T3kYWot60APzKNxTQ
 gdOL0PC+igKjBW17sYoXD86cWtdNlik2AjEgo4YbAWdEReiawhaP/hYUS A==;
X-CSE-ConnectionGUID: RAJ6V25WQuWDyqLtXT6T2Q==
X-CSE-MsgGUID: maoPNeWpQRKXTfzJ+Zc9QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74562429"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74562429"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:58 -0700
X-CSE-ConnectionGUID: dQmridXAQoSzDPOFHh/vDg==
X-CSE-MsgGUID: npzVWRDiT4ClUF6U2L+GEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221832935"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:19:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 06/12] tests/intel/kms_pipe_b_c_ivb: Prepare for
 returning NULL from igt_crtc_for_pipe()
Date: Mon, 16 Mar 2026 13:19:08 +0200
Message-ID: <19c7fd99b8379f2a6e07d359c9ef6e16cfdd5a71.1773659680.git.jani.nikula@intel.com>
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

Figure out igt_crtc_t pointers for pipes B and C once the beginning, and
skip the test if either isn't available.

This is really a no-op, as IVB will have pipes B and C, but prepares for
cleanly returning NULL from igt_crtc_for_pipe().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_pipe_b_c_ivb.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/tests/intel/kms_pipe_b_c_ivb.c b/tests/intel/kms_pipe_b_c_ivb.c
index 11c97e23c5e4..0e017706373c 100644
--- a/tests/intel/kms_pipe_b_c_ivb.c
+++ b/tests/intel/kms_pipe_b_c_ivb.c
@@ -65,6 +65,8 @@ IGT_TEST_DESCRIPTION(
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
+	igt_crtc_t *crtc_b;
+	igt_crtc_t *crtc_c;
 } data_t;
 
 drmModeModeInfo mode_3_lanes = {
@@ -173,8 +175,8 @@ find_outputs(data_t *data, igt_output_t **output1, igt_output_t **output2)
 static void
 test_dpms(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -202,8 +204,8 @@ test_dpms(data_t *data)
 static void
 test_lane_reduction(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -235,8 +237,8 @@ test_lane_reduction(data_t *data)
 static void
 test_disable_pipe_B(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -271,8 +273,8 @@ test_disable_pipe_B(data_t *data)
 static void
 test_from_C_to_B_with_3_lanes(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -302,8 +304,8 @@ test_from_C_to_B_with_3_lanes(data_t *data)
 static void
 test_fail_enable_pipe_C_while_B_has_3_lanes(data_t *data)
 {
-	igt_crtc_t *crtc_b = igt_crtc_for_pipe(&data->display, PIPE_B);
-	igt_crtc_t *crtc_c = igt_crtc_for_pipe(&data->display, PIPE_C);
+	igt_crtc_t *crtc_b = data->crtc_b;
+	igt_crtc_t *crtc_c = data->crtc_c;
 	igt_output_t *output1, *output2;
 	int ret;
 
@@ -339,6 +341,12 @@ int igt_main()
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+
+		data.crtc_b = igt_crtc_for_pipe(&data.display, PIPE_B);
+		igt_skip_on(!data.crtc_b->valid);
+
+		data.crtc_c = igt_crtc_for_pipe(&data.display, PIPE_C);
+		igt_skip_on(!data.crtc_c->valid);
 	}
 
 	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with mode "
-- 
2.47.3

