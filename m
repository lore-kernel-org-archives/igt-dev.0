Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AB7C282C6
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 13:48:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FBA10E319;
	Tue,  4 Mar 2025 13:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AgQ3vxaj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED5B10E319
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 13:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741096095; x=1772632095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g3iAXiK2k1aTX3sM7zsvI1RSIO6Sss06rqoS3MnO/SI=;
 b=AgQ3vxajvUfpO0GbEF82JutBrsIxeK7KgWZS6zwhSox3BHSrQT2mjygC
 GO95s/rSr4Fb/XGKunbBJaCPOBzCq2YwBIh+YZvd4OATApWvoazW8wCH8
 9bqa/F4AGbt1DchUIA8yuk5jAekEpLABtOLzjwIxNe1z+NJ5WyulR2xbI
 3yi7ZEkQ2ICoAJxWVNk2gogQXRe2sQMEv2oDjYxN4xyHxODEp8keU12xI
 yLgMACAFwXcb6/r+i96KLGV0pIStUoUuMilbubfPI4KXgtDhnT+ojjrVx
 YGg5mMmrA4OnUvEcuCzNbQHGRFGe2ctJ6UbB/74Wsy7vj9GciKkt4ay99 g==;
X-CSE-ConnectionGUID: 1fBi3TqeREGbwkKkreuRUg==
X-CSE-MsgGUID: +jDSeuHwQwO+lLE45yUi/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41909917"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41909917"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 05:48:10 -0800
X-CSE-ConnectionGUID: UNvl1VceR7yDsuGZxFiBLg==
X-CSE-MsgGUID: ctPBF2aCQeilp2ops86McA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123571243"
Received: from nemesa.iind.intel.com ([10.190.239.22])
 by orviesa005.jf.intel.com with ESMTP; 04 Mar 2025 05:48:09 -0800
From: Nemesa Garg <nemesa.garg@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t v3] tests/kms_plane: Add test to validate odd panning
Date: Tue,  4 Mar 2025 19:13:58 +0530
Message-Id: <20250304134358.333765-1-nemesa.garg@intel.com>
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

Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/kms_plane.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index b9bf025bd..95d98cc46 100644
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
@@ -1330,6 +1342,85 @@ static bool is_pipe_limit_reached(int count)
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
@@ -1408,6 +1499,10 @@ run_tests_for_pipe_plane(data_t *data)
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

