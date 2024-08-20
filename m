Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925EEC3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 08:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD5010E50B;
	Tue, 20 Aug 2024 08:15:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KqoIZHTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6AC10E4F3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 08:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724141709; x=1755677709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=swY7un1IAbKZWJc9U3im67PTM73evIHCaegGWeqAWkw=;
 b=KqoIZHTtVVDStS6U4T+0TflisYPE5CEu61EH1AbwzD4CcT0SZJ9eSvCe
 bhsYGROc+xymVpOOtuEZ3tAIRhavt9JVk0rtRiLzQ8kdv8RglIyO5K0Og
 l+b5G5vMuSPZL48RHl7g3pHAkK62J3NqehT4Mxk1DATT36ks3cj1BvG71
 VhdxuPgk4SRBjGH8IZgcJ1bzQNenMkaZEFvc71guJkhyMZoXyxa/nMVku
 xeBCZTOlxUlS5yAFs0togjsVr6rdGC++bPOwpQblU2kmWJeed9qEEl1h2
 H16Ukyehf16bVYw+hyzBUrQ/Y2k4fmu+X/jupBcybVLh1i3RmnkUsKN4+ A==;
X-CSE-ConnectionGUID: gAcFYo3SSHGEM0atF3eIzQ==
X-CSE-MsgGUID: /58/p3O1Q+OkYU54d4xkWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="44948241"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="44948241"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 01:15:06 -0700
X-CSE-ConnectionGUID: NTl8i9/YTb2eCOGRAbXKhQ==
X-CSE-MsgGUID: G3qdKA46THypJhwHF4BKgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="91418387"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by fmviesa001.fm.intel.com with ESMTP; 20 Aug 2024 01:15:04 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, ankit.k.nautiyal@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 3/5] tests/kms_content_protection: Rename
 igt_commit_style variable
Date: Tue, 20 Aug 2024 13:42:30 +0530
Message-ID: <20240820081233.4092203-4-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240820081233.4092203-1-suraj.kandpal@intel.com>
References: <20240820081233.4092203-1-suraj.kandpal@intel.com>
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

Currently all igt_commit_style variables are declared using a
single variable which is not a good practice use commit_style
naming instead.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 65 +++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 32 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index db6dc17b1..473686939 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -208,19 +208,19 @@ wait_for_prop_value(igt_output_t *output, uint64_t expected,
 }
 
 static void
-commit_display_and_wait_for_flip(enum igt_commit_style s)
+commit_display_and_wait_for_flip(enum igt_commit_style commit_style)
 {
 	int ret;
 	uint32_t flag;
 
-	if (s == COMMIT_ATOMIC) {
+	if (commit_style == COMMIT_ATOMIC) {
 		flag = DRM_MODE_PAGE_FLIP_EVENT | DRM_MODE_ATOMIC_ALLOW_MODESET;
 		igt_display_commit_atomic(&data.display, flag, NULL);
 
 		ret = wait_flip_event();
 		igt_assert_f(!ret, "wait_flip_event failed. %d\n", ret);
 	} else {
-		igt_display_commit2(&data.display, s);
+		igt_display_commit2(&data.display, commit_style);
 
 		/* Wait for 50mSec */
 		usleep(50 * 1000);
@@ -228,7 +228,7 @@ commit_display_and_wait_for_flip(enum igt_commit_style s)
 }
 
 static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
-			    enum igt_commit_style s)
+			    enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
 	drmModeModeInfo *mode;
@@ -240,15 +240,15 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 	igt_plane_set_fb(primary, &data.red);
 	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
 
-	igt_display_commit2(display, s);
+	igt_display_commit2(display, commit_style);
 
 	igt_plane_set_fb(primary, &data.green);
 
 	/* Wait for Flip completion before starting the HDCP authentication */
-	commit_display_and_wait_for_flip(s);
+	commit_display_and_wait_for_flip(commit_style);
 }
 
-static bool test_cp_enable(igt_output_t *output, enum igt_commit_style s,
+static bool test_cp_enable(igt_output_t *output, enum igt_commit_style commit_style,
 			   int content_type, bool type_change)
 {
 	igt_display_t *display = &data.display;
@@ -266,19 +266,19 @@ static bool test_cp_enable(igt_output_t *output, enum igt_commit_style s,
 		igt_output_set_prop_value(output,
 					  IGT_CONNECTOR_HDCP_CONTENT_TYPE,
 					  content_type);
-	igt_display_commit2(display, s);
+	igt_display_commit2(display, commit_style);
 
 	ret = wait_for_prop_value(output, CP_ENABLED,
 				  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 	if (ret) {
 		igt_plane_set_fb(primary, &data.green);
-		igt_display_commit2(display, s);
+		igt_display_commit2(display, commit_style);
 	}
 
 	return ret;
 }
 
-static void test_cp_disable(igt_output_t *output, enum igt_commit_style s)
+static void test_cp_disable(igt_output_t *output, enum igt_commit_style commit_style)
 {
 	igt_display_t *display = &data.display;
 	igt_plane_t *primary;
@@ -293,7 +293,7 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style s)
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
 				  CP_UNDESIRED);
 	igt_plane_set_fb(primary, &data.red);
-	igt_display_commit2(display, s);
+	igt_display_commit2(display, commit_style);
 
 	/* Wait for HDCP to be disabled, before crtc off */
 	ret = wait_for_prop_value(output, CP_UNDESIRED,
@@ -302,8 +302,9 @@ static void test_cp_disable(igt_output_t *output, enum igt_commit_style s)
 }
 
 static void test_cp_enable_with_retry(igt_output_t *output,
-				      enum igt_commit_style s, int retry,
-				      int content_type, bool expect_failure,
+				      enum igt_commit_style commit_style,
+				      int retry, int content_type,
+				      bool expect_failure,
 				      bool type_change)
 {
 	int retry_orig = retry;
@@ -311,16 +312,16 @@ static void test_cp_enable_with_retry(igt_output_t *output,
 
 	do {
 		if (!type_change || retry_orig != retry)
-			test_cp_disable(output, s);
+			test_cp_disable(output, commit_style);
 
-		ret = test_cp_enable(output, s, content_type, type_change);
+		ret = test_cp_enable(output, commit_style, content_type, type_change);
 
 		if (!ret && --retry)
 			igt_debug("Retry (%d/2) ...\n", 3 - retry);
 	} while (retry && !ret);
 
 	if (!ret)
-		test_cp_disable(output, s);
+		test_cp_disable(output, commit_style);
 
 	if (expect_failure)
 		igt_assert_f(!ret,
@@ -375,22 +376,22 @@ static bool write_srm_as_fw(const __u8 *srm, int len)
 
 static void test_content_protection_on_output(igt_output_t *output,
 					      enum pipe pipe,
-					      enum igt_commit_style s,
+					      enum igt_commit_style commit_style,
 					      int content_type)
 {
 	igt_display_t *display = &data.display;
 	bool ret;
 
-	test_cp_enable_with_retry(output, s, 3, content_type, false,
+	test_cp_enable_with_retry(output, commit_style, 3, content_type, false,
 				  false);
 
 	if (data.cp_tests & CP_TYPE_CHANGE) {
 		/* Type 1 -> Type 0 */
-		test_cp_enable_with_retry(output, s, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  HDCP_CONTENT_TYPE_0, false,
 					  true);
 		/* Type 0 -> Type 1 */
-		test_cp_enable_with_retry(output, s, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  content_type, false,
 					  true);
 	}
@@ -400,14 +401,14 @@ static void test_content_protection_on_output(igt_output_t *output,
 			     "mei_hdcp unload failed");
 
 		/* Expected to fail */
-		test_cp_enable_with_retry(output, s, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  content_type, true, false);
 
 		igt_assert_f(!igt_kmod_load("mei_hdcp", NULL),
 			     "mei_hdcp load failed");
 
 		/* Expected to pass */
-		test_cp_enable_with_retry(output, s, 3,
+		test_cp_enable_with_retry(output, commit_style, 3,
 					  content_type, false, false);
 	}
 
@@ -417,16 +418,16 @@ static void test_content_protection_on_output(igt_output_t *output,
 	if (data.cp_tests & CP_DPMS) {
 		igt_pipe_set_prop_value(display, pipe,
 					IGT_CRTC_ACTIVE, 0);
-		igt_display_commit2(display, s);
+		igt_display_commit2(display, commit_style);
 
 		igt_pipe_set_prop_value(display, pipe,
 					IGT_CRTC_ACTIVE, 1);
-		igt_display_commit2(display, s);
+		igt_display_commit2(display, commit_style);
 
 		ret = wait_for_prop_value(output, CP_ENABLED,
 					  KERNEL_AUTH_TIME_ALLOWED_MSEC);
 		if (!ret)
-			test_cp_enable_with_retry(output, s, 2,
+			test_cp_enable_with_retry(output, commit_style, 2,
 						  content_type, false,
 						  false);
 	}
@@ -534,20 +535,20 @@ static bool output_hdcp_capable(igt_output_t *output, int content_type)
 }
 
 static void
-test_fini(igt_output_t *output, enum igt_commit_style s)
+test_fini(igt_output_t *output, enum igt_commit_style commit_style)
 {
 	igt_plane_t *primary;
 
-	test_cp_disable(output, s);
+	test_cp_disable(output, commit_style);
 	primary = igt_output_get_plane_type(output,
 					    DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	igt_display_commit2(&data.display, s);
+	igt_display_commit2(&data.display, commit_style);
 }
 
 static void
-test_content_protection(enum igt_commit_style s, int content_type)
+test_content_protection(enum igt_commit_style commit_style, int content_type)
 {
 	igt_display_t *display = &data.display;
 	igt_output_t *output;
@@ -570,15 +571,15 @@ test_content_protection(enum igt_commit_style s, int content_type)
 			if (!intel_pipe_output_combo_valid(display))
 				continue;
 
-			modeset_with_fb(pipe, output, s);
+			modeset_with_fb(pipe, output, commit_style);
 
 			if (!output_hdcp_capable(output, content_type))
 				continue;
 
 			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
-				test_content_protection_on_output(output, pipe, s, content_type);
+				test_content_protection_on_output(output, pipe, commit_style, content_type);
 
-			test_fini(output, s);
+			test_fini(output, commit_style);
 			/*
 			 * Testing a output with a pipe is enough for HDCP
 			 * testing. No ROI in testing the connector with other
-- 
2.43.2

