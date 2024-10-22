Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB08DD2CDF6
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 15:52:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609C710E6AA;
	Tue, 22 Oct 2024 15:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZkba2Ch";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9407410E1FE
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729612361; x=1761148361;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=7hFrRoHwmi417yMZ4UqxCaxqWe3738RNxzPJzsB/9zo=;
 b=AZkba2ChtJoKp+1yZfC6A5a53dsBLk8pKE1SJ1ZC+nr+w5h8Zm9RKSFs
 j/80QOBvGagltykN1YetssOWyzYLUlq8kcBAKNYtKIydY1zjHj/vgYCvY
 ZwKtlw6TzcATzBaU5JUURKBAAvqiJY591HKA6cvxk/yYG9kwkroRLpcP1
 nT5MHWTJsLsfTMGiBGNxGGsd9P/kJ0HIV1P7YssRR6Jd+gSwjiQRDI1Zp
 iTydg6LzJS5+CjQML2rRpOq2vzr/zvcj3iBs98bBzxj4bxj+zz88VkjdV
 twJXYlCTm+QYOPDXMdYronRPIMJjhts9RcUr460vUfCMSVqd4SymFz8zH A==;
X-CSE-ConnectionGUID: U5qfZOaDTzW6HGRBkZtDPQ==
X-CSE-MsgGUID: FiOMG3BrQ1i+YQ1oNhzqbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29268524"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29268524"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:41 -0700
X-CSE-ConnectionGUID: JXd250y/S8+Jy+Q8idmeUg==
X-CSE-MsgGUID: Qv6CAGtST1ORWHhAARjAMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80248396"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 08:52:40 -0700
From: Imre Deak <imre.deak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t 1/3] lib/igt_kms: Add igt_kms_frame_time_from_vrefresh()
Date: Tue, 22 Oct 2024 18:53:09 +0300
Message-ID: <20241022155311.2797257-2-imre.deak@intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20241022155311.2797257-1-imre.deak@intel.com>
References: <20241022155311.2797257-1-imre.deak@intel.com>
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

Export a helper originally added to kms_vrr.c to convert a vertical
refresh rate to frame time. Use uint32_t for the type of vrefresh
matching the type of drmModeModeInfo::vrefresh.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_kms.c   | 12 ++++++++++++
 lib/igt_kms.h   |  2 ++
 tests/kms_vrr.c | 37 +++++++++++++++++--------------------
 3 files changed, 31 insertions(+), 20 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bb35d4b82..99231d6e7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -52,6 +52,7 @@
 #include <i915_drm.h>
 
 #include "drmtest.h"
+#include "igt_core.h"
 #include "igt_kms.h"
 #include "igt_aux.h"
 #include "igt_edid.h"
@@ -254,6 +255,17 @@ const struct edid *igt_kms_get_alt_edid(void)
 	return &edid;
 }
 
+/**
+ * igt_kms_frame_time_from_vrefresh:
+ * @vrefresh: vertical refresh rate in 1/s units.
+ *
+ * Returns the frame time in nanoseconds for the given vrefresh rate.
+ */
+uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh)
+{
+	return vrefresh ? (NSEC_PER_SEC / vrefresh) : 0;
+}
+
 #define AUDIO_EDID_SIZE (2 * EDID_BLOCK_SIZE)
 
 static const struct edid *
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2b26d2bbf..fc7e4cda1 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -274,6 +274,8 @@ enum joined_pipes {
 	JOINED_PIPES_ULTRA_JOINER = 4
 };
 
+uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
+
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
 bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 36a22eebe..12d29aa82 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -192,12 +192,6 @@ static uint64_t get_time_ns(void)
 	return 0;
 }
 
-/* Returns the rate duration in nanoseconds for the given refresh rate. */
-static uint64_t rate_from_refresh(uint64_t refresh)
-{
-	return refresh ? (NSECS_PER_SEC / refresh) : 0;
-}
-
 /* Instead of running on default mode, loop through the connector modes
  * and find the mode with max refresh rate to exercise full vrr range.
  */
@@ -340,13 +334,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	mode = *igt_output_get_mode(output);
 
-	data->vtest_ns.min = rate_from_refresh(data->range.min);
-	data->vtest_ns.max = rate_from_refresh(data->range.max);
+	data->vtest_ns.min = igt_kms_frame_time_from_vrefresh(data->range.min);
+	data->vtest_ns.max = igt_kms_frame_time_from_vrefresh(data->range.max);
 
 	/* If unspecified on the command line, default rate to the midpoint */
 	if (data->vtest_ns.rate_ns == 0) {
 		range_t *range = &data->range;
-		data->vtest_ns.rate_ns = rate_from_refresh(
+		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(
 						(range->min + range->max) / 2);
 	}
 
@@ -533,8 +527,8 @@ flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe pipe,
 	uint32_t total_flip = 0, total_pass = 0;
 	bool front = false;
 	drmModeModeInfoPtr mode = igt_output_get_mode(output);
-	uint64_t req_rate_ns = rate_from_refresh(mode->vrefresh + VREFRESH_MODIFIER);
-	uint64_t exp_rate_ns = rate_from_refresh(mode->vrefresh);
+	uint64_t req_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh + VREFRESH_MODIFIER);
+	uint64_t exp_rate_ns = igt_kms_frame_time_from_vrefresh(mode->vrefresh);
 	uint64_t threshold_ns = exp_rate_ns / mode->vdisplay; /* Upto 1 scan line. */
 
 	igt_info("CMRR on: requested rate: %"PRIu64" ns (%.2f Hz) "
@@ -633,7 +627,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 *      next Vmin.
 	 */
 	if (flags & TEST_FLIPLINE) {
-		rate[0] = rate_from_refresh(range.max + 5);
+		rate[0] = igt_kms_frame_time_from_vrefresh(range.max + 5);
 		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
@@ -649,7 +643,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 
 	if (flags & TEST_FLIPLINE) {
-		rate[0] = rate_from_refresh(range.min - 10);
+		rate[0] = igt_kms_frame_time_from_vrefresh(range.min - 10);
 		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
@@ -660,7 +654,10 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 		unsigned int range_min =
 			/* For Intel h/w tweak the min rate, as h/w will terminate the vblank at Vmax. */
 			is_intel_device(data->drm_fd) ? (range.min + 2) : range.min;
-		uint64_t maxmin_rates[] = {vtest_ns.max, rate_from_refresh(range_min)};
+		uint64_t maxmin_rates[] = {
+			vtest_ns.max,
+			igt_kms_frame_time_from_vrefresh(range_min)
+		};
 
 		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
 		igt_assert_f(result > 75,
@@ -752,7 +749,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
 
 	prepare_test(data, output, pipe);
-	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 
 	/*
 	 * Sink with DRR and VRR can be in downclock mode so
@@ -784,7 +781,7 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 		igt_output_override_mode(output, &virtual_mode);
 		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
-		rate[0] = rate_from_refresh(vrefresh);
+		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
 		result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
@@ -802,7 +799,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
 	uint64_t rate[] = {0};
 
-	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
 	prepare_test(data, output, pipe);
 
 	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
@@ -811,7 +808,7 @@ test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
 	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
-	rate[0] = rate_from_refresh(data->switch_modes[LOW_RR_MODE].vrefresh);
+	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[LOW_RR_MODE].vrefresh);
 	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
 	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
 		     "LOBF not enabled\n");
@@ -857,7 +854,7 @@ test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	result = flip_and_measure_cmrr(data, output, pipe, TEST_DURATION_NS * 2);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on threshold not reached, result was %u%%\n",
-		     mode.vrefresh, rate_from_refresh(mode.vrefresh), result);
+		     mode.vrefresh, igt_kms_frame_time_from_vrefresh(mode.vrefresh), result);
 }
 
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
@@ -1006,7 +1003,7 @@ static int opt_handler(int opt, int opt_index, void *_data)
 		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
 		break;
 	case 'r':
-		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
+		data->vtest_ns.rate_ns = igt_kms_frame_time_from_vrefresh(atoi(optarg));
 		break;
 	case 's':
 		data->static_image = true;
-- 
2.44.2

