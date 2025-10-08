Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD53CCD18E
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C0F10E8EE;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O85y70Hr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A26D710E8E8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pJRuauCU469ngQTNvH25qc+t11GEahijsaumdSmFvmc=;
 b=O85y70Hrf3iNosTdmya7LWS1pPVTdbhtKlZxIEn3BoMvvAdqa6C0HX8z
 M9SBPMN4ugUP/OSampQqZrFsfaILSFCgWnqMkU1zOce4RuiDkZNTW2SMh
 ItHMMKcVGj0TfQlkqgJZ/inbaWmoZEpGsODJj3zleEJFqntQFNMw7w9h8
 dd+WiC96lVMuyWstdeLSLju8lFIzP6EbzolgOdkmER2sCSQTKOCRn3itB
 oeyCqfCHVw/mauFqCZphEMRY9hb0EBh1Ag4LuMR+g06eYrmyU3wi6veIV
 a892zO5aLHftqYtYZyHJItZwW+QoKw9jR935HI7IK2/VNa9ZDrkVObMQy Q==;
X-CSE-ConnectionGUID: XSIs8sIqSc6j/aFZ3U6SQQ==
X-CSE-MsgGUID: Ai2GfExhRW6Jrb3YCRXHmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989653"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989653"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: SC08QBKoTYOmZ0GiD4xqGw==
X-CSE-MsgGUID: UgML4BSMQ+qy9L9NJY9TGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805289"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 11/18] tests/intel/xe_oa: Convert test_mi_rpc to take an
 OA unit argument
Date: Wed,  8 Oct 2025 14:17:58 -0700
Message-ID: <20251008211806.625154-12-ashutosh.dixit@intel.com>
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

Convert test_mi_rpc to take 'struct drm_xe_oa_unit *' argument, to enable
it to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 739da370ef..efcac06e15 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2994,15 +2994,16 @@ test_disabled_read_error(void)
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
@@ -5177,8 +5178,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
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

