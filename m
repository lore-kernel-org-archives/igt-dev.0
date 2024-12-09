Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 867ABE77182
	for <igt-dev@archiver.kernel.org>; Mon,  9 Dec 2024 11:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4221710E4A4;
	Mon,  9 Dec 2024 11:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D/f9J6D+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EC210E6F5
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Dec 2024 11:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733744624; x=1765280624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p42nd0po85gjq/thvY3azkA5HGeud3lMFWxu5/EbU7c=;
 b=D/f9J6D+jOwAmxxNzSxePi159EIgS0WlrnEa9ro4sCE3D2iK8OWIPAXW
 MoseXTBe8UxuM1sJaqMNuRZ3nHyh2H1XnTm3OulXvwfZzlW893w6YHwNy
 4X1Ww8Wf3h9y3KC3OMn5Apvf6tMgmYse+TEfK2BGPl5NouM0cjZzW7P4B
 TdA9QThXMpAhlJBfzcGwFN66jRofEudsg5xCUBQ9glpY/CH9MBRAetQPg
 Ru5h9mRtapt1CdmTH5qgVugf8f+0Nm3ZStIk3hpquHRsXOrMZ5jVeF3fz
 P99b7ONkXzX1GqGzNfHPISZTasA8JKiRzefJR2UMeqU2Zkzx8e0HFKEDk A==;
X-CSE-ConnectionGUID: A1lS+1YvRjK/mVBU8lnjCg==
X-CSE-MsgGUID: PEJZdtahQw64xi1m/tt3wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34182068"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="34182068"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 03:43:43 -0800
X-CSE-ConnectionGUID: ldpRRUayQdqw1OeFEo/HiQ==
X-CSE-MsgGUID: +EJvYCQEQxu5nP69GU5wHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="99503171"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:43:42 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 5/9] tests/kms_sharpness_filter: Add filter-tap subtest
Date: Mon,  9 Dec 2024 17:16:19 +0530
Message-Id: <20241209114623.1843033-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209114623.1843033-1-swati2.sharma@intel.com>
References: <20241209114623.1843033-1-swati2.sharma@intel.com>
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

Subtest is added to verify that following a resolution change,
distinct taps are selected i.e.

TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 79 ++++++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index aa200b16a..f91c444f7 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -37,6 +37,9 @@
  *
  * SUBTEST: filter-toggle
  * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
+ *
+ * SUBTEST: filter-tap
+ * Description: Verify that following a resolution change, distinct taps are selected.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -47,10 +50,15 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
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
@@ -60,6 +68,7 @@ enum test_type {
 	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
+	TEST_FILTER_TAP,
 };
 
 const int filter_strength_list[] = {
@@ -69,6 +78,11 @@ const int filter_strength_list[] = {
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
@@ -99,6 +113,7 @@ typedef struct {
 	igt_plane_t *plane[4];
 	drmModeModeInfo *mode;
 	int filter_strength;
+	int filter_tap;
 	uint64_t modifier;
 	const char *modifier_name;
 	uint32_t format;
@@ -151,6 +166,31 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
+static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3])
+{
+	drmModeConnector *connector = output->config.connector;
+	int total_pixels = 0;
+
+	/*
+	 * TAP 3: mode->hdisplay <= 1920 && mode->vdisplay <= 1080
+	 * TAP 5: mode->hdisplay > 1920 && mode->vdisplay > 1080
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
@@ -237,6 +277,34 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 				continue;
 			}
 
+			if (type == TEST_FILTER_TAP) {
+				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
+				int num_taps = ARRAY_SIZE(filter_tap_list);
+
+				igt_assert(num_taps == 3);
+
+				get_modes_for_filter_taps(output, modes);
+				for (int k = 0; k < 3; k++) {
+					data->filter_tap = filter_tap_list[k];
+					if (!modes[k])
+						continue;
+					data->mode = modes[k];
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
@@ -379,6 +447,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
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

