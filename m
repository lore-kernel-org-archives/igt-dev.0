Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24030D358EE
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 09:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB22610E844;
	Thu, 29 Jan 2026 09:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UlapDsrX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7293010E78B
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 00:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769646710; x=1801182710;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cwYAwUTeegPpglLhRVFjc1058DoPrkp9V5l4LbiFjxI=;
 b=UlapDsrXgVFVk5ygPAB35+hZl3Ywb+RU8daW20dU8epSAe3GnZ71QpOp
 5fUDyZoOveTv8xNlabo0vsvPVxO47Bb1Nx3cEkEy7Z9/69GmZB6ClOzUQ
 W7YZp1q9SdgIYR4gJsNfwb95+RSYkizuFtk+tajJnJbr5n9Lr9OiZmML0
 JBRg5fe5s18fM250u6IsL5cofu1luBUfyJ0WBswCjxJRd33gGjPC6WurL
 pC5t3U5DcGHp54b14CTZsfCZOQnsiH9JcUtaZmR991eWQ4x2tTOF//qVi
 qv4xqQkoR9lE076cTcy5bjv9K82WGNavuti/U9oF1bB2AuMGe+w3Urpgn Q==;
X-CSE-ConnectionGUID: xk+bfLf5Sry7zVXS1m1btw==
X-CSE-MsgGUID: J1OUeG9xQnqjLuzHBGOF0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69889065"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="69889065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 16:31:49 -0800
X-CSE-ConnectionGUID: 7LZj54eLQl6q9Xh/Nb5RiQ==
X-CSE-MsgGUID: wYmmLdedRMCq9XmJHOCzRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="208207123"
Received: from dut6094bmgfrd.fm.intel.com ([10.80.55.45])
 by orviesa009.jf.intel.com with ESMTP; 28 Jan 2026 16:31:48 -0800
From: Jia Yao <jia.yao@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jia Yao <jia.yao@intel.com>
Subject: [PATCH] tests/intel/xe_exec_system_allocator: Expect UC PAT madvise
 rejection
Date: Thu, 29 Jan 2026 00:31:46 +0000
Message-ID: <20260129003146.340181-1-jia.yao@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 29 Jan 2026 09:51:23 +0000
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

UC PAT index with CPU cached memory (system allocator) is now rejected
by kernel to prevent security issues where GPU could bypass CPU cache
and read stale sensitive data from DRAM.

Modify UC PAT index tests to verify kernel correctly rejects the madvise
call with -EINVAL, instead of attempting to execute batch buffers.

UC_COMP tests are not affected as they require VRAM which uses different
caching.

Signed-off-by: Jia Yao <jia.yao@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 44 ++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 20282fe8a..41194e460 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -2604,6 +2604,50 @@ int igt_main()
 			     !xe_has_vram(fd)) {
 				igt_skip("Skipping compression-related PAT index\n");
 			}
+
+			/*
+			 * UC PAT index with CPU cached memory (system allocator)
+			 * is rejected by kernel to prevent security issues.
+			 * Only verify madvise returns -EINVAL.
+			 */
+			if (strstr(s->name, "madvise-pat-idx-uc-")) {
+				struct drm_xe_sync sync[1] = {
+					{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
+					.flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+				};
+				uint64_t addr;
+				uint32_t vm;
+				void *data;
+				int err;
+				uint64_t bind_sync = 0;
+
+				vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
+						  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
+				data = aligned_alloc(SZ_4K, SZ_4M);
+				igt_assert(data);
+				memset(data, 0, SZ_4M);
+				addr = to_user_pointer(data);
+
+				/* Bind memory to create VMA first */
+				sync[0].addr = to_user_pointer(&bind_sync);
+				sync[0].timeline_value = 1;
+				__xe_vm_bind_assert(fd, vm, 0, 0, 0, addr, SZ_4M,
+						    DRM_XE_VM_BIND_OP_MAP,
+						    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+						    sync, 1, 0, 0);
+				xe_wait_ufence(fd, &bind_sync, 1, 0, FIVE_SEC);
+
+				/* Now madvise should fail with -EINVAL */
+				err = __xe_vm_madvise(fd, vm, addr, SZ_4M, 0,
+						      DRM_XE_MEM_RANGE_ATTR_PAT,
+						      s->fn(fd), 0, 0);
+				igt_assert_eq(err, -EINVAL);
+
+				free(data);
+				xe_vm_destroy(fd, vm);
+				continue;
+			}
+
 			xe_for_each_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, SZ_4M, 0, 0, NULL, NULL, s->flags, s->fn);
 		}
-- 
2.43.0

