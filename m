Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 467FDFB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:28:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB5510E2EC;
	Mon,  6 Apr 2026 22:28:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PQnhIDN7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A1E10E2E2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514440; x=1807050440;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NdqM9fZYZo6Xlesg+TaijY9jEQEQzXvyvvc3FJq6Cwg=;
 b=PQnhIDN7kT8XUZX1YpV46D1mzarsKFHs4EKp4tqRnKVKpCTZRTNm/tuJ
 JEAFWYBXYur8XQY+iAs/mWzkh9dzld9Ian0PrCppDzuJfzqdzh31Smg9S
 vh59nIIggZ8vN/rZdc2BDAQCyRkavX9d2vY4vAST832rnYXW1W8v/2qOR
 1wS4Fgpo5AOZu5R8CAuwYlgoVFE5ZItmpLPFD/WItdD+5ZAW7dy3fY4kG
 n97n1u6ygas5ppn+/Uzm0L4nT9WVE2bXeszSqG/7XwmhLagtwCh7FT3ya
 W2WK8YRssbmzas0jj4KivFPlMSi4NfQ1TLTnynx6Tyy5ArKeHGfm7zXbZ Q==;
X-CSE-ConnectionGUID: KAw/DymvQBKrhgjWRv98oQ==
X-CSE-MsgGUID: QxC3l+KxToiluFavfhJfsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="99094823"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="99094823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:27:19 -0700
X-CSE-ConnectionGUID: ShppIrEwTpqcsuWfi8MeJw==
X-CSE-MsgGUID: 0riL+TkhTJOsWwLtU+FV+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="221416454"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:27:18 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 4/5] tests/intel/xe_pat: detect wt support from cached PAT
 entries
Date: Mon,  6 Apr 2026 22:27:02 +0000
Message-ID: <20260406222703.3217769-5-zongyao.bai@intel.com>
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

Use local_pat_cache.has_wt instead of hardcoded platform checks when
validating and exercising wt PAT modes.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 64 +++++++++++++++++++++++---------------------
 1 file changed, 34 insertions(+), 30 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 94c82ff29..c799c7b67 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -136,10 +136,12 @@ static void userptr_coh_none(int fd)
 				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
 				   intel_get_pat_idx_uc(fd), 0),
 		      -EINVAL);
-	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
-				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
-				   intel_get_pat_idx_wt(fd), 0),
-		      -EINVAL);
+	if (local_pat_cache.has_wt) {
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
+					   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
+					   intel_get_pat_idx_wt(fd), 0),
+			      -EINVAL);
+	}
 	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
 				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
 				   XE_PAT_IDX_XA_UC, 0),
@@ -254,28 +256,26 @@ static void pat_sanity(int fd)
 	uint16_t dev_id = intel_get_drm_devid(fd);
 	unsigned int gfx_ver = intel_graphics_ver(dev_id);
 	struct intel_pat_cache pat_sw_config = {};
-	int32_t parsed;
-	bool has_uc_comp = false, has_wt = false;
+	bool has_uc_comp = false;
+
+	xe_fetch_pat_sw_config(fd, &pat_sw_config);
 
-	parsed = xe_fetch_pat_sw_config(fd, &pat_sw_config);
+	if (local_pat_cache.has_comp_en) {
+		for (int i = 0; i < local_pat_cache.n_entries; i++) {
+			struct local_pat_entry *e = &local_pat_cache.entries[i];
 
-	if (gfx_ver >= IP_VER(20, 0)) {
-		for (int i = 0; i < parsed; i++) {
-			uint32_t pat = pat_sw_config.entries[i].pat;
-			if (pat_sw_config.entries[i].rsvd)
+			if (e->rsvd)
+				continue;
+
+			if (!e->comp_en)
 				continue;
-			if (!!(pat & XE2_COMP_EN) &&
-			    REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_UC &&
-			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_UC) {
+
+			if (e->l3_policy == L3_CACHE_POLICY_UC &&
+			    e->l4_policy == L4_CACHE_POLICY_UC) {
 				has_uc_comp = true;
-			}
-			if (REG_FIELD_GET(XE2_L3_POLICY, pat) == L3_CACHE_POLICY_XD &&
-			    REG_FIELD_GET(XE2_L4_POLICY, pat) == L4_CACHE_POLICY_WT) {
-				has_wt = true;
+				break;
 			}
 		}
-	} else {
-		has_wt = true;
 	}
 
 	/*
@@ -288,7 +288,7 @@ static void pat_sanity(int fd)
 	igt_assert_f(pat_entry_is_wb(gfx_ver, pat_sw_config.entries[pat_sw_config.wb].pat),
 		     "WB index %d does not point to a WB/XA/XD entry (pat=%#x)\n",
 		     pat_sw_config.wb, pat_sw_config.entries[pat_sw_config.wb].pat);
-	if (has_wt)
+	if (local_pat_cache.has_wt)
 		igt_assert_f(pat_entry_is_wt(gfx_ver, pat_sw_config.entries[pat_sw_config.wt].pat),
 			     "WT index %d does not point to a WT entry (pat=%#x)\n",
 			     pat_sw_config.wt, pat_sw_config.entries[pat_sw_config.wt].pat);
@@ -400,11 +400,13 @@ static void pat_index_all(int fd)
 		      0);
 	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
 
-	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
-				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
-				   intel_get_pat_idx_wt(fd), 0),
-		      0);
-	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+	if (local_pat_cache.has_wt) {
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+					   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+					   intel_get_pat_idx_wt(fd), 0),
+			      0);
+		xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+	}
 
 	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
@@ -474,10 +476,12 @@ static void pat_index_all(int fd)
 				   intel_get_pat_idx_uc(fd), 0),
 		      -EINVAL);
 
-	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
-				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
-				   intel_get_pat_idx_wt(fd), 0),
-		      -EINVAL);
+	if (local_pat_cache.has_wt) {
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+					   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+					   intel_get_pat_idx_wt(fd), 0),
+			      -EINVAL);
+	}
 
 	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
-- 
2.43.0

