Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDBF46C71
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 18:42:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1B210E29E;
	Mon,  6 Apr 2026 18:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlfjJSt+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EAF110E29C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 18:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775500949; x=1807036949;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FsOUtLOkoMXfPB2d6EBA0vlagv0/g23SrRiovXJ6SgE=;
 b=WlfjJSt+aoxAvBxX29dvHJ2AJcuHmLvrqdYp6VoQUuJj7r3o9orkvvd5
 4tfGsUwL4oTF76FEgmrglC/+H3H9aGkNiBY9aKVqF3lDUUiffdLs/v0yR
 nwNvwSMRWYm3dtW474QtyIgM5PmxFZWrsM4apX6LvshxmGOlBOPCJ/Jjq
 uMsy95gdoXApWHNw9fV5lRKIfhTRmOXpNo15X1HXX5IAS95rRYyr+3I9v
 uye1z6oXOS8gyPZS5OqkfbbJe9Vd68DgtpUvivBij9AA70FnoYGqm83tJ
 9bkiAO6hSa/ZKPwO3Ef+9Q28snipYImQ19UAOjGHMDoispobcDhipuVN1 g==;
X-CSE-ConnectionGUID: 6mzqaAByRYO+zwfj+cDd6g==
X-CSE-MsgGUID: +wrSMnyWRpOG2ZUakdcxuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80342967"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80342967"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:42:28 -0700
X-CSE-ConnectionGUID: WNAa2TaFRUitszkpk629Tw==
X-CSE-MsgGUID: Hw396McmTUum7vYFp9iG7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225193411"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 11:42:27 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 4/4] tests/xe: Add large VMA range tests for better coverage
Date: Mon,  6 Apr 2026 18:42:31 +0000
Message-ID: <20260406184226.1294486-10-brian3.nguyen@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406184226.1294486-6-brian3.nguyen@intel.com>
References: <20260406184226.1294486-6-brian3.nguyen@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

Add tests that require multi-binds to ensure that the handling of PTEs
are behaving as expected even in split VMA ranges.

Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
---
 tests/intel/xe_page_reclaim.c | 147 ++++++++++++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/tests/intel/xe_page_reclaim.c b/tests/intel/xe_page_reclaim.c
index 6cc29d8d3..3bd44285c 100644
--- a/tests/intel/xe_page_reclaim.c
+++ b/tests/intel/xe_page_reclaim.c
@@ -107,6 +107,20 @@ static void compare_prl_stats(struct xe_prl_stats *before, struct xe_prl_stats *
 		      expected->prl_aborted_count);
 }
 
+static void xe_vm_null_bind_sync(int fd, uint32_t vm, uint64_t addr, uint64_t size)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = syncobj_create(fd, 0),
+	};
+
+	xe_vm_bind_async_flags(fd, vm, 0, 0, 0, addr, size, &sync, 1,
+			       DRM_XE_VM_BIND_FLAG_NULL);
+	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
+	syncobj_destroy(fd, sync.handle);
+}
+
 /* Helper with more flexibility on unbinding and offsets */
 static void vma_range_list_with_unbind_and_offsets(int fd, const uint64_t *vma_sizes, unsigned int n_vmas,
 				 uint64_t start_addr, uint64_t unbind_size, const uint64_t *vma_offsets)
@@ -623,6 +637,130 @@ static void test_pat_index_xd(int fd)
 	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
 }
 
+/**
+ * SUBTEST: binds-large-split
+ * Description: Bind a large BO (256MB + 4K) split across two adjacent
+ *      VM bind operations at non-2M-aligned boundaries, then unbind each
+ *      range separately to verify that page reclamation correctly handles
+ *      split binds producing a mix of 2M and 4K PRL entries across two
+ *      distinct page reclaim list operations.
+ */
+static void test_binds_large_split(int fd)
+{
+	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
+
+	uint64_t bo_size = SZ_256M;
+	uint64_t split_offset = SZ_4K;
+	uint32_t bo, vm;
+
+	uint64_t addr = (1ull << 30);
+
+	expected_stats.prl_4k_entry_count = 1;
+	expected_stats.prl_64k_entry_count = 0;
+	expected_stats.prl_2m_entry_count = 128;
+	expected_stats.prl_issued_count = 2;
+	expected_stats.prl_aborted_count = 0;
+
+	stats_before = get_prl_stats(fd, 0);
+
+	vm = xe_vm_create(fd, 0, 0);
+	/* Slightly larger BO to see behavior of split */
+	bo = xe_bo_create(fd, 0, bo_size + split_offset, system_memory(fd), 0);
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size / 2);
+	xe_vm_bind_sync(fd, vm, bo, bo_size / 2, addr + bo_size / 2, bo_size / 2 + split_offset);
+	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size / 2);
+	xe_vm_unbind_sync(fd, vm, 0, addr + bo_size / 2, bo_size / 2 + split_offset);
+
+	stats_after = get_prl_stats(fd, 0);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+
+	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
+}
+
+/**
+ * SUBTEST: binds-full-pd
+ * Description: Fill almost an entire 1G page directory (1G minus 4K)
+ *      by splitting a single BO across two adjacent VM bind operations,
+ *      then unbind each range separately to verify correct page reclamation
+ *      when most entries of a page directory are present, producing a mix
+ *      of 2M, 64K, and 4K PRL entries across two page reclaim list
+ *      operations.
+ */
+static void test_binds_full_pd(int fd)
+{
+	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
+	uint32_t bo, vm;
+	uint64_t addr = (1ull << 30);
+
+	expected_stats.prl_4k_entry_count = 15;
+	expected_stats.prl_64k_entry_count = 31;
+	expected_stats.prl_2m_entry_count = 511;
+	expected_stats.prl_issued_count = 2;
+	expected_stats.prl_aborted_count = 0;
+
+	stats_before = get_prl_stats(fd, 0);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, 0, SZ_1G - SZ_4K, system_memory(fd), 0);
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, SZ_512M);
+	xe_vm_bind_sync(fd, vm, bo, SZ_512M, addr + SZ_512M, SZ_512M - SZ_4K);
+	xe_vm_unbind_sync(fd, vm, 0, addr, SZ_512M);
+	xe_vm_unbind_sync(fd, vm, 0, addr + SZ_512M, SZ_512M - SZ_4K);
+
+	stats_after = get_prl_stats(fd, 0);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+
+	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
+}
+
+/**
+ * SUBTEST: binds-null-vma
+ * Description: Verify handling of null VMAs by creating a VM with real
+ *      BO mappings followed by a large null VMA mapping, then trigger
+ *      page reclamation across the entire range.
+ */
+static void test_binds_null_vma(int fd)
+{
+	struct xe_prl_stats stats_before, stats_after, expected_stats = { 0 };
+	uint32_t bo, vm;
+	/* 512G aligned */
+	uint64_t addr = 0;
+
+	/*
+	 * Layout:
+	 *   [0,      2M)      : real 2M BO   → allocates the level-3[0] subtree
+	 *   [2M,  512G)       : null VMA     → fills the rest of the level-3[0] span
+	 *   UNMAP [0, 512G)   → walk covers exactly one level-3 entry (512G each)
+	 *
+	 * Only the real 2M BO produces a PRL entry; the null VMA has no
+	 * hardware PTEs and is skipped by the page-reclaim walker.
+	 */
+	expected_stats.prl_4k_entry_count = 0;
+	expected_stats.prl_64k_entry_count = 0;
+	expected_stats.prl_2m_entry_count = 1;
+	expected_stats.prl_issued_count = 1;
+	expected_stats.prl_aborted_count = 0;
+
+	stats_before = get_prl_stats(fd, 0);
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, 0, SZ_2M, system_memory(fd), 0);
+	xe_vm_bind_sync(fd, vm, bo, 0, addr, SZ_2M);
+	xe_vm_null_bind_sync(fd, vm, addr + SZ_2M, 512ull * SZ_1G - SZ_2M);
+	xe_vm_unbind_sync(fd, vm, 0, addr, 512ull * SZ_1G);
+
+	stats_after = get_prl_stats(fd, 0);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+
+	compare_prl_stats(&stats_before, &stats_after, &expected_stats);
+}
+
 int igt_main()
 {
 	int fd;
@@ -674,6 +812,15 @@ int igt_main()
 	igt_subtest("pat-index-xd")
 		test_pat_index_xd(fd);
 
+	igt_subtest("binds-large-split")
+		test_binds_large_split(fd);
+
+	igt_subtest("binds-full-pd")
+		test_binds_full_pd(fd);
+
+	igt_subtest("binds-null-vma")
+		test_binds_null_vma(fd);
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

