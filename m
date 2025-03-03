Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72252C282D6
	for <igt-dev@archiver.kernel.org>; Mon,  3 Mar 2025 23:15:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239DE10E4E1;
	Mon,  3 Mar 2025 23:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcyqGi61";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264FB10E0A0
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Mar 2025 23:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741043707; x=1772579707;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=H0OlVSyjjFAcCZtrGAivIp/siMs/gSO6XhG+goLifQw=;
 b=mcyqGi61foDaN+7Pz/VstotmDtXJu01YqHm8OPhG3SUfmb0Wslzv/Fse
 +2vvGOFJlqky4LSFkvBfF5k432NzC4alCt8jPT4dmad0t/nlPao7NIPxs
 u9NhzTpt1/N1tI/njGYvO3GkpmHHHCVw3hlIZf2Ax7civODxSclkzYtSN
 drkKO+itp14S2JMeMzmrCVIN38vhKcBAxBNw1umqWZgl+VLslyCi91xEI
 As9BSiavXN3fhMyjf5IQZjVWj336aKyHXWn/BNRbG3s6IxP7bsDZ4Oxdp
 wto8papietyG2XMm4VCLFqaqClh6H6x/E7uSWya6ILL+m2u419C93LIps A==;
X-CSE-ConnectionGUID: qjB0agcORF299MBYC+0GCQ==
X-CSE-MsgGUID: hZtU8O8KQOycYvzfTa9Y8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41793040"
X-IronPort-AV: E=Sophos;i="6.13,330,1732608000"; d="scan'208";a="41793040"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
X-CSE-ConnectionGUID: gBa2KjsHRqqeH4o2eRq+TQ==
X-CSE-MsgGUID: dDRmZ4tlScmILsDtMhlxqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118716687"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2025 15:15:07 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 04/14] tests/intel/xe_oa: Rename oa_exp_1_millisec to
 oa_exponent_default
Date: Mon,  3 Mar 2025 15:14:52 -0800
Message-Id: <20250303231502.135720-5-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
References: <20250303231502.135720-1-umesh.nerlige.ramappa@intel.com>
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

On slower platforms, the idea is to set the default oa_exponent to a
smaller value so that test execution is faster. Rename the global
exponent to default so it can be set to platform-specific value.

v2: Add more detail in commit message (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index b15958de6..eddd91939 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -299,7 +299,7 @@ static uint32_t devid;
 static struct drm_xe_engine_class_instance default_hwe;
 
 static struct intel_xe_perf *intel_xe_perf;
-static uint64_t oa_exp_1_millisec;
+static uint64_t oa_exponent_default;
 static size_t default_oa_buffer_size;
 static struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
@@ -514,7 +514,7 @@ static size_t get_default_oa_buffer_size(int fd)
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -1089,7 +1089,7 @@ init_sys_info(void)
 
 	intel_xe_perf_load_perf_configs(intel_xe_perf, drm_fd);
 
-	oa_exp_1_millisec = max_oa_exponent_for_period_lte(1000000);
+	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
 
 	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
 	igt_debug("default_oa_buffer_size: %zu\n", default_oa_buffer_size);
@@ -1114,7 +1114,7 @@ static void test_system_wide_paranoid(void)
 			/* OA unit configuration */
 			DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		};
 		struct intel_xe_oa_open_prop param = {
 			.num_properties = ARRAY_SIZE(properties) / 2,
@@ -1140,7 +1140,7 @@ static void test_system_wide_paranoid(void)
 			/* OA unit configuration */
 			DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 			DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+			DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		};
 		struct intel_xe_oa_open_prop param = {
 			.num_properties = ARRAY_SIZE(properties) / 2,
@@ -1174,7 +1174,7 @@ static void test_invalid_oa_metric_set_id(void)
 
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, UINT64_MAX,
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -1211,7 +1211,7 @@ static void test_invalid_oa_format_id(void)
 
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, UINT64_MAX, /* No __ff() here */
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -1246,7 +1246,7 @@ static void test_missing_sample_flags(void)
 
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -1536,7 +1536,7 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 		igt_debug("Checking OA format %s\n", format.name);
 
 		open_and_read_2_oa_reports(i,
-					   oa_exp_1_millisec,
+					   oa_exponent_default,
 					   oa_report0,
 					   oa_report1,
 					   false, /* timer reports only */
@@ -3420,7 +3420,7 @@ test_rc6_disable(void)
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -3648,7 +3648,7 @@ test_create_destroy_userspace_config(void)
 		/* OA unit configuration */
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET
 	};
@@ -3948,7 +3948,7 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = sizeof(properties) / 16,
@@ -4154,7 +4154,7 @@ test_oa_unit_exclusive_stream(bool exponent)
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, 0,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(0),
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, 0,
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -4216,7 +4216,7 @@ test_oa_unit_exclusive_stream(bool exponent)
 		properties[7] = __ff(test_set->perf_oa_format);
 		properties[9] = hwe->engine_instance;
 		properties[10] = DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT;
-		properties[11] = oa_exp_1_millisec;
+		properties[11] = oa_exponent_default;
 		intel_xe_perf_ioctl_err(drm_fd, DRM_XE_OBSERVATION_OP_STREAM_OPEN, &param, EBUSY);
 
 		/* case 2: concurrent access to non-OAG unit should fail */
@@ -4374,7 +4374,7 @@ static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instanc
 static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 					   const struct drm_xe_engine_class_instance *hwe)
 {
-	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+	uint32_t period_us = oa_exponent_to_ns(oa_exponent_default) / 1000;
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t fmt = test_set->perf_oa_format;
 	uint32_t num_periodic_reports = 0;
@@ -4440,7 +4440,7 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
 		.num_properties = ARRAY_SIZE(properties) / 2,
@@ -4487,7 +4487,7 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
-		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
 	};
 	struct intel_xe_oa_open_prop param = {
-- 
2.34.1

