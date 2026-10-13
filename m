Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4BCCA9ED0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 04:43:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E27A10E729;
	Tue, 13 Oct 2026 04:43:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A7B110E729
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 04:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791866546; x=1823402546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AQBEORrXAcHZE2315dF0ZdaeJML1WXkJnqtYOhhewuA=;
 b=XZl+DPHgkJTTs2mU6nxWqAUS+ZRPjge2+3LhCAIrGpQDg0w5oG19W1Ka
 VptmUmb/gBAYQ/3UnjCJLx9Y29FDlYj8Y78f881LtBJwQXEcrcAv/gSL8
 q7LQdIiyC9FPO9Pp48zrcK5YCw3sMApvlCr6qrC73+BIPtVIPrWbAx1EL
 68hsp3kQkd65liIXtUeEcqDFUNhm3GBeeqVSJ60Ih98ceVtKtTKgGdhJd
 +CqoDW/piGoP9MucPFIyHFqrCnSVDEQjiiLPbZ4h87teyKkqU/b0AOl/a
 MI4MV93XKopIin5H7QAamrJkd/uG52iMQ5NGtk8HvTBl9m9cE9sbUVtRL Q==;
X-CSE-ConnectionGUID: THphAXT7SpK6uq3/2wmqsA==
X-CSE-MsgGUID: OT57olmtSxurz5ZeaNAJPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="468818"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="468818"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:42:25 -0700
X-CSE-ConnectionGUID: Stv+LkSbQdazbk2uSVDwVQ==
X-CSE-MsgGUID: BNiqwqgkRqy85JRH0Mer1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1181095"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:42:23 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v1] tests/xe_oa: OAM has broken stream on Xe3+
Date: Tue, 13 Oct 2026 10:12:15 +0530
Message-ID: <20261013044215.280639-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

Extend tail-address-wrap to all OA units and force the 192B format on
Xe3+ OAM to properly test it since other formats on OAM don't use 192B
on Xe3+ platforms.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/intel/xe_oa.c | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9ebb18690..d6c3c4a6d 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4516,6 +4516,29 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
 	try_invalid_access(vaddr);
 }
 
+static bool oam_has_tail_address_wrap(const struct drm_xe_oa_unit *oau)
+{
+	const struct drm_xe_gt *gt;
+
+	if ((oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM &&
+	     oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAM_SAG) ||
+	    !(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID))
+		return false;
+
+	gt = drm_xe_get_gt(xe_device_get(drm_fd), oau->gt_id);
+
+	return gt && gt->ip_ver_major >= 30;
+}
+
+static int tail_address_wrap_format(const struct drm_xe_oa_unit *oau)
+{
+	/* Default OAM metric sets use a power-of-2 report size */
+	if (oam_has_tail_address_wrap(oau))
+		return XE_OAM_FORMAT_MPEC8u64_B8_C8;
+
+	return oa_unit_metric_set(oau)->perf_oa_format;
+}
+
 /**
  * SUBTEST: tail-address-wrap
  * Description: Test tail address wrap on odd format sizes. Ensure that the
@@ -4530,7 +4553,7 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	u64 exponent = max_oa_exponent_for_period_lte(20000);
 	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
-	u64 fmt = test_set->perf_oa_format;
+	u64 fmt = tail_address_wrap_format(oau);
 	u64 properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4879,6 +4902,10 @@ exit:
 	for_each_oa_unit(oau) \
 		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
 
+#define __for_each_oa_unit_with_arg(oau, str) \
+	for_each_oa_unit(oau) \
+		igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	uint32_t tmp;
@@ -5146,7 +5173,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		long k = random() % num_buf_sizes;
 
 		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
-		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
+		__for_each_oa_unit_with_arg(oau, buf_sizes[k].name)
 			test_tail_address_wrap(oau, buf_sizes[k].size);
 	}
 
-- 
2.53.0

