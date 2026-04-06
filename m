Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF57BFB5175
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:27:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8281810E2E8;
	Mon,  6 Apr 2026 22:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j/7AYF/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A43210E2E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514439; x=1807050439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2M9UGh2e4AHFOHtxnupESwXTDLVedki8O1AsJ+IsgU=;
 b=j/7AYF/PwtRArDlOFArwXeu3c8PBX9cgIKh8YMpBrkxo78ZnAMC+q1pO
 tHIgdx2Pxbv/d+nuXHKdDTadA5kVc4ik+2bbazKa4tPOGH+Z2jcxRbD0O
 6uSHzfN2gyfO95vuFFzFv2A52V20XNSS+vNZRH9LEMd2nZ1VkbaD3wN83
 ooS1CaBgzarnxjWrOToeUCLXcM6gV/P6OgAzcHI03HruCuLQb5PKI/WeT
 0FaNckNKxBfaU9D0KPLlY3e9Jx8XmNH3rd71lDcJhFK06yuwc8/KBkwc8
 uFtRWkIDgbdoFAaXa5wfnA1qL45T4s/i2Fw4IjIw1g/X6d01D5Ku1kDJA w==;
X-CSE-ConnectionGUID: j4CaWMN8Ra6TKjgI+CiyLA==
X-CSE-MsgGUID: 0/6dw7waRqaFgXmPnoRUYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99094822"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="99094822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:27:19 -0700
X-CSE-ConnectionGUID: 2nJbizMPR8mP3ZAZ8kLqmQ==
X-CSE-MsgGUID: Wk/wFIacTw+I7b9O5a31DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="221416450"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:27:18 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 3/5] tests/intel/xe_pat: cache and decode PAT entries
Date: Mon,  6 Apr 2026 22:27:01 +0000
Message-ID: <20260406222703.3217769-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406222703.3217769-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20260406222703.3217769-1-zongyao.bai@intel.com>
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

Add local PAT cache structures to store raw and decoded PAT entry data,
along with helpers to decode PAT fields and initialize the cache from
the Xe PAT software configuration.

This prepares xe_pat for dynamically generating test modes from the
platform PAT layout instead of relying solely on hardcoded tables.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 130 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 99 insertions(+), 31 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 79f9a87aa..94c82ff29 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -33,14 +33,65 @@
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
-#define XE_COH_NONE          1
-#define XE_COH_AT_LEAST_1WAY 2
+#define XE_COH_NONE			1
+#define XE_COH_AT_LEAST_1WAY		2
+#define XE_COH_1WAY			2
+#define XE_COH_2WAY			3
+#define TEST_MODE_CNT			12
+#define TEST_MODE_CNT_SIMULATE		5
+#define TEST_COMMON_MODE_MAX		4
+#define PAT_NAME_MAX_LEN		64
 
 /*
  * PAT index 18: XA (eXclusive Access) + UC (Uncached).
  */
 #define XE_PAT_IDX_XA_UC     18
 
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
+#define L3_CACHE_POLICY_WB	0
+#define L3_CACHE_POLICY_XD	1
+#define L3_CACHE_POLICY_XA	2
+#define L3_CACHE_POLICY_UC	3
+
+#define L4_CACHE_POLICY_WB	0
+#define L4_CACHE_POLICY_WT	1
+#define L4_CACHE_POLICY_UC	3
+
+/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
+#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
+
+struct local_pat_entry {
+	uint8_t index;		/* PAT index (0-31) */
+	uint32_t pat;		/* Raw register value from debugfs */
+	bool rsvd;		/* Reserved entry (marked with * in debugfs) */
+	/* Decoded fields from pat register */
+	bool no_promote;
+	bool comp_en;
+	uint8_t pat_clos;
+	uint8_t l3_policy;
+	uint8_t l4_policy;
+	uint8_t coh_mode;
+};
+
+struct local_pat_cache {
+	struct local_pat_entry entries[XE_PAT_MAX_ENTRIES];
+	int n_entries;		/* Number of platform valid entries */
+	bool has_comp_en;	/* true if platform has COMP_EN (Compression Enable) PAT entry */
+	bool has_wt;		/* true if platform has WT (Write-Through) PAT entry */
+};
+
+/* Global PAT cache - populated once from debugfs, reused by all subtests */
+static struct local_pat_cache local_pat_cache;
+
 static bool do_slow_check;
 static char bus_addr[NAME_MAX];
 static struct pci_device *pci_dev;
@@ -97,35 +148,6 @@ static void userptr_coh_none(int fd)
 	munmap(data, size);
 	xe_vm_destroy(fd, vm);
 }
-#define REG_FIELD_GET(__mask, __val) \
-	((uint32_t)FIELD_GET(__mask, __val))
-
-#define XE2_NO_PROMOTE	REG_BIT(10)
-#define XE2_COMP_EN	REG_BIT(9)
-#define XE2_L3_CLOS	GENMASK(7, 6)
-#define XE2_L3_POLICY	GENMASK(5, 4)
-#define XE2_L4_POLICY	GENMASK(3, 2)
-#define XE2_COH_MODE	GENMASK(1, 0)
-
-#define L3_CLOS1		1
-#define L3_CLOS2		2
-#define L3_CLOS3		3
-
-#define L3_CACHE_POLICY_WB	0
-#define L3_CACHE_POLICY_XD	1
-#define L3_CACHE_POLICY_UC	3
-
-#define L4_CACHE_POLICY_WB	0
-#define L4_CACHE_POLICY_WT	1
-#define L4_CACHE_POLICY_UC	3
-
-#define COH_MODE_NONE	  	0
-#define COH_MODE_1WAY		2
-#define COH_MODE_2WAY		3
-
-/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
-#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
-
 static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
 {
 	if (gfx_ver >= IP_VER(20, 0))
@@ -181,6 +203,47 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 	return parsed;
 }
 
+static void decode_pat_entry(struct local_pat_entry *entry, bool has_comp_en)
+{
+	uint32_t pat = entry->pat;
+
+	entry->no_promote = !!(pat & XE2_NO_PROMOTE);
+	entry->pat_clos = REG_FIELD_GET(XE2_L3_CLOS, pat);
+	entry->l3_policy = REG_FIELD_GET(XE2_L3_POLICY, pat);
+	entry->l4_policy = REG_FIELD_GET(XE2_L4_POLICY, pat);
+	entry->coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat);
+
+	if (has_comp_en)
+		entry->comp_en = !!(pat & XE2_COMP_EN);
+	else
+		entry->comp_en = false;
+}
+
+/* init local_pat_cache */
+static void init_pat_cache(int fd)
+{
+	struct intel_pat_cache raw_cache = {};
+
+	local_pat_cache.n_entries = xe_fetch_pat_sw_config(fd, &raw_cache);
+	local_pat_cache.has_comp_en = HAS_FLATCCS(intel_get_drm_devid(fd));
+	local_pat_cache.has_wt = false;
+
+	for (int i = 0; i < local_pat_cache.n_entries; i++) {
+		local_pat_cache.entries[i].index = i;
+		local_pat_cache.entries[i].pat = raw_cache.entries[i].pat;
+		local_pat_cache.entries[i].rsvd = raw_cache.entries[i].rsvd;
+		decode_pat_entry(&local_pat_cache.entries[i], local_pat_cache.has_comp_en);
+
+		if (!local_pat_cache.entries[i].rsvd &&
+		    local_pat_cache.entries[i].l4_policy == L4_CACHE_POLICY_WT)
+			local_pat_cache.has_wt = true;
+	}
+
+	igt_debug("PAT cache initialized: n_entries=%d, has_comp_en=%d, has_wt=%d\n",
+		  local_pat_cache.n_entries, local_pat_cache.has_comp_en,
+		  local_pat_cache.has_wt);
+}
+
 /**
  * SUBTEST: pat-sanity
  * Test category: functionality test
@@ -2216,6 +2279,11 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		fd = drm_open_driver(DRIVER_XE);
 		dev_id = intel_get_drm_devid(fd);
 		xe_device_get(fd);
+
+		if (intel_graphics_ver(dev_id) >= IP_VER(20, 0))
+			init_pat_cache(fd);
+		else
+			local_pat_cache.has_wt = true;
 	}
 
 	igt_subtest("pat-sanity")
-- 
2.43.0

