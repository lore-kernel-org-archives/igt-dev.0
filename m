Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E956E301
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Nov 2021 06:43:50 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Mon, 22 Nov 2021 12:18:49 +0530
Message-Id: <20211122064849.785894-4-apoorva1.singh@intel.com>
In-Reply-To: <20211122064849.785894-1-apoorva1.singh@intel.com>
References: <20211122064849.785894-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,v2 3/3] i915/gem_ccs: Add testing for CCS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

Add gem_ccs test for CCS testing.
Commands are constructed with XY_BLOCK_COPY_BLT
and XY_CTRL_SURF_COPY_BLT instructions.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/i915/gem_engine_topology.c |  38 ++
 lib/i915/gem_engine_topology.h |   5 +
 tests/i915/gem_ccs.c           | 640 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 4 files changed, 684 insertions(+)
 create mode 100644 tests/i915/gem_ccs.c

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 729f42b0..37b5875e 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -488,6 +488,44 @@ int gem_engine_property_printf(int i915, const char *engine, const char *attr,
 	return ret;
 }
 
+static bool
+__gem_engine_has_capability(int i915, const char *engine,
+			    const char *attr, const char *cap)
+{
+	char buf[4096] = {};
+	FILE *file;
+
+	file = __open_attr(igt_sysfs_open(i915), "r",
+			   "engine", engine, attr, NULL);
+	if (file) {
+		fread(buf, 1, sizeof(buf) - 1, file);
+		fclose(file);
+	}
+
+	return strstr(buf, cap);
+}
+
+bool gem_engine_has_capability(int i915, const char *engine, const char *cap)
+{
+	return __gem_engine_has_capability(i915, engine, "capabilities", cap);
+}
+
+bool gem_engine_has_known_capability(int i915, const char *engine, const char *cap)
+{
+	return __gem_engine_has_capability(i915, engine, "known_capabilities", cap);
+}
+
+bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *engine)
+{
+	if (engine->class != I915_ENGINE_CLASS_COPY)
+		return false;
+
+	if (!gem_engine_has_known_capability(i915, engine->name, "block_copy"))
+		return intel_gen(intel_get_drm_devid(i915)) >= 12;
+
+	return gem_engine_has_capability(i915, engine->name, "block_copy");
+}
+
 uint32_t gem_engine_mmio_base(int i915, const char *engine)
 {
 	unsigned int mmio = 0;
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 4cfab560..d24bc9e8 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -124,6 +124,11 @@ int gem_engine_property_printf(int i915, const char *engine, const char *attr,
 
 uint32_t gem_engine_mmio_base(int i915, const char *engine);
 
+bool gem_engine_has_capability(int i915, const char *engine, const char *cap);
+bool gem_engine_has_known_capability(int i915, const char *engine, const char *cap);
+
+bool gem_engine_can_block_copy(int i915, const struct intel_execution_engine2 *engine);
+
 void dyn_sysfs_engines(int i915, int engines, const char *file,
 		       void (*test)(int i915, int engine));
 
diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
new file mode 100644
index 00000000..e4dc9139
--- /dev/null
+++ b/tests/i915/gem_ccs.c
@@ -0,0 +1,640 @@
+/*
+ * Copyright © 2020 Intel Corporation
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
+ *
+ * Authors:
+ *	CQ Tang <cq.tang@intel.com>
+ *	Neel Desai <neel.desai@intel.com>
+ *
+ */
+
+#include <errno.h>
+#include <sys/ioctl.h>
+#include <sys/time.h>
+#include <malloc.h>
+#include "drm.h"
+#include "igt.h"
+#include "i915/gem.h"
+#include "i915/gem_create.h"
+#include "lib/intel_chipset.h"
+#include "i915/i915_blt.h"
+
+IGT_TEST_DESCRIPTION("Exercise the memory bandwidth compression and "
+		     "decompression when copying data between "
+		     "system and local memory");
+
+static void igt_wr_xy_ctrl_surf_copy_blt(int fd, uint32_t cmd, uint32_t *batch_buf,
+					 uint32_t src, uint32_t dst, uint32_t out,
+					 int ccssize, uint8_t *pattern_buf,
+					 uint8_t *read_buf, int bosize,
+					 struct intel_execution_engine2 *e)
+{
+	int ret, i;
+
+	/* set 'src' to random pattern */
+	gem_write(fd, src, 0, pattern_buf, bosize);
+
+	/*
+	 * 'dst' is lmem BO with ccs, directly
+	 * copy content in 'src' BO to 'dst' BO's ccs
+	 */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    src, dst, ccssize, true, e);
+
+	igt_assert(!ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    dst, out, ccssize, false, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, ccssize);
+	/*
+	 * check 'read_buf',
+	 * it should have original pattern
+	 */
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+}
+
+static void igt_overwritten_xy_block_copy_blt(int fd, uint32_t cmd, uint32_t *batch_buf,
+					      uint32_t src, uint32_t dst, uint32_t out,
+					      int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+					      int bosize, struct intel_execution_engine2 *e)
+{
+	int ret, i;
+
+	/************************************************/
+	/* #2 CCS is overwritten by XY_BLOCK_COPY_BLT   */
+	/************************************************/
+	igt_info("copy random pattern to lmem BO with compression\n");
+
+	/* set 'src' to random pattern */
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	/* set 'dst' to random pattern */
+	gem_write(fd, dst, 0, pattern_buf, bosize);
+
+	/*
+	 * 'dst' is lmem BO with ccs,
+	 * copy content in 'src' BO to 'dst' BO
+	 */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				src, dst, bosize, 1, e);
+	igt_assert(!ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    dst, out, ccssize, false, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	/*
+	 * check 'read_buf',
+	 * it should NOT have original pattern
+	 * (overwrite by XY_BLOCK_COPY_BLT)
+	 */
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	/* read 'dst' BO into read_buf */
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should not have original pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO into 'out' BO */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				dst, out, bosize, 0, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have original pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	/* decompress 'dst' in place */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				dst, dst, bosize, 2, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have original pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy decompressed 'dst' to 'out' */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				dst, out, bosize, 0, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have original pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+
+	igt_assert(!ret);
+}
+
+static void igt_corrupted_xy_ctrl_surf_copy_blt(int fd, uint32_t cmd, uint32_t *batch_buf,
+						uint32_t src, uint32_t dst, uint32_t out,
+						int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+						int bosize, struct intel_execution_engine2 *e)
+{
+	int ret, i;
+
+	/* set 'src' to random pattern */
+	gem_write(fd, src, 0, pattern_buf, bosize);
+
+	/************************************************/
+	/* #3 CCS is corrupted by XY_CTRL_SURF_COPY_BLT */
+	/************************************************/
+	igt_info("corrupt CCS via XY_CTRL_SURF_COPY_BLT\n");
+
+	/*
+	 * corrupt 'dst' BO's ccs by writing directly
+	 */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    src, dst, ccssize, true, e);
+	igt_assert(!ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO into 'out' BO */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				dst, out, bosize, 0, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have corrupted pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    dst, out, ccssize, false, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have original pattern
+	 */
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+}
+
+static void igt_copy_zero_pattern_xy_block_copy_blt(int fd, uint32_t cmd, uint32_t *batch_buf,
+						    uint32_t src, uint32_t dst, uint32_t out,
+						    int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+						    uint8_t *input_buf, int bosize,
+						    struct intel_execution_engine2 *e)
+{
+	int ret, i;
+
+	/************************************************/
+	/* #4 Copy zeros pattern with XY_BLOCK_COPY_BLT */
+	/************************************************/
+	igt_info("copy zeros pattern to lmem BO with compression\n");
+
+	/* set src BO to random pattern */
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	/* set dst BO to random pattern */
+	gem_write(fd, dst, 0, pattern_buf, bosize);
+	/* set ccs to random pattern */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    src, dst, ccssize, true, e);
+	igt_assert(!ret);
+
+	/* clear 'src' BO */
+	memset(input_buf, 0, bosize);
+	gem_write(fd, src, 0, input_buf, bosize);
+
+	/* copy 'src' to 'dst' with compression */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				src, dst, bosize, 1, e);
+	igt_assert(!ret);
+
+	/* set out BO to random pattern */
+	gem_write(fd, out, 0, pattern_buf, bosize);
+
+	/* copy 'dst' BO back into 'out' BO */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				dst, out, bosize, 0, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have same zero pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != input_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	/* clear read_buf */
+	memset(read_buf, 0, bosize);
+	/* read 'dst' BO into read_buf */
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have the same pattern
+	 * as zero pattern compression won't change
+	 * target pages, only change ccs.
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    dst, out, ccssize, false, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have different pattern
+	 */
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+}
+
+static void igt_copy_repeat_pattern_xy_block_copy_blt(int fd, uint32_t cmd, uint32_t *batch_buf,
+						      uint32_t src, uint32_t dst, uint32_t out,
+						      int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+						      uint8_t *input_buf, int bosize,
+						      struct intel_execution_engine2 *e)
+{
+	int ret, i;
+
+	/************************************************/
+	/* #5 Copy repeat pattern with XY_BLOCK_COPY_BLT*/
+	/************************************************/
+	igt_info("copy repeat pattern to lmem BO with compression\n");
+
+	/* Set 'src' to random pattern */
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	/* Set 'dst' and 'ccs' to random pattern */
+	gem_write(fd, src, 0, pattern_buf, ccssize);
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    src, dst, ccssize, true, e);
+	igt_assert(!ret);
+	gem_write(fd, dst, 0, pattern_buf, bosize);
+
+	/* generate repeating pattern */
+	input_buf[0] = (uint8_t)rand();
+	input_buf[1] = (uint8_t)rand();
+	input_buf[2] = (uint8_t)rand();
+	input_buf[3] = (uint8_t)rand();
+	for (i = 4; i < bosize; i++)
+		input_buf[i] = input_buf[i - 4];
+	gem_write(fd, src, 0, input_buf, bosize);
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				src, dst, bosize, 1, e);
+	igt_assert(!ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO back into 'out' BO */
+	ret = xy_block_copy_blt(fd, cmd, batch_buf,
+				dst, out, bosize, 0, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have same pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != input_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	/* clear read_buf */
+	memset(read_buf, 0, bosize);
+	/* read 'dst' BO into read_buf */
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have different pattern
+	 */
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	/* clear out BO */
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	ret = xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+				    dst, out, ccssize, false, e);
+	igt_assert(!ret);
+
+	/* read 'out' BO into read_buf */
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	/*
+	 * check 'read_buf',
+	 * it should have different pattern
+	 */
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+}
+
+/*
+ * Allocate a BO in SMEM.
+ * Fill a pattern
+ * Use XY_BLOCK_COPY_BLT to copy it to LMEM with compression enabled
+ * Clear the BO in SMEM, and the pattern_buf in which the pattern was
+ * stored
+ * Use XY_BLOCK_COPY_BLT to copy it back to the BO in SMEM with
+ * resolve
+ * Compare the value in the BO in SMEM matches the pattern
+ */
+static void test_ccs(int fd, int size, uint32_t region, char *sub_name,
+		     struct intel_execution_engine2 *e)
+{
+	int bosize, ccssize, ret, i;
+	int start, end;
+	uint32_t cmd, src, dst, out;
+	uint32_t batch_buf[BATCH_SIZE / sizeof(uint32_t)];
+	uint8_t *pattern_buf, *input_buf, *read_buf;
+	struct timeval tv;
+
+	if (size > 0) {
+		start = size;
+		end = start + 1;
+	} else {
+		start = BOSIZE_MIN;
+		end = BOSIZE_MAX;
+	}
+
+	/*
+	 * create batch BO in smem for execution.
+	 */
+	cmd = gem_create(fd, BATCH_SIZE);
+
+	for (bosize = start; bosize < end; bosize *= 2) {
+		/* allocate working buffers */
+		pattern_buf = malloc(bosize);
+		igt_assert(pattern_buf);
+		input_buf = malloc(bosize);
+		igt_assert(input_buf);
+		read_buf = malloc(bosize);
+		igt_assert(read_buf);
+
+		ccssize = bosize / CCS_RATIO;
+
+		/* allocate working BOs in the right location */
+		src = gem_create_in_memory_regions(fd, bosize,
+						   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
+		dst = gem_create_in_memory_regions(fd, bosize, region);
+		out = gem_create_in_memory_regions(fd, bosize,
+						   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
+
+		/* fill in random pattern */
+		ret = gettimeofday(&tv, NULL);
+		igt_assert(!ret);
+		srandom((int)tv.tv_usec);
+
+		for (i = 0; i < bosize; i++)
+			pattern_buf[i] = (uint8_t)rand();
+
+		igt_info("progress: bosize %d, ccssize %d\n", bosize, ccssize);
+
+		igt_dynamic_f("write_read_in_ccs_surface-%s-%s", sub_name, e->name)
+			igt_wr_xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+						     src, dst, out, ccssize,
+						     pattern_buf, read_buf, bosize, e);
+		igt_dynamic_f("verify_compression_of_random_data-%s-%s", sub_name, e->name)
+			igt_overwritten_xy_block_copy_blt(fd, cmd, batch_buf,
+							  src, dst, out, ccssize,
+							  pattern_buf, read_buf, bosize, e);
+		igt_dynamic_f("verify_corrupted_pattern_in_ccs_surface-%s-%s", sub_name, e->name)
+			igt_corrupted_xy_ctrl_surf_copy_blt(fd, cmd, batch_buf,
+							    src, dst, out, ccssize,
+							    pattern_buf, read_buf, bosize, e);
+		igt_dynamic_f("copy_zero_pattern_with_compression-%s-%s", sub_name, e->name)
+			igt_copy_zero_pattern_xy_block_copy_blt(fd, cmd, batch_buf,
+								src, dst, out, ccssize, pattern_buf,
+								read_buf, input_buf, bosize, e);
+		igt_dynamic_f("copy_repeat_pattern_with_compression-%s-%s", sub_name, e->name)
+			igt_copy_repeat_pattern_xy_block_copy_blt(fd, cmd, batch_buf,
+								  src, dst, out, ccssize, pattern_buf,
+								  read_buf, input_buf, bosize, e);
+
+		/* cleanup... */
+		gem_close(fd, out);
+		gem_close(fd, dst);
+		gem_close(fd, src);
+		free(read_buf);
+		free(input_buf);
+		free(pattern_buf);
+	}
+
+	gem_close(fd, cmd);
+}
+
+igt_main
+{
+	struct drm_i915_query_memory_regions *query_info;
+	struct intel_execution_engine2 *e;
+	struct igt_collection *regions, *set;
+	char *sub_name;
+	uint32_t region;
+	int drm_fd;
+
+	igt_fixture {
+		drm_fd = drm_open_driver(DRIVER_INTEL);
+		igt_require_gem(drm_fd);
+		igt_require(AT_LEAST_GEN(intel_get_drm_devid(drm_fd), 12) > 0);
+		igt_require(HAS_FLAT_CCS(intel_get_drm_devid(drm_fd)));
+
+		query_info = gem_get_query_memory_regions(drm_fd);
+		igt_require(query_info);
+
+		set = get_memory_region_set(query_info, I915_DEVICE_MEMORY);
+	}
+
+	igt_subtest_with_dynamic("basic-gem-ccs-4K") {
+		for_each_physical_engine(drm_fd, e) {
+			if (!gem_engine_can_block_copy(drm_fd, e))
+				continue;
+
+			for_each_combination(regions, 1, set) {
+				sub_name = memregion_dynamic_subtest_name(regions);
+				region = igt_collection_get_value(regions, 0);
+				test_ccs(drm_fd, 4 * 1024, region, sub_name, e);
+				free(sub_name);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-gem-ccs-64K") {
+		for_each_physical_engine(drm_fd, e) {
+			if (!gem_engine_can_block_copy(drm_fd, e))
+				continue;
+
+			for_each_combination(regions, 1, set) {
+				sub_name = memregion_dynamic_subtest_name(regions);
+				region = igt_collection_get_value(regions, 0);
+				test_ccs(drm_fd, 64 * 1024, region, sub_name, e);
+				free(sub_name);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-gem-ccs-1M") {
+		for_each_physical_engine(drm_fd, e) {
+			if (!gem_engine_can_block_copy(drm_fd, e))
+				continue;
+
+			for_each_combination(regions, 1, set) {
+				sub_name = memregion_dynamic_subtest_name(regions);
+				region = igt_collection_get_value(regions, 0);
+				test_ccs(drm_fd, 1024 * 1024, region, sub_name, e);
+				free(sub_name);
+			}
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-gem-ccs-all") {
+		for_each_physical_engine(drm_fd, e) {
+			if (!gem_engine_can_block_copy(drm_fd, e))
+				continue;
+
+			for_each_combination(regions, 1, set) {
+				sub_name = memregion_dynamic_subtest_name(regions);
+				region = igt_collection_get_value(regions, 0);
+				test_ccs(drm_fd, 0, region, sub_name, e);
+				free(sub_name);
+			}
+		}
+	}
+
+	igt_fixture {
+		close(drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 0af3e03a..d3e76122 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -105,6 +105,7 @@ i915_progs = [
 	'gem_blits',
 	'gem_busy',
 	'gem_caching',
+	'gem_ccs',
 	'gem_close',
 	'gem_close_race',
 	'gem_concurrent_blit',
-- 
2.25.1
