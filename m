Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD6FDD148B3
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 06:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A7A10E69C;
	Thu,  8 Jan 2026 06:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f7Zy6yE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA73C10E69B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767855577; x=1799391577;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CCqi54BmDG6m4UPuoqEqRa3kGgXaTotc2UEOBmrj3IE=;
 b=f7Zy6yE5caE/htEDOWvxGGBSBqQ2jLS2/oDInko3TLKAyiH5uOehZhuG
 ADyZn+FVsDe57rioiwr2wP72ihKUwZcgkFx/j7U3UXNYnIGlhOnyyask6
 WwOQW9Hj66pWggZkhoGhh2SAiO7ybk7TC2S40pI0jk8IKitiWSjCEoeCn
 moXLhPzdoTV/OAxnRhGXSzrBzWxp8PxMEW1HOoM7IMBF1hdpYvJbvPRH3
 DKS1WD/UZRKbEMVxqATOyXlBh5eP/5dnEjxelL5Drjiy8vKvYjrKGWQv/
 ERWq0fqFlujLpLnU5kqlNa25qglNa9+i5IseMOU2VjmgMnIVILus2+gI+ g==;
X-CSE-ConnectionGUID: /X1TRBBvRnaKnK9CO1sa6Q==
X-CSE-MsgGUID: LHwDFEIVQFmNpw6S+Q9WOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="73078774"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="73078774"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 22:59:36 -0800
X-CSE-ConnectionGUID: PlnBHQwBQoefhrRdBAfbow==
X-CSE-MsgGUID: PGbaeY9ySmeNQu0xiZw1cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; d="scan'208";a="203034239"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa006.fm.intel.com with ESMTP; 07 Jan 2026 22:59:36 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v2 3/4] tests/intel/xe_pat: add bo-wb-comp-1way-bind subtest
Date: Thu,  8 Jan 2026 06:59:32 +0000
Message-ID: <20260108065933.409757-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108065933.409757-1-x.wang@intel.com>
References: <20260108065933.409757-1-x.wang@intel.com>
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

Add a xe_pat subtest that looks up a WB+compression+1way PAT entry
from the debugfs PAT table and validates that binding a WB-cached
BO with that PAT index succeeds on Xe3+.

Skip the test when the platform doesn't expose a suitable PAT entry.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_pat.c | 91 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 8af6ad174..79d0e7198 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -112,6 +112,43 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 	return parsed;
 }
 
+static bool find_wb_comp_1way_pat_index(int fd, uint8_t *pat_index_out)
+{
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t parsed;
+	int i;
+
+	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
+
+	for (i = 0; i < parsed; i++) {
+		uint32_t pat = pat_sw_config.entries[i].pat;
+
+		if (pat_sw_config.entries[i].rsvd)
+			continue;
+
+		if (!(pat & XE2_COMP_EN))
+			continue;
+
+		if (REG_FIELD_GET(XE2_COH_MODE, pat) != COH_MODE_1WAY)
+			continue;
+
+		if (REG_FIELD_GET(XE2_L3_POLICY, pat) != L3_CACHE_POLICY_WB)
+			continue;
+
+		/*
+		 * Matches Xe3 compressed+coherent entry (see kernel xe3_lpg_pat_table[16]).
+		 * Note: L4 policy is UC in that entry.
+		 */
+		if (REG_FIELD_GET(XE2_L4_POLICY, pat) != L4_CACHE_POLICY_UC)
+			continue;
+
+		*pat_index_out = i;
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * SUBTEST: pat-sanity
  * Test category: functionality test
@@ -958,6 +995,42 @@ static void bo_comp_disable_bind(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: bo-wb-comp-1way-bind
+ * Test category: functionality test
+ * Description: Validate binding a WB-cached BO using a WB+compression+1way PAT
+ * index (as advertised by the debugfs PAT table) succeeds. Skip if the
+ * platform doesn't expose such a PAT entry.
+ */
+static void bo_wb_comp_1way_bind(int fd)
+{
+	size_t size = xe_get_default_alignment(fd);
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint8_t wb_comp_pat_index;
+	bool supported;
+	uint32_t vm, bo;
+	int ret;
+
+	igt_require(intel_get_device_info(dev_id)->graphics_ver >= 30);
+
+	supported = find_wb_comp_1way_pat_index(fd, &wb_comp_pat_index);
+	igt_require_f(supported, "No WB+compression+1way PAT index found, skipping.\n");
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create_caching(fd, 0, size, system_memory(fd), 0,
+				  DRM_XE_GEM_CPU_CACHING_WB);
+
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x100000,
+			  size, 0, 0, NULL, 0,
+			  0, wb_comp_pat_index, 0);
+
+	igt_assert_eq(ret, 0);
+	xe_vm_unbind_sync(fd, vm, 0, 0x100000, size);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: userptr-comp
  * Test category: functionality test
@@ -1230,6 +1303,18 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
 	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
 };
 
+const struct pat_index_entry xe3_lpg_pat_index_modes[] = {
+	XE_COMMON_PAT_INDEX_MODES,
+
+	/* Too many, just pick some of the interesting ones */
+	{ NULL, 1,  false, "1way",        XE_COH_AT_LEAST_1WAY       },
+	{ NULL, 2,  false, "2way",        XE_COH_AT_LEAST_1WAY       },
+	{ NULL, 2,  false, "2way-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
+	{ NULL, 5,  false, "uc-1way",     XE_COH_AT_LEAST_1WAY       },
+	{ NULL, 12, true,  "uc-comp",     XE_COH_NONE                },
+	{ NULL, 16, true,  "wb-comp-2way",XE_COH_AT_LEAST_1WAY       },
+	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
+};
 /*
  * Depending on 2M/1G GTT pages we might trigger different PTE layouts for the
  * PAT bits, so make sure we test with and without huge-pages. Also ensure we
@@ -1461,6 +1546,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 	igt_subtest("bo-comp-disable-bind")
 		bo_comp_disable_bind(fd);
 
+	igt_subtest("bo-wb-comp-1way-bind")
+		bo_wb_comp_1way_bind(fd);
+
 	igt_subtest_with_dynamic("pat-index-xelp") {
 		igt_require(intel_graphics_ver(dev_id) <= IP_VER(12, 55));
 		subtest_pat_index_modes_with_regions(fd, xelp_pat_index_modes,
@@ -1486,6 +1574,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
 			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
 							     ARRAY_SIZE(bmg_g21_pat_index_modes));
+		else if (intel_get_device_info(dev_id)->graphics_ver == 30)
+			subtest_pat_index_modes_with_regions(fd, xe3_lpg_pat_index_modes,
+							     ARRAY_SIZE(xe3_lpg_pat_index_modes));
 		else
 			subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
 							     ARRAY_SIZE(xe2_pat_index_modes));
-- 
2.43.0

