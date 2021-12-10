Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A1F10E724
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Dec 2021 13:00:52 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Fri, 10 Dec 2021 18:35:33 +0530
Message-Id: <20211210130533.3688728-6-apoorva1.singh@intel.com>
In-Reply-To: <20211210130533.3688728-1-apoorva1.singh@intel.com>
References: <20211210130533.3688728-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t,v4 5/5] i915/gem_ccs: Add testing for CCS
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
 tests/i915/gem_ccs.c | 406 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 2 files changed, 407 insertions(+)
 create mode 100644 tests/i915/gem_ccs.c

diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
new file mode 100644
index 00000000..7d4aee1c
--- /dev/null
+++ b/tests/i915/gem_ccs.c
@@ -0,0 +1,406 @@
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
+static void igt_wr_xy_ctrl_surf_copy_blt(int fd, uint32_t region, uint32_t src, uint32_t dst,
+					 uint32_t out, uint64_t src_size, uint64_t dst_size,
+					 uint64_t out_size, uint64_t ahnd, int ccssize,
+					 uint8_t *pattern_buf, uint8_t *read_buf, int bosize,
+					 struct intel_execution_engine2 *e)
+{
+	gem_write(fd, src, 0, pattern_buf, bosize);
+
+	/*
+	 * 'dst' is lmem BO with ccs, directly
+	 * copy content in 'src' BO to 'dst' BO's ccs
+	 */
+	xy_ctrl_surf_copy_blt(fd, region, src, dst, src_size, dst_size,
+			      ahnd, ccssize, true, e);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, dst_size, out_size,
+			      ahnd, ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	igt_assert_eq(memcmp(read_buf, pattern_buf, ccssize), 0);
+}
+
+static void igt_overwritten_xy_block_copy_blt(int fd, uint32_t region, uint32_t src, uint32_t dst,
+					      uint32_t out, uint64_t src_size, uint64_t dst_size,
+					      uint64_t out_size, uint64_t ahnd, int ccssize,
+					      uint8_t *pattern_buf, uint8_t *read_buf, int bosize,
+					      struct intel_execution_engine2 *e)
+{
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
+	xy_block_copy_blt(fd, region, src, dst, src_size, dst_size, ahnd,
+			  bosize, SYS_TO_LOCAL, enable_compression, e);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, dst_size, out_size,
+			      ahnd, ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	igt_assert_neq(memcmp(read_buf, pattern_buf, ccssize), 0);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	igt_assert_neq(memcmp(read_buf, pattern_buf, bosize), 0);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, dst_size, out_size, ahnd,
+			  bosize, LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	igt_assert_eq(memcmp(read_buf, pattern_buf, bosize), 0);
+
+	/* decompress 'dst' in place */
+	xy_block_copy_blt(fd, region, dst, dst, dst_size, dst_size, ahnd,
+			  bosize, LOCAL_TO_LOCAL_INPLACE, enable_compression, e);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	igt_assert_eq(memcmp(read_buf, pattern_buf, bosize), 0);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy decompressed 'dst' to 'out' */
+	xy_block_copy_blt(fd, region, dst, out, dst_size, out_size, ahnd,
+			  bosize, LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	igt_assert_eq(memcmp(read_buf, pattern_buf, bosize), 0);
+}
+
+static void igt_corrupted_xy_ctrl_surf_copy_blt(int fd, uint32_t region, uint32_t src, uint32_t dst,
+						uint32_t out, uint64_t src_size, uint64_t dst_size,
+						uint64_t out_size, uint64_t ahnd, int ccssize,
+						uint8_t *pattern_buf, uint8_t *read_buf, int bosize,
+						struct intel_execution_engine2 *e)
+{
+	bool enable_compression = true;
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+
+	igt_info("corrupt CCS via XY_CTRL_SURF_COPY_BLT\n");
+
+	/* corrupt 'dst' BO's ccs by writing directly */
+	xy_ctrl_surf_copy_blt(fd, region, src, dst, src_size, dst_size,
+			      ahnd, ccssize, true, e);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, dst_size, out_size, ahnd,
+			  bosize, LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	igt_assert_neq(memcmp(read_buf, pattern_buf, bosize), 0);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, dst_size, out_size,
+			      ahnd, ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	igt_assert_eq(memcmp(read_buf, pattern_buf, ccssize), 0);
+}
+
+static void igt_copy_zero_pattern_xy_block_copy_blt(int fd, uint32_t region, uint32_t src,
+						    uint32_t dst, uint32_t out, uint64_t src_size,
+						    uint64_t dst_size, uint64_t out_size,
+						    uint64_t ahnd, int ccssize, uint8_t *pattern_buf,
+						    uint8_t *read_buf, uint8_t *input_buf,
+						    int bosize, struct intel_execution_engine2 *e)
+{
+	bool enable_compression = true;
+
+	igt_info("copy zeros pattern to lmem BO with compression\n");
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	gem_write(fd, dst, 0, pattern_buf, bosize);
+	/* set ccs to random pattern */
+	xy_ctrl_surf_copy_blt(fd, region, src, dst, src_size, dst_size,
+			      ahnd, ccssize, true, e);
+
+	memset(input_buf, 0, bosize);
+	gem_write(fd, src, 0, input_buf, bosize);
+
+	/* copy 'src' to 'dst' with compression */
+	xy_block_copy_blt(fd, region, src, dst, src_size, dst_size,
+			  ahnd, bosize, SYS_TO_LOCAL, enable_compression, e);
+
+	gem_write(fd, out, 0, pattern_buf, bosize);
+
+	/* copy 'dst' BO back into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, dst_size, out_size, ahnd,
+			  bosize, LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	igt_assert_eq(memcmp(read_buf, input_buf, bosize), 0);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	igt_assert_eq(memcmp(read_buf, pattern_buf, bosize), 0);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, dst_size, out_size,
+			      ahnd, ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	igt_assert_neq(memcmp(read_buf, pattern_buf, ccssize), 0);
+}
+
+static void igt_copy_repeat_pattern_xy_block_copy_blt(int fd, uint32_t region, uint32_t src,
+						      uint32_t dst, uint32_t out, uint64_t src_size,
+						      uint64_t dst_size, uint64_t out_size,
+						      uint64_t ahnd, int ccssize,
+						      uint8_t *pattern_buf, uint8_t *read_buf,
+						      uint8_t *input_buf, int bosize,
+						      struct intel_execution_engine2 *e)
+{
+	int i;
+	bool enable_compression = true;
+
+	igt_info("copy repeat pattern to lmem BO with compression\n");
+
+	gem_write(fd, src, 0, pattern_buf, bosize);
+	gem_write(fd, src, 0, pattern_buf, ccssize);
+
+	xy_ctrl_surf_copy_blt(fd, region, src, dst, src_size, dst_size,
+			      ahnd, ccssize, true, e);
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
+	xy_block_copy_blt(fd, region, src, dst, src_size, dst_size, ahnd,
+			  bosize, SYS_TO_LOCAL, enable_compression, e);
+
+	memset(read_buf, 0, bosize);
+	gem_write(fd, out, 0, read_buf, bosize);
+
+	/* copy 'dst' BO back into 'out' BO */
+	xy_block_copy_blt(fd, region, dst, out, dst_size, out_size, ahnd,
+			  bosize, LOCAL_TO_SYS, enable_compression, e);
+
+	gem_read(fd, out, 0, read_buf, bosize);
+
+	igt_assert_eq(memcmp(read_buf, input_buf, bosize), 0);
+
+	memset(read_buf, 0, bosize);
+	gem_read(fd, dst, 0, read_buf, bosize);
+
+	igt_assert_neq(memcmp(read_buf, pattern_buf, bosize), 0);
+
+	memset(read_buf, 0, ccssize);
+	gem_write(fd, out, 0, read_buf, ccssize);
+
+	/* copy 'dst' BO's ccs into 'out' BO */
+	xy_ctrl_surf_copy_blt(fd, region, dst, out, dst_size, out_size,
+			      ahnd, ccssize, false, e);
+
+	gem_read(fd, out, 0, read_buf, ccssize);
+
+	igt_assert_neq(memcmp(read_buf, pattern_buf, ccssize), 0);
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
+	uint64_t ahnd, src_size, dst_size, out_size;
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
+		src_size = dst_size = out_size = bosize;
+
+		/* allocate working BOs in the right location */
+		ret = __gem_create_in_memory_regions(fd, &src, &src_size,
+						   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
+		igt_assert_eq(ret, 0);
+
+		ret = __gem_create_in_memory_regions(fd, &dst, &dst_size, region);
+		igt_assert_eq(ret, 0);
+
+		ret = __gem_create_in_memory_regions(fd, &out, &out_size,
+						   INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0));
+		igt_assert_eq(ret, 0);
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
+			igt_wr_xy_ctrl_surf_copy_blt(fd, region, src, dst, out, src_size, dst_size,
+						     out_size, ahnd, ccssize, pattern_buf, read_buf,
+						     bosize, e);
+		igt_dynamic_f("verify_compression_of_random_data-%s-%s", sub_name, e->name)
+			igt_overwritten_xy_block_copy_blt(fd, region, src, dst, out, src_size,
+							  dst_size, out_size, ahnd, ccssize,
+							  pattern_buf, read_buf, bosize, e);
+		igt_dynamic_f("verify_corrupted_pattern_in_ccs_surface-%s-%s", sub_name, e->name)
+			igt_corrupted_xy_ctrl_surf_copy_blt(fd, region, src, dst, out, src_size,
+							    dst_size, out_size, ahnd, ccssize,
+							    pattern_buf, read_buf, bosize, e);
+		igt_dynamic_f("copy_zero_pattern_with_compression-%s-%s", sub_name, e->name)
+			igt_copy_zero_pattern_xy_block_copy_blt(fd, region, src, dst, out, src_size,
+								dst_size, out_size, ahnd, ccssize,
+								pattern_buf, read_buf, input_buf,
+								bosize, e);
+		igt_dynamic_f("copy_repeat_pattern_with_compression-%s-%s", sub_name, e->name)
+			igt_copy_repeat_pattern_xy_block_copy_blt(fd, region, src, dst, out,
+								  src_size, dst_size, out_size,
+								  ahnd, ccssize, pattern_buf,
+								  read_buf, input_buf, bosize, e);
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
+#define test_each_physical_engine(T, size) \
+        igt_subtest_with_dynamic(T) \
+                for_each_physical_engine(drm_fd, e) { \
+                        if (!gem_engine_can_block_copy(drm_fd, e)) \
+                                continue; \
+                        for_each_combination(regions, 1, set) { \
+                                sub_name = memregion_dynamic_subtest_name(regions); \
+                                region = igt_collection_get_value(regions, 0); \
+                                test_ccs(drm_fd, size, region, sub_name, e); \
+                                free(sub_name); \
+                        } \
+                }
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
+	test_each_physical_engine("basic-gem-ccs-4K", 4 * 1024);
+	test_each_physical_engine("basic-gem-ccs-64K", 64 * 1024);
+	test_each_physical_engine("basic-gem-ccs-1M", 1024 * 1024);
+	test_each_physical_engine("basic-gem-ccs-all", 0);
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
