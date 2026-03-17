Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CE3FEDA18
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 19:38:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAFF10E1B3;
	Tue, 17 Mar 2026 19:38:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BVu/9Wax";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8C2710E1B3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773776287; x=1805312287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JvxzLwO2Gb62h8qmvfWG/NqdAAp0ySOWKEYObDydFfI=;
 b=BVu/9WaxHAhDlvpt+leM6Db31atQ28zcmaCENbvsA/daLMuip8SbMb13
 UHBIpjtJzzmLV9EinQ/r1jCHCtYkaxheiLZ2o3TrGffZC3NH+0nstEQzE
 Fn4Ws4dVqXccGVmPzuDrx489StWEQ67JXv8LE/G1Aucwh4mCb0bRcX77Y
 TOOJhN/ZNiDtjc6prDM155xsYOMYgYMeOlo34pooeU1APldvzDJRZae4K
 g0dpkhzvIaNUwxFA9Fu0XeO5cjwgeQBp5BMF+7rHxb8obsFnQ4+FJ1TWm
 h5cM72TuD4a4dO2X+etzRWCleTw/i8SgCYhk88Vz3ywMsEmjuSNYIvtk+ w==;
X-CSE-ConnectionGUID: vdA5vGl2QJatbSwwafKCsQ==
X-CSE-MsgGUID: S+3dyvnwTemMNYlOmGHIZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="86175911"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="86175911"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 12:38:06 -0700
X-CSE-ConnectionGUID: Ymv14E+xSPSrSA3BnEE6Ag==
X-CSE-MsgGUID: 76g6me+xQ8mg14WkYL4DdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; d="scan'208";a="226517906"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.245.175])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 12:38:04 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t] tests/xe_pat: Add subtests for validating cached
 pagetables
Date: Tue, 17 Mar 2026 20:37:57 +0100
Message-ID: <20260317193756.1266825-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

For platforms where pagetables might be cached (WB and 2-way coherency)
verify there're no pagefaults when walker goes over partially valid
cachelines.

Introduced subtests utilize pagetables on different levels with different
offset selection strategies - sequential and randomized. Sequential
binds two PTEs per same cacheline whereas randomized distributes binds
"equally" (with the respect of level set size). Additionally PAT+PTE
subtest rebinds on same PTE replacing normal bind to NULL and vice-versa
validating pagetable walk uses updated entries and objects underneath
contain expected data.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 415 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 415 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index b92512164c..1a11bda6c3 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -18,6 +18,7 @@
 #include "igt_device.h"
 #include "igt_fs.h"
 #include "igt_kmod.h"
+#include "igt_map.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
 #include "igt_vgem.h"
@@ -1636,6 +1637,408 @@ static void xa_app_transient_test(int configfs_device_fd, bool media_on)
 	close(fw_handle);
 }
 
+/**
+ * SUBTEST: pt-caching
+ * Description: verify pt fetch doesn't trigger pagefaults on TLB eviction
+ *              (use many objects)
+ *
+ * SUBTEST: pt-caching-single-object
+ * Description: verify pt fetch doesn't trigger pagefaults on TLB eviction
+ *              (use single object bound with different offsets)
+ *
+ * SUBTEST: pt-caching-random-offsets
+ * Description: verify pt fetch doesn't trigger pagefaults on TLB eviction
+ *              (use many objects with random offsets)
+ *
+ * SUBTEST: pt-caching-update-pat-and-pte
+ * Description: verify read after write returns expected values when
+ *              NULL and normal object PTEs exists in same cacheline
+ *
+ */
+
+/*
+ * Helpers for spreading over pagetables
+ *
+ *      E         D         C         B         A
+ * +- 9bits -+- 9bits -+- 9bits -+- 9bits -+- 9bits -+
+ * |876543210|876543210|876543210|876543210|876543210|
+ *
+ * index is spread over n-groups
+ *
+ * (example) index = 876543210 (bits, not value)
+ *
+ * for 3-group bit shift will land
+ *      C         B         A
+ * |000000852|000000741|000000630|
+ *
+ * for 4-group bit shift will land
+ *      D         C         B         A
+ * |000000073|000000062|000000051|000000840|
+ *
+ * for 5-group bit shift will land
+ *      E         D         C         B         A
+ * |000000004|000000083|000000072|000000061|000000050|
+ */
+
+enum pt_groups {
+	GROUPS_3s = 3,
+	GROUPS_4s,
+	GROUPS_5s,
+};
+
+enum pt_test_opts {
+	PT_SINGLE_OBJECT = 1,
+	PT_RANDOM_OFFSETS = 2,
+	PT_UPDATE_PAT_AND_PTE = 3,
+};
+
+static uint64_t get_every_nth_bit(uint64_t v, int nth)
+{
+	uint64_t ret = 0;
+	int i = 0;
+
+	while (v) {
+		ret |= (v & 1) << i;
+		v >>= nth;
+		i++;
+	}
+
+	return ret;
+}
+
+static uint64_t pt_spread(uint64_t nr, enum pt_groups groups)
+{
+	uint64_t ret_pt = 0;
+
+	switch (groups) {
+	case GROUPS_5s:
+		ret_pt |= get_every_nth_bit(nr >> 4, groups) << 36;
+	case GROUPS_4s:
+		ret_pt |= get_every_nth_bit(nr >> 3, groups) << 27;
+	case GROUPS_3s:
+		ret_pt |= get_every_nth_bit(nr >> 2, groups) << 18 |
+			  get_every_nth_bit(nr >> 1, groups) << 9 |
+			  get_every_nth_bit(nr, groups);
+		break;
+	}
+
+	return ret_pt;
+}
+
+struct pt_object {
+	uint32_t bo;
+	uint32_t size;
+	uint64_t address;
+	uint64_t offset;
+	uint32_t dword;
+	uint32_t flags;
+};
+
+/* Batch address, selected low to avoid being placed in 48-57 range */
+#define BATCH_ADDRESS 0x10000
+
+/* Start address for all allocations */
+#define OFFSET_START 0x200000
+
+static struct pt_object *
+pt_create_objects(int xe, int num_objs, enum pt_test_opts opts, enum pt_groups groups,
+		  uint64_t addr_shift)
+{
+	struct pt_object *objs;
+	uint64_t obj_size = SZ_4K;
+	uint64_t va_mask = (1ULL << xe_va_bits(xe)) - 1;
+	struct igt_map *hash = NULL;
+	int i, max_randoms;
+	uint32_t region = system_memory(xe), vram_region = vram_memory(xe, 0);
+	uint32_t flags = 0;
+
+	objs = calloc(num_objs, sizeof(*objs));
+	igt_assert(objs);
+
+	if (xe_has_vram(xe) && xe_min_page_size(xe, vram_region) == SZ_4K) {
+		region = vram_region;
+		flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
+	}
+
+	if (opts == PT_RANDOM_OFFSETS)
+		hash = igt_map_create(igt_map_hash_64, igt_map_equal_64);
+
+	for (i = 0; i < num_objs; i++) {
+		if (opts == PT_RANDOM_OFFSETS) {
+			uint64_t addr, *paddr;
+
+			objs[i].bo = xe_bo_create(xe, 0, obj_size, region, flags);
+			objs[i].size = obj_size;
+
+			max_randoms = 16; /* arbitrary, very unlikely to exceed */
+			while (--max_randoms) {
+				addr = (uint64_t)rand() << 32 | rand();
+				addr &= ~((1 << 21) - 1) & va_mask;
+				if (addr > addr + OFFSET_START)
+					continue; /* avoid wrap around */
+				addr += OFFSET_START;
+				paddr = igt_map_search(hash, &addr);
+				if (!paddr)
+					break;
+				else
+					igt_debug("Address 0x%lx already found, randomizing again\n",
+						  addr);
+			}
+			igt_assert_neq(max_randoms, 0);
+			igt_map_insert(hash, &addr, from_user_pointer(i));
+			objs[i].address = addr;
+		} else if (opts == PT_SINGLE_OBJECT) {
+			if (!i) {
+				uint64_t total_size = num_objs * obj_size;
+
+				objs[i].bo = xe_bo_create(xe, 0, total_size,
+							  region, flags);
+				objs[i].size = total_size;
+			} else {
+				objs[i].bo = objs[0].bo;
+			}
+			objs[i].offset = i * obj_size;
+			objs[i].address = (pt_spread(i, groups) << 21) +
+					  OFFSET_START + addr_shift;
+		} else {
+			objs[i].bo = xe_bo_create_caching(xe, 0, obj_size, region, flags,
+							  DRM_XE_GEM_CPU_CACHING_WC);
+			objs[i].size = obj_size;
+			objs[i].address = (pt_spread(i, groups) << 21) +
+					  OFFSET_START + addr_shift;
+		}
+		objs[i].dword = i + 1 + addr_shift;
+
+		igt_debug("object[%d]: [bo: %u, size: 0x%x, offset: 0x%lx, address: 0x%lx]\n",
+			  i, objs[i].bo, objs[i].size, objs[i].offset, objs[i].address);
+	}
+
+	igt_map_destroy(hash, NULL);
+
+	return objs;
+}
+
+static void pt_destroy_objects(int xe, struct pt_object *objs, int num_objs)
+{
+	int i;
+
+	for (i = 0; i < num_objs; i++) {
+		if (objs[i].size)
+			gem_close(xe, objs[i].bo);
+		else
+			break;
+	}
+	free(objs);
+}
+
+static void pt_bind_objects(int xe, uint32_t vm, struct pt_object *objs,
+			    int num_objs, uint32_t flags, uint8_t pat_index)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+	};
+	uint32_t obj_size = SZ_4K;
+	int i;
+
+	for (i = 0; i < num_objs; i++) {
+		igt_debug("i: %x, address: 0x%lx, offset: %lx\n",
+			  i, objs[i].address, objs[i].offset);
+
+		sync.handle = syncobj_create(xe, 0);
+
+		igt_assert_eq(__xe_vm_bind(xe, vm, 0,
+					   flags == DRM_XE_VM_BIND_FLAG_NULL ? 0 : objs[i].bo,
+					   objs[i].offset,
+					   objs[i].address, obj_size,
+					   DRM_XE_VM_BIND_OP_MAP,
+					   flags,
+					   &sync, 1, 0,
+					   pat_index, 0), 0);
+
+		igt_assert(syncobj_wait(xe, &sync.handle, 1, INT64_MAX, 0, NULL));
+		syncobj_destroy(xe, sync.handle);
+		objs[i].flags = flags;
+	}
+}
+
+static void pt_fill_objects(int xe, uint32_t vm, struct pt_object *objs,
+			    int num_objs)
+{
+	uint64_t bb_size = num_objs * 4 * sizeof(uint32_t) + sizeof(uint32_t);
+	uint64_t batch_addr = 0;
+	uint32_t bb, exec_queue;
+	uint32_t *batch;
+	int i, n = 0;
+
+	batch_addr = ALIGN(BATCH_ADDRESS, xe_get_default_alignment(xe));
+	igt_debug("Batch offset: 0x%lx\n", batch_addr);
+
+	bb_size = xe_bb_size(xe, bb_size);
+	bb = xe_bo_create(xe, 0, bb_size, vram_if_possible(xe, 0),
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+	xe_vm_bind_sync(xe, vm,	bb, 0, batch_addr, bb_size);
+	batch = xe_bo_map(xe, bb, bb_size);
+	for (i = 0; i < num_objs; i++) {
+		batch[n++] = MI_STORE_DWORD_IMM_GEN4;
+		batch[n++] = objs[i].address;
+		batch[n++] = objs[i].address >> 32;
+		batch[n++] = objs[i].dword;
+	}
+	batch[n++] = MI_BATCH_BUFFER_END;
+	munmap(batch, bb_size);
+
+	exec_queue = xe_exec_queue_create_class(xe, vm, DRM_XE_ENGINE_CLASS_COPY);
+	xe_exec_wait(xe, exec_queue, batch_addr);
+
+	xe_exec_queue_destroy(xe, exec_queue);
+	xe_vm_unbind_sync(xe, vm, 0, batch_addr, bb_size);
+	gem_close(xe, bb);
+}
+
+static void pt_check_objects(int xe, struct pt_object *objs, int num_objs,
+			     enum pt_test_opts opts)
+{
+	uint32_t *map, v;
+	int i;
+
+	igt_debug("Checking objects\n");
+	if (opts == PT_SINGLE_OBJECT) {
+		map = xe_bo_map(xe, objs[0].bo, objs[0].size);
+		for (i = 0; i < num_objs; i++) {
+			v = map[0 + (i * SZ_4K / sizeof(*map))];
+			igt_debug("[%d]: bo: %u, value %08x\n", i, objs[i].bo, v);
+			igt_assert_eq(v, objs[i].dword);
+		}
+		munmap(map, objs[0].size);
+	} else {
+		for (i = 0; i < num_objs; i++) {
+			map = xe_bo_map(xe, objs[i].bo, objs[i].size);
+			v = map[0];
+			igt_debug("[%d]: bo: %u, value %08x\n", i, objs[i].bo, v);
+
+			/*
+			 * CPU mapping points to object data, so after rebind
+			 * from writeable to NULL GPU binding writing to it
+			 * will still keep previous data in the object from
+			 * CPU point of view. Clear it to ensure we don't read
+			 * stale data.
+			 */
+			if (opts == PT_UPDATE_PAT_AND_PTE)
+				memset(map, 0, objs[i].size);
+
+			munmap(map, objs[i].size);
+			if (objs[i].flags == DRM_XE_VM_BIND_FLAG_NULL)
+				igt_assert_eq(v, 0);
+			else
+				igt_assert_eq(v, objs[i].dword);
+		}
+	}
+}
+
+#define FILL_TLB_SIZE SZ_1M
+static void pt_caching_test(int xe, enum pt_test_opts opts)
+{
+	struct pt_object *objs1, *objs2;
+	uint32_t vm;
+	uint8_t pat_index = DEFAULT_PAT_INDEX;
+	int num_objs = FILL_TLB_SIZE / 64, every, bits, bgrps, i;
+
+	igt_require_f(xe_min_page_size(xe, system_memory(xe)) == SZ_4K,
+		      "We need at least one region with 4K alignment\n");
+
+	/*
+	 * For discrete where alignment is larger than 4K fallback to system
+	 * memory for objects location and decrease number of iterations.
+	 */
+	if (xe_get_default_alignment(xe) != SZ_4K) {
+		num_objs /= 4;
+	} else if (xe_has_vram(xe)) {
+		/*
+		 * For random offsets each 4K object may consume up to 3 or 4
+		 * 4K pages for pde/pte - so divisor == 12 should be enough
+		 * to keep everything in vram with some minor free space margin.
+		 * For rest each 4K object has 4K pte + pde which consumes about
+		 * ~7%, so divisor == 4 should cause to occupy ~82% of vram.
+		 */
+		int div = opts == PT_RANDOM_OFFSETS ? 12 : 4;
+
+		num_objs = min_t(int, num_objs,
+				 (xe_visible_vram_size(xe, 0) / SZ_4K / div));
+	}
+
+	vm = xe_vm_create(xe, 0, 0);
+	igt_info("va_bits: %d, num_objs: %u, spread over pt levels:\n",
+		 xe_va_bits(xe), num_objs);
+
+	if (xe_va_bits(xe) > 48)
+		every = 4;
+	else
+		every = 3;
+
+	if (opts != PT_RANDOM_OFFSETS) {
+		bits = igt_fls(num_objs - 1);
+		bgrps = DIV_ROUND_UP(bits, every);
+		for (i = 0; i < every; i++)
+			igt_info("[%d]: %d\n", i, num_objs >> bgrps * i);
+	} else {
+		uint32_t seed = time(NULL);
+
+		igt_info("-> random, seed: %u\n", seed);
+		srand(seed);
+	}
+
+	objs1 = pt_create_objects(xe, num_objs, opts, every, 0);
+	objs2 = pt_create_objects(xe, num_objs, opts, every, SZ_8K);
+
+	/*
+	 * Testing scenario:
+	 *  - bind 4K objects or single one (using different offsets)
+	 *    spreading them over different pt/pd levels
+	 *  - do memory writes to all of these objects causing TLB eviction
+	 *  - bind another set of 4K objects which will reside in same cache
+	 *    line, but after one entry gap
+	 *  - ensure writes succeed and no pagefault occur
+	 */
+	if (opts != PT_UPDATE_PAT_AND_PTE) {
+		pt_bind_objects(xe, vm, objs1, num_objs, 0, pat_index);
+		pt_fill_objects(xe, vm, objs1, num_objs);
+		pt_check_objects(xe, objs1, num_objs, opts);
+
+		pt_bind_objects(xe, vm, objs2, num_objs, 0, pat_index);
+		pt_fill_objects(xe, vm, objs2, num_objs);
+		pt_check_objects(xe, objs2, num_objs, opts);
+	/*
+	 * For PAT/PTE change we use different pat indices and
+	 * we keep <NULL PTE, invalid, valid obj PTE> in same cache line.
+	 * After write/read scenario we exchange the arrangement to
+	 * <valid obj PTE, invalid, NULL PTE> to ensure cachelines were
+	 * properly invalidated.
+	 */
+	} else {
+		pat_index = get_pat_idx_uc(xe, NULL);
+		pt_bind_objects(xe, vm, objs1, num_objs, DRM_XE_VM_BIND_FLAG_NULL, pat_index);
+		pt_bind_objects(xe, vm, objs2, num_objs, 0, pat_index);
+		pt_fill_objects(xe, vm, objs1, num_objs);
+		pt_fill_objects(xe, vm, objs2, num_objs);
+		pt_check_objects(xe, objs1, num_objs, opts);
+		pt_check_objects(xe, objs2, num_objs, opts);
+
+		pat_index = get_pat_idx_wb(xe, NULL);
+		pt_bind_objects(xe, vm, objs1, num_objs, 0, pat_index);
+		pt_bind_objects(xe, vm, objs2, num_objs, DRM_XE_VM_BIND_FLAG_NULL, pat_index);
+		pt_fill_objects(xe, vm, objs1, num_objs);
+		pt_fill_objects(xe, vm, objs2, num_objs);
+		pt_check_objects(xe, objs1, num_objs, opts);
+		pt_check_objects(xe, objs2, num_objs, opts);
+	}
+
+	/* Implicit vm cleanup */
+	xe_vm_destroy(xe, vm);
+	pt_destroy_objects(xe, objs1, num_objs);
+	pt_destroy_objects(xe, objs2, num_objs);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1757,6 +2160,18 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest("pt-caching")
+		pt_caching_test(fd, 0);
+
+	igt_subtest("pt-caching-single-object")
+		pt_caching_test(fd, PT_SINGLE_OBJECT);
+
+	igt_subtest("pt-caching-random-offsets")
+		pt_caching_test(fd, PT_RANDOM_OFFSETS);
+
+	igt_subtest("pt-caching-update-pat-and-pte")
+		pt_caching_test(fd, PT_UPDATE_PAT_AND_PTE);
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

