Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA5CCD197
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973F310E541;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMuV1w3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 505E410E153
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387450; x=1791923450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LDsGZ5b5QuxIronpF1l9J81Eaief2ZpFJJ7qCc8nIUk=;
 b=EMuV1w3GyjGcHdqAhogAd0635ddzuCUMCuVQGnO7vwFbnnc9kqYFMFWK
 /KxuzJvA+wKrBUzzqM/ZYz9VCtjazkOEf4fjfaI9i/u7urpKWK0NN7jmk
 ZlvdTG8afaEuKthiKepQVXhq0TGHiZDxG7IX7xSW982Poj5nRrAZSQySe
 3l0izf+2hwAXAlwSj4ST5SKWgo6hMdJYzEazl1eu6wot3zRmBUZreyqEe
 hrSek4DeLd6mVoP1dkuDtwRCDh8rhrrPgxpgFUSC0aMmBzRGeRAVzVAPf
 YTyOxb+Cl89q9zYDhxaVG17FrT1pD5IEctrhgwToJ4bQ+z3CG3mQkgR87 A==;
X-CSE-ConnectionGUID: hvU+zAi1QF2k6MT4tVz1vQ==
X-CSE-MsgGUID: kV6GYS2kQvylL12h7Rca8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641939"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641939"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: tT3qJIFrS4+OJu9M6oRAog==
X-CSE-MsgGUID: x7gpYC4oTaej3elCZWsybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924041"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 12/18] tests/intel/xe_oa: Convert
 test_single_ctx_render_target_writes_a_counter
Date: Mon, 13 Oct 2025 13:30:35 -0700
Message-ID: <20251013203042.925115-13-ashutosh.dixit@intel.com>
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

Convert test_single_ctx_render_target_writes_a_counter to take 'struct
drm_xe_oa_unit *' argument, to enable it to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 62c2c4d709..cdc422d724 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3135,12 +3135,14 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
 	emit_report_perf_count(ibb, dst, report_dst_offset, report_id);
 }
 
-static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
+static void single_ctx_helper(struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
+	struct drm_xe_engine_class_instance *hwe =
+		&xe_find_engine_by_class(drm_fd, DRM_XE_ENGINE_CLASS_RENDER)->instance;
 	uint64_t fmt = oar_unit_default_format();
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 
 		/* Have a random value here for the context id, but initialize
 		 * it once you figure out the context ID for the work to be
@@ -3182,6 +3184,8 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	uint32_t ctx_id_offset, counter_offset, dst_buf_size;
 	struct oa_format format = get_oa_format(fmt);
 
+	igt_require_f(hwe, "no render engine\n");
+
 	if (format.report_hdr_64bit) {
 		ctx_id_offset = 4;
 		counter_offset = 8;
@@ -3439,7 +3443,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
  * Description: A harder test for OAR/OAC using MI_REPORT_PERF_COUNT
  */
 static void
-test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instance *hwe)
+test_single_ctx_render_target_writes_a_counter(struct drm_xe_oa_unit *oau)
 {
 	int child_ret;
 	struct igt_helper_process child = {};
@@ -3454,7 +3458,7 @@ test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instan
 
 			igt_drop_root();
 
-			single_ctx_helper(hwe);
+			single_ctx_helper(oau);
 
 			drm_close_driver(drm_fd);
 		}
@@ -5200,8 +5204,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 		igt_subtest_with_dynamic("unprivileged-single-ctx-counters") {
 			igt_require_f(render_copy, "no render-copy function\n");
-			__for_one_render_engine(hwe)
-				test_single_ctx_render_target_writes_a_counter(hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_single_ctx_render_target_writes_a_counter(oau);
 		}
 	}
 
-- 
2.48.1

