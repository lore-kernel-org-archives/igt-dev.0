Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9665ACCF2D3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 05:13:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3342010E0E7;
	Mon, 19 Oct 2026 05:13:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8F410E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 05:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792386730; x=1823922730;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eywJWY+q+Ck6QQoUGLc4a9HsHloVLhdEIP1vArDo59E=;
 b=gEyGxjVPtkYAQPCgTiml02NvsFotum+HbCnPoEUjBq72iL0BhI5yGVZv
 20e5QzdNmMgO8uRfQ5bOn1Ah8ikkK9rXPkXwY59AGI29j63L1bf2ZxfSx
 aytWsnuzRH4t/akb0K5ISgr/v9oT7tN/ohzEEgbCYgJzwB9gKr3Lkhm4O
 BH/Cc7804zPk0pqIO7hm+YYOpktoHv38hhilzpzjnDlMeO2KxucRaToT9
 p6UT6laQChogIuvUn+kOj/9eX2T7bmqla8vaANdZ1/KYLvLHyYdvbXaZY
 wWYh2bW/VNtgoxtbS/V6ZeyH/KbuIIgRp2015/YdxBiG1KCYxLxcyMN2r Q==;
X-CSE-ConnectionGUID: peJgPEqQQ2+grRcBgKAM6A==
X-CSE-MsgGUID: Yxnh387CToyGmBxJx5818Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1095936"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1095936"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 22:12:09 -0700
X-CSE-ConnectionGUID: oK4Q3L0mTsuOvfHq6UknOg==
X-CSE-MsgGUID: 6wIu2V42RJyAGq4SyYV6Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2840545"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2026 22:12:08 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com,
	umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v2] tests/xe_oa: OAM has broken stream on Xe3+
Date: Mon, 19 Oct 2026 10:42:00 +0530
Message-ID: <20261019051200.1071936-1-shekhar.chauhan@intel.com>
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

v2: Run tail-address-wrap only on OA units that support it via
__for_each_oa_unit_with_tail_address_wrap() and update the format
comment. (Umesh)

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tests/intel/xe_oa.c | 38 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9ebb18690..b9f62c115 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4516,6 +4516,35 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
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
+static bool oau_has_tail_address_wrap(const struct drm_xe_oa_unit *oau)
+{
+	return oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG ||
+	       oam_has_tail_address_wrap(oau);
+}
+
+static int tail_address_wrap_format(const struct drm_xe_oa_unit *oau)
+{
+	/* Pick a non-power-of-2 OAM format to verify tail address wrap */
+	if (oam_has_tail_address_wrap(oau))
+		return XE_OAM_FORMAT_MPEC8u64_B8_C8;
+
+	return oa_unit_metric_set(oau)->perf_oa_format;
+}
+
 /**
  * SUBTEST: tail-address-wrap
  * Description: Test tail address wrap on odd format sizes. Ensure that the
@@ -4530,7 +4559,7 @@ test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	u64 exponent = max_oa_exponent_for_period_lte(20000);
 	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
-	u64 fmt = test_set->perf_oa_format;
+	u64 fmt = tail_address_wrap_format(oau);
 	u64 properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4879,6 +4908,11 @@ exit:
 	for_each_oa_unit(oau) \
 		igt_dynamic_f("%s-%d", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id)
 
+#define __for_each_oa_unit_with_tail_address_wrap(oau, str) \
+	for_each_oa_unit(oau) \
+		for_if(oau_has_tail_address_wrap(oau)) \
+			igt_dynamic_f("%s-%d-%s", oa_unit_name[oau->oa_unit_type], oau->oa_unit_id, str)
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	uint32_t tmp;
@@ -5146,7 +5180,7 @@ int igt_main_args("b:td", long_options, help_str, opt_handler, NULL)
 		long k = random() % num_buf_sizes;
 
 		igt_require(oau0->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
-		__for_oa_unit_by_type_w_arg(DRM_XE_OA_UNIT_TYPE_OAG, buf_sizes[k].name)
+		__for_each_oa_unit_with_tail_address_wrap(oau, buf_sizes[k].name)
 			test_tail_address_wrap(oau, buf_sizes[k].size);
 	}
 
-- 
2.53.0

