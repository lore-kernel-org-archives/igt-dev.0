Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD08CCD18F
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FB810E53B;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQYC5p0B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EF110E534
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387449; x=1791923449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mMNy7f5w6UFsa9Vy/y0ElblGJVHrACJvwRy4ewHX/WM=;
 b=ZQYC5p0BnMI4CbI/AhcwHjpzdHKqrQWv5xcK87YeZxpDnDD2EqNmD0vf
 5ZdkmSvZpsf8jurV9YoZ0Hw+u6Thk4Vc6A3QQbzKHEGv73btuIeGqQICc
 Luhr6N0c2aYXfyuN5SGu/zFTqo/Me/s6lF/ElzoqE012Zgtsq/7k206Sw
 Dto+cBiDay8bPMKOlkkcCfeFegicObRLY0rItDU0NsQfZwBHEBGTEUkPO
 01vL0zqwS/g1WdpOZyGDL15o39gRC+RHg/h3x6G0NsshlMvgPOSI796FX
 6UjAYn/4fbkauRF9goY+/fl9CMglmYzkdlHW8GdGBVt+qEyP5z2frVeBI g==;
X-CSE-ConnectionGUID: j5jNODvQRAOaIiFE+YL0MQ==
X-CSE-MsgGUID: bubm+p8TSBuBOu+P2At+Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641934"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641934"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: TMy9DJsDT1iwZckgoe1+NA==
X-CSE-MsgGUID: dzIk6kkoSUit+D6qn1h6AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924026"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 07/18] tests/intel/xe_oa: Convert test_oa_formats to
 take an OA unit argument
Date: Mon, 13 Oct 2025 13:30:30 -0700
Message-ID: <20251013203042.925115-8-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013203042.925115-1-ashutosh.dixit@intel.com>
References: <20251013203042.925115-1-ashutosh.dixit@intel.com>
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

To enable OA IGT's to run on all OA units, OA unit tests are converted to
take a 'struct drm_xe_oa_unit *' argument (instead of hwe). This patch
converts the first unit test (test_oa_formats), so it introduces this new
infrastructure.

OA units are now identified via a name (corresponding to OA unit type) and
id. OA units are longer identified by hwe, because some OA units have no
associated hwe's.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 92 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 71 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 8e73182700..22cc4e8b9b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -327,8 +327,6 @@ static int pm_fd = -1;
 static int stream_fd = -1;
 static uint32_t devid;
 
-static struct drm_xe_engine_class_instance default_hwe;
-
 static struct intel_xe_perf *intel_xe_perf;
 static uint64_t oa_exponent_default;
 static size_t default_oa_buffer_size;
@@ -340,6 +338,54 @@ static uint32_t min_oa_exponent;
 static uint32_t buffer_fill_size;
 static uint32_t num_buf_sizes;
 
+/* OA unit names */
+static const char *oa_unit_name[] = {
+	[DRM_XE_OA_UNIT_TYPE_OAG] = "oag",
+	[DRM_XE_OA_UNIT_TYPE_OAM] = "oam",
+	[DRM_XE_OA_UNIT_TYPE_OAM_SAG] = "sag",
+};
+
+static struct intel_xe_perf_metric_set *oa_unit_metric_set(struct drm_xe_oa_unit *oau)
+{
+	const char *test_set_name = NULL;
+	struct intel_xe_perf_metric_set *metric_set_iter;
+	struct intel_xe_perf_metric_set *test_set = NULL;
+
+	if (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG)
+		test_set_name = "TestOa";
+	else if (HAS_OAM(devid) &&
+		 (oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM ||
+		  oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
+		test_set_name = "MediaSet1";
+	else
+		igt_assert(!"reached");
+
+	igt_list_for_each_entry(metric_set_iter, &intel_xe_perf->metric_sets, link) {
+		if (strcmp(metric_set_iter->symbol_name, test_set_name) == 0) {
+			test_set = metric_set_iter;
+			break;
+		}
+	}
+
+	igt_assert(test_set);
+
+	/*
+	 * configuration was loaded in init_sys_info() ->
+	 * intel_xe_perf_load_perf_configs(), and test_set->perf_oa_metrics_set
+	 * should point to metric id returned by the config add ioctl. 0 is
+	 * invalid.
+	 */
+	igt_assert_neq_u64(test_set->perf_oa_metrics_set, 0);
+
+	igt_debug("oa_unit %d:%d - %s metric set UUID = %s\n",
+		  oau->oa_unit_id,
+		  oau->oa_unit_type,
+		  test_set->symbol_name,
+		  test_set->hw_config_guid);
+
+	return test_set;
+}
+
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
 	const char *test_set_name = NULL;
@@ -381,7 +427,7 @@ static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_cl
 
 	return test_set;
 }
-#define default_test_set metric_set(&default_hwe)
+#define default_test_set oa_unit_metric_set(oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAG))
 
 static void set_fd_flags(int fd, int flags)
 {
@@ -1558,11 +1604,11 @@ open_and_read_2_oa_reports(int format_id,
 			   uint32_t *oa_report0,
 			   uint32_t *oa_report1,
 			   bool timer_only,
-			   const struct drm_xe_engine_class_instance *hwe)
+			   struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 		/* Include OA reports in samples */
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -1682,32 +1728,28 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 }
 
 static bool
-hwe_supports_oa_type(int oa_type, const struct drm_xe_engine_class_instance *hwe)
+oau_supports_oa_type(int oa_type, struct drm_xe_oa_unit *oau)
 {
 	switch (oa_type) {
 	case DRM_XE_OA_FMT_TYPE_OAM:
 	case DRM_XE_OA_FMT_TYPE_OAM_MPEC:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
-		       hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
+		return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM ||
+		       oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM_SAG;
 	case DRM_XE_OA_FMT_TYPE_OAG:
 	case DRM_XE_OA_FMT_TYPE_OAR:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER;
 	case DRM_XE_OA_FMT_TYPE_OAC:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
 	case DRM_XE_OA_FMT_TYPE_PEC:
-		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
-		       hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
+		return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG;
 	default:
 		return false;
 	}
-
 }
 
 /**
  * SUBTEST: oa-formats
  * Description: Test that supported OA formats work as expected
  */
-static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
+static void test_oa_formats(struct drm_xe_oa_unit *oau)
 {
 	for (int i = 0; i < XE_OA_FORMAT_MAX; i++) {
 		struct oa_format format = get_oa_format(i);
@@ -1717,7 +1759,7 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 		if (!format.name) /* sparse, indexed by ID */
 			continue;
 
-		if (!hwe_supports_oa_type(format.oa_type, hwe))
+		if (!oau_supports_oa_type(format.oa_type, oau))
 			continue;
 
 		igt_debug("Checking OA format %s\n", format.name);
@@ -1727,13 +1769,13 @@ static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
 					   oa_report0,
 					   oa_report1,
 					   false, /* timer reports only */
-					   hwe);
+					   oau);
 
 		print_reports(oa_report0, oa_report1, i);
 		sanity_check_reports(oa_report0, oa_report1, i);
 
-		if (i == metric_set(hwe)->perf_oa_format)
-			pec_sanity_check_reports(oa_report0, oa_report1, metric_set(hwe));
+		if (i == oa_unit_metric_set(oau)->perf_oa_format)
+			pec_sanity_check_reports(oa_report0, oa_report1, oa_unit_metric_set(oau));
 	}
 }
 
@@ -4956,6 +4998,14 @@ static const char *xe_engine_class_name(uint32_t engine_class)
 	igt_require_f(hwe, "no render engine\n"); \
 	igt_dynamic_f("rcs-%d", hwe->engine_instance)
 
+#define __for_oa_unit_by_type(k) \
+	if ((oau = oa_unit_by_type(drm_fd, k))) \
+		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
+
+#define __for_oa_unit_by_type_w_arg(k, str) \
+	if ((oau = oa_unit_by_type(drm_fd, k))) \
+		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	uint32_t tmp;
@@ -5067,8 +5117,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		test_missing_sample_flags();
 
 	igt_subtest_with_dynamic("oa-formats")
-		__for_one_hwe_in_oag(hwe)
-			test_oa_formats(hwe);
+		__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			test_oa_formats(oau);
 
 	igt_subtest("invalid-oa-exponent")
 		test_invalid_oa_exponent();
-- 
2.48.1

