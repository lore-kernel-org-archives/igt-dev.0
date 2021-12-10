Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FD610E3AC
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 12:48:27 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 10 Dec 2021 18:23:06 +0530
Message-Id: <20211210125306.3681902-6-apoorva1.singh@intel.com>
In-Reply-To: <20211210125306.3681902-1-apoorva1.singh@intel.com>
References: <20211210125306.3681902-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,v3 5/5] i915/gem_ccs: Add testing for CCS
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com, igt-dev@lists.freedesktop.org, ramalingam.c@intel.com, zbigniew.kempczynski@intel.com, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: CQ Tang <cq.tang@intel.com>

Add gem_ccs test for CCS testing.
Commands are constructed with XY_BLOCK_COPY_BLT
and XY_CTRL_SURF_COPY_BLT instructions.

Signed-off-by: CQ Tang <cq.tang@intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_ccs.c | 492 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 493 insertions(+)
 create mode 100644 tests/i915/gem_ccs.c

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
new file mode 100644
index 00000000..0689b8f9
--- /dev/null
+++ b/tests/i915/gem_ccs.c
@@ -0,0 +1,492 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2021 Intel Corporation
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
+static void igt_wr_xy_ctrl_surf_copy_blt(int fd, uint32_t region, uint32_t src,
+					 uint32_t dst, uint32_t out, uint64_t ahnd,
+					 int ccssize, uint8_t *pattern_buf,
+					 uint8_t *read_buf, int bosize,
+					 struct intel_execution_engine2 *e)
+{
+	int ret, i;
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+
+	/*
+	 * 'dst' is lmem BO with ccs, directly
+	 * copy content in 'src' BO to 'dst' BO's ccs
+	 */
+	xy_ctrl_surf_copy_blt(fd, ahnd, src, dst, ahnd,
+			      ccssize, true, e);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, ahnd,
+			      ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+}
+
+static void igt_overwritten_xy_block_copy_blt(int fd, uint32_t region, uint32_t src,
+					      uint32_t dst, uint32_t out, uint64_t ahnd,
+					      int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+					      int bosize, struct intel_execution_engine2 *e)
+{
+	int ret, i;
+	bool enable_compression = true;
+
+	igt_info("copy random pattern to lmem BO with compression\n");
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	gem_write(fd, dst, 0, pattern_buf, bosize);
+
+	/*
+	 * 'dst' is lmem BO with ccs,
+	 * copy content in 'src' BO to 'dst' BO
+	 */
+	xy_block_copy_blt(fd, region, src, dst, ahnd, bosize,
+			  SYS_TO_LOCAL, enable_compression, e);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, ahnd,
+			      ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, ahnd, bosize,
+			  LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	/* decompress 'dst' in place */
+	xy_block_copy_blt(fd, region, dst, dst, ahnd, bosize,
+			  LOCAL_TO_LOCAL, enable_compression, e);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy decompressed 'dst' to 'out' */
+	xy_block_copy_blt(fd, region, dst, out, ahnd, bosize,
+			  LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+}
+
+static void igt_corrupted_xy_ctrl_surf_copy_blt(int fd, uint32_t region, uint32_t src,
+						uint32_t dst, uint32_t out, uint64_t ahnd,
+						int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+						int bosize, struct intel_execution_engine2 *e)
+{
+	int ret, i;
+	bool enable_compression = true;
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+
+	igt_info("corrupt CCS via XY_CTRL_SURF_COPY_BLT\n");
+
+	/* corrupt 'dst' BO's ccs by writing directly */
+	xy_ctrl_surf_copy_blt(fd, region, src, dst, ahnd,
+			      ccssize, true, e);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, ahnd, bosize,
+			  LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, ahnd,
+			      ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+}
+
+static void igt_copy_zero_pattern_xy_block_copy_blt(int fd, uint32_t region, uint32_t src,
+						    uint32_t dst, uint32_t out, uint64_t ahnd,
+						    int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+						    uint8_t *input_buf, int bosize,
+						    struct intel_execution_engine2 *e)
+{
+	int ret, i;
+	bool enable_compression = true;
+
+	igt_info("copy zeros pattern to lmem BO with compression\n");
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	gem_write(fd, dst, 0, pattern_buf, bosize);
+	/* set ccs to random pattern */
+	xy_ctrl_surf_copy_blt(fd, region, src, dst, ahnd,
+			      ccssize, true, e);
+
+	memset(input_buf, 0, bosize);
+	gem_write(fd, src, 0, input_buf, bosize);
+
+	/* copy 'src' to 'dst' with compression */
+	xy_block_copy_blt(fd, region, src, dst, ahnd, bosize,
+			  SYS_TO_LOCAL, enable_compression, e);
+
+	gem_write(fd, out, 0, pattern_buf, bosize);
+
+	/* copy 'dst' BO back into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, ahnd, bosize,
+			  LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != input_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, ahnd,
+			      ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	for (i = 0; i < ccssize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+}
+
+static void igt_copy_repeat_pattern_xy_block_copy_blt(int fd, uint32_t region, uint32_t src,
+						      uint32_t dst, uint32_t out, uint64_t ahnd,
+						      int ccssize, uint8_t *pattern_buf, uint8_t *read_buf,
+						      uint8_t *input_buf, int bosize,
+						      struct intel_execution_engine2 *e)
+{
+	int ret, i;
+	bool enable_compression = true;
+
+	igt_info("copy repeat pattern to lmem BO with compression\n");
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	gem_write(fd, src, 0, pattern_buf, ccssize);
+
+	xy_ctrl_surf_copy_blt(fd, region, src, dst, ahnd,
+			      ccssize, true, e);
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
+
+	xy_block_copy_blt(fd, region, src, dst, ahnd, bosize,
+			  SYS_TO_LOCAL, enable_compression, e);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO back into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, ahnd, bosize,
+			  LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != input_buf[i])
+			ret++;
+	}
+	igt_assert(!ret);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	for (i = 0; i < bosize; i++) {
+		if (read_buf[i] != pattern_buf[i])
+			ret++;
+	}
+	igt_assert(ret);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, ahnd,
+			      ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
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
+	uint32_t src, dst, out;
+	uint8_t *pattern_buf, *input_buf, *read_buf;
+	uint64_t ahnd;
+	struct timeval tv;
+
+	ahnd = get_reloc_ahnd(fd, 0);
+
+	if (size > 0) {
+		start = size;
+		end = start + 1;
+	} else {
+		start = BOSIZE_MIN;
+		end = BOSIZE_MAX;
+	}
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
+			igt_wr_xy_ctrl_surf_copy_blt(fd, region, src, dst, out, ahnd,
+						     ccssize, pattern_buf, read_buf,
+						     bosize, e);
+		igt_dynamic_f("verify_compression_of_random_data-%s-%s", sub_name, e->name)
+			igt_overwritten_xy_block_copy_blt(fd, region, src, dst, out, ahnd,
+							  ccssize, pattern_buf, read_buf,
+							  bosize, e);
+		igt_dynamic_f("verify_corrupted_pattern_in_ccs_surface-%s-%s", sub_name, e->name)
+			igt_corrupted_xy_ctrl_surf_copy_blt(fd, region, src, dst, out, ahnd,
+							    ccssize, pattern_buf, read_buf,
+							    bosize, e);
+		igt_dynamic_f("copy_zero_pattern_with_compression-%s-%s", sub_name, e->name)
+			igt_copy_zero_pattern_xy_block_copy_blt(fd, region, src, dst, out, ahnd,
+								ccssize, pattern_buf, read_buf,
+								input_buf, bosize, e);
+		igt_dynamic_f("copy_repeat_pattern_with_compression-%s-%s", sub_name, e->name)
+			igt_copy_repeat_pattern_xy_block_copy_blt(fd, region, src, dst, out, ahnd,
+								  ccssize, pattern_buf, read_buf,
+								  input_buf, bosize, e);
+
+		gem_close(fd, out);
+		gem_close(fd, dst);
+		gem_close(fd, src);
+		free(read_buf);
+		free(input_buf);
+		free(pattern_buf);
+	}
+
+	put_ahnd(ahnd);
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
index c14acf99..e0b48d66 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -107,6 +107,7 @@ i915_progs = [
 	'gem_blits',
 	'gem_busy',
 	'gem_caching',
+	'gem_ccs',
 	'gem_close',
 	'gem_close_race',
 	'gem_concurrent_blit',
-- 
2.25.1
