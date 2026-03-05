Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E92EFCE56
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 00:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075F910EAED;
	Thu,  5 Mar 2026 00:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z0Hawcr/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93BF10E1AC
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772670652; x=1804206652;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kLe0UkkiIkskzmHNcVsg1Zt7VAZMzPOgg4jiNHl8qto=;
 b=Z0Hawcr/AfiEA+UMTTl3xIy5awDb5aBPCZwO+NKW8AVc+fCvarYFYqEv
 oLRUy2XZkd54VDJdx8sdo1RObGuirxhBKUwuMypkAa3foRTKYA/mYLrZ0
 vaXx87lC5K1uKCLoreO9Ljqpfz6IRf9b1XRG5HaoZIrsymeuiI/XjjlTw
 5kyjYcE7f7Qsjl/EqXQ4s6CaFjuRPugn5GSHH9jw2s03IVpjmO+99dTOi
 5YlpPbFG3U393eL3IkQmA5OItf0L/+h1y8PQ5ZNKZydbNG01ER1G65Sah
 NAKrpWPnMZjycYSbRyL/3JAxeswCfZ57+qtHcQmpgDmiekUYtOjexsYmF g==;
X-CSE-ConnectionGUID: ekSPt601RrCGKEsQQcX3bQ==
X-CSE-MsgGUID: jdlPd7c8SwytVghyBrPxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="99215012"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="99215012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 16:30:51 -0800
X-CSE-ConnectionGUID: CqsHgboDQDeFT/ZN8LcdnA==
X-CSE-MsgGUID: QIOLL88NSTq4CscY0neL6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="248981854"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 16:30:52 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himanshu.girotra@intel.com,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t] Revert "lib/intel_pat: use kernel debugfs as
 authoritative PAT source for Xe"
Date: Wed,  4 Mar 2026 16:30:47 -0800
Message-ID: <20260305003047.2290389-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

This reverts commit 4e59b8e7779b04ba982cd5b17c023511ee2f0ed7.

This patch caused a major regression in xe_oa tests and should not have
been merged. Revert for now and re-merge after the regression is fixed.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_pat.c      | 37 ++++++++++----------
 tests/intel/xe_pat.c | 80 ++++----------------------------------------
 2 files changed, 24 insertions(+), 93 deletions(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 8660a25153..9815efc187 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -96,27 +96,24 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
 
 static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
-	uint16_t dev_id;
-
-	/*
-	 * For Xe driver, query the kernel's PAT software configuration
-	 * via debugfs. The kernel is the authoritative source for PAT
-	 * indices, accounting for platform-specific workarounds
-	 * (e.g. Wa_16023588340) at runtime.
-	 */
-	if (is_xe_device(fd)) {
-		int32_t parsed = xe_get_pat_sw_config(fd, pat);
-
-		igt_assert_f(parsed > 0,
-			     "Failed to get PAT sw_config from debugfs (parsed=%d)\n",
-			     parsed);
-		return;
-	}
-
-	/* i915 fallback: hardcoded PAT indices */
-	dev_id = intel_get_drm_devid(fd);
+	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	if (IS_METEORLAKE(dev_id)) {
+	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
+		pat->uc = 3;
+		pat->wb = 2;
+		pat->max_index = 31;
+	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
+		   intel_get_device_info(dev_id)->graphics_ver == 20) {
+		pat->uc = 3;
+		pat->wt = 15; /* Compressed + WB-transient */
+		pat->wb = 2;
+		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
+		pat->max_index = 31;
+
+		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
+		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
+			pat->max_index -= 4;
+	} else if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
 		pat->wt = 1;
 		pat->wb = 3;
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index ab519aab0f..21547c84e7 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -103,55 +103,6 @@ static void userptr_coh_none(int fd)
 #define COH_MODE_1WAY		2
 #define COH_MODE_2WAY		3
 
-/* Pre-Xe2 PAT bit fields (from kernel xe_pat.c) */
-#define XELP_MEM_TYPE_MASK	GENMASK(1, 0)
-
-static bool pat_entry_is_uc(unsigned int gfx_ver, uint32_t pat)
-{
-	if (gfx_ver >= IP_VER(20, 0))
-		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
-		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
-
-	if (gfx_ver >= IP_VER(12, 70))
-		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC;
-
-	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 0;
-}
-
-static bool pat_entry_is_wb(unsigned int gfx_ver, uint32_t pat)
-{
-	if (gfx_ver >= IP_VER(20, 0)) {
-		uint32_t l3 = REG_FIELD_GET(XE2_L3_POLICY, pat);
-
-		return l3 == L3_CACHE_POLICY_WB || l3 == L3_CACHE_POLICY_XD;
-	}
-
-	if (gfx_ver >= IP_VER(12, 70))
-		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WB;
-
-	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 3;
-}
-
-static bool pat_entry_is_wt(unsigned int gfx_ver, uint32_t pat)
-{
-	if (gfx_ver >= IP_VER(20, 0))
-		return REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
-		       REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
-
-	if (gfx_ver >= IP_VER(12, 70))
-		return REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT;
-
-	return REG_FIELD_GET(XELP_MEM_TYPE_MASK, pat) == 2;
-}
-
-static bool pat_entry_is_compressed(unsigned int gfx_ver, uint32_t pat)
-{
-	if (gfx_ver < IP_VER(20, 0))
-		return false;
-
-	return !!(pat & XE2_COMP_EN);
-}
-
 static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 {
 	int32_t parsed = xe_get_pat_sw_config(fd, pat_sw_config);
@@ -169,14 +120,13 @@ static int xe_fetch_pat_sw_config(int fd, struct intel_pat_cache *pat_sw_config)
 static void pat_sanity(int fd)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
-	unsigned int gfx_ver = intel_graphics_ver(dev_id);
 	struct intel_pat_cache pat_sw_config = {};
 	int32_t parsed;
 	bool has_uc_comp = false, has_wt = false;
 
 	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
 
-	if (gfx_ver >= IP_VER(20, 0)) {
+	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
 		for (int i = 0; i < parsed; i++) {
 			uint32_t pat = pat_sw_config.entries[i].pat;
 			if (pat_sw_config.entries[i].rsvd)
@@ -194,29 +144,13 @@ static void pat_sanity(int fd)
 	} else {
 		has_wt = true;
 	}
-
-	/*
-	 * Validate that the selected PAT indices actually have the expected
-	 * cache types rather than comparing against hardcoded values.
-	 */
-	igt_assert_f(pat_entry_is_uc(gfx_ver, pat_sw_config.entries[pat_sw_config.uc].pat),
-		     "UC index %d does not point to an uncached entry (pat=%#x)\n",
-		     pat_sw_config.uc, pat_sw_config.entries[pat_sw_config.uc].pat);
-	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
-		     "WB index %d does not point to a WB/XA/XD entry (pat=%#x)\n",
-		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
+	igt_assert_eq(pat_sw_config.max_index, intel_get_max_pat_index(fd));
+	igt_assert_eq(pat_sw_config.uc, intel_get_pat_idx_uc(fd));
+	igt_assert_eq(pat_sw_config.wb, intel_get_pat_idx_wb(fd));
 	if (has_wt)
-		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
-			     "WT index %d does not point to a WT entry (pat=%#x)\n",
-			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
-	if (has_uc_comp) {
-		uint32_t uc_comp_pat = pat_sw_config.entries[pat_sw_config.uc_comp].pat;
-
-		igt_assert_f(pat_entry_is_compressed(gfx_ver, uc_comp_pat) &&
-			     pat_entry_is_uc(gfx_ver, uc_comp_pat),
-			     "UC_COMP index %d does not point to a compressed UC entry (pat=%#x)\n",
-			     pat_sw_config.uc_comp, uc_comp_pat);
-	}
+		igt_assert_eq(pat_sw_config.wt, intel_get_pat_idx_wt(fd));
+	if (has_uc_comp)
+		igt_assert_eq(pat_sw_config.uc_comp, intel_get_pat_idx_uc_comp(fd));
 }
 
 /**
-- 
2.48.1

