Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1921606A319
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 19:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kqMfyJs/
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A0E10EAFC;
	Mon, 19 Oct 2026 19:47:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA40110EAFC
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792439183; x=1823975183;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0YceyUKDHTKeHQYKWZvkCRs/dILQhKmjf2tcgbPmWL0=;
 b=kqMfyJs/JF4RYZokh5CywSgdTW4xQWncd/Kau6KAY0ktdQ2dKi1bkcAU
 lNZcFU2oynIS/+lrnm+Vf5QBAUDI7M8229V68o6sdy7epgsgAG8hvWCDl
 wNL9rNaeOVumKaLZPlhm+IruLXD0/F7hmdcPRHSZi/dgIIEdnYjq9oG5+
 Ud9gVv2GHZ5RXzP6DeL4i560GdTTMAv7D3qQhossemG/XVcI+XK5dvH6q
 Q1IHzCYE+4AIRaHiKgAougzDHye/KV2YWKBiJffaVn/cvFIKKhTWIPMDU
 fzn0tOXiJgeusyeSq8ZgGtP8iW2ETnabSRKvNzjuFBBSy+a0+TRmHBCwB g==;
X-CSE-ConnectionGUID: nzsJ/BbFSNG2WmwvFvAlYQ==
X-CSE-MsgGUID: uCP0MLzEQ+yPbwXJzCZndg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1169315"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1169315"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 12:46:23 -0700
X-CSE-ConnectionGUID: BMLnpaznRm+cZJ+emTG6AA==
X-CSE-MsgGUID: YOgXeJv2S8+bu+Dj3XSYlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2986945"
Received: from dut1106bmgfrd.igk.intel.com ([10.211.177.75])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 12:46:22 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, peter.senna@linux.intel.com,
 stuart.summers@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [i-g-t,
 v2] tests/intel/xe_vm: cover single-op binds reserving unused pgtable
 ops
Date: Mon, 19 Oct 2026 19:45:57 +0000
Message-ID: <20261019194557.10403-1-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

xe_vma_ops_alloc() sizes the page table update ops array with the number
of ops reserved while parsing a VM_BIND, and allocates it without zeroing
it. Only the ops that xe_pt_update_ops_prepare() goes on to populate are
valid, so a kernel loop bounded by the reserved count instead of the
populated one walks into never initialised slab memory, reads a garbage
pointer out of it and dereferences it.

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

Originally validated on a BMG DUT with CONFIG_KASAN=y,
CONFIG_UBSAN_BOOL=y and CONFIG_SLUB_DEBUG_ON=y, which poisons the freed
ops array to 0x6b. On a kernel still carrying the mismatch each subtest
faulted within 90ms of starting:

  UBSAN: invalid-load in drivers/gpu/drm/xe/xe_migrate.c:1836:13
  load of value 107 is not a valid value for type '_Bool'
  Oops: general protection fault, probably for non-canonical address
        0xed6d696d6d6d6d6e
  RIP: 0010:xe_vm_populate_pgtable+0xd0/0x380 [xe]

Those loops have since been removed: commit f5708e761ed6 ("drm/xe: Add
CPU bind layer") moved the page table update path out of xe_migrate.c
into xe_cpu_bind.c, and the ops array now lives in struct xe_pt_job_ops
with every consumer bounded by current_op. Re-ran on drm-xe-next with
that series applied and the same debug config: 20 iterations of each
subtest, 60 of 60 pass, no UBSAN or KASAN splat. The subtests stand as
regression coverage for the reserved versus populated op mismatch, which
the bind paths can still construct.

Suggested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
v2:
- Drop the Link to the kernel fix. The loops it bounded were removed by
  commit f5708e761ed6 ("drm/xe: Add CPU bind layer"), so the reference no
  longer points at anything that exists.
- Rework the validation paragraph: retested on drm-xe-next carrying the CPU
  bind rewrite, 20 iterations of each subtest, 60 of 60 pass, dmesg clean
  with KASAN/UBSAN/SLUB_DEBUG_ON.
- Rebase onto current master.
- Add Jonathan's Reviewed-by.

 tests/intel/xe_vm.c | 204 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 204 insertions(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index d1157803d..1408cace6 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -309,6 +309,204 @@ static void test_partial_unbinds(int fd)
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
@@ -3216,6 +3414,12 @@ int igt_main()
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

