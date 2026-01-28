Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AF2D35672
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 05:46:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 730C510E61E;
	Wed, 28 Jan 2026 05:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SVcm8FDQ";
	dkim-atps=neutral
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E5710E18B
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 05:46:28 +0000 (UTC)
X-UUID: ac0ddd18fc0c11f0b7fc4fdb8733b2bc-20260128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1R7VTId9BC0r9ZKDOH270RV4+MPNxlWEebrfh+HoLb0=; 
 b=SVcm8FDQALmXvvTzcruyLy51tht7pnFoYMk+XSSAX7PFi0hFG3wwZP3kEvxUPvIM4VLuMS4qxLjB289qBrI7UNEMVnyNnKRjPwM5tuHjxP8e5/XyAxRBEh43RJmhpi9ZUVKf1T0GpIoguvQ7VNq9iAp64Bt1D8GmU2CvZ2RxL5k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.11, REQID:c21164b2-3110-417d-be0f-de58c3bab8b5, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:89c9d04, CLOUDID:ce8807e9-ef90-4382-9c6f-55f2a0689a6b,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102|836|888|898,TC:-5,Content:0|15|5
 0,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA
 :0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ac0ddd18fc0c11f0b7fc4fdb8733b2bc-20260128
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 596508282; Wed, 28 Jan 2026 13:46:20 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 28 Jan 2026 13:46:18 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 28 Jan 2026 13:46:18 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: <igt-dev@lists.freedesktop.org>, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Fei Shao <fshao@chromium.org>
CC: Jani <jani.nikula@intel.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>,
 Yacoub <markyacoub@chromium.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH i-g-t] tests/kms_content_protection: Fix framebuffer management
Date: Wed, 28 Jan 2026 13:45:52 +0800
Message-ID: <20260128054617.817010-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
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

The framebuffers were previously created once at test start.
On systems with multiple outputs of different resolutions, the
pre-created framebuffer size might not match subsequent outputs,
causing modeset failures.

Fix framebuffer indexing to properly handle different resolutions:
- Single output tests: Use pipe as framebuffer index
- MST tests: Use valid output sequential indexing to support multiple
  outputs per pipe with different resolutions

Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
 tests/kms_content_protection.c | 150 ++++++++++++++++++++-------------
 1 file changed, 93 insertions(+), 57 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 5928266f2fe4..e9f15e4cf22a 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -107,10 +107,15 @@
 
 IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
 
+struct hdcp_test_fbs {
+	struct igt_fb red;
+	struct igt_fb green;
+};
+
 struct data {
 	int drm_fd;
 	igt_display_t display;
-	struct igt_fb red, green;
+	struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
 	unsigned int cp_tests;
 	struct udev_monitor *uevent_monitor;
 	bool is_force_hdcp14;
@@ -267,18 +272,19 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 	mode = igt_output_get_mode(output);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(primary, &data.red);
-	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
+	igt_plane_set_fb(primary, &data.fbs[pipe].red);
+	igt_fb_set_size(&data.fbs[pipe].red, primary, mode->hdisplay, mode->vdisplay);
 
 	igt_display_commit2(display, commit_style);
 
-	igt_plane_set_fb(primary, &data.green);
+	igt_plane_set_fb(primary, &data.fbs[pipe].green);
 
 	/* Wait for Flip completion before starting the HDCP authentication */
 	commit_display_and_wait_for_flip(commit_style);
 }
 
-static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
+static bool test_cp_enable(igt_output_t *output, enum pipe pipe,
+			   enum igt_commit_style commit_style,
 			   int content_type, bool type_change)
 {
 	igt_display_t *display = &data.display;
@@ -301,7 +307,7 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_st
 	ret = wait_for_prop_value(output, CP_ENABLED,
 				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 	if (ret) {
-		igt_plane_set_fb(primary, &data.green);
+		igt_plane_set_fb(primary, &data.fbs[pipe].green);
 		igt_display_commit2(display, commit_style);
 	}
 
@@ -320,7 +326,7 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 
 	for (count = 0; count < valid_outputs; count++) {
 		primary = igt_output_get_plane_type(hdcp_mst_output[count], DRM_PLANE_TYPE_PRIMARY);
-		igt_plane_set_fb(primary, &data.red);
+		igt_plane_set_fb(primary, &data.fbs[count].red);
 		igt_output_set_prop_value(hdcp_mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION,
 					  CP_UNDESIRED);
 	}
@@ -338,7 +344,8 @@ static void test_mst_cp_disable(igt_output_t *hdcp_mst_output[],
 	igt_assert_f(ret, "Content Protection not cleared on all MST outputs\n");
 }
 
-static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
+static void test_cp_disable(igt_output_t *output, enum pipe pipe,
+			    enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
@@ -352,7 +359,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
 	 */
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
 				  CP_UNDESIRED);
-	igt_plane_set_fb(primary, &data.red);
+	igt_plane_set_fb(primary, &data.fbs[pipe].red);
 	igt_display_commit2(display, commit_style);
 
 	/* Wait for HDCP to be disabled, before crtc off */
@@ -361,7 +368,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_s
 	igt_assert_f(ret, "Content Protection not cleared\n");
 }
 
-static void test_cp_enable_with_retry(igt_output_t *output,
+static void test_cp_enable_with_retry(igt_output_t *output, enum pipe pipe,
 				      enum igt_commit_style commit_style,
 				      int retry, int content_type,
 				      bool expect_failure,
@@ -372,16 +379,16 @@ static void test_cp_enable_with_retry(igt_output_t *output,
 
 	do {
 		if (!type_change || retry_orig != retry)
-			test_cp_disable(output, commit_style);
+			test_cp_disable(output, pipe, commit_style);
 
-		ret = test_cp_enable(output, commit_style, content_type, type_change);
+		ret = test_cp_enable(output, pipe, commit_style, content_type, type_change);
 
 		if (!ret && --retry)
 			igt_debug("Retry (%d/2) ...\n", 3 - retry);
 	} while (retry && !ret);
 
 	if (!ret)
-		test_cp_disable(output, commit_style);
+		test_cp_disable(output, pipe, commit_style);
 
 	if (expect_failure)
 		igt_assert_f(!ret,
@@ -451,16 +458,16 @@ static void test_content_protection_on_output(igt_output_t *output,
 	igt_display_t *display = &data.display;
 	bool ret;
 
-	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
+	test_cp_enable_with_retry(output, pipe, commit_style, 3, content_type, false,
 				  false);
 
 	if (data.cp_tests & CP_TYPE_CHANGE) {
 		/* Type 1 -> Type 0 */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, pipe, commit_style, 3,
 					  HDCP_CONTENT_TYPE_0, false,
 					  true);
 		/* Type 0 -> Type 1 */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, pipe, commit_style, 3,
 					  content_type, false,
 					  true);
 	}
@@ -470,14 +477,14 @@ static void test_content_protection_on_output(igt_output_t *output,
 			     "mei_hdcp unload failed");
 
 		/* Expected to fail */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, pipe, commit_style, 3,
 					  content_type, true, false);
 
 		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
 			     "mei_hdcp load failed");
 
 		/* Expected to pass */
-		test_cp_enable_with_retry(output, commit_style, 3,
+		test_cp_enable_with_retry(output, pipe, commit_style, 3,
 					  content_type, false, false);
 	}
 
@@ -496,7 +503,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 		ret = wait_for_prop_value(output, CP_ENABLED,
 					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
-			test_cp_enable_with_retry(output, commit_style, 2,
+			test_cp_enable_with_retry(output, pipe, commit_style, 2,
 						  content_type, false,
 						  false);
 	}
@@ -507,7 +514,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 		ret = wait_for_prop_value(output, CP_ENABLED,
 					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
-			test_cp_enable_with_retry(output, commit_style, 2,
+			test_cp_enable_with_retry(output, pipe, commit_style, 2,
 						  content_type, false,
 						  false);
 	}
@@ -577,21 +584,24 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_enabled)
+static void prepare_modeset_on_mst_output(igt_output_t *output, int count, bool is_enabled)
 {
 	drmModeModeInfo *mode;
 	igt_plane_t *primary;
 	int width, height;
+	struct igt_fb *fb;
 
 	mode = igt_output_get_mode(output);
 
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
+	fb = is_enabled ? &data.fbs[count].green : &data.fbs[count].red;
+
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
-	igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
-	igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, width, height);
+	igt_plane_set_fb(primary, fb);
+	igt_fb_set_size(fb, primary, width, height);
 	igt_plane_set_size(primary, width, height);
 }
 
@@ -663,11 +673,11 @@ static void reset_i915_force_hdcp14(igt_output_t *output)
 }
 
 static void
-test_fini(igt_output_t *output, enum igt_commit_style commit_style)
+test_fini(igt_output_t *output, enum pipe pipe, enum igt_commit_style commit_style)
 {
 	igt_plane_t *primary;
 
-	test_cp_disable(output, commit_style);
+	test_cp_disable(output, pipe, commit_style);
 	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
@@ -725,6 +735,8 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 
 	for_each_connected_output(display, output) {
 		for_each_pipe(display, pipe) {
+			drmModeModeInfo *mode;
+
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 			if (is_output_hdcp_test_exempt(output)) {
@@ -739,6 +751,14 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
+			mode = igt_output_get_mode(output);
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    1.f, 0.f, 0.f, &data.fbs[pipe].red);
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    0.f, 1.f, 0.f, &data.fbs[pipe].green);
+
 			modeset_with_fb(pipe, output, commit_style);
 			if (data.is_force_hdcp14)
 				set_i915_force_hdcp14(output);
@@ -749,7 +769,11 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
 			if (data.is_force_hdcp14)
 				reset_i915_force_hdcp14(output);
 
-			test_fini(output, commit_style);
+			test_fini(output, pipe, commit_style);
+
+			igt_remove_fb(data.drm_fd, &data.fbs[pipe].red);
+			igt_remove_fb(data.drm_fd, &data.fbs[pipe].green);
+
 			/*
 			 * Testing a output with a pipe is enough for HDCP
 			 * testing. No ROI in testing the connector with other
@@ -843,7 +867,7 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 			igt_debug("Retry %d/3\n", 3 - retries);
 
 		for (i = 0; i < valid_outputs; i++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[i], ret);
+			prepare_modeset_on_mst_output(hdcp_mst_output[i], i, ret);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
 	} while (retries && !ret);
@@ -865,6 +889,7 @@ test_content_protection_mst(int content_type)
 	enum pipe pipe;
 	bool pipe_found;
 	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
+	drmModeModeInfo *mode;
 
 	for_each_pipe(display, pipe)
 		max_pipe++;
@@ -890,7 +915,16 @@ test_content_protection_mst(int content_type)
 
 		igt_output_set_crtc(output,
 				    igt_crtc_for_pipe(output->display, pipe));
-		prepare_modeset_on_mst_output(output, false);
+
+		mode = igt_output_get_mode(output);
+		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    1.f, 0.f, 0.f, &data.fbs[valid_outputs].red);
+		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.f, 1.f, 0.f, &data.fbs[valid_outputs].green);
+
+		prepare_modeset_on_mst_output(output, valid_outputs, false);
 		dp_mst_outputs++;
 		if (output_hdcp_capable(output, content_type))
 			hdcp_mst_output[valid_outputs++] = output;
@@ -906,8 +940,22 @@ test_content_protection_mst(int content_type)
 		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
 		igt_require_f(found, "No valid mode combo found for MST modeset\n");
 
-		for (count = 0; count < valid_outputs; count++)
-			prepare_modeset_on_mst_output(hdcp_mst_output[count], false);
+		/* Need to re-prepare after mode override */
+		for (count = 0; count < valid_outputs; count++) {
+			igt_remove_fb(data.drm_fd, &data.fbs[count].red);
+			igt_remove_fb(data.drm_fd, &data.fbs[count].green);
+
+			mode = igt_output_get_mode(hdcp_mst_output[count]);
+
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    1.f, 0.f, 0.f, &data.fbs[count].red);
+			igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+					    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+					    0.f, 1.f, 0.f, &data.fbs[count].green);
+
+			prepare_modeset_on_mst_output(hdcp_mst_output[count], count, false);
+		}
 
 		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
 		igt_require_f(ret == 0, "Commit failure during MST modeset\n");
@@ -935,7 +983,7 @@ test_content_protection_mst(int content_type)
 	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
 	 */
 	igt_debug("CP Prop being UNDESIRED on %s\n", hdcp_mst_output[0]->name);
-	test_cp_disable(hdcp_mst_output[0], COMMIT_ATOMIC);
+	test_cp_disable(hdcp_mst_output[0], 0, COMMIT_ATOMIC);
 
 	/* CP is expected to be still enabled on other outputs*/
 	for (i = 1; i < valid_outputs; i++) {
@@ -946,6 +994,11 @@ test_content_protection_mst(int content_type)
 
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 1);
+
+	for (count = 0; count < valid_outputs; count++) {
+		igt_remove_fb(data.drm_fd, &data.fbs[count].red);
+		igt_remove_fb(data.drm_fd, &data.fbs[count].green);
+	}
 }
 
 
@@ -956,6 +1009,8 @@ static void test_content_protection_cleanup(void)
 	uint64_t val;
 
 	for_each_connected_output(display, output) {
+		drmModeModeInfo *mode;
+
 		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
 			continue;
 
@@ -964,34 +1019,16 @@ static void test_content_protection_cleanup(void)
 		if (val == CP_UNDESIRED)
 			continue;
 
-		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
-		test_cp_disable(output, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-	}
-
-	igt_remove_fb(data.drm_fd, &data.red);
-	igt_remove_fb(data.drm_fd, &data.green);
-}
-
-static void create_fbs(void)
-{
-	uint16_t width = 0, height = 0;
-	drmModeModeInfo *mode;
-	igt_output_t *output;
-
-	for_each_connected_output(&data.display, output) {
 		mode = igt_output_get_mode(output);
-		igt_assert(mode);
+		igt_create_color_fb(data.drm_fd, mode->hdisplay, mode->vdisplay,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    1.f, 0.f, 0.f, &data.fbs[0].red);
 
-		width = max(width, mode->hdisplay);
-		height = max(height, mode->vdisplay);
-	}
+		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
+		test_cp_disable(output, 0, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    1.f, 0.f, 0.f, &data.red);
-	igt_create_color_fb(data.drm_fd, width, height,
-			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    0.f, 1.f, 0.f, &data.green);
+		igt_remove_fb(data.drm_fd, &data.fbs[0].red);
+	}
 }
 
 static const struct {
@@ -1159,7 +1196,6 @@ int igt_main()
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
-		create_fbs();
 	}
 
 	igt_describe("Test content protection with legacy style commit.");
-- 
2.43.0

