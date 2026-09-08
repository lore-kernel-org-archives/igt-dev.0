Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E3FC79F82
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 07:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356E510EA25;
	Tue,  8 Sep 2026 07:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YQ2Hjt6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5553C10EA25
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788852597; x=1820388597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IZY4nZP/NdJp94OWcdzGr4O58OKmjzD1c/DQFPvBPDg=;
 b=YQ2Hjt6IStf7rR/F47o26q3qR3q62PNTDoZUKCef/HSyYdPlIg2lX84f
 rqUpIJHR6JyBklqLUUm7WlT5VE9BrTMD2dcOrto6GkNTkjPZUWsMDK93n
 9DEvS6OY9rxK5ty/SxqqBv2lRVsIlKeUKOgT5JBETQyfiWjh3ZGtGXPEQ
 shZr/bVqBN8Ey7QwaQLz/G71TzWB3c7JWlv1I6+GbAoU0XfWOFhJD3oVo
 pQE2G6vznSvsVdC13DkPvz1ovyHuApBx63dMHAz0OQf6HHEatI7Ptl4MA
 4mphZbWJU6zLV6cKbv4Z5SoewMCnBSq3vVPz8R0fLaAnWir+RX3fmqp48 A==;
X-CSE-ConnectionGUID: l6WdqFPtRu2t7ouwRql/Tw==
X-CSE-MsgGUID: ZKzhDthNR16JO6qLng09SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="106761212"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="106761212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:29:57 -0700
X-CSE-ConnectionGUID: Mt7RYCZIQFq7D0fkO2ao2g==
X-CSE-MsgGUID: BkVWRxsSSlOXCI3qBxtudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; d="scan'208";a="274702058"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2026 00:29:56 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, andrzej.hajda@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_pat: skip the write-through
 checks without a WT index
Date: Tue,  8 Sep 2026 13:47:28 +0530
Message-Id: <20260908081728.119942-3-sujaritha.sundaresan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260908081728.119942-1-sujaritha.sundaresan@intel.com>
References: <20260908081728.119942-1-sujaritha.sundaresan@intel.com>
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

Gate those three on intel_has_pat_wt() so the write-through checks only
run where a distinct write-through index exists. Platforms which do have
one are unaffected.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 tests/intel/xe_pat.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 9dd4ffb69..9706b2dd5 100644
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
+	if (intel_has_pat_wt(fd))
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
+	bool has_wt = intel_has_pat_wt(fd);
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
+	if (intel_has_pat_wt(fd))
+		igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
+					      0, DRM_XE_MEM_RANGE_ATTR_PAT,
+					      intel_get_pat_idx_wt(fd), 0, 0), -EINVAL);
 
 	igt_assert_eq(__xe_vm_madvise(fd, vm, to_user_pointer(buffer), size,
 					0, DRM_XE_MEM_RANGE_ATTR_PAT,
-- 
2.34.1

