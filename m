Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBB48C3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 08:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9205910E251;
	Tue, 30 Jul 2024 08:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdCAAg93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB62C10E251
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 08:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722327634; x=1753863634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f17RG3Rgt83VSAPKY/7Jk5AfB2+8OZ4F0bJpkZpUiKo=;
 b=DdCAAg9342eVAOLz9ECZVDe0J28BqkF5bCH10gai2sAESxpCJD15Su9Z
 2A/BZVWPRgZU9e7/zHuUXF5qDNVfA+guehBAAQqQVLtvCtWyyz8sFiN4Y
 gmRWt5gFqZOlLwp5AfCswMeddtdIVJZ/1+KNzWMF0LmBlp1QM3409s8VY
 L7+rV/8ycNxPlI21g/P6HE4vhPVj4B1aV4ij4IcWSRnFRpFClDrK8bIcY
 krFafmCYqmB5IBM/RUo4t65Z8Yl0w+yqCE309/tQ47oMnfQZbZ3u/z99k
 BFgYTIzlapqVWt/Qn9/sDSrIo53KIytgQwRipTxgsZfp51jR0gPOr8lED w==;
X-CSE-ConnectionGUID: 3pxHfHi4Rs2PAi6CCNnpCg==
X-CSE-MsgGUID: DLaPyu9+T+iJ/eVoKYRcqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="23915376"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23915376"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:20:34 -0700
X-CSE-ConnectionGUID: moKFTKLtRWeGcPqY9eO+QQ==
X-CSE-MsgGUID: 50Oaf9UJThysIkF4h3fYNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54316374"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 01:20:32 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
Date: Tue, 30 Jul 2024 14:01:11 +0530
Message-Id: <20240730083111.2897557-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240730083111.2897557-1-jeevan.b@intel.com>
References: <20240730083111.2897557-1-jeevan.b@intel.com>
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

Validate refresh rate changes that appear to be stable but actually
change slightly in the VRR using the fixed refresh rate framework
for non-PSR scenarios.

v2: Add PR check.
v3: Update commit message and fix code structure.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7e8885f16..88855b01d 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -31,6 +31,7 @@
  */
 
 #include "igt.h"
+#include "igt_psr.h"
 #include "i915/intel_drrs.h"
 #include "sw_sync.h"
 #include <fcntl.h>
@@ -76,6 +77,11 @@
  * 		without a full modeset.
  * Functionality: LRR
  *
+ * SUBTEST: lobf
+ * Description: Test to validate link-off between active frames in non-psr
+ *              operation
+ * Functionality: LOBF
+ *
  * SUBTEST: max-min
  * Description: Oscillates between highest and lowest refresh each frame for
  *              manual flicker profiling
@@ -106,7 +112,8 @@ enum {
 	TEST_FASTSET = 1 << 7,
 	TEST_MAXMIN = 1 << 8,
 	TEST_CMRR = 1 << 9,
-	TEST_NEGATIVE = 1 << 10,
+	TEST_LINK_OFF = 1 << 10,
+	TEST_NEGATIVE = 1 << 11,
 };
 
 enum {
@@ -129,6 +136,7 @@ typedef struct vtest_ns {
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
+	int debugfs_fd;
 	igt_plane_t *primary;
 	igt_fb_t fb[2];
 	range_t range;
@@ -784,6 +792,45 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
+static void
+test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	bool change_mode = false, flip = true;
+	time_t startTime = time(NULL);
+	time_t secs = 4, change_time = 3;
+	igt_plane_t *primary;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+
+	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
+
+	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
+
+	igt_require(!igt_get_i915_edp_lobf_status(data->drm_fd, output->name));
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1, 1, 1, &data->fb[0]);
+	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1, 1, 0, &data->fb[1]);
+
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+
+	while (time(NULL) - startTime < secs) {
+		flip = !flip;
+		igt_plane_set_fb(primary, flip ? &data->fb[0] : &data->fb[1]);
+		igt_display_commit(&data->display);
+		if (!change_mode && time(NULL) - startTime >= change_time) {
+			igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
+			change_mode = true;
+		}
+	}
+
+	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
+		     "LOBF not enabled\n");
+}
+
 static void
 test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
@@ -851,6 +898,15 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	    !intel_output_has_drrs(data->drm_fd, output)) {
 		igt_info("Selected panel won't support DRRS.\n");
 		return false;
+
+	if ((flags & TEST_LINK_OFF) &&
+	     output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return false;
+
+	if ((flags & TEST_LINK_OFF) &&
+	    (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)))
+		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 	}
 
 	/* Reset output */
@@ -1030,13 +1086,20 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
-		igt_describe("Test to validate the the content rate exactly match with the "
+		igt_describe("Test to validate the content rate exactly match with the "
 			     "requested rate without any frame drops.");
 		igt_subtest_with_dynamic("cmrr") {
 			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
 
 			run_vrr_test(&data, test_cmrr, TEST_CMRR);
 		}
+		igt_describe("Test to validate the link-off between active frames in "
+			     "non-PSR operation.");
+		igt_subtest_with_dynamic("lobf") {
+			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
+
+			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

