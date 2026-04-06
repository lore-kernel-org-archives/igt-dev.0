Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83815FB5175
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:27:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C11A10E2E2;
	Mon,  6 Apr 2026 22:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCZBMyEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03DC10E2E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514440; x=1807050440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DGwU1T2Ske5XtCD7GbNKvRz51KukF4Tkttlo+7qy9G0=;
 b=DCZBMyEWPFsmTlEnEKOq44yzOJ5dGEwB5ouPusj92lF6fCALCvyJWc18
 ZUmx1mG93U98/mRDdTYBMbcwHy+rGbZLSs5ZR8cubb12OHyq3RlS5QVCL
 n48VyzgD//3GMUooiHijHRhtgnXPpgEr9CpAGy5acwiQAwHfY76b8SYTD
 JDrlfikWFfIjfYF38cTzyWTXSxgs+N7y3fLiyRE/WUhRoOwUmotSTIVwc
 igBNLcGiQDwm2MS4boqaXx5JgMebG4ExkTJy7WX/bk7o/hgZKVZ0V919L
 4ngfeswWh/zGI23PD+PITnGGiFvBmnO5V+Qved/VS0kQUKGfgXCnnOphy g==;
X-CSE-ConnectionGUID: ZFk2vYs2Rzub4dvaAu0/qQ==
X-CSE-MsgGUID: 4r2BvWqaQJ6MNO++Ma/2Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99094825"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="99094825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:27:19 -0700
X-CSE-ConnectionGUID: tvU2udqFTAytpo5AmNh8Bg==
X-CSE-MsgGUID: TBjEvEt7SW2F5mV4VsRGgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="221416457"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:27:18 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 5/5] tests/intel/xe_pat: randomly generate test PAT set to
 cover more PAT index
Date: Mon,  6 Apr 2026 22:27:03 +0000
Message-ID: <20260406222703.3217769-6-zongyao.bai@intel.com>
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

Replace hardcoded xe2_pat_index_modes[] and bmg_g21_pat_index_modes[]
tables with dynamic generation test PAT set.

Generate descriptive mode names from decoded PAT fields, keep a small
set of common modes first, then fill the remaining slots from a
shuffled set of valid entries.

This exercises more PAT indices than the previous handpicked subset.
It avoids manual updates to platform-specific Xe2 PAT tables.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 168 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 141 insertions(+), 27 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index c799c7b67..f11bd4a30 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1346,7 +1346,7 @@ struct pat_index_entry {
 	uint8_t pat_index;
 	bool    compressed;
 
-	const char *name;
+	char     name[PAT_NAME_MAX_LEN];
 	uint16_t   coh_mode;
 	bool       force_cpu_wc;
 };
@@ -1388,29 +1388,147 @@ const struct pat_index_entry xelpg_pat_index_modes[] = {
 	{ NULL, 4, false, "2way-atomics-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
 };
 
-const struct pat_index_entry xe2_pat_index_modes[] = {
-	XE_COMMON_PAT_INDEX_MODES,
+static struct pat_index_entry pat_index_modes[TEST_MODE_CNT * 2];
 
-	/* Too many, just pick some of the interesting ones */
-	{ NULL, 1,  false, "1way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
-	{ NULL, 5,  false, "uc-1way",     XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 12, true,  "uc-comp",     XE_COH_NONE                },
-	{ NULL, 31, false, "c3-2way",     XE_COH_AT_LEAST_1WAY       },
-};
+static void generate_pat_entry_name(struct local_pat_entry *entry, char *name_buf,
+				    bool cpu_wc)
+{
+	const char *l3_policy_str[] = { "-l3_wb", "-l3_xd", "-l3_xa", "-l3_uc" };
+	const char *l4_policy_str[] = { "-l4_wb", "-l4_wt", "", "-l4_uc" };
+	const char *coh_str;
+
+	if (entry->coh_mode == XE_COH_1WAY)
+		coh_str = "-1way";
+	else if (entry->coh_mode == XE_COH_2WAY)
+		coh_str = "-2way";
+	else
+		coh_str = "";
+
+	snprintf(name_buf, PAT_NAME_MAX_LEN, "c%u%s%s%s%s%s",
+		 entry->pat_clos,
+		 l3_policy_str[entry->l3_policy & 3],
+		 l4_policy_str[entry->l4_policy & 3],
+		 coh_str,
+		 entry->comp_en ? "-comp" : "",
+		 cpu_wc ? "-cpu_wc" : "");
+}
 
-const struct pat_index_entry bmg_g21_pat_index_modes[] = {
-	XE_COMMON_PAT_INDEX_MODES,
+static void add_pat_mode(struct pat_index_entry *modes, int idx, int pat_idx, bool cpu_wc)
+{
+	struct local_pat_entry *entry = &local_pat_cache.entries[pat_idx];
+
+	modes[idx].get_pat_index = NULL;
+	modes[idx].pat_index = pat_idx;
+	modes[idx].compressed = entry->comp_en;
+	modes[idx].coh_mode =
+		(entry->coh_mode >= XE_COH_1WAY) ? XE_COH_AT_LEAST_1WAY : XE_COH_NONE;
+	modes[idx].force_cpu_wc = cpu_wc;
+	generate_pat_entry_name(entry, modes[idx].name, cpu_wc);
+}
 
-	/* Too many, just pick some of the interesting ones */
-	{ NULL, 1,  false, "1way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way",        XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 2,  false, "2way-cpu-wc", XE_COH_AT_LEAST_1WAY, true },
-	{ NULL, 5,  false, "uc-1way",     XE_COH_AT_LEAST_1WAY       },
-	{ NULL, 12, true,  "uc-comp",     XE_COH_NONE                },
-	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
-};
+/*
+ * Build pat_index_modes[] test table:
+ * 1. Common modes first (WT, Coherent, Non-coherent)
+ * 2. Random modes (shuffled remaining entries)
+ */
+static int init_pat_index_modes(void)
+{
+	int test_cnt = (igt_run_in_simulation()) ? TEST_MODE_CNT_SIMULATE : TEST_MODE_CNT;
+	struct pat_index_entry common_modes[TEST_COMMON_MODE_MAX];
+	struct pat_index_entry random_modes[XE_PAT_MAX_ENTRIES * 2];
+	struct pat_index_entry tmp;
+	int n_common = 0;
+	int n_random = 0;
+	int n_picked = 0;
+	int i, j;
+
+	bool ensure_picked_wt = true;
+	bool ensure_picked_coh = true;
+	bool ensure_picked_noncoh = true;
+
+	igt_assert(local_pat_cache.n_entries > 0);
+
+	/* Step 1: Split entries into common_modes and random_modes */
+	for (i = 0; i < local_pat_cache.n_entries; i++) {
+		struct local_pat_entry *entry = &local_pat_cache.entries[i];
+
+		if (entry->rsvd)
+			continue;
+
+		/* Common pat index type 1: WT mode (l3=xd, l4=wt, coh=0) */
+		if (ensure_picked_wt && local_pat_cache.has_wt &&
+		    entry->pat_clos == 0 &&
+		    entry->l3_policy == L3_CACHE_POLICY_XD &&
+		    entry->l4_policy == L4_CACHE_POLICY_WT &&
+		    entry->coh_mode == 0) {
+			add_pat_mode(common_modes, n_common, i, false);
+			n_common++;
+			ensure_picked_wt = false;
+			continue;
+		}
+		/* Common pat index type 2: Coherent mode (l3=wb, l4=uc, coh>=1way) */
+		if (ensure_picked_coh &&
+		    entry->pat_clos == 0 &&
+		    entry->l3_policy == L3_CACHE_POLICY_WB &&
+		    entry->l4_policy == L4_CACHE_POLICY_UC &&
+		    entry->coh_mode >= XE_COH_1WAY) {
+			add_pat_mode(common_modes, n_common, i, false);
+			n_common++;
+			add_pat_mode(common_modes, n_common, i, true);
+			n_common++;
+			ensure_picked_coh = false;
+			continue;
+		}
+		/* Common pat index type 3: Non-coherent mode (l3=uc, l4=uc, coh=0) */
+		if (ensure_picked_noncoh &&
+		    entry->pat_clos == 0 &&
+		    entry->l3_policy == L3_CACHE_POLICY_UC &&
+		    entry->l4_policy == L4_CACHE_POLICY_UC &&
+		    entry->coh_mode == 0) {
+			add_pat_mode(common_modes, n_common, i, false);
+			n_common++;
+			ensure_picked_noncoh = false;
+			continue;
+		}
+
+		/* Add to random_modes */
+		add_pat_mode(random_modes, n_random, i, false);
+		n_random++;
+		if (entry->coh_mode >= XE_COH_1WAY) {
+			add_pat_mode(random_modes, n_random, i, true);
+			n_random++;
+		}
+	}
+	igt_assert(n_common + n_random > 0);
+
+	/* Step 2: Fisher-Yates shuffle on random_modes */
+	for (i = n_random - 1; i > 0; i--) {
+		j = rand() % (i + 1);
+		tmp = random_modes[i];
+		random_modes[i] = random_modes[j];
+		random_modes[j] = tmp;
+	}
+
+	/* Step 3: Merge common_modes and random_modes into pat_index_modes */
+	for (i = 0; i < n_common; i++)
+		pat_index_modes[n_picked++] = common_modes[i];
+	for (i = 0; i < n_random; i++)
+		pat_index_modes[n_picked++] = random_modes[i];
+
+	/* Step 4: Truncate to test_cnt */
+	if (n_picked > test_cnt)
+		n_picked = test_cnt;
+
+	for (i = 0; i < n_picked; i++) {
+		igt_debug("  [%d] idx=%2u comp=%d coh=%u cpu_wc=%d name=%s%s\n",
+			  i, pat_index_modes[i].pat_index, pat_index_modes[i].compressed,
+			  pat_index_modes[i].coh_mode, pat_index_modes[i].force_cpu_wc,
+			  pat_index_modes[i].name,
+			  (i < n_common) ? " (common)" : " (random)");
+	}
+
+	return n_picked;
+}
 
 const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
 	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
@@ -2339,12 +2457,8 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
 		igt_assert(HAS_FLATCCS(dev_id));
 
-		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
-			subtest_pat_index_modes_with_regions(fd, bmg_g21_pat_index_modes,
-							     ARRAY_SIZE(bmg_g21_pat_index_modes));
-		else
-			subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
-							     ARRAY_SIZE(xe2_pat_index_modes));
+		subtest_pat_index_modes_with_regions(fd, pat_index_modes,
+			init_pat_index_modes());
 	}
 
 	igt_subtest("display-vs-wb-transient")
-- 
2.43.0

