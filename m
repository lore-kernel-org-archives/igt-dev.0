Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83873EE57D6
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 05:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C55310E97B;
	Wed, 31 Dec 2025 05:55:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nxChHfia";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF1710E8D0
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767160530; x=1798696530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vusvRZz2e8YhItYorYZf8g7o93uV4qaPNT38IHz69TU=;
 b=nxChHfiaHBgr6wakoXuL6D2k/9HxVm1Dl20jRVtUq+JutpHuOv6AYYoS
 yj9rAbKiUkvKl9eRc9J0SivmvrXqc9VARIcnMByBcenbnT2+iiN/kjMsy
 Md9fi359lFYCU8/B4FiU3BuIVSTt+HmpE5etuIIoxc0PG2BYnayaoxlOD
 UuD1Y0y1ddJCA/ti4PIrrU7/MnBN4O3IFTb331k31rci3bYjc3W/7B/mW
 rShClmNi8TB0evj3v8pYJDFU8IWYpoI44CGXJGMjqJU8AKUmNLkpxm1rV
 zjzFQsAzEe2hpbGomdr/+P0y6O6/1dH2Mfidxx2rDc8tTGGtu8SCNeE4F Q==;
X-CSE-ConnectionGUID: XVmGSb+0RO+/VFqzIhEOJw==
X-CSE-MsgGUID: vw/uklS3Swih1tJ5FAwj1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72590001"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="72590001"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 21:55:29 -0800
X-CSE-ConnectionGUID: mSZRaX1AQeGBF83DQS56Sg==
X-CSE-MsgGUID: ajGXG7KuSH+I4yrJd9t1jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="201119709"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 21:55:29 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v9 3/5] tests/xe_pat: add pat-sanity subtest for debugfs vs
 getters
Date: Wed, 31 Dec 2025 05:55:23 +0000
Message-ID: <20251231055525.51524-4-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231055525.51524-1-x.wang@intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a new pat-sanity subtest that reads the Xe PAT software
configuration from debugfs and validates it against the
existing PAT index helper getters.

CC: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
---
 tests/intel/xe_pat.c | 99 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 2fd3635fd..f003f0046 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -18,6 +18,7 @@
 #include "intel_blt.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
+#include "linux_scaffold.h"
 
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -76,6 +77,101 @@ static void userptr_coh_none(int fd)
 	munmap(data, size);
 	xe_vm_destroy(fd, vm);
 }
+#define REG_FIELD_GET(__mask, __val) \
+	((uint32_t)FIELD_GET(__mask, __val))
+
+#define XE2_NO_PROMOTE	REG_BIT(10)
+#define XE2_COMP_EN	REG_BIT(9)
+#define XE2_L3_CLOS	GENMASK(7, 6)
+#define XE2_L3_POLICY	GENMASK(5, 4)
+#define XE2_L4_POLICY	GENMASK(3, 2)
+#define XE2_COH_MODE	GENMASK(1, 0)
+
+#define L3_CLOS1		1
+#define L3_CLOS2		2
+#define L3_CLOS3		3
+
+#define L3_CACHE_POLICY_WB	0
+#define L3_CACHE_POLICY_XD	1
+#define L3_CACHE_POLICY_UC	3
+
+#define L4_CACHE_POLICY_WB	0
+#define L4_CACHE_POLICY_WT	1
+#define L4_CACHE_POLICY_UC	3
+
+#define COH_MODE_NONE	  	0
+#define COH_MODE_1WAY		2
+#define COH_MODE_2WAY		3
+
+static int xe_fetch_pat_sw_config_or_skip(int fd, struct intel_pat_cache *pat_sw_config)
+{
+	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
+
+	igt_require_f(parsed > 0, "Couldn't get Xe PAT software configuration\n");
+
+	return parsed;
+}
+
+static void dump_xe2_pat_sw_entries(const struct intel_pat_cache *pat_sw_config,
+				    int32_t parsed)
+{
+	for (int i = 0; i < parsed; i++) {
+		uint32_t pat = pat_sw_config->entries[i].pat;
+
+		igt_info("PAT[%2d] = [ %u, %u, %u, %u, %u, %u]  (%#8x)%s\n", i,
+			  !!(pat & XE2_NO_PROMOTE),
+			  !!(pat & XE2_COMP_EN),
+			  REG_FIELD_GET(XE2_L3_CLOS, pat),
+			  REG_FIELD_GET(XE2_L3_POLICY, pat),
+			  REG_FIELD_GET(XE2_L4_POLICY, pat),
+			  REG_FIELD_GET(XE2_COH_MODE, pat),
+			  pat,
+			  pat_sw_config->entries[i].rsvd ? " *" : "");
+	}
+}
+
+/**
+ * SUBTEST: pat-sanity
+ * Test category: functionality test
+ * Description: Test debugfs PAT config vs getters
+ */
+static void pat_sanity(int fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(fd);
+	struct intel_pat_cache pat_sw_config = {};
+	int32_t parsed;
+	bool has_uc_comp = false, has_wt = false;
+
+	parsed = xe_fetch_pat_sw_config_or_skip(fd, &pat_sw_config);
+
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
+		dump_xe2_pat_sw_entries(&pat_sw_config, parsed);
+		for (int i = 0; i < parsed; i++) {
+			uint32_t pat = pat_sw_config.entries[i].pat;
+			if (pat_sw_config.entries[i].rsvd)
+				continue;
+			if (!!(pat & XE2_COMP_EN) &&
+			    REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
+			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC) {
+				has_uc_comp = true;
+			}
+			if (REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
+			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT) {
+				has_wt = true;
+			}
+		}
+		if (has_uc_comp)
+			igt_assert(pat_sw_config.uc_comp == intel_get_pat_idx_uc_comp(fd));
+	}
+	else {
+		has_wt = true;
+	}
+	igt_assert(pat_sw_config.max_index == intel_get_max_pat_index(fd));
+	igt_assert(pat_sw_config.uc == intel_get_pat_idx_uc(fd));
+	igt_assert(pat_sw_config.wb == intel_get_pat_idx_wb(fd));
+	if (has_wt)
+		igt_assert(pat_sw_config.wt == intel_get_pat_idx_wt(fd));
+}
 
 /**
  * SUBTEST: pat-index-all
@@ -1230,6 +1326,9 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		xe_device_get(fd);
 	}
 
+	igt_subtest("pat-sanity")
+		pat_sanity(fd);
+
 	igt_subtest("pat-index-all")
 		pat_index_all(fd);
 
-- 
2.43.0

