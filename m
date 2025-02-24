Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A99C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 14:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76C1410E3C1;
	Mon, 24 Feb 2025 14:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FFUCLkYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C44A10E3C1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 14:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740408072; x=1771944072;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=20irlWmOl8/BotziBLOrD9GSA3L5kUY32HthRK5W1o4=;
 b=FFUCLkYp9yOpwg1CuNEY6pmtPId0Jt1PqU/61jD7ObKeggSa5riycIDy
 EH9vJNgNUB3ytpL16FBGnFQv57sR7Xk8dlFWZBLBzhVOZ60GurRRvFv53
 YvoKtjOpztbHMRxhDoqXlhkdKLnYo5xh/PVluSpZqp5uW0foz5zVEWrNJ
 /4nj9kazHJkYCO+A6A++TW1MKexIT2qbbNDTDWJqlae19XxB0KDyEt1BE
 3L+3Y2zJNWdyQ/tAaIeIALD5mNMXgbjbA2qNnJXNaGM5Y9PPqch8NfnjL
 ITKR8UZO+qDk2iRF3MTdW1sAVyQv7PXXRZLXJptbki2+xXUBbs6gOrdzp w==;
X-CSE-ConnectionGUID: qfgNj33jSqa3BXZlJgAavA==
X-CSE-MsgGUID: PW5bebEeSSuCTq9/kyS5/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58711493"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; d="scan'208";a="58711493"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 06:41:06 -0800
X-CSE-ConnectionGUID: vDyktd22SYqrC+dgheZb0A==
X-CSE-MsgGUID: d3tUhRtIRP683zpNWR8y7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120200556"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2025 06:41:05 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_plane: Add test to validate odd panning
Date: Mon, 24 Feb 2025 20:07:07 +0530
Message-Id: <20250224143707.2594265-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_plane.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index b9bf025bd..8490cfabc 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -88,6 +88,15 @@
  * @format-source-clamping:          with source clamping
  */
 
+/**
+ * SUBTEST: odd-panning
+ * Description: Verify that odd panning in horizontal direction for planar format
+ * Driver requirement: i915, xe
+ * Functionality: kms_odd_pan
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
@@ -121,6 +133,8 @@ typedef struct {
 	uint32_t crop;
 	bool extended;
 	unsigned int flags;
+	igt_plane_t **plane;
+	struct igt_fb *fb;
 } data_t;
 
 static bool all_pipes;
@@ -1330,6 +1344,91 @@ static bool is_pipe_limit_reached(int count)
 		return count >= CRTC_RESTRICT_CNT && !all_pipes;
 }
 
+static void
+prepare_planes(igt_display_t *display, const enum pipe pipe_id,
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
+static void run_test_pan(igt_display_t *display, const enum pipe pipe_id,
+			 igt_output_t *output)
+{
+	prepare_planes(display, pipe_id, output);
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
+			run_test_pan(display, pipe, output);
+
+		if (pipe == 0)
+			break;
+	}
+}
+
 static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 {
 	enum pipe pipe;
@@ -1408,6 +1507,10 @@ run_tests_for_pipe_plane(data_t *data)
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

