Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB52C982D0
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 19:19:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2916910F08A;
	Thu, 17 Sep 2026 19:19:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EcfyydGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B619210F08A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789672752; x=1821208752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jz4ae+HW4z/dcPkNM4TPq54XNbYErhwsjjiQWrQi3Is=;
 b=EcfyydGL62GHGMAJeg979ZEhso3g3ed7g6F/6MVfj5FXdfE866wTeGo/
 fsQQ6Z8MDwVpCCaQ2NeKHFHWc1g2i/DiIWToHvzP5SYd7CkDFacblHtqZ
 qXwRAobgIUQygK9HltxMJOCaP7MMdXUiwT0MiGAvlwamzunIDYnvhegYV
 TK3pcHjtKuNoLHLWrUtSvTkniDcvXxugui8mQ59eslRbq/79VgGRkpLpD
 i36x+Hi9stpwwt3RSghSc1jDYGbj/dA1UJuY5cEgLJhw+2foe2FPh5knd
 sQ0YnG4r1JgYN5n6EEmwjiSiiJ0Vcg6nh2CvOPb7gS/3rNAJkXY5v7Yc2 A==;
X-CSE-ConnectionGUID: 1TBK1oIcQ8yQVM+HXtCCGA==
X-CSE-MsgGUID: ux4oRTVLTQa284jvv527lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77696400"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="77696400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:19:08 -0700
X-CSE-ConnectionGUID: YJHp/rSzTRaCc1Jxu8AYQA==
X-CSE-MsgGUID: y6i+UvdJQkCXL783+lsU/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271322427"
Received: from live-gta-imageloader.igk.intel.com (HELO
 DUT1105BMGFRD.igk.intel.com) ([10.211.177.74])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:19:06 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: peter.senna@linux.intel.com, stuart.summers@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t] tests/intel/xe_vm: cover single-op binds reserving unused
 pgtable ops
Date: Thu, 17 Sep 2026 19:18:57 +0000
Message-ID: <20260917191857.7733-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.43.0
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

xe_vma_ops_alloc() sizes the pt_update_ops->ops array with the number of
page table update ops reserved while parsing a VM_BIND, and allocates it
without zeroing it. Only the ops that xe_pt_update_ops_prepare() goes on
to populate are valid, so a kernel loop bounded by the reserved count
instead of the populated one walks into never initialised slab memory,
reads a garbage pointer out of it and dereferences it.

Syzkaller hit exactly that: xe_migrate.c iterated num_ops while xe_pt.c
iterated current_op.

Add three subtests which reserve more ops than they populate out of a
single (num_binds == 1) VM_BIND, so that the mismatch is reached without
an array of binds. They cover the three independent ways
vm_bind_ioctl_ops_parse() can count an op that op_prepare() then skips:

- single-op-unmap-partly-bound: an UNMAP covering a bound and an unbound
  VMA parses two UNMAP ops, and unbinding the VMA that was never bound
  is skipped.
- single-op-remap-unbound: a partial UNMAP of an unbound VMA parses a
  REMAP, and unbinding the original VMA is skipped while binding the
  remainder is not.
- single-op-map-mirror-over-bound: a CPU_ADDR_MIRROR MAP over a bound
  VMA parses an UNMAP plus a MAP, and binding a CPU address mirror VMA
  is skipped.

An unbound VMA here is one created by a non IMMEDIATE MAP in a fault
mode VM, which defers the bind to the first GPU page fault. A fault mode
VM is in long running mode, so the binds signal user fences rather than
syncobjs. Every iteration first populates and frees an equally sized ops
array so that the VM_BIND under test is likely to recycle a slab object
still holding stale pointers rather than freshly zeroed memory, and the
sequence is repeated so that one quiet iteration does not pass for
coverage.

Validated on a BMG DUT with CONFIG_KASAN=y, CONFIG_UBSAN_BOOL=y and
CONFIG_SLUB_DEBUG_ON=y, which poisons the freed ops array to 0x6b. On an
unfixed kernel each subtest faults within 90ms of starting:

  UBSAN: invalid-load in drivers/gpu/drm/xe/xe_migrate.c:1836:13
  load of value 107 is not a valid value for type '_Bool'
  Oops: general protection fault, probably for non-canonical address
        0xed6d696d6d6d6d6e
  RIP: 0010:xe_vm_populate_pgtable+0xd0/0x380 [xe]

With the kernel fix applied all three pass, while a debug print of the
two counters confirms they still reach current_op < num_ops on every
iteration, so the coverage is not lost once the bug is fixed.

Link: https://lore.kernel.org/intel-xe/20260824183816.299110-2-jagmeet.randhawa@intel.com/
Suggested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 204 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 1d109e783..a2181d464 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -307,6 +307,204 @@ static void test_partial_unbinds(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
+/**
+ * SUBTEST: single-op-unmap-partly-bound
+ * Functionality: unbind
+ * Description:
+ *	Single VM_BIND UNMAP spanning a bound and an unbound VMA, so that the
+ *	unbound VMA reserves a page table update op which is never populated
+ * Test category: functionality test
+ *
+ * SUBTEST: single-op-remap-unbound
+ * Functionality: unbind
+ * Description:
+ *	Single VM_BIND UNMAP splitting an unbound VMA, so that unbinding the
+ *	original VMA reserves a page table update op which is never populated
+ * Test category: functionality test
+ *
+ * SUBTEST: single-op-map-mirror-over-bound
+ * Functionality: bind
+ * Description:
+ *	Single VM_BIND MAP with CPU_ADDR_MIRROR replacing a bound VMA in a
+ *	scratch page fault mode VM, so that the map reserves a page table
+ *	update op which is never populated
+ * Test category: functionality test
+ */
+
+enum single_op_case {
+	SINGLE_OP_UNMAP_PARTLY_BOUND,
+	SINGLE_OP_REMAP_UNBOUND,
+	SINGLE_OP_MAP_MIRROR_OVER_BOUND,
+};
+
+static const struct single_op_section {
+	const char *name;
+	enum single_op_case op_case;
+} single_op_sections[] = {
+	{ "unmap-partly-bound", SINGLE_OP_UNMAP_PARTLY_BOUND },
+	{ "remap-unbound", SINGLE_OP_REMAP_UNBOUND },
+	{ "map-mirror-over-bound", SINGLE_OP_MAP_MIRROR_OVER_BOUND },
+	{ }
+};
+
+#define SINGLE_OP_ITERATIONS	32
+
+/*
+ * A VM_BIND reserves one page table update op per GPUVA op it parses, and the
+ * array holding them is allocated without being zeroed. Ops that end up being
+ * skipped while preparing the update are reserved but never populated, so only
+ * the populated prefix of the array is valid. The sequences below reserve more
+ * ops than they populate out of a single (num_binds == 1) VM_BIND:
+ *
+ * - UNMAP_PARTLY_BOUND: an UNMAP covering a bound and an unbound VMA parses
+ *   two UNMAP ops, and unbinding the VMA that was never bound is skipped.
+ * - REMAP_UNBOUND: a partial UNMAP of an unbound VMA parses a REMAP, and
+ *   unbinding the original VMA is skipped while binding the remainder is not.
+ * - MAP_MIRROR_OVER_BOUND: a CPU_ADDR_MIRROR MAP over a bound VMA parses an
+ *   UNMAP plus a MAP, and binding a CPU address mirror VMA is skipped.
+ *
+ * An unbound VMA is one created by a non IMMEDIATE MAP in a fault mode VM,
+ * which is deferred to the first GPU page fault instead of being bound by the
+ * VM_BIND itself.
+ */
+static void
+single_op_prime_pt_update_ops(int fd, uint32_t vm, uint32_t bo, uint64_t addr,
+			      uint64_t page, struct drm_xe_sync *sync,
+			      uint64_t *vm_sync)
+{
+	/*
+	 * Fully populate and then free a two op array, so that the VM_BIND
+	 * under test is likely to recycle a slab object still holding stale
+	 * pointers rather than freshly zeroed memory.
+	 */
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page, NULL, 0,
+			       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+	xe_vm_bind_async_flags(fd, vm, 0, bo, page, addr + page, page, NULL, 0,
+			       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, 2 * page, sync, 1);
+	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+	*vm_sync = 0;
+}
+
+static uint32_t single_op_vm_create(int fd, enum single_op_case c)
+{
+	struct drm_xe_vm_create create = {
+		.flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			 DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
+	};
+
+	if (c == SINGLE_OP_MAP_MIRROR_OVER_BOUND)
+		create.flags |= DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE;
+
+	/*
+	 * A scratch page fault mode VM is only accepted on platforms needing
+	 * scratch, and CPU address mirroring additionally needs GPUSVM.
+	 */
+	igt_require_f(!igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create),
+		      "VM create with flags 0x%x not supported\n", create.flags);
+
+	return create.vm_id;
+}
+
+static void test_single_op_pt_update_ops(int fd, enum single_op_case c)
+{
+	uint64_t page = xe_get_default_alignment(fd);
+	uint64_t prime_addr = 0x100000000ull;
+	uint64_t addr = 0x200000000ull;
+	/* A fault mode VM is in long running mode, which only takes ufences. */
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.timeline_value = USER_FENCE_VALUE,
+	};
+	uint32_t vm = single_op_vm_create(fd, c);
+	uint64_t vm_sync = 0;
+	uint32_t bo;
+	int i;
+
+	/*
+	 * The remainder of a split must not be aligned to the maximum PTE size,
+	 * otherwise binding it is skipped as well and no op is populated at all.
+	 */
+	igt_assert(!IS_ALIGNED(addr + page, SZ_1G));
+
+	bo = xe_bo_create(fd, vm, 2 * page, vram_if_possible(fd, 0), 0);
+	sync.addr = to_user_pointer(&vm_sync);
+
+	if (c == SINGLE_OP_MAP_MIRROR_OVER_BOUND) {
+		int ret = __xe_vm_bind(fd, vm, 0, 0, 0, addr, page,
+				       DRM_XE_VM_BIND_OP_MAP,
+				       DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+				       NULL, 0, 0, DEFAULT_PAT_INDEX, 0);
+
+		igt_require_f(!ret, "CPU address mirroring not supported: %d\n",
+			      ret);
+		xe_vm_unbind_async(fd, vm, 0, 0, addr, page, &sync, 1);
+		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+		vm_sync = 0;
+	}
+
+	for (i = 0; i < SINGLE_OP_ITERATIONS; ++i) {
+		uint64_t left_addr = 0, left_size = 0;
+
+		single_op_prime_pt_update_ops(fd, vm, bo, prime_addr, page,
+					      &sync, &vm_sync);
+
+		/* Printed before the bind, which may take the DUT down with it. */
+		igt_info("iteration %d: issuing single op bind sequence\n", i);
+
+		switch (c) {
+		case SINGLE_OP_UNMAP_PARTLY_BOUND:
+			xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page,
+					       NULL, 0,
+					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+			xe_vm_bind_async(fd, vm, 0, bo, page, addr + page, page,
+					 NULL, 0);
+			xe_vm_unbind_async(fd, vm, 0, 0, addr, 2 * page,
+					   &sync, 1);
+			break;
+		case SINGLE_OP_REMAP_UNBOUND:
+			xe_vm_bind_async(fd, vm, 0, bo, 0, addr, 2 * page,
+					 NULL, 0);
+			xe_vm_unbind_async(fd, vm, 0, 0, addr, page, &sync, 1);
+			left_addr = addr + page;
+			left_size = page;
+			break;
+		case SINGLE_OP_MAP_MIRROR_OVER_BOUND:
+			xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page,
+					       NULL, 0,
+					       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+			__xe_vm_bind_assert(fd, vm, 0, 0, 0, addr, page,
+					    DRM_XE_VM_BIND_OP_MAP,
+					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
+					    &sync, 1, 0, 0);
+			left_addr = addr;
+			left_size = page;
+			break;
+		}
+
+		xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
+			       NSEC_PER_SEC);
+		vm_sync = 0;
+
+		if (left_size) {
+			xe_vm_unbind_async(fd, vm, 0, 0, left_addr, left_size,
+					   &sync, 1);
+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
+				       NSEC_PER_SEC);
+			vm_sync = 0;
+		}
+	}
+
+	/* The VM must still be usable, a kill would fail the bind below. */
+	xe_vm_bind_async_flags(fd, vm, 0, bo, 0, addr, page, &sync, 1,
+			       DRM_XE_VM_BIND_FLAG_IMMEDIATE);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
+
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 /**
  * SUBTEST: unbind-all-%d-vmas
  * Functionality: unbind
@@ -3226,6 +3424,12 @@ int igt_main()
 	igt_subtest("partial-unbinds")
 		test_partial_unbinds(fd);
 
+	for (const struct single_op_section *s = single_op_sections;
+	     s->name; s++) {
+		igt_subtest_f("single-op-%s", s->name)
+			test_single_op_pt_update_ops(fd, s->op_case);
+	}
+
 	igt_subtest("unbind-all-2-vmas")
 		unbind_all(fd, 2);
 
-- 
2.43.0

