Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F75C3DA59
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jul 2024 07:41:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BF210E3B2;
	Mon, 22 Jul 2024 07:41:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWup6xTp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DEA10E3B2
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jul 2024 07:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721634057; x=1753170057;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LYIHFUaoxzQ13hbspadAlTmiKpgn9HmMYQIbecHlSxM=;
 b=dWup6xTpIVnoD8Y3eaDo9DLyblRMFitMgpHcFDsT7++7qn+PsCTwN58k
 yKADXRCPZ4u4CcZgNTyl+c6UeEXozoX3s0t2bx4NV3EBgwyZo3IGM9Ycc
 BZug0i7vhzlf6kYKajLE2xyad2wcDnnSXwWWpPCNT4EbBmSq3oL1PFQ+q
 yNElBTi1fzL6OIsfLnxGssXgZRK/DRkgKzDIlUPYFZUcF+RwtlEcVAz3S
 gMnSmAeVRRf0Sn7rj6SzqzVQqj92IM/O6nJw6y8QSLYUc5BjAWzDP2F3L
 fygjlgIaKPLls00LKZcK3fXaQRwPfHSr/tk3V9pPwKczJaT7DDL0aQu8G g==;
X-CSE-ConnectionGUID: 7KWV9gXOQ26aH4llsQuHBw==
X-CSE-MsgGUID: ez5FSWJkTw2rSFPc+s6PHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22996006"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="22996006"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 00:40:57 -0700
X-CSE-ConnectionGUID: fQcWWAc3ScWvBKmN5QnyZQ==
X-CSE-MsgGUID: lnpZsTBfS9i7yUIDnOJ69A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; d="scan'208";a="52066085"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2024 00:40:53 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, animesh.manna@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
Date: Mon, 22 Jul 2024 13:20:48 +0530
Message-Id: <20240722075048.2616411-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240722075048.2616411-1-jeevan.b@intel.com>
References: <20240722075048.2616411-1-jeevan.b@intel.com>
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

Validate pseudo static refresh rate changes in the VRR with
fixed refresh rate framework for non-psr scenarios.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7e8885f16..a79819303 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -31,12 +31,18 @@
  */
 
 #include "igt.h"
+#include "igt_psr.h"
 #include "i915/intel_drrs.h"
 #include "sw_sync.h"
 #include <fcntl.h>
 #include <signal.h>
 
 /**
+ * SUBTEST: lobf
+ * Description: Test to validate link-off between active frames in non-psr
+ *              operation
+ * Functionality: LOBF
+ *
  * SUBTEST: cmrr
  * Description: Test to validate the content rate to exactly match with the
  * 		requested rate without any frame drops.
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
@@ -784,6 +792,43 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
+static void
+test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	bool change_mode = false;
+	time_t startTime = time(NULL);
+	time_t secs = 4, change_time = 3;
+	igt_plane_t *primary;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+
+	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
+
+	igt_require(output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP);
+	igt_require(!igt_get_i915_edp_lobf_status(data->drm_fd, output->name));
+	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL))
+		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+			    1, 1, 1, &data->fb[0]);
+
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+
+	while (time(NULL) - startTime < secs) {
+		igt_plane_set_fb(primary, &data->fb[0]);
+		igt_display_commit(&data->display);
+		if (!change_mode && time(NULL) - startTime >= change_time) {
+			igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
+			change_time = true;
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
@@ -973,6 +1018,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
+		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);
 
 		kmstest_set_vt_graphics_mode();
 
@@ -1030,13 +1076,20 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
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

