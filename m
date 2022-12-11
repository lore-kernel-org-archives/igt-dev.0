Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB63810E11A
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 19:52:43 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 k88-20020a17090a4ce100b00219d0b857bcso10064738pjh.1
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Dec 2022 11:52:43 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 11 Dec 2022 11:52:38 -0800
Message-Id: <20221211195238.120566-2-robdclark@gmail.com>
In-Reply-To: <20221211195238.120566-1-robdclark@gmail.com>
References: <20221211195238.120566-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 2/2] tests/msm: Add GEM shrinker/eviction test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Adds a test to various subtests to stress shrinker/eviction.  Various
subtests also add mmap and dma-buf mmap into the mix (the latter because
it uncovered a memory corruption bug due to page mappings not being
correctly shot down).

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 lib/igt_msm.c          |   2 +-
 lib/igt_msm.h          |   6 +-
 tests/meson.build      |   1 +
 tests/msm/msm_shrink.c | 314 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 321 insertions(+), 2 deletions(-)
 create mode 100644 tests/msm/msm_shrink.c

diff --git a/lib/igt_msm.c b/lib/igt_msm.c
index e9cf588f..8c0380f4 100644
--- a/lib/igt_msm.c
+++ b/lib/igt_msm.c
@@ -268,7 +268,7 @@ igt_msm_cmd_submit(struct msm_cmd *cmd)
 		},
 	};
 	struct drm_msm_gem_submit req = {
-			.flags   = cmd->pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT,
+			.flags   = cmd->pipe->pipe | MSM_SUBMIT_FENCE_FD_OUT | MSM_SUBMIT_NO_IMPLICIT,
 			.queueid = cmd->pipe->submitqueue_id,
 			.nr_cmds = ARRAY_SIZE(cmds),
 			.cmds    = VOID2U64(cmds),
diff --git a/lib/igt_msm.h b/lib/igt_msm.h
index 6008020b..413c7ea6 100644
--- a/lib/igt_msm.h
+++ b/lib/igt_msm.h
@@ -97,10 +97,14 @@ enum adreno_pm4_packet_type {
 
 enum adreno_pm4_type3_packets {
 	CP_NOP = 16,
+	CP_WAIT_MEM_WRITES = 18,
+	CP_WAIT_FOR_ME = 19,
 	CP_WAIT_MEM_GTE = 20,
+	CP_WAIT_FOR_IDLE = 38,
 	CP_WAIT_REG_MEM = 60,
 	CP_MEM_WRITE = 61,
 	CP_MEM_TO_MEM = 115,
+	CP_MEMCPY = 117,
 };
 
 static inline unsigned
@@ -157,7 +161,7 @@ struct msm_cmd {
 	struct msm_bo *cmdstream_bo;
 	uint32_t *cur;
 	uint32_t nr_bos;
-	struct msm_bo *bos[8];
+	struct msm_bo *bos[128];
 };
 
 struct msm_cmd *igt_msm_cmd_new(struct msm_pipe *pipe, size_t size);
diff --git a/tests/meson.build b/tests/meson.build
index 619c18b2..424f050f 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -253,6 +253,7 @@ i915_progs = [
 msm_progs = [
 	'msm_mapping',
 	'msm_recovery',
+	'msm_shrink',
 	'msm_submit'
 ]
 
diff --git a/tests/msm/msm_shrink.c b/tests/msm/msm_shrink.c
new file mode 100644
index 00000000..d0b098aa
--- /dev/null
+++ b/tests/msm/msm_shrink.c
@@ -0,0 +1,314 @@
+/*
+ * Copyright © 2022 Google, Inc.
+ * Copyright © 2016 Intel Corporation
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include <fcntl.h>
+#include <sys/mman.h>
+
+#include "igt.h"
+#include "igt_msm.h"
+#include "igt_os.h"
+#include "igt_sysfs.h"
+
+#define SZ_1M (1024 * 1024)
+
+static void leak(uint64_t alloc)
+{
+	char *ptr;
+
+	ptr = mmap(NULL, alloc, PROT_READ | PROT_WRITE,
+		   MAP_ANON | MAP_PRIVATE | MAP_POPULATE,
+		   -1, 0);
+	if (ptr == MAP_FAILED)
+		return;
+
+	while (alloc > 4096) {
+		alloc -= 4096;
+		ptr[alloc] = 0;
+	}
+}
+
+static void madvise_dontneed(struct msm_bo *bo)
+{
+	struct drm_msm_gem_madvise req = {
+		.handle = bo->handle,
+		.madv = MSM_MADV_DONTNEED,
+	};
+	do_ioctl(bo->dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+}
+
+static struct msm_cmd *cmd_copy_gpu(struct msm_pipe *pipe, unsigned num_bos, struct msm_bo **bos)
+{
+	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x1000);
+
+	assert((num_bos % 2) == 0);
+
+	for (unsigned i = 0; i < (num_bos / 2); i++) {
+		struct msm_bo *dst = bos[2*i];
+		struct msm_bo *src = bos[2*i+1];
+
+		unsigned dwords = min(0x2000u, dst->size / 4);
+
+		msm_cmd_pkt7(cmd, CP_MEMCPY, 5);
+		msm_cmd_emit(cmd, dwords);          /* DWORDS */
+		msm_cmd_bo  (cmd, src, 0);          /* SRC_LO/HI */
+		msm_cmd_bo  (cmd, dst, 0);          /* DST_LO/HI */
+		msm_cmd_pkt7(cmd, CP_WAIT_MEM_WRITES, 0);
+		msm_cmd_pkt7(cmd, CP_WAIT_FOR_IDLE, 0);
+		msm_cmd_pkt7(cmd, CP_WAIT_FOR_ME, 0);
+	}
+
+	return cmd;
+}
+
+static void *map_dmabuf(struct msm_bo *bo)
+{
+	int fd, ret;
+	void *ptr;
+
+	ret = drmPrimeHandleToFD(bo->dev->fd, bo->handle, DRM_CLOEXEC | DRM_RDWR, &fd);
+	igt_assert_eq(ret, 0);
+
+	ptr = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
+	igt_assert(ptr != MAP_FAILED);
+
+	close(fd);
+
+	return ptr;
+}
+
+struct test {
+	const char *name;
+	struct msm_cmd *(*cmd)(struct msm_pipe *pipe, unsigned num_bos, struct msm_bo **bos);
+	void *(*map)(struct msm_bo *bo);
+} tests[] = {
+	{ "copy-gpu", cmd_copy_gpu },
+	{ "copy-mmap", cmd_copy_gpu, igt_msm_bo_map },
+	{ "copy-mmap-dmabuf", cmd_copy_gpu, map_dmabuf },
+	{},
+};
+
+enum testmode {
+	SANITY_CHECK	= BIT(0),
+	SINGLE_THREAD	= BIT(1),
+	MADVISE		= BIT(2),
+	OOM		= BIT(3),
+};
+
+static const struct mode {
+	const char *suffix;
+	unsigned flags;
+} modes[] = {
+	{ "-sanitycheck", SANITY_CHECK },
+/* Disable by default to keep test runtime down:
+	{ "-singlethread", SINGLE_THREAD },
+ */
+	{ "", 0 },
+	{ "-madvise", MADVISE },
+	{ "-oom", OOM },
+	{ NULL },
+};
+
+static void do_test(int num_submits, uint64_t alloc_size_kb, int num_bos,
+		    unsigned timeout, bool do_madvise, const struct test *test)
+{
+	struct msm_device *dev = igt_msm_dev_open();
+	struct msm_pipe *pipe = igt_msm_pipe_open(dev, 0);
+	struct msm_bo *bo[num_submits][num_bos];
+	struct msm_cmd *cmd[num_submits];
+	void *map[num_submits][num_bos];
+	int fence_fd = -1;
+
+	/* Allocate the buffer objects and prepare the cmds: */
+	for (int i = 0; i < num_submits; i++) {
+		for (int j = 0; j < num_bos; j++) {
+			bo[i][j] = igt_msm_bo_new(dev, alloc_size_kb * 1024, MSM_BO_WC);
+		}
+		cmd[i] = test->cmd(pipe, num_bos, bo[i]);
+	}
+
+	/* Prepare the CPU maps, if necessary: */
+	if (test->map) {
+		for (int i = 0; i < num_submits; i++) {
+			for (int j = 0; j < num_bos; j++) {
+				map[i][j] = test->map(bo[i][j]);
+				memset(map[i][j], 0xde, bo[i][j]->size);
+			}
+		}
+	}
+
+	igt_until_timeout(timeout) {
+		for (int i = 0; i < num_submits / 2; i++) {
+			if (fence_fd > 0)
+				close(fence_fd);
+			fence_fd = igt_msm_cmd_submit(cmd[i]);
+		}
+
+		igt_wait_and_close(fence_fd);
+		fence_fd = -1;
+
+		if (test->map) {
+			for (int i = 0; i < num_submits; i++) {
+				for (int j = 0; j < num_bos; j++) {
+					memset(map[i][j], 0xde, bo[i][j]->size);
+				}
+			}
+		}
+
+		for (int i = num_submits / 2; i < num_submits; i++) {
+			if (fence_fd > 0)
+				close(fence_fd);
+			fence_fd = igt_msm_cmd_submit(cmd[i]);
+		}
+		igt_wait_and_close(fence_fd);
+		fence_fd = -1;
+	}
+
+	if (do_madvise) {
+		for (int i = 0; i < num_submits; i++) {
+			if (fence_fd > 0)
+				close(fence_fd);
+			fence_fd = igt_msm_cmd_submit(cmd[i]);
+			for (int j = 0; j < num_bos; j++) {
+				madvise_dontneed(bo[i][j]);
+			}
+		}
+		igt_wait_and_close(fence_fd);
+		fence_fd = -1;
+	}
+}
+
+static void run_test(int nchildren, uint64_t alloc_size_mb, unsigned num_bos,
+		     const struct test *test, unsigned flags)
+{
+	const int timeout = (test->map) || (flags & (SANITY_CHECK | MADVISE)) ? 1 : 10;
+	bool madvise = !!(flags & MADVISE);
+	uint64_t alloc_size_kb;
+
+	/* We are trying to use more GEM buffers that will fit in
+	 * memory, but less than 2x avail RAM.  Split across at
+	 * least two submits so we aren't getting into a scenario
+	 * where all the children are trying to pin all the memory
+	 * at the same time and get into a situation where no one
+	 * can make forward progress.
+	 */
+	unsigned num_submits = 8;
+
+	if (flags & SANITY_CHECK)
+		nchildren = 1;
+
+	alloc_size_kb = DIV_ROUND_UP(alloc_size_mb * 1024, num_bos * num_submits);
+
+	if (flags & SINGLE_THREAD) {
+		num_submits *= nchildren;
+		nchildren = 1;
+	}
+
+	igt_info("%s, %d submits, %d processes, and %d x %'"PRIu64"KiB bos per submit for total size of %'"PRIu64"KiB\n",
+		 test->name, num_submits, nchildren, num_bos, alloc_size_kb,
+		 num_bos * num_submits * nchildren * alloc_size_kb);
+
+	/* Background load */
+	if (flags & OOM) {
+		igt_fork(child, nchildren) {
+			for (int pass = 0; pass < nchildren; pass++)
+				leak(alloc_size_kb / 1024);
+		}
+	}
+
+	/* Exercise major ioctls */
+	igt_fork(child, nchildren) {
+		do_test(num_submits, alloc_size_kb, num_bos, timeout, madvise, test);
+	}
+	igt_waitchildren();
+}
+
+static const unsigned num_bos[] = { 8, 32 };
+
+igt_main
+{
+	struct msm_device *dev = NULL;
+	uint64_t alloc_size_mb = 0;
+	int num_processes = 0;
+
+	igt_fixture {
+		int params, ncpus;
+		uint64_t mem_size;
+		uint64_t swap_size;
+
+		/* Make sure we are running on the right hw: */
+		dev = igt_msm_dev_open();
+
+		igt_require(dev->gen >= 6);
+
+		/* Ensure that eviction is enabled: */
+		params = igt_params_open(dev->fd);
+		igt_sysfs_set(params, "enable_eviction", "1");
+		igt_sysfs_set(params, "address_space_size", "0x400000000");
+		close(params);
+
+		/* Figure out # of processes and allocation size: */
+		ncpus = sysconf(_SC_NPROCESSORS_ONLN);
+		mem_size = igt_get_total_ram_mb();
+		swap_size = igt_get_total_swap_mb();
+
+		igt_require(swap_size > 0);
+
+		/*
+		 * Spawn enough processes to use all memory, but each only
+		 * uses a fraction of the available per-cpu memory.
+		 * Individually the processes would be ok, but en masse
+		 * we expect the shrinker to start purging objects,
+		 * and possibly fail.
+		 *
+		 * Note, consider only a fraction of avail swap when
+		 * calculating target size, as we have no good way to
+		 * determine if it is zram swap (which will consume an
+		 * increasing portion of RAM as it is filled)
+		 */
+		mem_size += swap_size / 4;
+		alloc_size_mb = (mem_size + ncpus - 1) / ncpus / 8;
+		num_processes = ncpus + (mem_size / alloc_size_mb);
+
+		igt_info("Using %d processes and %'"PRIu64"MiB per process for total size of %'"PRIu64"MiB\n",
+			 num_processes, alloc_size_mb, num_processes * alloc_size_mb);
+
+		igt_require_memory(num_processes, alloc_size_mb,
+				   CHECK_SWAP | CHECK_RAM);
+	}
+
+	for(const struct test *t = tests; t->name; t++) {
+		for(const struct mode *m = modes; m->suffix; m++) {
+			for (int i = 0; i < ARRAY_SIZE(num_bos); i++) {
+				igt_subtest_f("%s%s-%u", t->name, m->suffix, num_bos[i]) {
+					run_test(num_processes, alloc_size_mb,
+						 num_bos[i], t, m->flags);
+				}
+			}
+		}
+	}
+
+	igt_fixture {
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.38.1
