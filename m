Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6C8E77194
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 12:57:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0F9010E204;
	Tue, 31 Dec 2024 12:57:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXlntbka";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE48A10E063
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735649865; x=1767185865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JTAnq99f2v8D90IS6MlyMpL2BZVR6p3tAcWLwfyGQqc=;
 b=jXlntbkaFsBolkgsCZYFaF3joIRc6XU0T9f9/5p/ktxdLyOCO2YBc9+8
 KpA3zEpHs3MOxNLVg8paFvQIFStmXWuN/cLjc/AMYojdvO9XrlWkbgOhd
 ExrJSKOs+I0MV6LcFWs1+y1KUWraF4moFLFxcW8d2m7a8JZKv7s3e382L
 Apgd9orOx7YNEkjDlZMJ4AStMGVLqndS1yiXOdDzM13SWW7djhbN/cL/1
 eRdN6s4LBh6lP+NUA7OZsoIlbDjLFZ3K6Qi3U3wZUT3FZytB3xprJe4dD
 pAVRPMNd9WCJWqeHkHvgve4GEdJnGWlmEvZ7r18lU6Vi/rK1eGUyFm1/Y w==;
X-CSE-ConnectionGUID: wUiTcsYqSii9oMVWK+hpqA==
X-CSE-MsgGUID: 1VNodvhnScu3zGC74ZIEzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="46518400"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="46518400"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:45 -0800
X-CSE-ConnectionGUID: sEowszF6RamRgtuYK6l85Q==
X-CSE-MsgGUID: nJBSNEWHSCi6agjFg8dk5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100867231"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 04:57:43 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 5/9] tests/kms_sharpness_filter: Add filter-tap subtest
Date: Tue, 31 Dec 2024 18:32:37 +0530
Message-Id: <20241231130241.69689-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241231130241.69689-1-swati2.sharma@intel.com>
References: <20241231130241.69689-1-swati2.sharma@intel.com>
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

Add subtest to verify that sharpness works with different
resolutions (implicitly different taps). Select different taps
based on the following conditions:

TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
       (mode->vdisplay > 1080 && mode->vdisplay < 2160)
TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160

v2: -Fix test description (Ankit)
    -Fix tap selection conditions (Ankit)
    -Change iterator (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index 2bc87374e..d1d6558c5 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -37,6 +37,10 @@
  *
  * SUBTEST: filter-toggle
  * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
+ *
+ * SUBTEST: filter-tap
+ * Description: Verify content adaptive sharpness filter with resolution change, resolution change
+ * 		will lead to selection of distinct taps.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -47,10 +51,15 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
  * is seen without corruption for each subtest.
  */
 
+#define TAP_3				3
+#define TAP_5				5
+#define TAP_7				7
 #define DISABLE_FILTER			0
 #define MIN_FILTER_STRENGTH		1
 #define MID_FILTER_STRENGTH		128
 #define MAX_FILTER_STRENGTH		255
+#define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
+#define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
 #define NROUNDS				10
 
 enum test_type {
@@ -60,6 +69,7 @@ enum test_type {
 	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
+	TEST_FILTER_TAP,
 };
 
 const int filter_strength_list[] = {
@@ -69,6 +79,11 @@ const int filter_strength_list[] = {
 	(MID_FILTER_STRENGTH + MAX_FILTER_STRENGTH) / 2,
 	MAX_FILTER_STRENGTH,
 };
+const int filter_tap_list[] = {
+	TAP_3,
+	TAP_5,
+	TAP_7,
+};
 static const struct {
 	uint64_t modifier;
 	const char *name;
@@ -99,6 +114,7 @@ typedef struct {
 	igt_plane_t *plane[4];
 	drmModeModeInfo *mode;
 	int filter_strength;
+	int filter_tap;
 	uint64_t modifier;
 	const char *modifier_name;
 	uint32_t format;
@@ -151,6 +167,32 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
+static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3])
+{
+	drmModeConnector *connector = output->config.connector;
+	int total_pixels = 0;
+
+	/*
+	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
+	 * TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
+	 * 	  (mode->vdisplay > 1080 && mode->vdisplay < 2160)
+	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
+	 */
+	for (int i = 0; i < connector->count_modes; i++) {
+		total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
+
+		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
+			mode[0] = &connector->modes[i];
+
+		if (total_pixels > MAX_PIXELS_FOR_3_TAP_FILTER &&
+		    total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
+			mode[1] = &connector->modes[i];
+
+		if (total_pixels > MAX_PIXELS_FOR_5_TAP_FILTER)
+			mode[2] = &connector->modes[i];
+	}
+}
+
 static int test_filter_toggle(data_t *data)
 {
 	int ret = 0;
@@ -239,6 +281,34 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 				continue;
 			}
 
+			if (type == TEST_FILTER_TAP) {
+				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
+				int num_taps = ARRAY_SIZE(filter_tap_list);
+
+				igt_assert(num_taps == 3);
+
+				get_modes_for_filter_taps(output, modes);
+				for (int i = 0; i < 3; i++) {
+					data->filter_tap = filter_tap_list[i];
+					if (!modes[i])
+						continue;
+					data->mode = modes[i];
+				        igt_info("Mode %dx%d@%d on output %s\n", data->mode->hdisplay, data->mode->vdisplay,
+						  data->mode->vrefresh, igt_output_name(data->output));
+					igt_output_override_mode(data->output, data->mode);
+
+					snprintf(name, sizeof(name), "-tap-%d", data->filter_tap);
+					igt_dynamic_f("pipe-%s-%s%s", kmstest_pipe_name(data->pipe_id),
+						       data->output->name, name)
+						test_sharpness_filter(data, type);
+				}
+
+				if (data->limited)
+					break;
+
+				continue;
+			}
+
 			switch (type) {
 			case TEST_FILTER_BASIC:
 				snprintf(name, sizeof(name), "-basic");
@@ -381,6 +451,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
 	}
 
+	igt_describe("Verify that following a resolution change, "
+		     "distict taps are selected.");
+	igt_subtest_with_dynamic("filter-tap") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

