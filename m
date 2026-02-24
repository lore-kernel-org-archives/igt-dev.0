Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A75F357BA
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 17:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F2610E5F2;
	Tue, 24 Feb 2026 17:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFvCZM/m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E2010E5F2
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 17:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771952860; x=1803488860;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1GgRBscSESwkiKfwGIj0jX25Aku+ALpr93eJ8CJNr4E=;
 b=KFvCZM/mAv0c9KBIPfYSNr6EQk18rLacUK8ZwsT/zGXOWNtenGq/WAyc
 /etNwuSiiMvz40AolCTQ1/q7AgsT8VWlYlwmRx34I6LSqFFtKOYHeubh1
 3n7IG+5QNHYgACJ1wNqmL/lCV6oVn0HOqd1W30lVur+55Qoj7hrROytKH
 msmuwthsCuJ+GcQ+5+klUP5hzHASYpwsUhzJHUJNqTqBCcZspfsvmnXuW
 Lc4izoqMp5WA8+9sjF013Td0+gCXE4JoQ07WLGwEfiekpHhwWngkIz5+7
 TD9AHtUtruDDWyN/o2eV5QKYcCfDWqt78NtrbouKXsWaDD6Vk6SCjj0IC Q==;
X-CSE-ConnectionGUID: IBFZba5eT5COBHQqOmdtKA==
X-CSE-MsgGUID: +G7iJdr2RgCK8vZYB2ZV5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72185514"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="72185514"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 09:07:40 -0800
X-CSE-ConnectionGUID: IwCIi9NoSfSbMoI5yuG8ow==
X-CSE-MsgGUID: kA14zt9gSi212SiUay3+Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215972763"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.223.55.10])
 by orviesa008.jf.intel.com with ESMTP; 24 Feb 2026 09:07:38 -0800
From: himanshu.girotra@intel.com
To: matthew.d.roper@intel.com, x.wang@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t] lib/intel_pat: use kernel debugfs as authoritative
 PAT source for Xe
Date: Tue, 24 Feb 2026 22:37:37 +0530
Message-ID: <20260224170737.12151-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.50.1
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

IGT should treat the kernel as authoritative for PAT configuration
rather than replicating platform-specific logic and workaround
adjustments in hardcoded tables, which is error-prone as PAT layouts
vary across platforms.

For Xe devices, query pat_sw_config from debugfs instead of using
hardcoded PAT indices. Remove the Xe-only hardcoded entries and
retain the i915 fallback for older platforms.

Drop the now-redundant max_index assert in pat_sanity().

v2: Drop redundant index asserts; instead validate actual PAT register contents for correct cache types (Matt Roper)

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Xin Wang <x.wang@intel.com>
Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_pat.c      | 37 ++++++++++----------
 tests/intel/xe_pat.c | 81 ++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 94 insertions(+), 24 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 9815efc18..8660a2515 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -96,24 +96,27 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
 
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
+	uint16_t dev_id;
+
+	/*
+	 * For Xe driver, query the kernel's PAT software configuration
+	 * via debugfs. The kernel is the authoritative source for PAT
+	 * indices, accounting for platform-specific workarounds
+	 * (e.g. Wa_16023588340) at runtime.
+	 */
+	if (is_xe_device(fd)) {
+		int32_t parsed = xe_get_pat_sw_config(fd, pat);
+
+		igt_assert_f(parsed > 0,
+			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
+			     parsed);
+		return;
+	}
 
-	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
-		pat->uc = 3;
-		pat->wb = 2;
-		pat->max_index = 31;
-	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
-		   intel_get_device_info(dev_id)->graphics_ver == 20) {
-		pat->uc = 3;
-		pat->wt = 15; /* Compressed + WB-transient */
-		pat->wb = 2;
-		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
-		pat->max_index = 31;
-
-		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
-		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
-			pat->max_index -= 4;
-	} else if (IS_METEORLAKE(dev_id)) {
+	/* i915 fallback: hardcoded PAT indices */
+	dev_id = intel_get_drm_devid(fd);
+
+	if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
 		pat->wt = 1;
 		pat->wb = 3;
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 21547c84e..6ad6adab7 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -103,6 +103,57 @@ static void userptr_coh_none(int fd)
 #define COH_MODE_1WAY		2
 #define COH_MODE_2WAY		3
 
+/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
+#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
+
+static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
+{
+	if (gfx_ver >= IP_VER(20, 0))
+		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
+		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
+
+	if (gfx_ver >= IP_VER(12, 70))
+		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
+
+	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 0;
+}
+
+static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
+{
+	if (gfx_ver >= IP_VER(20, 0)) {
+		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
+
+		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD;
+	}
+
+	if (gfx_ver >= IP_VER(12, 70))
+		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WB;
+
+	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 3;
+}
+
+static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat)
+{
+	if (gfx_ver >= IP_VER(20, 0))
+		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
+		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
+
+	if (gfx_ver >= IP_VER(12, 70))
+		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
+
+	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 2;
+}
+
+static bool pat_entry_is_uc_comp(unsigned int gfx_ver, uint32_t pat)
+{
+	if (gfx_ver >= IP_VER(20, 0))
+		return !!(pat & XE2_COMP_EN) &&
+		       REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
+		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
+
+	return false;
+}
+
 static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 {
 	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
@@ -120,13 +171,14 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 static void pat_sanity(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
+	unsigned int gfx_ver = intel_graphics_ver(dev_id);
 	struct intel_pat_cache pat_sw_config = {};
 	int32_t parsed;
 	bool has_uc_comp = false, has_wt = false;
 
 	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
 
-	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
+	if (gfx_ver >= IP_VER(20, 0)) {
 		for (int i = 0; i < parsed; i++) {
 			uint32_t pat = pat_sw_config.entries[i].pat;
 			if (pat_sw_config.entries[i].rsvd)
@@ -144,13 +196,28 @@ static void pat_sanity(int fd)
 	} else {
 		has_wt = true;
 	}
-	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
-	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
-	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
+
+	/*
+	 * Validate that the selected PAT indices actually have the expected
+	 * cache types rather than comparing against hardcoded values.
+	 */
+	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config.uc].pat),
+		     "UC index %d does not point to an uncached entry (pat=0x%x)\n",
+		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
+	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
+		     "WB index %d does not point to a WB/XA/XD entry (pat=0x%x)\n",
+		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
 	if (has_wt)
-		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
-	if (has_uc_comp)
-		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
+		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
+			     "WT index %d does not point to a WT entry (pat=0x%x)\n",
+			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
+	if (has_uc_comp) {
+		uint32_t uc_comp_pat = pat_sw_config.entries[pat_sw_config.uc_comp].pat;
+
+		igt_assert_f(pat_entry_is_uc_comp(gfx_ver, uc_comp_pat),
+			     "UC_COMP index %d does not point to a compressed UC entry (pat=0x%x)\n",
+			     pat_sw_config.uc_comp, uc_comp_pat);
+	}
 }
 
 /**
-- 
2.50.1

