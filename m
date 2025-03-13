Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161BCC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 13:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBE110E194;
	Thu, 13 Mar 2025 13:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gMgPTLHL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B651310E194
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741874379; x=1773410379;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dHnWjgQDh5eQWqB/DKvldC1RYef4DCoqKzb0h4SpD+A=;
 b=gMgPTLHLNhIgKJYIlPuY2ROood526qe/yMgiJWAOckuifx7hT0iqChDj
 bwwMYyBS60QNWLGS1j6YGMvfUFnpWjIGMLfTBtHevWHvzGPsMnQoELNc1
 jrisDkWQQAVU79B04EdsgOtjUo4MB4c+bGzu/Y0/lV3QoFwGISo+e9iaY
 mp65dWcZDUHo7x9iYe1JwAzT/isbciza9oJXvsLYbDgfbQN/Mvh/+zTJs
 vO14xnFNVIKsgEfVs0LgXdmlNOw3odF/lFKuh7G5puL10K6UHF4diQ5cE
 oHD0NnYtuoVauKAzKR+Tp5mgPakElyEz4ZJvNi+xVXEDrXLawI2SUc+bY g==;
X-CSE-ConnectionGUID: QlRxHF8GSIyOCJSjqDin1Q==
X-CSE-MsgGUID: 1XhxT1VrRQOsuMQ7TUMH1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53641734"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="53641734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:59:28 -0700
X-CSE-ConnectionGUID: Aj1Bww5PS6egASFy6BL4/Q==
X-CSE-MsgGUID: 9aGZdMW9ToSkuMIr4C9HEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="151899040"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa001.fm.intel.com with ESMTP; 13 Mar 2025 06:59:26 -0700
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t v4] tests/kms_plane: Add test to validate odd panning
Date: Thu, 13 Mar 2025 19:24:33 +0530
Message-Id: <20250313135433.802818-1-nemesa.garg@intel.com>
X-Mailer: git-send-email 2.25.1
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

This feature creates a NV12 plane having two framebuffers
and moving it to odd position and then do continous flip
along with the change in the width of framebuffer.
This is to check whether panning at odd position is
supported or not.

v2: Add test in kms_plane.[Swati]
v3: Remove extra parameters[Pranay]
v4: Add check for modifier

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_plane.c | 102 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index b9bf025bd..c9a988f8a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -88,6 +88,15 @@
  * @format-source-clamping:          with source clamping
  */
 
+/**
+ * SUBTEST: odd-panning
+ * Description: Verify that odd panning in horizontal direction for planar format
+ * Driver requirement: i915, xe
+ * Functionality: plane, panning
+ * Mega feature: General Display Features
+ * Test category: functionality test
+ */
+
 /*
  * Throw away enough lsbs in pixel formats tests
  * to get a match despite some differences between
@@ -100,6 +109,9 @@
 #define CRTC_RESTRICT_CNT	2
 #define SIM_CRTC_RESTRICT_CNT	1
 
+#define PLANE_WIDTH 810
+#define PLANE_HEIGHT 590
+
 typedef struct {
 	float red;
 	float green;
@@ -1330,6 +1342,92 @@ static bool is_pipe_limit_reached(int count)
 		return count >= CRTC_RESTRICT_CNT && !all_pipes;
 }
 
+static void
+prepare_planes_panning(igt_display_t *display, const enum pipe pipe_id,
+	       igt_output_t *output)
+{
+	igt_plane_t *primary;
+	struct igt_fb primary_fb_1, primary_fb_2;
+	unsigned int fb_id_1, fb_id_2;
+	int j = 0, ret;
+
+	igt_output_set_pipe(output, pipe_id);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_info("plane-%d does not supports NV12 format and Linear modifier\n",
+			primary->index);
+		return;
+	}
+
+	fb_id_1 = igt_create_pattern_fb(display->drm_fd,
+					800, 590,
+					DRM_FORMAT_NV12,
+					DRM_FORMAT_MOD_LINEAR,
+					&primary_fb_1);
+
+	fb_id_2 = igt_create_pattern_fb(display->drm_fd,
+					800, 590,
+					DRM_FORMAT_NV12,
+					DRM_FORMAT_MOD_LINEAR,
+					&primary_fb_2);
+
+	igt_assert(fb_id_1);
+	igt_assert(fb_id_2);
+
+	igt_plane_set_fb(primary, &primary_fb_1);
+
+	igt_plane_set_size(primary, PLANE_WIDTH, PLANE_HEIGHT);
+	igt_plane_set_position(primary, -501, 200);
+
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	do {
+		if (j % 2 == 0) {
+			igt_plane_set_fb(primary, &primary_fb_1);
+			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
+			ret = igt_display_try_commit_atomic(display, 0, NULL);
+		} else {
+			igt_plane_set_fb(primary, &primary_fb_2);
+			igt_plane_set_size(primary, PLANE_WIDTH - j, PLANE_HEIGHT);
+			ret = igt_display_try_commit_atomic(display, 0, NULL);
+		}
+		j++;
+	} while (j < 20);
+
+	igt_assert_eq(ret, -22);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_try_commit2(display, COMMIT_ATOMIC);
+
+	igt_remove_fb(display->drm_fd, &primary_fb_1);
+	igt_remove_fb(display->drm_fd, &primary_fb_2);
+}
+
+static void run_test_odd_pan(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	enum pipe pipe;
+	igt_output_t *output;
+
+	for_each_pipe_with_valid_output(display, pipe, output) {
+		igt_display_reset(display);
+
+		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(display))
+			continue;
+
+		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output))
+			prepare_planes_panning(display, pipe, output);
+
+		if (pipe == 0)
+			break;
+	}
+}
+
 static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 {
 	enum pipe pipe;
@@ -1408,6 +1506,10 @@ run_tests_for_pipe_plane(data_t *data)
 		run_test(data, dynamic_test_handler);
 	}
 
+	igt_describe("verify whether odd panning is supported or not");
+	igt_subtest_with_dynamic("odd-panning")
+		run_test_odd_pan(data);
+
 	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
 	igt_subtest_f("planar-pixel-format-settings")
 		test_planar_settings(data);
-- 
2.25.1

