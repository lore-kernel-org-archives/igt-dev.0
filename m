Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9BECD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 23:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B6C10E22A;
	Mon, 11 May 2026 23:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zftql4Lu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B0B10E91E
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778542596; x=1810078596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2ZlbxVInkMokyvkQQMOBDxejttvZtuG8E4DEiJSi2mo=;
 b=Zftql4Lu98U/2oZvzlYNAe6QoMWf5vrqV6Npk9DjdrTaoxFRFjKQbU90
 PrpqwVzszIqgUVAkGBzoJ7nkphUTFll/chrSfBF1C9jBXeLWS5uiNKX6/
 bbakjUpc79+yPxPXTVUE35YfCrtuNdrFLM23Xaj/kcO0aJW6xjTgNx2+2
 3K6DSL4W35YUe8vLAPFobXUsIwMtWUcPvNKyVQsSuGY8/ieJ44P8gd9l6
 iVotQTLIXaGCVml5f71KxUSgWI5rLh1jzfai6PgCZecKEzSRr9mPPP7Q8
 U/T00wDxH8nQUlKqXDFVENPysx8TVeDDupfWSReIQoTgY9W/kBRQcdMUc A==;
X-CSE-ConnectionGUID: h9FgKP2sQpCLxbwoWWfpaA==
X-CSE-MsgGUID: 6zokQRyfQ4SgXNOG6Criqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90027400"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90027400"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 16:36:36 -0700
X-CSE-ConnectionGUID: VIMK4d/yTqexRIG9kJP0Iw==
X-CSE-MsgGUID: v7AkXsFmSgypwDsTdY4Wzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="237687264"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa009.jf.intel.com with ESMTP; 11 May 2026 16:36:35 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 3/3] tests/intel/xe_pat: Add dynamic PAT index selection for
 pat-index-auto
Date: Mon, 11 May 2026 23:36:22 +0000
Message-ID: <20260511233622.2074382-4-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511233622.2074382-1-zongyao.bai@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
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

Introduce the `pat-index-auto` dynamic subtest to iteratively test
PAT indices based on the hardware configuration, improving test
coverage beyond hardcoded arrays.

Build the test mode set by:
    selecting a small common set first (WT, coherent, non-coherent)
    adding randomized remaining valid entries

Add pat-index-auto to xe.fast-feedback.testlist.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist |   1 +
 tests/intel/xe_pat.c                     | 158 +++++++++++++++++++++++
 2 files changed, 159 insertions(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..6851c1f49 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -211,6 +211,7 @@ igt@xe_pat@pat-index-xelp
 igt@xe_pat@pat-index-xehpc
 igt@xe_pat@pat-index-xelpg
 igt@xe_pat@pat-index-xe2
+igt@xe_pat@pat-index-auto
 igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 79f9a87aa..957f843ec 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -35,6 +35,7 @@
 
 #define XE_COH_NONE          1
 #define XE_COH_AT_LEAST_1WAY 2
+#define PAT_NAME_MAX_LEN     64
 
 /*
  * PAT index 18: XA (eXclusive Access) + UC (Uncached).
@@ -113,6 +114,7 @@ static void userptr_coh_none(int fd)
 
 #define L3_CACHE_POLICY_WB	0
 #define L3_CACHE_POLICY_XD	1
+#define L3_CACHE_POLICY_XA	2
 #define L3_CACHE_POLICY_UC	3
 
 #define L4_CACHE_POLICY_WB	0
@@ -1345,6 +1347,147 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
 	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
 };
 
+static void add_pat_mode(struct pat_index_entry *modes_arr, int idx,
+			 uint32_t pat, bool has_comp_en, int pat_idx, bool cpu_wc)
+{
+	modes_arr[idx].get_pat_index = NULL;
+	modes_arr[idx].pat_index = pat_idx;
+	modes_arr[idx].compressed = has_comp_en && !!(pat & XE2_COMP_EN);
+	modes_arr[idx].name = NULL;
+	modes_arr[idx].coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat) >= COH_MODE_1WAY ?
+				  XE_COH_AT_LEAST_1WAY : XE_COH_NONE;
+	modes_arr[idx].force_cpu_wc = cpu_wc;
+}
+
+/*
+ * Build pat_index_modes[] test table dynamically from hardware PAT table:
+ * 1. Read PAT entries from hardware
+ * 2. Pick common modes first (WT, Coherent, Non-coherent)
+ * 3. Pick random modes (shuffled remaining entries)
+ * 4. Return the modes array and count through output parameters
+ */
+static int init_pat_index_modes(int fd, struct pat_index_entry **modes)
+{
+	const int TEST_MODE_CNT = 12;
+	const int TEST_COMMON_MODE_MAX = 4;
+
+	/* Static storage for results - persists after function returns */
+	static struct pat_index_entry pat_index_modes[XE_PAT_MAX_ENTRIES * 2];
+	static struct intel_pat_cache pat_sw_config;
+	static char name_storage[XE_PAT_MAX_ENTRIES * 2][PAT_NAME_MAX_LEN];
+
+	int n_entries;
+	bool has_comp_en;
+
+	int test_cnt = igt_run_in_simulation() ? TEST_MODE_CNT / 2 : TEST_MODE_CNT;
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
+	/* Fetch PAT config from hardware */
+	n_entries = xe_fetch_pat_sw_config(fd, &pat_sw_config);
+	has_comp_en = HAS_FLATCCS(intel_get_drm_devid(fd));
+
+	igt_assert(n_entries > 0);
+
+	/* Step 1: Split entries into common_modes and random_modes */
+	for (i = 0; i < n_entries; i++) {
+		uint32_t pat = pat_sw_config.entries[i].pat;
+		uint8_t pat_clos = REG_FIELD_GET(XE2_L3_CLOS, pat);
+		uint8_t l3_policy = REG_FIELD_GET(XE2_L3_POLICY, pat);
+		uint8_t l4_policy = REG_FIELD_GET(XE2_L4_POLICY, pat);
+		uint8_t coh_mode = REG_FIELD_GET(XE2_COH_MODE, pat);
+
+		if (pat_sw_config.entries[i].rsvd)
+			continue;
+
+		/* Common pat index type 1: WT mode (l3=xd, l4=wt, coh=0) */
+		if (ensure_picked_wt &&
+		    pat_clos == 0 &&
+		    l3_policy == L3_CACHE_POLICY_XD &&
+		    l4_policy == L4_CACHE_POLICY_WT &&
+		    coh_mode == 0) {
+			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
+			n_common++;
+			ensure_picked_wt = false;
+			continue;
+		}
+		/* Common pat index type 2: Coherent mode (l3=wb, l4=uc, coh>=1way) */
+		if (ensure_picked_coh &&
+		    pat_clos == 0 &&
+		    l3_policy == L3_CACHE_POLICY_WB &&
+		    l4_policy == L4_CACHE_POLICY_UC &&
+		    coh_mode >= COH_MODE_1WAY) {
+			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
+			n_common++;
+			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, true);
+			n_common++;
+			ensure_picked_coh = false;
+			continue;
+		}
+		/* Common pat index type 3: Non-coherent mode (l3=uc, l4=uc, coh=0) */
+		if (ensure_picked_noncoh &&
+		    pat_clos == 0 &&
+		    l3_policy == L3_CACHE_POLICY_UC &&
+		    l4_policy == L4_CACHE_POLICY_UC &&
+		    coh_mode == 0) {
+			add_pat_mode(common_modes, n_common, pat, has_comp_en, i, false);
+			n_common++;
+			ensure_picked_noncoh = false;
+			continue;
+		}
+
+		/* Add to random_modes */
+		add_pat_mode(random_modes, n_random, pat, has_comp_en, i, false);
+		n_random++;
+		if (coh_mode >= COH_MODE_1WAY) {
+			add_pat_mode(random_modes, n_random, pat, has_comp_en, i, true);
+			n_random++;
+		}
+	}
+	igt_assert(n_common + n_random > 0);
+
+	/* Step 2: Fisher-Yates shuffle on random_modes */
+	for (i = n_random - 1; i > 0; i--) {
+		j = random() % (i + 1);
+		tmp = random_modes[i];
+		random_modes[i] = random_modes[j];
+		random_modes[j] = tmp;
+	}
+
+	/* Step 3: Merge common_modes and random_modes into pat_index_modes (up to test_cnt) */
+	for (i = 0; i < n_common && n_picked < test_cnt; i++)
+		pat_index_modes[n_picked++] = common_modes[i];
+	for (i = 0; i < n_random && n_picked < test_cnt; i++)
+		pat_index_modes[n_picked++] = random_modes[i];
+
+	/* Step 4: Assign simple numeric names and print debug info */
+	for (i = 0; i < n_picked; i++) {
+		snprintf(name_storage[i], PAT_NAME_MAX_LEN, "PAT_INDEX_%u%s",
+			 pat_index_modes[i].pat_index,
+			 pat_index_modes[i].force_cpu_wc ? "-force_cpu_wc" : "");
+
+		pat_index_modes[i].name = name_storage[i];
+
+		igt_debug("  [%d] idx=%2u comp=%d coh=%u cpu_wc=%d name=%s%s\n",
+			  i, pat_index_modes[i].pat_index, pat_index_modes[i].compressed,
+			  pat_index_modes[i].coh_mode, pat_index_modes[i].force_cpu_wc,
+			  pat_index_modes[i].name,
+			  (i < n_common) ? " (common)" : " (random)");
+	}
+
+	*modes = pat_index_modes;
+	return n_picked;
+}
+
 const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
 	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
 	{ NULL, 19, false, "xa-l3-1way", XE_COH_AT_LEAST_1WAY },
@@ -1414,6 +1557,12 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
  * Description: Check some of the xe2 pat_index modes.
  */
 
+/**
+ * SUBTEST: pat-index-auto
+ * Test category: functionality test
+ * Description: Dynamically generate and test PAT index modes from platform PAT configuration.
+ */
+
 /**
  * SUBTEST: xa-app-transient-media-off
  * Test category: functionality test
@@ -2275,6 +2424,15 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 							     ARRAY_SIZE(xe2_pat_index_modes));
 	}
 
+	igt_subtest_with_dynamic("pat-index-auto") {
+		struct pat_index_entry *modes;
+		int n_modes;
+
+		igt_require(intel_graphics_ver(dev_id) >= IP_VER(20, 0));
+		n_modes = init_pat_index_modes(fd, &modes);
+		subtest_pat_index_modes_with_regions(fd, modes, n_modes);
+	}
+
 	igt_subtest("display-vs-wb-transient")
 		display_vs_wb_transient(fd);
 
-- 
2.43.0

