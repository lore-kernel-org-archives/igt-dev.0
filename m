Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C13C3DA64
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 14:56:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC9310E64B;
	Wed, 31 Jul 2024 14:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iP5qOqv+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7E10E64B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jul 2024 14:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722437818; x=1753973818;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eX0vsBC0btN9WMipugRMX6wFts6991UJknJS80vLNq0=;
 b=iP5qOqv+14/1uMu8pGd9prtdo5wcFajo/UJgGAyIHSi6GaXZ9l04QMFb
 jDKejcy5CJgqVrtyYmY0gZ7dPuoctM5KghKrCVj4qlei7bSVX9YuxSPI2
 0XvZJZNQOS6e9xJqW82zMgSH0RoXlyUDDYZAkbh+7S30qpZ6jsJCFIGFQ
 wqxnnFGakEJRB5L41BzX6hwtEn66O774oP9guIugZmKX48gCmwH3kA8iE
 QxDb9KkaxCVu8WnIR1ktAonG8aX7Io8814CWNiALPFikv8rLKDrYZ0NTq
 NBBMXOnKuTlJOkShiMNPtYF7l6jNOlChRrLgueglLAO385Ocld+v1tdIC g==;
X-CSE-ConnectionGUID: 73z7K3btRsKJ05l07A5ZIA==
X-CSE-MsgGUID: 80kXvLaST3SQnARH0G0P+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37839429"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="37839429"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:56:57 -0700
X-CSE-ConnectionGUID: orSAbHoWQFWx5mU97VUnug==
X-CSE-MsgGUID: baEoeK1ASs6ekaxJnyVyWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="54635788"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 07:56:56 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_vrr: Add new test to validate LOBF
Date: Wed, 31 Jul 2024 20:37:40 +0530
Message-Id: <20240731150741.2952335-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731150741.2952335-1-jeevan.b@intel.com>
References: <20240731150741.2952335-1-jeevan.b@intel.com>
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
v5: combine output constraints condition and minor fixes.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_vrr.c | 59 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7e8885f16..9ddb56cbc 100644
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
@@ -784,6 +792,31 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
+/* FIXME: test_lobf : Lobf can be enabled when
+ * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
+ * one the depends patches are merged please fix this function.
+ */
+
+static void
+test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint64_t rate[] = {0};
+
+	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+	prepare_test(data, output, pipe);
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
@@ -843,7 +876,9 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
 {
-	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR)) &&
+	data->debugfs_fd = igt_debugfs_dir(data->drm_fd);
+
+	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_CMRR | TEST_LINK_OFF)) &&
 	    output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
 		return false;
 
@@ -853,6 +888,17 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		return false;
 	}
 
+	if (flags & TEST_LINK_OFF) {
+		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
+		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
+			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
+
+		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
+			igt_info("LOBF not supported. \n");
+			return false;
+		}
+	}
+
 	/* Reset output */
 	igt_display_reset(&data->display);
 
@@ -881,6 +927,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 
 	data->range.min = data->switch_modes[LOW_RR_MODE].vrefresh;
 
+	close(data->debugfs_fd);
 	return true;
 }
 
@@ -1037,6 +1084,14 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 
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

