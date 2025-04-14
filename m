Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EEFC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 11:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D47910E576;
	Mon, 14 Apr 2025 11:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mgLWCbCD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F041C10E572
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 11:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744629104; x=1776165104;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8SEJ+o/Kxmnb48qJncqu21KEXb9VrgKIpO6Cb50kPeM=;
 b=mgLWCbCDlB7ES7nuskwyqwF45Cmk00a7J9uWI/npgnY9xLbWRW5iN1gn
 0DMIYbG0KDr/T4bqM+aNw6tPuYVS+oJi7z6HaF4MUnh6WrZNmWbcTzm7+
 Bo0/jqL5vDGr4Dj7leusRKu85Q2I0nIkNQfSLfT1pvZwezKbwRch+y4vI
 F73JZPorv6lNijtSxQLzVPqTJTT1gTVt4uK7QGBHY3nQfT3OMR9u9aK2G
 KcurLnv9YvHXwD5JaWbfUqwNb4ET22FDvLnP1Q9kkj3YL9RP7gYpsUsaS
 u9788eOXtJNseiKyehkpCu8X3T0cQmqjRi5cO4Apw/DTwh5SwpLyWOoSM g==;
X-CSE-ConnectionGUID: /xsQ9FoxQUSp32qsj2N6+A==
X-CSE-MsgGUID: 12kwLc4BQZifPJVWWBU2vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="33706194"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="33706194"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:44 -0700
X-CSE-ConnectionGUID: /8aQg5Q6SAmdSWzYCo5rqA==
X-CSE-MsgGUID: 5YyR/u+kTQmo0voNcobJYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134838324"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 04:11:42 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 05/10] tests/kms_sharpness_filter: Add filter-tap subtest
Date: Mon, 14 Apr 2025 16:46:52 +0530
Message-Id: <20250414111657.794484-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414111657.794484-1-swati2.sharma@intel.com>
References: <20250414111657.794484-1-swati2.sharma@intel.com>
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
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
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

