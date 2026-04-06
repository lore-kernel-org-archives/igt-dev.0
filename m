Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5D3FB5177
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 23:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3DC10E2EC;
	Mon,  6 Apr 2026 23:16:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dL/hXuXf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB4A110E2EC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775517344; x=1807053344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r2M9UGh2e4AHFOHtxnupESwXTDLVedki8O1AsJ+IsgU=;
 b=dL/hXuXf8SxAoXs5ujWulkcu2cPZsTDaQgNrneIR/P+3fWpu/afeWvnj
 DJVWvKzgo45EPvOsslD9A8QnIrtT1frXcbhUxWdwZs2Ft24hUa85M508U
 w6fdMg3Kvj2ZRYYMl19pyFUbOVpvXHIJzzN1V7YnIj8LBqy2g9mEGVeYx
 X7DFUSa2W7+G3BzUaOpNyvueEx9/o2XlwYAjr0I6yobjkSV4oWuk/7Swu
 8PXe4VuyAedW/n9i9vpBFaHVr8ti3cfflw/06oTUtXE65gUJzyJvYxgpK
 YCWjKPD2lGz69DZt17Hc9f1MYteKWNPH8Vq587ICSELRULMDLX6J7yAKS Q==;
X-CSE-ConnectionGUID: QgvcWYXZRHmJYkfGfs6dtg==
X-CSE-MsgGUID: 8RImmPVlTmmx7TOgRqfb/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76660629"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76660629"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 16:15:44 -0700
X-CSE-ConnectionGUID: ogIh1gz9TWK8c66hyMR//g==
X-CSE-MsgGUID: 2gJNPKw1ReS8UoTnHsid1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227164744"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 16:15:43 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3 3/5] tests/intel/xe_pat: cache and decode PAT entries
Date: Mon,  6 Apr 2026 23:15:38 +0000
Message-ID: <20260406231540.3238758-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406231540.3238758-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20260406231540.3238758-1-zongyao.bai@intel.com>
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

