Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0A89993
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2020 19:20:48 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Fri,  4 Sep 2020 12:20:26 -0400
Message-Id: <20200904162026.10956-2-ashutosh.dixit@intel.com>
In-Reply-To: <20200904162026.10956-1-ashutosh.dixit@intel.com>
References: <20200904162026.10956-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915: Convert remaining sites to
 gem_pread/gem_pwrite
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Convert remaining sites to where pread/pwrite ioctl's must absolutely
be used to gem_pread() and gem_pwrite() calls.

v2: Added some more files missed out in v1

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_partial_pwrite_pread.c       |  9 ++++----
 tests/i915/gem_pread.c                      |  9 ++++----
 tests/i915/gem_pread_after_blit.c           |  1 +
 tests/i915/gem_pwrite.c                     | 23 +++++++++++----------
 tests/i915/gem_pwrite_snooped.c             |  3 ++-
 tests/i915/gem_set_tiling_vs_pwrite.c       |  5 +++--
 tests/i915/gem_tiled_partial_pwrite_pread.c |  1 +
 tests/i915/gem_tiled_pread_basic.c          |  3 ++-
 tests/i915/gem_tiled_pread_pwrite.c         |  5 +++--
 9 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index b4bae9b6d..906f67e2b 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -149,7 +149,7 @@ static void test_partial_reads(data_t *data)
 		blt_bo_fill(data, staging_buf, scratch_buf, val);
 
 		get_range(&start, &len);
-		gem_read(data->drm_fd, scratch_buf->handle, start, tmp, len);
+		gem_pread(data->drm_fd, scratch_buf->handle, start, tmp, len);
 
 		for (j = 0; j < len; j++) {
 			igt_assert_f(tmp[j] == val,
@@ -176,7 +176,7 @@ static void test_partial_writes(data_t *data)
 		memset(tmp, i + 63, BO_SIZE);
 
 		get_range(&start, &len);
-		gem_write(data->drm_fd, scratch_buf->handle, start, tmp, len);
+		gem_pwrite(data->drm_fd, scratch_buf->handle, start, tmp, len);
 
 		copy_bo(scratch_buf, staging_buf);
 		gtt_ptr = __try_gtt_map_first(data, staging_buf, 0);
@@ -216,7 +216,7 @@ static void test_partial_read_writes(data_t *data)
 
 		/* partial read */
 		get_range(&start, &len);
-		gem_read(data->drm_fd, scratch_buf->handle, start, tmp, len);
+		gem_pread(data->drm_fd, scratch_buf->handle, start, tmp, len);
 		for (j = 0; j < len; j++) {
 			igt_assert_f(tmp[j] == val,
 				     "mismatch in read at %i [%i + %i], got: %i, expected: %i\n",
@@ -232,7 +232,7 @@ static void test_partial_read_writes(data_t *data)
 		memset(tmp, i + 63, BO_SIZE);
 
 		get_range(&start, &len);
-		gem_write(data->drm_fd, scratch_buf->handle, start, tmp, len);
+		gem_pwrite(data->drm_fd, scratch_buf->handle, start, tmp, len);
 
 		copy_bo(scratch_buf, staging_buf);
 		gtt_ptr = __try_gtt_map_first(data, staging_buf, 0);
@@ -284,6 +284,7 @@ igt_main
 		data.drm_fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(data.drm_fd);
 		gem_require_blitter(data.drm_fd);
+		gem_require_pread_pwrite(data.drm_fd);
 
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		data.bops = buf_ops_create(data.drm_fd);
diff --git a/tests/i915/gem_pread.c b/tests/i915/gem_pread.c
index 6d12b8e9f..cb9d1c301 100644
--- a/tests/i915/gem_pread.c
+++ b/tests/i915/gem_pread.c
@@ -63,9 +63,9 @@ static void pread_self(int i915)
 		uint32_t handle = gem_create(i915, MiB(4));
 		void *ptr = (*fn)(i915, handle, 0, MiB(4), PROT_WRITE);
 
-		gem_read(i915, handle, 0, ptr + MiB(3), MiB(1));
-		gem_read(i915, handle, MiB(3), ptr, MiB(1));
-		gem_read(i915, handle, MiB(1), ptr + MiB(1), MiB(2));
+		gem_pread(i915, handle, 0, ptr + MiB(3), MiB(1));
+		gem_pread(i915, handle, MiB(3), ptr, MiB(1));
+		gem_pread(i915, handle, MiB(1), ptr + MiB(1), MiB(2));
 
 		munmap(ptr, MiB(4));
 		gem_close(i915, handle);
@@ -80,7 +80,7 @@ static void pread_self(int i915)
 static void do_gem_read(int fd, uint32_t handle, void *buf, int len, int loops)
 {
 	while (loops--)
-		gem_read(fd, handle, 0, buf, len);
+		gem_pread(fd, handle, 0, buf, len);
 }
 
 static double elapsed(const struct timeval *start,
@@ -149,6 +149,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		gem_require_pread_pwrite(fd);
 
 		dst = gem_create(fd, object_size);
 		src = malloc(object_size);
diff --git a/tests/i915/gem_pread_after_blit.c b/tests/i915/gem_pread_after_blit.c
index 81454c930..5c99d0887 100644
--- a/tests/i915/gem_pread_after_blit.c
+++ b/tests/i915/gem_pread_after_blit.c
@@ -212,6 +212,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
 		igt_require_gem(fd);
+		gem_require_pread_pwrite(fd);
 
 		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
 		drm_intel_bufmgr_gem_enable_reuse(bufmgr);
diff --git a/tests/i915/gem_pwrite.c b/tests/i915/gem_pwrite.c
index e491263fd..3bb1c2d83 100644
--- a/tests/i915/gem_pwrite.c
+++ b/tests/i915/gem_pwrite.c
@@ -66,9 +66,9 @@ static void pwrite_self(int i915)
 		uint32_t handle = gem_create(i915, MiB(4));
 		void *ptr = (*fn)(i915, handle, 0, MiB(4), PROT_READ);
 
-		gem_write(i915, handle, 0, ptr + MiB(3), MiB(1));
-		gem_write(i915, handle, MiB(3), ptr, MiB(1));
-		gem_write(i915, handle, MiB(1), ptr + MiB(1), MiB(2));
+		gem_pwrite(i915, handle, 0, ptr + MiB(3), MiB(1));
+		gem_pwrite(i915, handle, MiB(3), ptr, MiB(1));
+		gem_pwrite(i915, handle, MiB(1), ptr + MiB(1), MiB(2));
 
 		munmap(ptr, MiB(4));
 		gem_close(i915, handle);
@@ -86,7 +86,7 @@ static void pwrite_self(int i915)
 static void do_gem_write(int fd, uint32_t handle, void *buf, int len, int loops)
 {
 	while (loops--)
-		gem_write(fd, handle, 0, buf, len);
+		gem_pwrite(fd, handle, 0, buf, len);
 }
 
 static double elapsed(const struct timeval *start,
@@ -145,8 +145,8 @@ static void test_big_cpu(int fd, int scale, unsigned flags)
 			int suboffset = (offset >> 12) % (4096 - sizeof(offset));
 			uint64_t tmp;
 
-			gem_write(fd, handle, offset + suboffset, &offset, sizeof(offset));
-			gem_read(fd, handle, offset + suboffset, &tmp, sizeof(tmp));
+			gem_pwrite(fd, handle, offset + suboffset, &offset, sizeof(offset));
+			gem_pread(fd, handle, offset + suboffset, &tmp, sizeof(tmp));
 			igt_assert_eq_u64(offset, tmp);
 		}
 	}
@@ -157,8 +157,8 @@ static void test_big_cpu(int fd, int scale, unsigned flags)
 			int suboffset = 4096 - (offset % (4096 - sizeof(offset)));
 			uint64_t tmp;
 
-			gem_write(fd, handle, (offset<<12) + suboffset, &offset, sizeof(offset));
-			gem_read(fd, handle, (offset<<12) + suboffset, &tmp, sizeof(tmp));
+			gem_pwrite(fd, handle, (offset<<12) + suboffset, &offset, sizeof(offset));
+			gem_pread(fd, handle, (offset<<12) + suboffset, &tmp, sizeof(tmp));
 			igt_assert_eq_u64(offset, tmp);
 		}
 	}
@@ -169,8 +169,8 @@ static void test_big_cpu(int fd, int scale, unsigned flags)
 			uint64_t tmp = rand() % (size >> 12);
 			int suboffset = tmp % (4096 - sizeof(offset));
 
-			gem_write(fd, handle, (tmp << 12) + suboffset, &offset, sizeof(offset));
-			gem_read(fd, handle, (tmp << 12) + suboffset, &tmp, sizeof(tmp));
+			gem_pwrite(fd, handle, (tmp << 12) + suboffset, &offset, sizeof(offset));
+			gem_pread(fd, handle, (tmp << 12) + suboffset, &tmp, sizeof(tmp));
 			igt_assert_eq_u64(offset, tmp);
 		}
 	}
@@ -263,7 +263,7 @@ static void test_random(int fd)
 		uint64_t a = hars_petruska_f54_1_random64(&prng) % (size / sizeof(uint64_t));
 		uint64_t x = hars_petruska_f54_1_random64(&prng);
 
-		gem_write(fd, handle, a * sizeof(x), &x, sizeof(x));
+		gem_pwrite(fd, handle, a * sizeof(x), &x, sizeof(x));
 
 		gem_set_domain(fd, handle, I915_GEM_DOMAIN_WC, 0);
 		igt_assert_eq_u64(map[a], x);
@@ -317,6 +317,7 @@ igt_main_args("s:", NULL, help_str, opt_handler, NULL)
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_INTEL);
+		gem_require_pread_pwrite(fd);
 
 		dst = gem_create(fd, object_size);
 		src = malloc(object_size);
diff --git a/tests/i915/gem_pwrite_snooped.c b/tests/i915/gem_pwrite_snooped.c
index 4a3395241..25a9f8830 100644
--- a/tests/i915/gem_pwrite_snooped.c
+++ b/tests/i915/gem_pwrite_snooped.c
@@ -115,7 +115,7 @@ static void test(int w, int h)
 
 	gem_set_caching(fd, src->handle, I915_CACHING_CACHED);
 
-	gem_write(fd, src->handle, 0, buf, object_size);
+	gem_pwrite(fd, src->handle, 0, buf, object_size);
 
 	gem_set_caching(fd, src->handle, I915_CACHING_NONE);
 
@@ -132,6 +132,7 @@ igt_simple_main
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require_gem(fd);
 	gem_require_blitter(fd);
+	gem_require_pread_pwrite(fd);
 
 	devid = intel_get_drm_devid(fd);
 	bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
diff --git a/tests/i915/gem_set_tiling_vs_pwrite.c b/tests/i915/gem_set_tiling_vs_pwrite.c
index 302ea24b6..dd2c7aeb9 100644
--- a/tests/i915/gem_set_tiling_vs_pwrite.c
+++ b/tests/i915/gem_set_tiling_vs_pwrite.c
@@ -55,6 +55,7 @@ igt_simple_main
 
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require(gem_available_fences(fd) > 0);
+	gem_require_pread_pwrite(fd);
 
 	for (int i = 0; i < OBJECT_SIZE/4; i++)
 		data[i] = i;
@@ -72,7 +73,7 @@ igt_simple_main
 	}
 
 	igt_info("testing pwrite on tiled buffer\n");
-	gem_write(fd, handle, 0, data, OBJECT_SIZE);
+	gem_pwrite(fd, handle, 0, data, OBJECT_SIZE);
 	memset(data, 0, OBJECT_SIZE);
 	gem_read(fd, handle, 0, data, OBJECT_SIZE);
 	for (int i = 0; i < OBJECT_SIZE/4; i++)
@@ -88,7 +89,7 @@ igt_simple_main
 	gem_set_tiling(fd, handle, I915_TILING_NONE, 0);
 
 	igt_info("testing pwrite on untiled, but still fenced buffer\n");
-	gem_write(fd, handle, 0, data, OBJECT_SIZE);
+	gem_pwrite(fd, handle, 0, data, OBJECT_SIZE);
 	memset(data, 0, OBJECT_SIZE);
 	gem_read(fd, handle, 0, data, OBJECT_SIZE);
 	for (int i = 0; i < OBJECT_SIZE/4; i++)
diff --git a/tests/i915/gem_tiled_partial_pwrite_pread.c b/tests/i915/gem_tiled_partial_pwrite_pread.c
index 7de5358b2..0c4545990 100644
--- a/tests/i915/gem_tiled_partial_pwrite_pread.c
+++ b/tests/i915/gem_tiled_partial_pwrite_pread.c
@@ -270,6 +270,7 @@ igt_main
 		igt_require_gem(fd);
 		gem_require_mappable_ggtt(fd);
 		gem_require_blitter(fd);
+		gem_require_pread_pwrite(fd);
 
 		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
 		//drm_intel_bufmgr_gem_enable_reuse(bufmgr);
diff --git a/tests/i915/gem_tiled_pread_basic.c b/tests/i915/gem_tiled_pread_basic.c
index 7cb644104..8474945f7 100644
--- a/tests/i915/gem_tiled_pread_basic.c
+++ b/tests/i915/gem_tiled_pread_basic.c
@@ -127,6 +127,7 @@ igt_simple_main
 	igt_require(gem_available_fences(fd) > 0);
 	handle = create_bo(fd);
 	igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
+	gem_require_pread_pwrite(fd);
 
 	devid = intel_get_drm_devid(fd);
 
@@ -160,7 +161,7 @@ igt_simple_main
 			len = size;
 		}
 
-		gem_read(fd, handle, offset, linear, len);
+		gem_pread(fd, handle, offset, linear, len);
 
 		/* Translate from offsets in the read buffer to the swizzled
 		 * address that it corresponds to.  This is the opposite of
diff --git a/tests/i915/gem_tiled_pread_pwrite.c b/tests/i915/gem_tiled_pread_pwrite.c
index f58048faa..45e172ab2 100644
--- a/tests/i915/gem_tiled_pread_pwrite.c
+++ b/tests/i915/gem_tiled_pread_pwrite.c
@@ -114,6 +114,7 @@ igt_simple_main
 	
 	fd = drm_open_driver(DRIVER_INTEL);
 	igt_require(gem_available_fences(fd) > 0);
+	gem_require_pread_pwrite(fd);
 
 	count = gem_available_fences(fd) + 1;
 	intel_require_memory(2 * count, sizeof(linear), CHECK_RAM);
@@ -128,10 +129,10 @@ igt_simple_main
 		handle = create_bo_and_fill(fd);
 		igt_require(gem_get_tiling(fd, handle, &tiling, &swizzle));
 
-		gem_read(fd, handle, 0, linear, sizeof(linear));
+		gem_pread(fd, handle, 0, linear, sizeof(linear));
 
 		handle_target = create_bo(fd);
-		gem_write(fd, handle_target, 0, linear, sizeof(linear));
+		gem_pwrite(fd, handle_target, 0, linear, sizeof(linear));
 
 		/* Check the target bo's contents. */
 		data = gem_mmap__gtt(fd, handle_target, sizeof(linear), PROT_READ);
-- 
2.27.0.112.g101b3204f3

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
