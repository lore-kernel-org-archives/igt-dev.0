Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2E0CCF9FF
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 07:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7006510EABF;
	Fri, 31 Oct 2025 07:59:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmoAX7Dj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A01D10EABD
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761897544; x=1793433544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=l0ISF323nm0mRngLclH5ALca6rjSAIFLwtCCozoC8/U=;
 b=XmoAX7DjKEq3dih2+y3qAbZs2Oj4h8o20fl1nsl0N0a2HdIwzTz2CwqI
 0LvITgokLu5bjnb7B/wlREcVhMOWuUQb5JqEvwczGb10C4RJ+LWkeqH+6
 kDFkgCbl3c4pS6MW+EnjvEmOvDYmvYu4NR4yTf4N2QYSV6sYgrqX35uKn
 hg335vLddAehTsMe2E6dELbumIKWPjb39Topdoo8xHq+kNybZQ5f8zua+
 oNmqUUJt29pOMkpN3lF9q2Ijw1zuvjzxNd7vePaM1PMfKxWRlkD6iI12+
 u7purOUUe9ZHfYCrbWkmRaGIbsjFILwVgfD923hIQCWvV+tTy9+OY5hRB w==;
X-CSE-ConnectionGUID: SKQQWEe7TNStnNqmyfym4A==
X-CSE-MsgGUID: lpZsePFXSTKwivK+FPhEPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="75169890"
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="75169890"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 00:59:04 -0700
X-CSE-ConnectionGUID: F4UdTWcPQd+qzlJaBIb4nw==
X-CSE-MsgGUID: sNsLqszjRSmG6BFKlVqdCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,268,1754982000"; d="scan'208";a="186287366"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 00:59:03 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: [PATCH i-g-t,
 v2 05/10] tests/kms_sharpness_filter: Add filter-tap subtest
Date: Fri, 31 Oct 2025 13:35:29 +0530
Message-Id: <20251031080534.880321-6-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251031080534.880321-1-swati2.sharma@intel.com>
References: <20251031080534.880321-1-swati2.sharma@intel.com>
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
index 5b0940aac..3cdd40d75 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -32,6 +32,10 @@
  *
  * SUBTEST: filter-toggle
  * Description: Verify toggling between enabling and disabling content adaptive sharpness filter.
+ *
+ * SUBTEST: filter-tap
+ * Description: Verify content adaptive sharpness filter with resolution change, resolution change
+ * 		will lead to selection of distinct taps.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -42,10 +46,15 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
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
@@ -55,6 +64,7 @@ enum test_type {
 	TEST_FILTER_FORMATS,
 	TEST_FILTER_STRENGTH,
 	TEST_FILTER_TOGGLE,
+	TEST_FILTER_TAP,
 };
 
 const int filter_strength_list[] = {
@@ -64,6 +74,11 @@ const int filter_strength_list[] = {
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
@@ -94,6 +109,7 @@ typedef struct {
 	igt_plane_t *plane[4];
 	drmModeModeInfo *mode;
 	int filter_strength;
+	int filter_tap;
 	uint64_t modifier;
 	const char *modifier_name;
 	uint32_t format;
@@ -146,6 +162,32 @@ static void cleanup(data_t *data)
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
@@ -234,6 +276,34 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
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
@@ -376,6 +446,17 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
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

