Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA48CC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 11:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8260910E137;
	Wed, 31 Jul 2024 11:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QfYeum0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C294210E137
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 11:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722426691; x=1753962691;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jCHnyvxl51oeE1vJ7kypNuCGUwpwifw/3U+gObito2g=;
 b=QfYeum0f498GMa3RaRe8KhhX6NeHvZa64izowgNpvRcZv9h+sBj3gHEG
 Pf3H1St7YQrwDV/48sgMnJWIcKCcSph8b4YfZ1cEpVCCzrPVLD8f4I097
 bVntUTlhCMPoSxOyxnTeUVVr/ycZC37byEqPwuVN5wXyyuibq3p7Lt4Ve
 2mo86L725+8oi8Vbzkj/om+lDmG/GpA4qtqcqDLJfHFLrbA3o+mK1HIAG
 8aJxJo4yf4SBG/DorbzJT0FgzenhYfC7Y1+fK9C+RVf+1UWZB/I3HRMpK
 qp/ExiUyCQL9BxSsDotbF6fR8flGjQFcf7+ztntvf2r6OPCJ2beiN98yP A==;
X-CSE-ConnectionGUID: uMUq7qvBS4yZgJKfOY6JdQ==
X-CSE-MsgGUID: y3LFBS0FQ4+o5E8gVpv73g==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30925562"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30925562"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:51:31 -0700
X-CSE-ConnectionGUID: 6UpyqrVLRS22J3KPfeM+BQ==
X-CSE-MsgGUID: OJM5EdQuQQm+in2eujSaag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="77932522"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 04:51:30 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
Date: Wed, 31 Jul 2024 17:32:15 +0530
Message-Id: <20240731120215.2946412-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731120215.2946412-1-jeevan.b@intel.com>
References: <20240731120215.2946412-1-jeevan.b@intel.com>
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

v2: add PR check.
v3: update commit message and fix code structure.
v4: update logic using existing code.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7e8885f16..851b8bbee 100644
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
@@ -784,6 +792,27 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
+static void
+test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint64_t rate[] = {0};
+
+	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+	prepare_test(data, output, pipe);
+	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
+
+	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
+		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
+
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
+	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
+	rate[0] = rate_from_refresh(data->switch_modes[LOW_RR_MODE].vrefresh);
+	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
+	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
+		     "LOBF not enabled\n");
+}
+
 static void
 test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
@@ -843,6 +872,8 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
+	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
+
 	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
 	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 		return false;
@@ -852,6 +883,20 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		igt_info("Selected panel won't support DRRS.\n");
 		return false;
 	}
+	if ((flags & TEST_LINK_OFF) &&
+	     output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return false;
+
+	if ((flags & TEST_LINK_OFF) &&
+	    (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
+	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL)))
+		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+
+	if ((flags & TEST_LINK_OFF) &&
+		igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
+		igt_info("LOBF not supported. \n");
+		return false;
+	}
 
 	/* Reset output */
 	igt_display_reset(&data->display);
@@ -1030,13 +1075,21 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
 			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 
-		igt_describe("Test to validate the the content rate exactly match with the "
+		igt_describe("Test to validate the content rate exactly match with the "
 			     "requested rate without any frame drops.");
 		igt_subtest_with_dynamic("cmrr") {
 			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
 
 			run_vrr_test(&data, test_cmrr, TEST_CMRR);
 		}
+
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

