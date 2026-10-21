Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4584160A381F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 12:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MXCSvkuD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF64C10E277;
	Wed, 21 Oct 2026 12:34:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1CB10E13C
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 12:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792586034; x=1824122034;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P9oXrAvPxnk5c0GN4iu4CjTmsub8mfEq7cB4sfyZz00=;
 b=MXCSvkuDieS46txNvG1LJw0TgiUwK5EZazTyA9lgFEeohC1VTQIomhBd
 +f8P3TZekWVSu0jXorN+AvL6Lvo2rlD5ZXM2ia8DLQ5EcuS8VB4pnepoJ
 v0p9ASbvrFzRi7kuuhiyIbLw3IFIUgAzSkYOvqcpyCqGv8SGHD4a/9J6u
 lRZvMtQ6E+C2+KDrybZ/Sjt9Zp0G9dVJmy9W6UR34X1gKJL8Irp3x3IZu
 3m0YGmEqvbyAjy0hwX2t8C6wLQynZdBdfknM/HU0q9PqXF0rPNMrX6RGA
 kuGXBXnvc6kD3R0NCqtUtlPR7c2KszEWTK1pslLnCsRp7dMIj8oGzcVC9 w==;
X-CSE-ConnectionGUID: j6FFcQ6TRQizpB/mIODXNg==
X-CSE-MsgGUID: Ym5yXj+uQ0qmxuO0N6dOjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1324808"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1324808"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 05:33:54 -0700
X-CSE-ConnectionGUID: UxhBftQRSKG7RyNed3Neuw==
X-CSE-MsgGUID: tLSIxuKVRBCy7c6XxIOANg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3180121"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO fedora)
 ([10.245.245.16])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 05:33:53 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_bo_shrink: Add a user-space shrinker test
Date: Wed, 21 Oct 2026 14:33:11 +0200
Message-ID: <20261021123315.10033-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a user-space counterpart of the xe_bo_shrink kunit test, now that
user-space can mark buffer objects purgeable using the madvise IOCTL.

The test creates 64 MiB system buffer objects corresponding to twice
the amount of free system memory, fills them with pseudo-random data
through CPU mappings that are kept alive until readback, and verifies
the contents after the overcommit has forced the shrinker to back up
or purge them. As in the kunit test, the share of the memory that
doesn't fit in free RAM and swap is marked purgeable (DONTNEED) and
allocated first. Purgeable objects are only verified if found retained
when marked WILLNEED again; purged objects are never accessed.

Subtests:
- shrink: The kunit test equivalent.
- purge: Ignore swap space when sizing the purgeable share, so that
  the shrinker needs to purge rather than swap.
- shrink-fault-inject: Enable TTM backup / restore fault injection
  through debugfs, if available, making the shrinker back up only part
  of the objects and making backup and restore of individual pages
  fail. The number of injected faults is checked to be non-zero.
- *-blit: Rather than restoring objects by CPU faults, restore them
  through a GPU bind and read them back by a MEM_COPY blit to a dummy
  object in a separate VM. On discrete devices, objects are created
  with system and VRAM placements, prefetched to system memory on
  creation and prefetched to VRAM before the copy, so that they are
  restored by the migration to VRAM.
- *-private: Create the objects private to the test VM rather than as
  external objects.
- *-fast: Allocate at most the free system memory, half of it
  purgeable, capped to 8 GiB purgeable and 8 GiB non-purgeable, and
  shrink using drop_caches rather than memory overcommit.

The non-fast subtests are slow and require a substantial amount of
swap space for meaningful coverage, so block them in CI and run only
the fast subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub_Copilot:claude-opus-5.5
---
 tests/intel-ci/xe.blocklist.txt |   3 +-
 tests/intel/xe_bo_shrink.c      | 610 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 3 files changed, 613 insertions(+), 1 deletion(-)
 create mode 100644 tests/intel/xe_bo_shrink.c

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index c1dd3c7a8..ba589aac2 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -35,9 +35,10 @@ igt@gpu_buddy
 igt@drm_mm
 igt@kms_selftest.*
 ##################################################################
-# Exclude slow KUnit test which should run as manual test
+# Exclude slow shrinker tests which should run as manual tests
 ##################################################################
 igt@xe_live_ktest@xe_bo_shrink
+igt@xe_bo_shrink@(?!.*-fast$).*
 ##################################################################
 # Exclude all other non-Xe tests
 ##################################################################
diff --git a/tests/intel/xe_bo_shrink.c b/tests/intel/xe_bo_shrink.c
new file mode 100644
index 000000000..6210923af
--- /dev/null
+++ b/tests/intel/xe_bo_shrink.c
@@ -0,0 +1,610 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: Exercise the xe buffer object shrinker from user-space
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Memory management tests
+ * Functionality: shrinker, swap, purgeable
+ *
+ * This is a user-space counterpart of the xe_bo_shrink kunit test.
+ * It creates system memory buffer objects corresponding to twice the
+ * amount of free system memory. All objects are filled with pseudo-random
+ * data through a CPU mapping that is kept alive until the data is verified
+ * after the overcommit. Purgeable objects are additionally marked DONTNEED
+ * using the madvise IOCTL so that the shrinker may discard their contents.
+ * Those are only verified if still retained when marked WILLNEED again.
+ *
+ * The blit variants never read the bos using the CPU. Instead each bo is
+ * bound to a separate VM and copied to a dummy bo using the MEM_COPY
+ * blitter command, so that bos are restored by the GPU paths rather than
+ * by CPU faults, and the content of the dummy bo is verified. On discrete
+ * devices, the blit variants create the bos with both system and VRAM
+ * placements and immediately prefetch them to system memory. Before the
+ * copy, each bo is prefetched to VRAM, so that it is restored by the
+ * migration to VRAM.
+ *
+ * The private variants create the bos private to the test VM, sharing
+ * the VM's reservation object, rather than as external bos.
+ *
+ * The fast variants instead create bos corresponding to the amount of
+ * free system memory, half of them purgeable, capped to
+ * XE_BO_SHRINK_FAST_MAX purgeable and non-purgeable each, and shrink
+ * them by writing to /proc/sys/vm/drop_caches rather than relying on
+ * reclaim caused by memory overcommit.
+ */
+
+#include <sys/random.h>
+#include <sys/sysinfo.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_rand.h"
+#include "igt_sysfs.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
+#include "xe_drm.h"
+
+#include "intel_reg.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define XE_BO_SHRINK_SIZE	(64ull << 20)
+#define XE_BO_SHRINK_VA_BASE	(1ull << 32)
+/* Max purgeable and max non-purgeable memory, each, for fast variants. */
+#define XE_BO_SHRINK_FAST_MAX	(8ull << 30)
+
+#define BLIT_BATCH_ADDR		(1ull << 20)
+#define BLIT_DST_ADDR		(1ull << 32)
+#define BLIT_SRC_ADDR		(2ull << 32)
+
+#define SHRINK_PURGE		(0x1 << 0)
+#define SHRINK_FAULT_INJECT	(0x1 << 1)
+#define SHRINK_BLIT		(0x1 << 2)
+#define SHRINK_FAST		(0x1 << 3)
+#define SHRINK_PRIVATE		(0x1 << 4)
+
+/**
+ * struct shrink_bo - A shrinker test bo
+ * @map: Persistent CPU mapping of the bo, kept from fill until readback.
+ * @handle: GEM handle of the bo.
+ * @addr: GPU virtual address of the bo in the test VM, if @bound.
+ * @val: The first pseudo-random value written, used to detect a PRNG
+ * that is out of sync on readback.
+ * @purgeable: Whether the bo is marked DONTNEED and thus may be purged.
+ * @bound: Whether the bo is bound at @addr in the test VM.
+ */
+struct shrink_bo {
+	uint32_t *map;
+	uint32_t handle;
+	uint64_t addr;
+	uint32_t val;
+	bool purgeable;
+	bool bound;
+};
+
+/**
+ * struct shrink_blit - State for blitter readback of bos
+ * @vm: A separate VM used for the copies.
+ * @exec_queue: Copy engine exec queue in @vm.
+ * @batch: Batch bo holding the MEM_COPY command.
+ * @dst: Dummy destination bo, in system memory.
+ * @dst_map: CPU mapping of @dst, used to verify the copied content.
+ */
+struct shrink_blit {
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t batch;
+	uint32_t dst;
+	uint32_t *dst_map;
+};
+
+/**
+ * struct ttm_fault_inject - TTM backup / restore fault injection state
+ * @dir: Debugfs directory fd of the fault attributes, or -1 if not opened.
+ * @probability: Original probability, restored after the test.
+ * @interval: Original interval, restored after the test.
+ * @times: Original times, restored after the test.
+ * @verbose: Original verbosity, restored after the test.
+ * @task_filter: Original task-filter setting, restored after the test.
+ */
+static struct ttm_fault_inject {
+	int dir;
+	uint32_t probability;
+	uint32_t interval;
+	int32_t times;
+	uint32_t verbose;
+	bool task_filter;
+} ttm_fi = { .dir = -1 };
+
+static void ttm_fault_inject_restore(int sig)
+{
+	if (ttm_fi.dir < 0)
+		return;
+
+	__igt_sysfs_set_u32(ttm_fi.dir, "probability", ttm_fi.probability);
+	__igt_sysfs_set_u32(ttm_fi.dir, "interval", ttm_fi.interval);
+	__igt_sysfs_set_s32(ttm_fi.dir, "times", ttm_fi.times);
+	__igt_sysfs_set_u32(ttm_fi.dir, "verbose", ttm_fi.verbose);
+	__igt_sysfs_set_boolean(ttm_fi.dir, "task-filter", ttm_fi.task_filter);
+	close(ttm_fi.dir);
+	ttm_fi.dir = -1;
+}
+
+/*
+ * Enable the TTM backup_fault_inject attribute, which makes the shrinker
+ * back up only part of a bo, fails backup of individual folios and makes
+ * interruptible restores fail with -EINTR. Requires CONFIG_FAULT_INJECTION
+ * and CONFIG_FAULT_INJECTION_DEBUG_FS.
+ */
+static void ttm_fault_inject_enable(void)
+{
+	const char *debugfs_root = igt_debugfs_mount();
+	char path[PATH_MAX];
+
+	igt_require_f(debugfs_root, "debugfs not available\n");
+	snprintf(path, sizeof(path), "%s/ttm/backup_fault_inject", debugfs_root);
+	ttm_fi.dir = open(path, O_RDONLY | O_DIRECTORY);
+	igt_require_f(ttm_fi.dir >= 0,
+		      "TTM backup fault injection not available (%s)\n", path);
+
+	ttm_fi.probability = igt_sysfs_get_u32(ttm_fi.dir, "probability");
+	ttm_fi.interval = igt_sysfs_get_u32(ttm_fi.dir, "interval");
+	ttm_fi.times = igt_sysfs_get_s32(ttm_fi.dir, "times");
+	ttm_fi.verbose = igt_sysfs_get_u32(ttm_fi.dir, "verbose");
+	ttm_fi.task_filter = igt_sysfs_get_boolean(ttm_fi.dir, "task-filter");
+	igt_install_exit_handler(ttm_fault_inject_restore);
+
+	igt_sysfs_set_boolean(ttm_fi.dir, "task-filter", false);
+	igt_sysfs_set_u32(ttm_fi.dir, "verbose", 0);
+	igt_sysfs_set_u32(ttm_fi.dir, "interval", 1);
+	/* The kernel decrements times on each injection. */
+	igt_sysfs_set_s32(ttm_fi.dir, "times", INT32_MAX);
+	igt_sysfs_set_u32(ttm_fi.dir, "probability", 10);
+}
+
+static int32_t ttm_fault_inject_count(void)
+{
+	return INT32_MAX - igt_sysfs_get_s32(ttm_fi.dir, "times");
+}
+
+static bool xe_has_purgeable_support(int fd)
+{
+	struct drm_xe_query_config *config = xe_config(fd);
+
+	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_PURGING_SUPPORT;
+}
+
+/*
+ * The CPU mapping is kept until shrink_verify(), so that the shrinker
+ * needs to zap the PTEs of a live mapping and readback restores the
+ * bo through that same mapping.
+ */
+static void shrink_fill_random(int fd, struct shrink_bo *bo, uint32_t *prng)
+{
+	uint32_t *map = xe_bo_map(fd, bo->handle, XE_BO_SHRINK_SIZE);
+	size_t i;
+
+	for (i = 0; i < XE_BO_SHRINK_SIZE / sizeof(*map); i++)
+		map[i] = hars_petruska_f54_1_random(prng);
+
+	bo->val = map[0];
+	bo->map = map;
+}
+
+static void shrink_verify(const uint32_t *map, uint32_t first_val,
+			  unsigned int bo_nr, uint32_t *prng)
+{
+	size_t i;
+
+	for (i = 0; i < XE_BO_SHRINK_SIZE / sizeof(*map); i++) {
+		uint32_t val = hars_petruska_f54_1_random(prng);
+
+		igt_assert_f(map[i] == val,
+			     "Content not preserved, bo %u offset 0x%016zx. "
+			     "Failed value is 0x%08x, recorded 0x%08x.%s\n",
+			     bo_nr, i * sizeof(*map), map[i], val,
+			     (i == 0 && val != first_val) ?
+			     " Looks like PRNG is out of sync." : "");
+	}
+}
+
+/*
+ * The bo was purged. Never touch its mapping, but advance the
+ * pseudo-random sequence to keep it in sync for the following bos.
+ */
+static void shrink_skip(struct shrink_bo *bo, uint32_t *prng)
+{
+	size_t i;
+
+	for (i = 0; i < XE_BO_SHRINK_SIZE / sizeof(*bo->map); i++)
+		hars_petruska_f54_1_random(prng);
+
+	munmap(bo->map, XE_BO_SHRINK_SIZE);
+}
+
+/*
+ * Set up a separate VM with a dummy destination bo and a batch copying
+ * a bo bound at BLIT_SRC_ADDR to the dummy bo. A separate VM is used so
+ * that exec doesn't need to revalidate any other shrinker test bos.
+ */
+static void shrink_blit_init(int fd, struct shrink_blit *blit)
+{
+	uint32_t width = XE_BO_SHRINK_SIZE / 256;
+	uint32_t devid = intel_get_drm_devid(fd);
+	uint32_t mocs = intel_get_uc_mocs_index(fd);
+	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
+	uint32_t *cmd;
+	int i = 0;
+
+	blit->vm = xe_vm_create(fd, 0, 0);
+	blit->exec_queue = xe_exec_queue_create_class(fd, blit->vm,
+						      DRM_XE_ENGINE_CLASS_COPY);
+
+	blit->dst = xe_bo_create_caching(fd, 0, XE_BO_SHRINK_SIZE,
+					 system_memory(fd), 0,
+					 DRM_XE_GEM_CPU_CACHING_WB);
+	blit->dst_map = xe_bo_map(fd, blit->dst, XE_BO_SHRINK_SIZE);
+	xe_vm_bind_sync(fd, blit->vm, blit->dst, 0, BLIT_DST_ADDR,
+			XE_BO_SHRINK_SIZE);
+
+	blit->batch = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
+	cmd = xe_bo_map(fd, blit->batch, bb_size);
+	/* Linear page mode copy, 256 byte units. */
+	cmd[i++] = MEM_COPY_CMD | (1 << 19);
+	cmd[i++] = width - 1;
+	cmd[i++] = 0;
+	cmd[i++] = width - 1;
+	cmd[i++] = width - 1;
+	cmd[i++] = lower_32_bits(BLIT_SRC_ADDR);
+	cmd[i++] = upper_32_bits(BLIT_SRC_ADDR);
+	cmd[i++] = lower_32_bits(BLIT_DST_ADDR);
+	cmd[i++] = upper_32_bits(BLIT_DST_ADDR);
+	if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+		cmd[i++] = mocs << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs;
+	else
+		cmd[i++] = mocs << GEN12_MEM_COPY_MOCS_SHIFT | mocs;
+	cmd[i++] = MI_BATCH_BUFFER_END;
+	munmap(cmd, bb_size);
+	xe_vm_bind_sync(fd, blit->vm, blit->batch, 0, BLIT_BATCH_ADDR, bb_size);
+}
+
+static void shrink_blit_fini(int fd, struct shrink_blit *blit)
+{
+	munmap(blit->dst_map, XE_BO_SHRINK_SIZE);
+	xe_exec_queue_destroy(fd, blit->exec_queue);
+	xe_vm_destroy(fd, blit->vm);
+	gem_close(fd, blit->batch);
+	gem_close(fd, blit->dst);
+}
+
+/* Restore @bo through a GPU bind and copy, and return the copy. */
+static const uint32_t *shrink_blit_copy(int fd, struct shrink_blit *blit,
+					struct shrink_bo *bo)
+{
+	xe_vm_bind_sync(fd, blit->vm, bo->handle, 0, BLIT_SRC_ADDR,
+			XE_BO_SHRINK_SIZE);
+	xe_exec_wait(fd, blit->exec_queue, BLIT_BATCH_ADDR);
+	xe_vm_unbind_sync(fd, blit->vm, 0, BLIT_SRC_ADDR, XE_BO_SHRINK_SIZE);
+
+	return blit->dst_map;
+}
+
+/**
+ * SUBTEST: shrink
+ * Description:
+ *	Create system bos corresponding to twice the amount of free system
+ *	memory to test shrinker functionality. If no swap space is available
+ *	to accommodate the memory overcommit, mark bos purgeable.
+ * Test category: functionality test
+ *
+ * SUBTEST: purge
+ * Description:
+ *	Create system bos corresponding to twice the amount of free system
+ *	memory and mark the bos needed to accommodate the memory overcommit
+ *	purgeable regardless of available swap space, to make sure the
+ *	shrinker purges rather than swaps.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fault-inject
+ * Description:
+ *	Same as shrink, but with TTM backup and restore fault injection
+ *	enabled, making the shrinker back up only part of the bos and
+ *	making backup and restore of individual pages fail.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-blit
+ * Description:
+ *	Same as shrink, but restore and read back bos using a blitter copy
+ *	to a dummy bo instead of CPU access. On discrete devices, bos are
+ *	restored by a prefetch to VRAM.
+ * Test category: functionality test
+ *
+ * SUBTEST: purge-blit
+ * Description:
+ *	Same as purge, but restore and read back bos using a blitter copy
+ *	to a dummy bo instead of CPU access. On discrete devices, bos are
+ *	restored by a prefetch to VRAM.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fault-inject-blit
+ * Description:
+ *	Same as shrink-fault-inject, but restore and read back bos using a
+ *	blitter copy to a dummy bo instead of CPU access. On discrete
+ *	devices, bos are restored by a prefetch to VRAM.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fast
+ * Description:
+ *	Create system bos corresponding to the amount of free system memory,
+ *	half of them purgeable, and shrink them using drop_caches rather
+ *	than memory overcommit.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-blit-fast
+ * Description:
+ *	Same as shrink-fast, but restore and read back bos using a blitter
+ *	copy to a dummy bo instead of CPU access. On discrete devices, bos
+ *	are restored by a prefetch to VRAM.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fault-inject-fast
+ * Description:
+ *	Same as shrink-fast, but with TTM backup and restore fault injection
+ *	enabled.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fault-inject-blit-fast
+ * Description:
+ *	Same as shrink-blit-fast, but with TTM backup and restore fault
+ *	injection enabled.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-private-fast
+ * Description:
+ *	Same as shrink-fast, but with bos private to the test VM.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fault-inject-private-fast
+ * Description:
+ *	Same as shrink-fault-inject-fast, but with bos private to the test VM.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-private
+ * Description:
+ *	Same as shrink, but with bos private to the test VM.
+ * Test category: functionality test
+ *
+ * SUBTEST: purge-private
+ * Description:
+ *	Same as purge, but with bos private to the test VM.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fault-inject-private
+ * Description:
+ *	Same as shrink-fault-inject, but with bos private to the test VM.
+ * Test category: functionality test
+ */
+static void shrink_test_run_device(int fd, unsigned int flags)
+{
+	uint64_t ram, ram_and_swap, purgeable = 0, alloced, to_alloc, limit;
+	unsigned int count = 0, nr_bos = 0, purged = 0, retained = 0;
+	struct shrink_bo *bos;
+	struct sysinfo si;
+	struct shrink_blit blit;
+	uint64_t placement = system_memory(fd);
+	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
+	uint32_t seed, prng, vram_region = 0;
+	bool prefetch = false;
+	uint32_t vm;
+	int ret;
+
+	if (flags & SHRINK_BLIT) {
+		igt_require_f(blt_has_mem_copy(fd), "MEM_COPY not supported\n");
+		prefetch = xe_has_vram(fd);
+	}
+
+	if (prefetch) {
+		placement |= vram_memory(fd, 0);
+		cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+		vram_region = xe_mem_region(fd, vram_memory(fd, 0))->instance;
+	}
+
+	igt_assert_eq(getrandom(&seed, sizeof(seed), 0), sizeof(seed));
+	igt_info("Random seed is 0x%08x.\n", seed);
+
+	/* Skip if execution time is expected to be too long. */
+	limit = 32ull << 30;
+	/* IGFX with flat CCS needs to copy when swapping / shrinking */
+	if (!xe_has_vram(fd) && blt_platform_has_flat_ccs_enabled(fd))
+		limit = 16ull << 30;
+
+	igt_assert_eq(sysinfo(&si), 0);
+	ram = (uint64_t)si.freeram * si.mem_unit;
+
+	if (flags & SHRINK_FAST) {
+		/* No overcommit. Shrinking is triggered using drop_caches. */
+		purgeable = min_t(uint64_t, ram / 2, XE_BO_SHRINK_FAST_MAX);
+		to_alloc = purgeable + min_t(uint64_t, ram - purgeable,
+					   XE_BO_SHRINK_FAST_MAX);
+	} else {
+		igt_require_f(ram <= limit, "Too long expected execution time.\n");
+		to_alloc = ram * 2;
+
+		ram_and_swap = (flags & SHRINK_PURGE) ? ram :
+			ram + (uint64_t)si.freeswap * si.mem_unit;
+		if (to_alloc > ram_and_swap)
+			purgeable = to_alloc - ram_and_swap;
+		purgeable += purgeable / 5;
+	}
+
+	igt_info("Free ram is %" PRIu64 " bytes. Will allocate %" PRIu64
+		 " bytes, %" PRIu64 " bytes purgeable.\n",
+		 ram, to_alloc, purgeable);
+	igt_require_f(!purgeable || xe_has_purgeable_support(fd),
+		      "Kernel does not support purgeable buffer objects\n");
+
+	if (flags & SHRINK_FAULT_INJECT)
+		ttm_fault_inject_enable();
+
+	bos = calloc(DIV_ROUND_UP(to_alloc, XE_BO_SHRINK_SIZE), sizeof(*bos));
+	igt_assert(bos);
+
+	if (flags & SHRINK_BLIT)
+		shrink_blit_init(fd, &blit);
+
+	vm = xe_vm_create(fd, 0, 0);
+	prng = seed;
+	for (alloced = 0; alloced < to_alloc; alloced += XE_BO_SHRINK_SIZE) {
+		struct shrink_bo *bo = &bos[nr_bos];
+
+		/* The uAPI requires WC with VRAM placement. */
+		ret = __xe_bo_create_caching(fd,
+					     (flags & SHRINK_PRIVATE) ? vm : 0,
+					     XE_BO_SHRINK_SIZE,
+					     placement, 0, cpu_caching,
+					     &bo->handle);
+		if (ret) {
+			igt_assert_f(ret == -ENOMEM || ret == -ENOSPC ||
+				     ret == -EINTR,
+				     "Error creating bo: %d\n", ret);
+			igt_info("Bo creation failed with %d after %" PRIu64
+				 " bytes.\n", ret, alloced);
+			break;
+		}
+		nr_bos++;
+
+		/*
+		 * Allocate purgeable bos first, because if we do it the
+		 * other way around, they may not be subject to swapping...
+		 * Purgeable state and prefetch are set per VMA, so bind
+		 * the bo first.
+		 */
+		bo->purgeable = alloced < purgeable;
+		bo->bound = bo->purgeable || prefetch;
+		bo->addr = XE_BO_SHRINK_VA_BASE + alloced;
+		if (bo->bound)
+			xe_vm_bind_sync(fd, vm, bo->handle, 0, bo->addr,
+					XE_BO_SHRINK_SIZE);
+		/* CPU faults wait for the migration to complete. */
+		if (prefetch)
+			xe_vm_prefetch_async(fd, vm, 0, 0, bo->addr,
+					     XE_BO_SHRINK_SIZE, NULL, 0, 0);
+
+		/* mmap() is blocked in DONTNEED state, so fill first. */
+		shrink_fill_random(fd, bo, &prng);
+
+		/*
+		 * The CPU mapping is kept, but must not be accessed until
+		 * the bo is marked WILLNEED and found retained.
+		 */
+		if (bo->purgeable)
+			xe_vm_madvise_purgeable(fd, vm, bo->addr,
+						XE_BO_SHRINK_SIZE,
+						DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
+	}
+
+	if (flags & SHRINK_FAST)
+		igt_purge_vm_caches(fd);
+
+	/*
+	 * Read back and destroy bos. Reset the pseudo-random seed to get an
+	 * identical pseudo-random number sequence for readback.
+	 */
+	prng = seed;
+	for (count = 0; count < nr_bos; count++) {
+		struct shrink_bo *bo = &bos[count];
+
+		if (bo->purgeable &&
+		    !xe_vm_madvise_purgeable(fd, vm, bo->addr,
+					     XE_BO_SHRINK_SIZE,
+					     DRM_XE_VMA_PURGEABLE_STATE_WILLNEED)) {
+			purged++;
+			shrink_skip(bo, &prng);
+		} else {
+			const uint32_t *map = bo->map;
+
+			retained += bo->purgeable;
+			/* The blit bind and exec wait for the migration. */
+			if (prefetch)
+				xe_vm_prefetch_async(fd, vm, 0, 0, bo->addr,
+						     XE_BO_SHRINK_SIZE, NULL, 0,
+						     vram_region);
+			if (flags & SHRINK_BLIT)
+				map = shrink_blit_copy(fd, &blit, bo);
+			shrink_verify(map, bo->val, count + 1, &prng);
+			munmap(bo->map, XE_BO_SHRINK_SIZE);
+		}
+
+		if (bo->bound)
+			xe_vm_unbind_sync(fd, vm, 0, bo->addr, XE_BO_SHRINK_SIZE);
+		gem_close(fd, bo->handle);
+	}
+
+	igt_info("Readbacks successful: %u (%u purgeable retained), purgeable bos purged: %u\n",
+		 nr_bos - purged, retained, purged);
+
+	if (flags & SHRINK_BLIT)
+		shrink_blit_fini(fd, &blit);
+	xe_vm_destroy(fd, vm);
+	free(bos);
+
+	if (flags & SHRINK_FAST)
+		igt_assert_f(purged > 0, "No purgeable bos were purged\n");
+
+	if (flags & SHRINK_FAULT_INJECT) {
+		int32_t injected = ttm_fault_inject_count();
+
+		ttm_fault_inject_restore(0);
+		igt_info("TTM backup / restore faults injected: %d\n", injected);
+		igt_assert_f(injected > 0,
+			     "No TTM backup / restore faults were injected\n");
+	}
+}
+
+int igt_main()
+{
+	const struct section {
+		const char *name;
+		unsigned int flags;
+	} sections[] = {
+		{ "shrink-fast", SHRINK_FAST },
+		{ "shrink-blit-fast", SHRINK_FAST | SHRINK_BLIT },
+		{ "shrink-fault-inject-fast", SHRINK_FAST | SHRINK_FAULT_INJECT },
+		{ "shrink-fault-inject-blit-fast",
+		  SHRINK_FAST | SHRINK_FAULT_INJECT | SHRINK_BLIT },
+		{ "shrink-private-fast", SHRINK_FAST | SHRINK_PRIVATE },
+		{ "shrink-fault-inject-private-fast",
+		  SHRINK_FAST | SHRINK_FAULT_INJECT | SHRINK_PRIVATE },
+		{ "shrink", 0 },
+		{ "shrink-blit", SHRINK_BLIT },
+		{ "purge", SHRINK_PURGE },
+		{ "purge-blit", SHRINK_PURGE | SHRINK_BLIT },
+		{ "shrink-fault-inject", SHRINK_FAULT_INJECT },
+		{ "shrink-fault-inject-blit", SHRINK_FAULT_INJECT | SHRINK_BLIT },
+		{ "shrink-private", SHRINK_PRIVATE },
+		{ "purge-private", SHRINK_PURGE | SHRINK_PRIVATE },
+		{ "shrink-fault-inject-private", SHRINK_FAULT_INJECT | SHRINK_PRIVATE },
+		{ }
+	};
+	int fd;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		xe_device_get(fd);
+	}
+
+	for (const struct section *s = sections; s->name; s++)
+		igt_subtest(s->name)
+			shrink_test_run_device(fd, s->flags);
+
+	igt_fixture() {
+		ttm_fault_inject_restore(0);
+		xe_device_put(fd);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 519a9e727..2f50f000d 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -284,6 +284,7 @@ intel_kms_progs = [
 
 intel_xe_progs = [
 	'xe_wedged',
+	'xe_bo_shrink',
 	'xe_ccs',
 	'xe_create',
 	'xe_compute',
-- 
2.56.0

