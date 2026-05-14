Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E43CD4F25
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 09:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDFD10E065;
	Thu, 14 May 2026 09:42:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gmnVB2j6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE05710E065
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 09:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778751679; x=1810287679;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2/5FS5Bf5356p7YoJAwmSM7D3L3vDcBSDlJF+zt26iA=;
 b=gmnVB2j6lLzdbMBsLzMzMV/f/SfpMb3Tohw6iLkA+c0EeIwC9ExUHj9g
 D2BxdXiepkWsk+bDdJ7Fw4gLrsgVnIRInrzfs6OZW90ru+uKgvsKkMegm
 QKjYrOaw/iw2hwjmVo3ZBWRt56/wmRQwIUnDo6R72fXQD91J8292YxKZh
 F5d7oS/DK/8eMzxYpn1TpR2Q+33kcFKW2HIcrDOU30Bd9VYpqptbxk1MC
 VuTymPYCBR/duRU6hrt1andYUKbNUjkauleoJRFtgF3qMfmw04irNmeSq
 tOyp3jV0RsNwBA/KFBF2IKyRkCV4gV4Ce53LglgdsxENqYM5groY4Qen+ Q==;
X-CSE-ConnectionGUID: EdfF/VWHTIme/HROtorX6w==
X-CSE-MsgGUID: XiG4DZmoQ3emuNpvFr9INw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="83560535"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="83560535"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 02:41:19 -0700
X-CSE-ConnectionGUID: h+uwIqUPRZuFwXA2L/z5Dg==
X-CSE-MsgGUID: 9WLRyjdkT020Z1FXeDWSoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; d="scan'208";a="237475575"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 02:41:16 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jason-jh.lin@mediatek.com, karthik.b.s@intel.com,
 fshao@chromium.org, navaremanasi@google.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 2/3] Revert "tests/kms_content_protection: Pass crtc
 parameter and use per-CRTC FBs"
Date: Thu, 14 May 2026 15:05:09 +0530
Message-Id: <20260514093510.688396-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
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

This reverts commit 8d7c2453de54032d1cd576a17d416ed0591ea0c4.

cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
cc: Fei Shao <fshao@chromium.org>
cc: Manasi Navare <navaremanasi@google.com>
cc: Suraj Kandpal <suraj.kandpal@intel.com>
cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_content_protection.c | 74 ++++++++++++++--------------------
 1 file changed, 31 insertions(+), 43 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index cddb0b6da..47ccf61d7 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -263,7 +263,7 @@ commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
 	}
 }
 
-static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
+static void modeset_with_fb(igt_output_t *output,
 			    enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
@@ -273,19 +273,18 @@ static void modeset_with_fb(igt_output_t *output, igt_crtc_t *crtc,
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
-	igt_fb_set_size(&data.fbs[crtc->crtc_index].red, primary, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_fb(primary, &data.red);
+	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
 
 	igt_display_commit2(display, commit_style);
 
-	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
+	igt_plane_set_fb(primary, &data.green);
 
 	/* Wait for Flip completion before starting the HDCP authentication */
 	commit_display_and_wait_for_flip(commit_style);
 }
 
-static bool test_cp_enable(igt_output_t *output, igt_crtc_t *crtc,
-			   enum igt_commit_style commit_style,
+static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
 			   int content_type, bool type_change)
 {
 	igt_display_t *display = &data.display;
@@ -308,7 +307,7 @@ static bool test_cp_enable(igt_output_t *output, igt_crtc_t *crtc,
 	ret = wait_for_prop_value(output, CP_ENABLED,
 				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 	if (ret) {
-		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].green);
+		igt_plane_set_fb(primary, &data.green);
 		igt_display_commit2(display, commit_style);
 	}
 
@@ -321,15 +320,13 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
-	igt_crtc_t *crtc;
 	bool ret;
 	int count;
 	u64 val;
 
 	for (count = 0; count < valid_outputs; count++) {
-		crtc = igt_output_get_driving_crtc(hdcp_mst_output[count]);
 		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
+		igt_plane_set_fb(primary, &data.red);
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
 					  CP_UNDESIRED);
 	}
@@ -347,8 +344,7 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
 }
 
-static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
-			    enum igt_commit_style commit_style)
+static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
@@ -362,7 +358,7 @@ static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
 	 */
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
 				  CP_UNDESIRED);
-	igt_plane_set_fb(primary, &data.fbs[crtc->crtc_index].red);
+	igt_plane_set_fb(primary, &data.red);
 	igt_display_commit2(display, commit_style);
 
 	/* Wait for HDCP to be disabled, before crtc off */
@@ -371,7 +367,7 @@ static void test_cp_disable(igt_output_t *output, igt_crtc_t *crtc,
 	igt_assert_f(ret, "Content Protection not cleared\n");
 }
 
-static void test_cp_enable_with_retry(igt_output_t *output, igt_crtc_t *crtc,
+static void test_cp_enable_with_retry(igt_output_t *output,
 				      enum igt_commit_style commit_style,
 				      int retry, int content_type,
 				      bool expect_failure,
@@ -382,16 +378,16 @@ static void test_cp_enable_with_retry(igt_output_t *output, igt_crtc_t *crtc,
 
 	do {
 		if (!type_change || retry_orig != retry)
-			test_cp_disable(output, crtc, commit_style);
+			test_cp_disable(output, commit_style);
 
-		ret = test_cp_enable(output, crtc, commit_style, content_type, type_change);
+		ret = test_cp_enable(output, commit_style, content_type, type_change);
 
 		if (!ret && --retry)
 			igt_debug("Retry (%d/2) ...\n", 3 - retry);
 	} while (retry && !ret);
 
 	if (!ret)
-		test_cp_disable(output, crtc, commit_style);
+		test_cp_disable(output, commit_style);
 
 	if (expect_failure)
 		igt_assert_f(!ret,
@@ -461,16 +457,16 @@ static void test_content_protection_on_output(igt_output_t *output,
 	igt_display_t *display = &data.display;
 	bool ret;
 
-	test_cp_enable_with_retry(output, crtc, commit_style, 3, content_type, false,
+	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
 				  false);
 
 	if (data.cp_tests & CP_TYPE_CHANGE) {
 		/* Type 1 -> Type 0 */
-		test_cp_enable_with_retry(output, crtc, commit_style, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  HDCP_CONTENT_TYPE_0, false,
 					  true);
 		/* Type 0 -> Type 1 */
-		test_cp_enable_with_retry(output, crtc, commit_style, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  content_type, false,
 					  true);
 	}
@@ -480,14 +476,14 @@ static void test_content_protection_on_output(igt_output_t *output,
 			     "mei_hdcp unload failed");
 
 		/* Expected to fail */
-		test_cp_enable_with_retry(output, crtc, commit_style, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  content_type, true, false);
 
 		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
 			     "mei_hdcp load failed");
 
 		/* Expected to pass */
-		test_cp_enable_with_retry(output, crtc, commit_style, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  content_type, false, false);
 	}
 
@@ -506,7 +502,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 		ret = wait_for_prop_value(output, CP_ENABLED,
 					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
-			test_cp_enable_with_retry(output, crtc, commit_style, 2,
+			test_cp_enable_with_retry(output, commit_style, 2,
 						  content_type, false,
 						  false);
 	}
@@ -517,7 +513,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 		ret = wait_for_prop_value(output, CP_ENABLED,
 					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
-			test_cp_enable_with_retry(output, crtc, commit_style, 2,
+			test_cp_enable_with_retry(output, commit_style, 2,
 						  content_type, false,
 						  false);
 	}
@@ -587,24 +583,21 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void prepare_modeset_on_mst_output(igt_output_t *output, igt_crtc_t *crtc, bool is_enabled)
+static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int width, height;
-	struct igt_fb *fb;
 
 	mode = igt_output_get_mode(output);
 
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
-	fb = is_enabled ? &data.fbs[crtc->crtc_index].green : &data.fbs[crtc->crtc_index].red;
-
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_plane_set_fb(primary, fb);
-	igt_fb_set_size(fb, primary, width, height);
+	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
+	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
 	igt_plane_set_size(primary, width, height);
 }
 
@@ -676,11 +669,11 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
 }
 
 static void
-test_fini(igt_output_t *output, igt_crtc_t *crtc, enum igt_commit_style commit_style)
+test_fini(igt_output_t *output, enum igt_commit_style commit_style)
 {
 	igt_plane_t *primary;
 
-	test_cp_disable(output, crtc, commit_style);
+	test_cp_disable(output, commit_style);
 	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -776,7 +769,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
-			modeset_with_fb(output, crtc, commit_style);
+			modeset_with_fb(output, commit_style);
 			if (data.is_force_hdcp14)
 				set_i915_force_hdcp14(output);
 
@@ -790,7 +783,7 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (data.is_force_hdcp14)
 				reset_i915_force_hdcp14(output);
 
-			test_fini(output, crtc, commit_style);
+			test_fini(output, commit_style);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
 			 * testing. No ROI in testing the connector with other
@@ -883,11 +876,8 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 		if (!ret || retries)
 			igt_debug("Retry %d/3\n", 3 - retries);
 
-		for (i = 0; i < valid_outputs; i++) {
-			igt_crtc_t *crtc = igt_output_get_driving_crtc(hdcp_mst_output[i]);
-
-			prepare_modeset_on_mst_output(hdcp_mst_output[i], crtc, ret);
-		}
+		for (i = 0; i < valid_outputs; i++)
+			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
@@ -929,7 +919,7 @@ test_content_protection_mst(int content_type)
 		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
 
 		igt_output_set_crtc(output, crtc);
-		prepare_modeset_on_mst_output(output, crtc, false);
+		prepare_modeset_on_mst_output(output, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
 			hdcp_mst_output[valid_outputs++] = output;
@@ -992,7 +982,6 @@ static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
-	igt_crtc_t *crtc;
 	uint64_t val;
 
 	for_each_connected_output(display, output) {
@@ -1005,8 +994,7 @@ static void test_content_protection_cleanup(void)
 			continue;
 
 		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
-		crtc = igt_output_get_driving_crtc(output);
-		test_cp_disable(output, crtc, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 	}
 }
 
-- 
2.34.1

