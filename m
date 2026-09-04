Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B9F8C79F80
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 08:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1910F92C;
	Fri,  4 Sep 2026 08:13:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kipyO9pX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C181010E423
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 08:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788509455; x=1820045455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PUnzeMofUzaaZTKtRkeIXfWgZX8cxHeogThu6X23xf0=;
 b=kipyO9pX/9JuQU9XadMkWd3fMWkiIEJBskcqsfLOQ3FkDTy84aFcswL2
 6UryCXFVlt80DT+lUf4y64T8gyi5VazC98A/9sIpYdf2V50l5MyONrhPw
 s3v4sTCpwbWhgoI82YXJZnML3YjsI749iooO8+67fFO7SEGvz5LmKUe86
 GsC3tmpLefLUXjP4RqpnTxjr+g7jjLKFJHmDfxD/c1AW4Ft+TDBHiyA25
 /+Kr7PAvlT1usnyxP5BC2fnjX5BTYf2EkenibeBsya8XmDR2GhU3TQcpH
 9konihHxjfyQLuE0o36IW0ozi94usyd+oU69irnr4CNMPdOLZg0yb58P9 A==;
X-CSE-ConnectionGUID: qGKt8GadRY+F4faWWpdp9g==
X-CSE-MsgGUID: GLMITcC3T/24uxqt2nHqdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100166345"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100166345"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:10:55 -0700
X-CSE-ConnectionGUID: Sh0KNlvIT6m7fzDs+f0obA==
X-CSE-MsgGUID: G1SOdTKHQ/OXUBh5CWjp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="267399592"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 01:10:54 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pat: skip the write-through checks
 without a WT index
Date: Fri,  4 Sep 2026 14:26:50 +0530
Message-Id: <20260904085650.98553-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260904085650.98553-1-sujaritha.sundaresan@intel.com>
References: <20260904085650.98553-1-sujaritha.sundaresan@intel.com>
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

On platforms with no write-through entry in the PAT table
intel_get_pat_idx_wt() hands back the UC index, so userptr-coh-none,
pat-index-all and l2-flush-opt-svm-pat-restrict each repeat their UC
check under a "wt" label and report coverage they do not have.

Gate those three on intel_pat_has_wt() so the write-through checks only
run where a distinct write-through index exists. Platforms which do have
one are unaffected.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel/xe_pat.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 9dd4ffb69..060e65aa0 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -86,10 +86,11 @@ static void userptr_coh_none(int fd)
 				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
 				   intel_get_pat_idx_uc(fd), 0),
 		      -EINVAL);
-	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
-				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
-				   intel_get_pat_idx_wt(fd), 0),
-		      -EINVAL);
+	if (intel_pat_has_wt(fd))
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
+					   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
+					   intel_get_pat_idx_wt(fd), 0),
+			      -EINVAL);
 	igt_assert_eq(__xe_vm_bind(fd, vm, 0, 0, to_user_pointer(data), 0x40000,
 				   size, DRM_XE_VM_BIND_OP_MAP_USERPTR, 0, NULL, 0, 0,
 				   XE_PAT_IDX_XA_UC, 0),
@@ -323,6 +324,7 @@ static void pat_sw_hw_compare(int fd, enum pat_test_opts opts)
  */
 static void pat_index_all(int fd)
 {
+	bool has_wt = intel_pat_has_wt(fd);
 	size_t size = xe_get_default_alignment(fd);
 	struct intel_pat_cache pat_sw_config = {};
 	uint32_t vm, bo;
@@ -339,11 +341,13 @@ static void pat_index_all(int fd)
 		      0);
 	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
 
-	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
-				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
-				   intel_get_pat_idx_wt(fd), 0),
-		      0);
-	xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+	if (has_wt) {
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+					   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+					   intel_get_pat_idx_wt(fd), 0),
+			      0);
+		xe_vm_unbind_sync(fd, vm, 0, 0x40000, size);
+	}
 
 	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
@@ -413,10 +417,11 @@ static void pat_index_all(int fd)
 				   intel_get_pat_idx_uc(fd), 0),
 		      -EINVAL);
 
-	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
-				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
-				   intel_get_pat_idx_wt(fd), 0),
-		      -EINVAL);
+	if (has_wt)
+		igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
+					   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
+					   intel_get_pat_idx_wt(fd), 0),
+			      -EINVAL);
 
 	igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 				   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
@@ -878,9 +883,10 @@ static void l2_flush_opt_svm_pat_restrict(int fd)
 					0, DRM_XE_MEM_RANGE_ATTR_PAT,
 					intel_get_pat_idx_uc(fd), 0, 0), -EINVAL);
 
-	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
-					0, DRM_XE_MEM_RANGE_ATTR_PAT,
-					intel_get_pat_idx_wt(fd), 0, 0), -EINVAL);
+	if (intel_pat_has_wt(fd))
+		igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
+					      0, DRM_XE_MEM_RANGE_ATTR_PAT,
+					      intel_get_pat_idx_wt(fd), 0, 0), -EINVAL);
 
 	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
 					0, DRM_XE_MEM_RANGE_ATTR_PAT,
-- 
2.34.1

