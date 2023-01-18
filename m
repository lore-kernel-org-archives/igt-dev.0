Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B359C10E742
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 13:10:34 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 14:10:18 +0100
Message-Id: <20230118131018.3733-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_(linear,
 tiled)_blits: Randomise buffer contents
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

Currently, we use an incrementing value for the buffer contents,
starting the next buffer from the final value of the last. This means
that the value of corresponding dwords between two buffers is offset
by a single bit. In order to differentiate between an error in copying
between two buffers from single bit memory errors, we need to randomise
the offset between those two buffers.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/gem_linear_blits.c        | 7 ++-----
 tests/i915/gem_render_linear_blits.c | 8 +++++---
 tests/i915/gem_render_tiled_blits.c  | 8 +++++---
 tests/i915/gem_tiled_blits.c         | 6 ++----
 4 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/tests/i915/gem_linear_blits.c b/tests/i915/gem_linear_blits.c
index d02751be9..fac25095f 100644
--- a/tests/i915/gem_linear_blits.c
+++ b/tests/i915/gem_linear_blits.c
@@ -184,7 +184,6 @@ static void run_test(int fd, int count, bool do_relocs)
 {
 	uint32_t *handle, *start_val;
 	uint64_t *offset, ahnd;
-	uint32_t start = 0;
 	int i;
 
 	ahnd = intel_allocator_open(fd, 0, do_relocs ?
@@ -197,13 +196,11 @@ static void run_test(int fd, int count, bool do_relocs)
 	start_val = handle + count;
 
 	for (i = 0; i < count; i++) {
-		handle[i] = create_bo(fd, start);
+		start_val[i] = rand();
+		handle[i] = create_bo(fd, start_val[i]);
 
 		offset[i] = intel_allocator_alloc(ahnd, handle[i],
 						  sizeof(linear), ALIGNMENT);
-
-		start_val[i] = start;
-		start += 1024 * 1024 / 4;
 	}
 
 	for (i = 0; i < count; i++) {
diff --git a/tests/i915/gem_render_linear_blits.c b/tests/i915/gem_render_linear_blits.c
index d40593c64..c2f2c0788 100644
--- a/tests/i915/gem_render_linear_blits.c
+++ b/tests/i915/gem_render_linear_blits.c
@@ -79,7 +79,6 @@ static void run_test (int fd, int count)
 	struct intel_bb *ibb;
 	uint32_t *start_val;
 	struct intel_buf *bufs;
-	uint32_t start = 0;
 	int i, j;
 
 	render_copy = igt_get_render_copyfunc(intel_get_drm_devid(fd));
@@ -92,11 +91,14 @@ static void run_test (int fd, int count)
 	start_val = malloc(sizeof(*start_val)*count);
 
 	for (i = 0; i < count; i++) {
+		uint32_t val;
+
 		intel_buf_init(bops, &bufs[i], WIDTH, HEIGHT, 32, 0,
 			       I915_TILING_NONE, I915_COMPRESSION_NONE);
-		start_val[i] = start;
+		val = rand();
+		start_val[i] = val;
 		for (j = 0; j < WIDTH*HEIGHT; j++)
-			linear[j] = start++;
+			linear[j] = val++;
 		gem_write(fd, bufs[i].handle, 0, linear, sizeof(linear));
 	}
 
diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
index 52d67b768..eae06a332 100644
--- a/tests/i915/gem_render_tiled_blits.c
+++ b/tests/i915/gem_render_tiled_blits.c
@@ -97,7 +97,6 @@ static void run_test (int fd, int count)
 	struct intel_bb *ibb;
 	uint32_t *start_val;
 	struct intel_buf *bufs;
-	uint32_t start = 0;
 	int i, j;
 	uint32_t devid;
 
@@ -127,18 +126,21 @@ static void run_test (int fd, int count)
 
 	for (i = 0; i < count; i++) {
 		uint32_t tiling = I915_TILING_X + (random() & 1);
+		uint32_t val;
 		uint32_t *ptr;
 
 		intel_buf_init(bops, &bufs[i], WIDTH, HEIGHT, 32, 0,
 			       tiling, I915_COMPRESSION_NONE);
-		start_val[i] = start;
 
 		ptr = gem_mmap__gtt(fd, bufs[i].handle,
 				    bufs[i].surface[0].size, PROT_WRITE);
 		gem_set_domain(fd, bufs[i].handle,
 			       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
+		val = rand();
+		start_val[i] = val;
 		for (j = 0; j < WIDTH*HEIGHT; j++)
-			ptr[j] = start++;
+			ptr[j] = val++;
 
 		munmap(ptr, bufs[i].surface[0].size);
 	}
diff --git a/tests/i915/gem_tiled_blits.c b/tests/i915/gem_tiled_blits.c
index cc44d0f10..5e7ed0c4e 100644
--- a/tests/i915/gem_tiled_blits.c
+++ b/tests/i915/gem_tiled_blits.c
@@ -128,7 +128,6 @@ static void run_test(int fd, int count)
 	struct buf_ops *bops;
 	struct intel_buf **bo;
 	uint32_t *bo_start_val;
-	uint32_t start = 0;
 	int i;
 
 	bops = buf_ops_create(fd);
@@ -138,9 +137,8 @@ static void run_test(int fd, int count)
 	bo_start_val = malloc(sizeof(uint32_t)*count);
 
 	for (i = 0; i < count; i++) {
-		bo[i] = create_bo(bops, ibb, start);
-		bo_start_val[i] = start;
-		start += 1024 * 1024 / 4;
+		bo_start_val[i] = rand();
+		bo[i] = create_bo(bops, ibb, bo_start_val[i]);
 	}
 
 	for (i = 0; i < count + 1; i++) {
-- 
2.39.0
