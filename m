Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1CA2CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2054410E8E9;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1KhDyM6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF8D10E8E7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958296; x=1791494296;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gE2mir0nlXrEoqre5NGwWwvBPWSNe4udIQyOXDAHhps=;
 b=G1KhDyM6FmYMLQNMfUvKIAbpDCIQeaxqduXG1gGqAuTNqrjuDzyWnHxa
 r55d7Zf696tR/RwSp22Nh/dnHRLMpw8u4uf+I37oZa5D+leD8z21YQZ/x
 soLuXipuwRYeom/gz0u6LTk9QLPT5m3KY+5aCqWmirKCb619vpEI9cdf6
 BJz2VI0GoCj33fvZxbqzirJ4ap1xiZXkRv1Qa13jSt+cu0GLpJEHKhh9n
 OJ5vimnZNIaOK9SXD+yJHBxeWrzBnDKhLO6749CaW/S6bkGiErZFQm9LR
 Ht1rrqSWzWB6KOaSeaHTkqyPKzm4/NGOXlXdPtdubGvZE2K/bZcZ/4LrC w==;
X-CSE-ConnectionGUID: sQbWHxCEQFSHOLdVGesrAQ==
X-CSE-MsgGUID: ym1iBnm+Rwan/qU9zcLg7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989654"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989654"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
X-CSE-ConnectionGUID: DVQkK0T3T6iobNmqMT2rZg==
X-CSE-MsgGUID: AxsbviX6ST2L4KxkIMSEuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805292"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:14 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 12/18] tests/intel/xe_oa: Convert
 test_single_ctx_render_target_writes_a_counter
Date: Wed,  8 Oct 2025 14:17:59 -0700
Message-ID: <20251008211806.625154-13-ashutosh.dixit@intel.com>
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

Convert test_single_ctx_render_target_writes_a_counter to take 'struct
drm_xe_oa_unit *' argument, to enable it to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index efcac06e15..01df791dc5 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -3125,12 +3125,14 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
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
@@ -3172,6 +3174,8 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
 	uint32_t ctx_id_offset, counter_offset, dst_buf_size;
 	struct oa_format format = get_oa_format(fmt);
 
+	igt_require_f(hwe, "no render engine\n");
+
 	if (format.report_hdr_64bit) {
 		ctx_id_offset = 4;
 		counter_offset = 8;
@@ -3429,7 +3433,7 @@ static void single_ctx_helper(struct drm_xe_engine_class_instance *hwe)
  * Description: A harder test for OAR/OAC using MI_REPORT_PERF_COUNT
  */
 static void
-test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instance *hwe)
+test_single_ctx_render_target_writes_a_counter(struct drm_xe_oa_unit *oau)
 {
 	int child_ret;
 	struct igt_helper_process child = {};
@@ -3444,7 +3448,7 @@ test_single_ctx_render_target_writes_a_counter(struct drm_xe_engine_class_instan
 
 			igt_drop_root();
 
-			single_ctx_helper(hwe);
+			single_ctx_helper(oau);
 
 			drm_close_driver(drm_fd);
 		}
@@ -5190,8 +5194,8 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
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

