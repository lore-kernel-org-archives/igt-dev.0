Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6A8CCD18C
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2143A10E8EB;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B7cc+6x8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C633810E8EA
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T05Hqhn6BxB/dEg21FhUbMuWyP6vYF2IW8zuSpcVjqY=;
 b=B7cc+6x890XAJvOtQBkWREWw7ppFOzvgK3EDb+FlhoWk+6PtDhruIPkI
 SrktHswsrjrYvT+N2c1rKoH8OZH7S+qI+eO2wNBTaona5JEJbI7WuMB0T
 R4V+GWzd6E1HBnJWkb91FpNLxrGxt6tI2jaMDZ4ekEnnN80N8vHGsq+OO
 IcRfywx3x0vFFowXSUHtSx2j0VrI9HprjNF+Z48D9LSnuk8ropFp5afMI
 fBRGwxz/6L+2f4q388NbvGJH1rOMEw3+64+5U0u1D9CLMbXkGsfb+13fF
 G+t8OkfgH7hhIPKkMf8zYPzCvWndx9ISBKutkd2Qq55CgUEKPVrrebv5D w==;
X-CSE-ConnectionGUID: vhxpoquaTLGtzedPGj55Kg==
X-CSE-MsgGUID: RnMYURSeTYmBeAyZx2vP0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989657"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989657"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
X-CSE-ConnectionGUID: Mtk7IuGyRLeBKfSHawTs2g==
X-CSE-MsgGUID: XU4SJf8CS0Wb9xANBLfU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805300"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 14/18] tests/intel/xe_oa: Convert MMIO trigger tests to
 take OA unit arguments
Date: Wed,  8 Oct 2025 14:18:01 -0700
Message-ID: <20251008211806.625154-15-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008211806.625154-1-ashutosh.dixit@intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
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

Convert MMIO trigger tests to take 'struct drm_xe_oa_unit *' arguments, to
enable them to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1b16893de3..a3f4a80d6a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3992,11 +3992,12 @@ static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
  * SUBTEST: oa-regs-whitelisted
  * Description: Verify that OA registers are whitelisted
  */
-static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hwe)
+static void test_oa_regs_whitelist(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4010,8 +4011,7 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
 	u32 mmio_base;
 
 	/* FIXME: Add support for OAM whitelist testing */
-	if (hwe->engine_class != DRM_XE_ENGINE_CLASS_RENDER &&
-	    hwe->engine_class != DRM_XE_ENGINE_CLASS_COMPUTE)
+	if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
 		return;
 
 	mmio_base = oa_get_mmio_base(hwe);
@@ -4039,10 +4039,12 @@ static void test_oa_regs_whitelist(const struct drm_xe_engine_class_instance *hw
 }
 
 static void
-__test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
+__test_mmio_triggered_reports(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = default_test_set;
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4144,10 +4146,12 @@ __test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe)
 }
 
 static void
-__test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
+__test_mmio_triggered_reports_read(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = default_test_set;
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4240,8 +4244,7 @@ __test_mmio_triggered_reports_read(struct drm_xe_engine_class_instance *hwe)
  * Description: Test MMIO trigger functionality with read system call
  */
 static void
-test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
-			    bool with_read)
+test_mmio_triggered_reports(struct drm_xe_oa_unit *oau, bool with_read)
 {
 	struct igt_helper_process child = {};
 	int ret;
@@ -4251,9 +4254,9 @@ test_mmio_triggered_reports(struct drm_xe_engine_class_instance *hwe,
 		igt_drop_root();
 
 		if (with_read)
-			__test_mmio_triggered_reports_read(hwe);
+			__test_mmio_triggered_reports_read(oau);
 		else
-			__test_mmio_triggered_reports(hwe);
+			__test_mmio_triggered_reports(oau);
 	}
 	ret = igt_wait_helper(&child);
 	write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
@@ -5275,19 +5278,19 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		}
 
 		igt_subtest_with_dynamic("oa-regs-whitelisted")
-			__for_one_hwe_in_oag(hwe)
-				test_oa_regs_whitelist(hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_oa_regs_whitelist(oau);
 
 		igt_subtest_with_dynamic("mmio-triggered-reports") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			__for_one_hwe_in_oag(hwe)
-				test_mmio_triggered_reports(hwe, false);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mmio_triggered_reports(oau, false);
 		}
 
 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			__for_one_hwe_in_oag(hwe)
-				test_mmio_triggered_reports(hwe, true);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mmio_triggered_reports(oau, true);
 		}
 	}
 
-- 
2.48.1

