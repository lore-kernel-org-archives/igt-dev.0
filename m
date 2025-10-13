Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C10CCD183
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F6F10E536;
	Mon, 13 Oct 2025 20:30:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5x+h84F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351D410E535
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387450; x=1791923450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w6B0yLvV1xeTl2U1x6EzFq1LuJFdeXBbp4R1QjlvmjM=;
 b=L5x+h84FV/dsIMP4XnvZZN0PQARoWZ1JIRqnvRVxWvQEWctUPRYLCFkk
 fXS/0zcKDxAf/ltnEyL0W/2Xx27KYNyycGYhpnfOBDaYFInsT8zT/THNr
 pKTqj7VB9g7wBf/91n0D9JuFpewBCP576+76evXhvDqH06qzr80MX/vj3
 1Ek4qVWzOF7dX1lQyTmydGs+vRzG5r7twD4sbKNoi307AXrPEAiCv6RJe
 dM5ZP87xr03vMzHjKW1McfwR9uKRBv4XRveOpTvb5tsPx3ccF9Xtz1yeR
 EV/TPKdyv7bslxpN3oCTQ4b/43WzhjPwrR6GrZbqawAl62OqJtVO+MgdN w==;
X-CSE-ConnectionGUID: akrVUtY4TH286ClxAh0Q6A==
X-CSE-MsgGUID: aA0fovcbSX6ymY+WtE3lIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641938"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641938"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: QgUJyI4ZQrm8PC4AwCEUDQ==
X-CSE-MsgGUID: BCeF8CuLSvuEqB9ttMZn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924038"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 11/18] tests/intel/xe_oa: Convert test_mi_rpc to take an
 OA unit argument
Date: Mon, 13 Oct 2025 13:30:34 -0700
Message-ID: <20251013203042.925115-12-ashutosh.dixit@intel.com>
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

Convert test_mi_rpc to take 'struct drm_xe_oa_unit *' argument, to enable
it to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 3f9743a90b..62c2c4d709 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3004,15 +3004,16 @@ test_disabled_read_error(void)
  * Description: Test OAR/OAC using MI_REPORT_PERF_COUNT
  */
 static void
-test_mi_rpc(struct drm_xe_engine_class_instance *hwe)
+test_mi_rpc(struct drm_xe_oa_unit *oau)
 
 {
+	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t fmt = ((IS_DG2(devid) || IS_METEORLAKE(devid)) &&
 			hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) ?
 		XE_OAC_FORMAT_A24u64_B8_C8 : oar_unit_default_format();
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 		/* On Gen12, MI RPC uses OAR. OAR is configured only for the
 		 * render context that wants to measure the performance. Hence a
@@ -5187,8 +5188,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 	igt_subtest_group {
 		igt_subtest_with_dynamic("mi-rpc")
-			__for_one_hwe_in_oag(hwe)
-				test_mi_rpc(hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mi_rpc(oau);
 
 		igt_subtest_with_dynamic("oa-tlb-invalidate") {
 			igt_require(intel_graphics_ver(devid) <= IP_VER(12, 70) &&
-- 
2.48.1

