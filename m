Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C8606A329
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 13:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BQ53005y
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3DC10E107;
	Fri,  6 Nov 2026 13:13:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AB3310E107
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793970770; x=1825506770;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uEkyoOd3mrcnkWgHgHrJCJJjGeMAhfKoFs8thwfrK/c=;
 b=BQ53005yA7MqQ6I0Cg6wEYZrRGZswuoetIt4nvd9zi47NpUKXMq394Mj
 Bzy1xWDsSVsBz99BufEC6Bf4kTE9ngO1Ne1DAuvTgHk9hvZqaDbzSnqmI
 O7qx/PELEQMB6t4GAhoEAcabpe7e5TsmQB+eGtd/mAc40jymtalE/ddcG
 Hisy4qzv1Ag9ASkvwYdB432+wZojSNb/Obik6E+avcH1j/ms+r4FNp4N3
 8xC+qdHEakoJ9tqMhADvQECKUxasrW3jmZNCGPqu5ulJYSjbLdc5N+/rT
 MjWW308XNjc0KGS81qY9WEOOAklwL53wMMz1/PIHE3PxKIGKG92pRS8Gc w==;
X-CSE-ConnectionGUID: tnX8dD67QHG8Bvpd0BP+sA==
X-CSE-MsgGUID: vY5NzzaQRniyp0iUKCuWZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2776186"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2776186"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:12:50 -0800
X-CSE-ConnectionGUID: 2KqBVsMQQlSG4L1XT/xhZA==
X-CSE-MsgGUID: 7BJwOH6fRYuDDIr5UxKt6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7632876"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO fedora)
 ([10.245.245.125])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 05:12:48 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH i-g-t v3] tests/intel/xe_bo_shrink: Add a user-space shrinker
 test
Date: Fri,  6 Nov 2026 14:12:24 +0100
Message-ID: <20261106131226.40643-1-thomas.hellstrom@linux.intel.com>
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
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
  fail. The number of injected faults is checked to be non-zero,
  unless there was less than 1 GiB of free swap space at test start.
- *-blit: Never access the objects using the CPU. Instead fill them
  from, and read them back to, a CPU-mapped dummy object using MEM_COPY
  blits in a separate VM, so that they are restored through the GPU
  paths. On integrated devices with flat CCS, bind the objects using a
  compressed PAT index to cover shrinking of compressed system memory
  objects. On discrete devices, objects are created with system and VRAM
  placements, prefetched to system memory before the fill and prefetched
  to VRAM before the readback, so that they are restored by the
  migration to VRAM.
- *-private: Create the objects private to the test VM rather than as
  external objects.
- *-fast: Allocate at most the free system memory, half of it
  purgeable, capped to 8 GiB purgeable and 8 GiB non-purgeable, and
  shrink using drop_caches rather than memory overcommit.

The non-fast subtests are slow and require a substantial amount of
swap space for meaningful coverage, so block them in CI and run only
the fast subtests.

v2:
- Don't fail the fault-inject subtests if no faults were injected and
  there was less than XE_BO_SHRINK_FI_MIN_SWAP (1 GiB) free swap space
  at test start, since nothing is then backed up or restored
- Never access the blit variant bos using the CPU, not even for the
  fill. Fill them by blitting from the dummy bo instead
- Bind the blit variant bos using a compressed PAT index on integrated
  devices with flat CCS to test shrinking of compressed system memory
  bos (Matthew Auld)

v3:
- Create bos that are not intended to be compressed with
  DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION, if supported, for consistent
  behaviour across platforms (Matthew Auld)
- Use cached MOCS for the blitter copies (Matthew Auld)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Assisted-by: GitHub_Copilot:claude-opus-5.5
Reviewed-by: Matthew Auld <matthew.auld@intel.com> #v2
---
 tests/intel-ci/xe.blocklist.txt |   3 +-
 tests/intel/xe_bo_shrink.c      | 723 ++++++++++++++++++++++++++++++++
 tests/meson.build               |   1 +
 3 files changed, 726 insertions(+), 1 deletion(-)
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
index 000000000..d93882265
--- /dev/null
+++ b/tests/intel/xe_bo_shrink.c
@@ -0,0 +1,723 @@
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
+ * The blit variants never access the bos using the CPU. Instead each bo is
+ * bound to a separate VM and filled from, and read back to, a CPU-mapped
+ * dummy bo using the MEM_COPY blitter command, so that bos are restored by
+ * the GPU paths rather than by CPU faults, and the content of the dummy bo
+ * is verified. On integrated devices with flat CCS, the bos are bound using
+ * a compressed PAT index, so that compressed system memory bos, including
+ * their CCS metadata, are subject to shrinking and restore. On discrete
+ * devices, the blit variants create the bos with both system and VRAM
+ * placements and prefetch them to system memory before the fill. Before
+ * the readback copy, each bo is prefetched to VRAM, so that it is restored
+ * by the migration to VRAM.
+ *
+ * All other bos are created with DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION,
+ * if supported, so that platforms with snooped compression don't need to
+ * back up and restore CCS metadata of bos that are never compressed.
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
+#include "igt_syncobj.h"
+#include "igt_sysfs.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
+#include "intel_pat.h"
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
+/* Min free swap at test start for fault injection to be required. */
+#define XE_BO_SHRINK_FI_MIN_SWAP	(1ull << 30)
+
+#define BLIT_BATCH_ADDR		(1ull << 20)
+/* Offset of the readback copy batch, after the fill copy batch. */
+#define BLIT_READBACK_OFFSET	256
+#define BLIT_DUMMY_ADDR		(1ull << 32)
+#define BLIT_BO_ADDR		(2ull << 32)
+
+#define SHRINK_PURGE		(0x1 << 0)
+#define SHRINK_FAULT_INJECT	(0x1 << 1)
+#define SHRINK_BLIT		(0x1 << 2)
+#define SHRINK_FAST		(0x1 << 3)
+#define SHRINK_PRIVATE		(0x1 << 4)
+
+/**
+ * struct shrink_bo - A shrinker test bo
+ * @map: Persistent CPU mapping of the bo, kept from fill until readback,
+ * or NULL if the bo is filled and read back using blitter copies.
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
+ * struct shrink_blit - State for blitter fill and readback of bos
+ * @vm: A separate VM used for the copies.
+ * @exec_queue: Copy engine exec queue in @vm.
+ * @batch: Batch bo holding the fill and readback MEM_COPY commands.
+ * @dummy: Dummy bo in system memory, the source of the fill copies and
+ * the destination of the readback copies.
+ * @dummy_map: CPU mapping of @dummy, used to generate and verify content.
+ * @syncobj: Syncobj used to wait for binds of the bos.
+ * @pat_index: PAT index used to bind the bos, compressed if supported.
+ */
+struct shrink_blit {
+	uint32_t vm;
+	uint32_t exec_queue;
+	uint32_t batch;
+	uint32_t dummy;
+	uint32_t *dummy_map;
+	uint32_t syncobj;
+	uint8_t pat_index;
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
+static bool xe_has_no_compression_hint(int fd)
+{
+	struct drm_xe_query_config *config = xe_config(fd);
+
+	return config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
+}
+
+/* Fill @map with pseudo-random data and return the first value. */
+static uint32_t shrink_fill_random(uint32_t *map, uint32_t *prng)
+{
+	size_t i;
+
+	for (i = 0; i < XE_BO_SHRINK_SIZE / sizeof(*map); i++)
+		map[i] = hars_petruska_f54_1_random(prng);
+
+	return map[0];
+}
+
+/*
+ * The CPU mapping is kept until shrink_verify(), so that the shrinker
+ * needs to zap the PTEs of a live mapping and readback restores the
+ * bo through that same mapping.
+ */
+static void shrink_fill_cpu(int fd, struct shrink_bo *bo, uint32_t *prng)
+{
+	bo->map = xe_bo_map(fd, bo->handle, XE_BO_SHRINK_SIZE);
+	bo->val = shrink_fill_random(bo->map, prng);
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
+	for (i = 0; i < XE_BO_SHRINK_SIZE / sizeof(uint32_t); i++)
+		hars_petruska_f54_1_random(prng);
+
+	if (bo->map)
+		munmap(bo->map, XE_BO_SHRINK_SIZE);
+}
+
+/* Emit a linear page mode MEM_COPY of a bo sized range. */
+static int shrink_blit_emit_copy(int fd, uint32_t *cmd, int i,
+				 uint64_t src, uint64_t dst)
+{
+	uint32_t width = XE_BO_SHRINK_SIZE / 256;
+	/* Cached, so that bos may have dirty GPU cache lines when shrunk. */
+	uint32_t mocs = intel_get_wb_mocs_index(fd);
+
+	/* 256 byte units. */
+	cmd[i++] = MEM_COPY_CMD | (1 << 19);
+	cmd[i++] = width - 1;
+	cmd[i++] = 0;
+	cmd[i++] = width - 1;
+	cmd[i++] = width - 1;
+	cmd[i++] = lower_32_bits(src);
+	cmd[i++] = upper_32_bits(src);
+	cmd[i++] = lower_32_bits(dst);
+	cmd[i++] = upper_32_bits(dst);
+	if (intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(20, 0))
+		cmd[i++] = mocs << XE2_MEM_COPY_SRC_MOCS_SHIFT | mocs;
+	else
+		cmd[i++] = mocs << GEN12_MEM_COPY_MOCS_SHIFT | mocs;
+	cmd[i++] = MI_BATCH_BUFFER_END;
+
+	return i;
+}
+
+/*
+ * Set up a separate VM with a dummy bo and batches copying from the dummy
+ * bo to a bo bound at BLIT_BO_ADDR, and vice versa. A separate VM is used
+ * so that exec doesn't need to revalidate any other shrinker test bos.
+ */
+static void shrink_blit_init(int fd, struct shrink_blit *blit,
+			     uint8_t pat_index)
+{
+	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
+	uint32_t *cmd;
+	int i;
+
+	blit->pat_index = pat_index;
+	blit->syncobj = syncobj_create(fd, 0);
+	blit->vm = xe_vm_create(fd, 0, 0);
+	blit->exec_queue = xe_exec_queue_create_class(fd, blit->vm,
+						      DRM_XE_ENGINE_CLASS_COPY);
+
+	blit->dummy = xe_bo_create_caching(fd, 0, XE_BO_SHRINK_SIZE,
+					   system_memory(fd), 0,
+					   DRM_XE_GEM_CPU_CACHING_WB);
+	blit->dummy_map = xe_bo_map(fd, blit->dummy, XE_BO_SHRINK_SIZE);
+	xe_vm_bind_sync(fd, blit->vm, blit->dummy, 0, BLIT_DUMMY_ADDR,
+			XE_BO_SHRINK_SIZE);
+
+	blit->batch = xe_bo_create(fd, 0, bb_size, system_memory(fd), 0);
+	cmd = xe_bo_map(fd, blit->batch, bb_size);
+	i = shrink_blit_emit_copy(fd, cmd, 0, BLIT_DUMMY_ADDR, BLIT_BO_ADDR);
+	igt_assert(i * sizeof(*cmd) <= BLIT_READBACK_OFFSET);
+	shrink_blit_emit_copy(fd, cmd, BLIT_READBACK_OFFSET / sizeof(*cmd),
+			      BLIT_BO_ADDR, BLIT_DUMMY_ADDR);
+	munmap(cmd, bb_size);
+	xe_vm_bind_sync(fd, blit->vm, blit->batch, 0, BLIT_BATCH_ADDR, bb_size);
+}
+
+static void shrink_blit_fini(int fd, struct shrink_blit *blit)
+{
+	munmap(blit->dummy_map, XE_BO_SHRINK_SIZE);
+	xe_exec_queue_destroy(fd, blit->exec_queue);
+	xe_vm_destroy(fd, blit->vm);
+	gem_close(fd, blit->batch);
+	gem_close(fd, blit->dummy);
+	syncobj_destroy(fd, blit->syncobj);
+}
+
+/* Bind @bo using the blit PAT index, run the batch at @batch_addr. */
+static void shrink_blit_copy(int fd, struct shrink_blit *blit,
+			     struct shrink_bo *bo, uint64_t batch_addr)
+{
+	struct drm_xe_sync sync = {
+		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
+		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
+		.handle = blit->syncobj,
+	};
+
+	igt_assert_eq(__xe_vm_bind(fd, blit->vm, 0, bo->handle, 0,
+				   BLIT_BO_ADDR, XE_BO_SHRINK_SIZE,
+				   DRM_XE_VM_BIND_OP_MAP, 0, &sync, 1, 0,
+				   blit->pat_index, 0), 0);
+	igt_assert(syncobj_wait(fd, &blit->syncobj, 1, INT64_MAX, 0, NULL));
+	syncobj_reset(fd, &blit->syncobj, 1);
+	xe_exec_wait(fd, blit->exec_queue, batch_addr);
+	xe_vm_unbind_sync(fd, blit->vm, 0, BLIT_BO_ADDR, XE_BO_SHRINK_SIZE);
+}
+
+/* Fill @bo with pseudo-random data through the dummy bo. */
+static void shrink_blit_fill(int fd, struct shrink_blit *blit,
+			     struct shrink_bo *bo, uint32_t *prng)
+{
+	bo->val = shrink_fill_random(blit->dummy_map, prng);
+	shrink_blit_copy(fd, blit, bo, BLIT_BATCH_ADDR);
+}
+
+/* Restore @bo through a GPU bind and copy, and return the copy. */
+static const uint32_t *shrink_blit_readback(int fd, struct shrink_blit *blit,
+					    struct shrink_bo *bo)
+{
+	shrink_blit_copy(fd, blit, bo, BLIT_BATCH_ADDR + BLIT_READBACK_OFFSET);
+
+	return blit->dummy_map;
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
+ *	making backup and restore of individual pages fail. Fail if no
+ *	faults were injected, unless there was less than
+ *	XE_BO_SHRINK_FI_MIN_SWAP free swap space at test start.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-blit
+ * Description:
+ *	Same as shrink, but fill, restore and read back bos using
+ *	blitter copies from and to a dummy bo instead of CPU access.
+ *	On integrated devices with flat CCS, the bos are compressed.
+ *	On discrete devices, bos are restored by a prefetch to VRAM.
+ * Test category: functionality test
+ *
+ * SUBTEST: purge-blit
+ * Description:
+ *	Same as purge, but fill, restore and read back bos using
+ *	blitter copies from and to a dummy bo instead of CPU access.
+ *	On integrated devices with flat CCS, the bos are compressed.
+ *	On discrete devices, bos are restored by a prefetch to VRAM.
+ * Test category: functionality test
+ *
+ * SUBTEST: shrink-fault-inject-blit
+ * Description:
+ *	Same as shrink-fault-inject, but fill, restore and read back bos using
+ *	blitter copies from and to a dummy bo instead of CPU access.
+ *	On integrated devices with flat CCS, the bos are compressed.
+ *	On discrete devices, bos are restored by a prefetch to VRAM.
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
+ *	Same as shrink-fast, but fill, restore and read back bos using
+ *	blitter copies from and to a dummy bo instead of CPU access.
+ *	On integrated devices with flat CCS, the bos are compressed.
+ *	On discrete devices, bos are restored by a prefetch to VRAM.
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
+	uint64_t ram, swap, ram_and_swap, purgeable = 0, alloced, to_alloc, limit;
+	unsigned int count = 0, nr_bos = 0, purged = 0, retained = 0;
+	struct shrink_bo *bos;
+	struct sysinfo si;
+	struct shrink_blit blit;
+	uint64_t placement = system_memory(fd);
+	uint16_t cpu_caching = DRM_XE_GEM_CPU_CACHING_WB;
+	uint32_t seed, prng, vram_region = 0;
+	uint8_t pat_index = DEFAULT_PAT_INDEX;
+	uint32_t create_flags = 0;
+	bool prefetch = false;
+	uint32_t vm;
+	int ret;
+
+	if (flags & SHRINK_BLIT) {
+		uint16_t devid = intel_get_drm_devid(fd);
+
+		igt_require_f(blt_has_mem_copy(fd), "MEM_COPY not supported\n");
+		prefetch = xe_has_vram(fd);
+
+		/*
+		 * Test compressed system memory bos. On discrete devices,
+		 * system memory can't be compressed.
+		 */
+		if (!xe_has_vram(fd) && intel_gen(devid) >= 20 &&
+		    HAS_FLATCCS(devid) && blt_platform_has_flat_ccs_enabled(fd)) {
+			pat_index = intel_get_pat_idx_uc_comp(fd);
+			/* The compressed PAT index is not coherent. */
+			cpu_caching = DRM_XE_GEM_CPU_CACHING_WC;
+		}
+		igt_info("Blit using %s bos.\n",
+			 pat_index == DEFAULT_PAT_INDEX ? "uncompressed" :
+			 "compressed");
+	}
+
+	/*
+	 * Unless testing compression, avoid CCS backup and restore of bos
+	 * that could otherwise be bound compressed, for consistent
+	 * behaviour across platforms.
+	 */
+	if (pat_index == DEFAULT_PAT_INDEX && xe_has_no_compression_hint(fd))
+		create_flags |= DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION;
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
+	swap = (uint64_t)si.freeswap * si.mem_unit;
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
+		ram_and_swap = (flags & SHRINK_PURGE) ? ram : ram + swap;
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
+		shrink_blit_init(fd, &blit, pat_index);
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
+					     placement, create_flags,
+					     cpu_caching,
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
+		/* The blit bind and exec wait for the migration. */
+		if (prefetch)
+			xe_vm_prefetch_async(fd, vm, 0, 0, bo->addr,
+					     XE_BO_SHRINK_SIZE, NULL, 0, 0);
+
+		/* mmap() is blocked in DONTNEED state, so fill first. */
+		if (flags & SHRINK_BLIT)
+			shrink_blit_fill(fd, &blit, bo, &prng);
+		else
+			shrink_fill_cpu(fd, bo, &prng);
+
+		/*
+		 * A CPU mapping is kept, but must not be accessed until
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
+				map = shrink_blit_readback(fd, &blit, bo);
+			shrink_verify(map, bo->val, count + 1, &prng);
+			if (bo->map)
+				munmap(bo->map, XE_BO_SHRINK_SIZE);
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
+		/* Without swap space, nothing is backed up or restored. */
+		igt_assert_f(injected > 0 || swap < XE_BO_SHRINK_FI_MIN_SWAP,
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

