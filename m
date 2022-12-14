Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF9910E438
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 16:48:01 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 17:47:39 +0100
Message-Id: <20221214164747.68626-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
References: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 03/11] tests/prime_nv: Remove
 intel-libdrm calls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Replace intel-libdrm calls with already existing IGT wrappers. We need
this to completely remove intel_batchbuffer helpers.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/prime_nv_api.c   | 151 +++++++++++++++-----------------------
 tests/prime_nv_pcopy.c | 107 +++++++++++----------------
 tests/prime_nv_test.c  | 162 ++++++++++++++++++-----------------------
 3 files changed, 173 insertions(+), 247 deletions(-)

diff --git a/tests/prime_nv_api.c b/tests/prime_nv_api.c
index 054a1ec64a..cb3d52e8d6 100644
--- a/tests/prime_nv_api.c
+++ b/tests/prime_nv_api.c
@@ -15,18 +15,14 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 
-#include "intel_bufmgr.h"
+#include "i915/gem_create.h"
 #include "nouveau.h"
 
 #define BO_SIZE (256*1024)
 
 int intel_fd = -1, intel_fd2 = -1, nouveau_fd = -1, nouveau_fd2 = -1;
-drm_intel_bufmgr *bufmgr;
-drm_intel_bufmgr *bufmgr2;
 struct nouveau_device *ndev, *ndev2;
 struct nouveau_client *nclient, *nclient2;
-uint32_t devid;
-struct intel_batchbuffer *intel_batch;
 
 static void find_and_open_devices(void)
 {
@@ -69,13 +65,12 @@ static void find_and_open_devices(void)
 
 static void test_i915_nv_import_twice(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL, *nvbo2 = NULL;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	igt_assert(drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd) == 0);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	igt_assert(nouveau_bo_prime_handle_ref(ndev2, prime_fd, &nvbo2) == 0);
@@ -83,19 +78,18 @@ static void test_i915_nv_import_twice(void)
 
 	nouveau_bo_ref(NULL, &nvbo2);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 static void test_i915_nv_import_twice_check_flink_name(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL, *nvbo2 = NULL;
 	uint32_t flink_name1, flink_name2;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	igt_assert(drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd) == 0);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	igt_assert(nouveau_bo_prime_handle_ref(ndev2, prime_fd, &nvbo2) == 0);
@@ -108,25 +102,24 @@ static void test_i915_nv_import_twice_check_flink_name(void)
 
 	nouveau_bo_ref(NULL, &nvbo2);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 static void test_i915_nv_reimport_twice_check_flink_name(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL, *nvbo2 = NULL;
 	uint32_t flink_name1, flink_name2;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	igt_assert(drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd) == 0);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 
 	/* create a new dma-buf */
 	close(prime_fd);
-	igt_assert(drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd) == 0);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev2, prime_fd, &nvbo2) == 0);
 	close(prime_fd);
@@ -138,12 +131,12 @@ static void test_i915_nv_reimport_twice_check_flink_name(void)
 
 	nouveau_bo_ref(NULL, &nvbo2);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 static void test_nv_i915_import_twice_check_flink_name(void)
 {
-	drm_intel_bo *intel_bo = NULL, *intel_bo2 = NULL;
+	uint32_t intel_handle, intel_handle2;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL;
 	uint32_t flink_name1, flink_name2;
@@ -153,26 +146,23 @@ static void test_nv_i915_import_twice_check_flink_name(void)
 
 	igt_assert(nouveau_bo_set_prime(nvbo, &prime_fd) == 0);
 
-	intel_bo = drm_intel_bo_gem_create_from_prime(bufmgr, prime_fd, BO_SIZE);
-	igt_assert(intel_bo);
-
-	intel_bo2 = drm_intel_bo_gem_create_from_prime(bufmgr2, prime_fd, BO_SIZE);
-	igt_assert(intel_bo2);
+	intel_handle = prime_fd_to_handle(intel_fd, prime_fd);
+	intel_handle2 = prime_fd_to_handle(intel_fd2, prime_fd);
 	close(prime_fd);
 
-	igt_assert(drm_intel_bo_flink(intel_bo, &flink_name1) == 0);
-	igt_assert(drm_intel_bo_flink(intel_bo2, &flink_name2) == 0);
+	flink_name1 = gem_flink(intel_fd, intel_handle);
+	flink_name2 = gem_flink(intel_fd2, intel_handle2);
 
 	igt_assert_eq_u32(flink_name1, flink_name2);
 
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(intel_bo);
-	drm_intel_bo_unreference(intel_bo2);
+	gem_close(intel_fd, intel_handle);
+	gem_close(intel_fd2, intel_handle2);
 }
 
 static void test_nv_i915_reimport_twice_check_flink_name(void)
 {
-	drm_intel_bo *intel_bo = NULL, *intel_bo2 = NULL;
+	uint32_t intel_handle, intel_handle2;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL;
 	uint32_t flink_name1, flink_name2;
@@ -182,35 +172,32 @@ static void test_nv_i915_reimport_twice_check_flink_name(void)
 
 	igt_assert(nouveau_bo_set_prime(nvbo, &prime_fd) == 0);
 
-	intel_bo = drm_intel_bo_gem_create_from_prime(bufmgr, prime_fd, BO_SIZE);
-	igt_assert(intel_bo);
+	intel_handle = prime_fd_to_handle(intel_fd, prime_fd);
 	close(prime_fd);
+
 	igt_assert(nouveau_bo_set_prime(nvbo, &prime_fd) == 0);
 
-	intel_bo2 = drm_intel_bo_gem_create_from_prime(bufmgr2, prime_fd, BO_SIZE);
-	igt_assert(intel_bo2);
+	intel_handle2 = prime_fd_to_handle(intel_fd2, prime_fd);
 	close(prime_fd);
 
-	igt_assert(drm_intel_bo_flink(intel_bo, &flink_name1) == 0);
-	igt_assert(drm_intel_bo_flink(intel_bo2, &flink_name2) == 0);
+	flink_name1 = gem_flink(intel_fd, intel_handle);
+	flink_name2 = gem_flink(intel_fd2, intel_handle2);
 
 	igt_assert_eq_u32(flink_name1, flink_name2);
 
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(intel_bo);
-	drm_intel_bo_unreference(intel_bo2);
+	gem_close(intel_fd, intel_handle);
+	gem_close(intel_fd2, intel_handle2);
 }
 
 static void test_i915_nv_import_vs_close(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL, *nvbo2 = NULL;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-	igt_assert(test_intel_bo);
-
-	igt_assert(drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd) == 0);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	close(prime_fd);
@@ -218,20 +205,18 @@ static void test_i915_nv_import_vs_close(void)
 
 	nouveau_bo_ref(NULL, &nvbo2);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 /* import handle twice on one driver */
 static void test_i915_nv_double_import(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL, *nvbo2 = NULL;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-	igt_assert(test_intel_bo);
-
-	igt_assert(drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd) == 0);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo2) == 0);
@@ -241,23 +226,20 @@ static void test_i915_nv_double_import(void)
 
 	nouveau_bo_ref(NULL, &nvbo2);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 /* export handle twice from one driver - import twice
    see if we get same object */
 static void test_i915_nv_double_export(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd, prime_fd2;
 	struct nouveau_bo *nvbo = NULL, *nvbo2 = NULL;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-	igt_assert(test_intel_bo);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd2);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
+	prime_fd2 = prime_handle_to_fd(intel_fd2, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	close(prime_fd);
@@ -268,27 +250,26 @@ static void test_i915_nv_double_export(void)
 
 	nouveau_bo_ref(NULL, &nvbo2);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+
+	gem_close(intel_fd, intel_handle);
 }
 
 /* export handle from intel driver - reimport to intel driver
    see if you get same object */
 static void test_i915_self_import(void)
 {
-	drm_intel_bo *test_intel_bo, *test_intel_bo2;
+	uint32_t intel_handle, intel_handle2;
 	int prime_fd;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
-
-	test_intel_bo2 = drm_intel_bo_gem_create_from_prime(bufmgr, prime_fd, BO_SIZE);
+	intel_handle2 = prime_fd_to_handle(intel_fd, prime_fd);
 	close(prime_fd);
-	igt_assert(test_intel_bo2);
 
-	igt_assert(test_intel_bo->handle == test_intel_bo2->handle);
+	igt_assert(intel_handle == intel_handle2);
 
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 /* nouveau export reimport test */
@@ -313,19 +294,17 @@ static void test_nv_self_import(void)
    see if you get same object */
 static void test_i915_self_import_to_different_fd(void)
 {
-	drm_intel_bo *test_intel_bo, *test_intel_bo2;
+	uint32_t intel_handle, intel_handle2;
 	int prime_fd;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
-	test_intel_bo2 = drm_intel_bo_gem_create_from_prime(bufmgr2, prime_fd, BO_SIZE);
+	intel_handle2 = prime_fd_to_handle(intel_fd2, prime_fd);
 	close(prime_fd);
-	igt_assert(test_intel_bo2);
 
-	drm_intel_bo_unreference(test_intel_bo2);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
+	gem_close(intel_fd2, intel_handle2);
 }
 
 /* nouveau export reimport to other driver test */
@@ -356,16 +335,6 @@ igt_main
 		igt_require(intel_fd != -1);
 		igt_require(intel_fd2 != -1);
 
-		/* set up intel bufmgr */
-		bufmgr = drm_intel_bufmgr_gem_init(intel_fd, 4096);
-		igt_assert(bufmgr);
-		/* Do not enable reuse, we share (almost) all buffers. */
-		//drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
-		bufmgr2 = drm_intel_bufmgr_gem_init(intel_fd2, 4096);
-		igt_assert(bufmgr2);
-		drm_intel_bufmgr_gem_enable_reuse(bufmgr2);
-
 		/* set up nouveau bufmgr */
 		igt_assert(nouveau_device_wrap(nouveau_fd, 0, &ndev) >= 0);
 		igt_assert(nouveau_client_new(ndev, &nclient) >= 0);
@@ -374,11 +343,6 @@ igt_main
 		igt_assert(nouveau_device_wrap(nouveau_fd2, 0, &ndev2) >= 0);
 
 		igt_assert(nouveau_client_new(ndev2, &nclient2) >= 0);;
-
-		/* set up an intel batch buffer */
-		devid = intel_get_drm_devid(intel_fd);
-		intel_batch = intel_batchbuffer_alloc(bufmgr, devid);
-		igt_assert(intel_batch);
 	}
 
 #define xtest(name) \
@@ -399,12 +363,11 @@ igt_main
 	xtest(nv_self_import_to_different_fd);
 	
 	igt_fixture {
-		intel_batchbuffer_free(intel_batch);
-
 		nouveau_device_del(&ndev);
-		drm_intel_bufmgr_destroy(bufmgr);
 
 		close(intel_fd);
+		close(intel_fd2);
 		close(nouveau_fd);
+		close(nouveau_fd2);
 	}
 }
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index e465e5fc03..5b2a89d809 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -25,15 +25,12 @@
 #include <sys/ioctl.h>
 #include <errno.h>
 
-#include "intel_bufmgr.h"
+#include "i915/gem_create.h"
 #include "nouveau.h"
 
 static int intel_fd = -1, nouveau_fd = -1;
-static drm_intel_bufmgr *bufmgr;
 static struct nouveau_device *ndev;
 static struct nouveau_client *nclient;
-static uint32_t devid;
-static struct intel_batchbuffer *batch;
 static struct nouveau_object *nchannel, *pcopy;
 static struct nouveau_bufctx *nbufctx;
 static struct nouveau_pushbuf *npush;
@@ -161,16 +158,17 @@ BEGIN_NVXX(struct nouveau_pushbuf *push, int subc, int mthd, int size)
 }
 
 static void
-noop_intel(drm_intel_bo *bo)
+noop_intel(uint32_t bo_handle)
 {
-	BEGIN_BATCH(3, 1);
-	OUT_BATCH(MI_NOOP);
-	OUT_BATCH(MI_BATCH_BUFFER_END);
-	OUT_RELOC(bo, I915_GEM_DOMAIN_RENDER,
-			I915_GEM_DOMAIN_RENDER, 0);
-	ADVANCE_BATCH();
-
-	intel_batchbuffer_flush(batch);
+	struct intel_bb *ibb;
+
+	ibb = intel_bb_create(intel_fd, 4096);
+	intel_bb_out(ibb, MI_NOOP);
+	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
+	intel_bb_emit_reloc(ibb, bo_handle, I915_GEM_DOMAIN_RENDER,
+			    I915_GEM_DOMAIN_RENDER, 0, 0);
+	intel_bb_flush_blit(ibb);
+	intel_bb_destroy(ibb);
 }
 
 static void find_and_open_devices(void)
@@ -548,25 +546,25 @@ static void test1_micro(void)
 	uint32_t dst_x = 0, dst_y = 0;
 	uint32_t x, y, w = 256, h = 64;
 
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
+	uint8_t *gtt_map;
 	int prime_fd;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", w * h, 4096);
-	igt_assert(test_intel_bo);
-	drm_intel_bo_set_tiling(test_intel_bo, &tiling, w);
-	igt_assert(tiling == I915_TILING_Y);
-	igt_assert(drm_intel_gem_bo_map_gtt(test_intel_bo) == 0);
+	intel_handle = gem_create(intel_fd, w * h);
+	gem_set_tiling(intel_fd, intel_handle, tiling, w);
 
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
-	igt_assert_lte(0, prime_fd);
-	noop_intel(test_intel_bo);
+	gtt_map = gem_mmap__gtt(intel_fd, intel_handle, w * h, PROT_READ | PROT_WRITE);
+
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
+
+	noop_intel(intel_handle);
 
 	nv_bo_alloc(&bo_intel, &intel, w, h, tile_intel_y, prime_fd, 0);
 	nv_bo_alloc(&bo_nvidia, &nvidia, w, h, 0x10, -1, NOUVEAU_BO_VRAM);
 	nv_bo_alloc(&bo_linear, &linear, w, h, 0, -1, NOUVEAU_BO_GART);
 
 	for (y = 0; y < linear.h; ++y) {
-		uint8_t *map = bo_linear->map;
+		uint8_t *map = gtt_map;
 		map += y * linear.pitch;
 		for (x = 0; x < linear.pitch; ++x) {
 			uint8_t pos = x & 0x3f;
@@ -584,15 +582,16 @@ static void test1_micro(void)
 	if (pcopy)
 		perform_copy(bo_intel, &intel, dst_x, dst_y, bo_nvidia, &nvidia, src_x, src_y, w, h);
 	else
-		swtile_y(test_intel_bo->virtual, bo_linear->map, w, h);
+		swtile_y(gtt_map, bo_linear->map, w, h);
 
-	noop_intel(test_intel_bo);
-	check1_micro(test_intel_bo->virtual, intel.pitch, intel.h, dst_x, dst_y, w, h);
+	noop_intel(intel_handle);
+	check1_micro(gtt_map, intel.pitch, intel.h, dst_x, dst_y, w, h);
 
 	nouveau_bo_ref(NULL, &bo_linear);
 	nouveau_bo_ref(NULL, &bo_nvidia);
 	nouveau_bo_ref(NULL, &bo_intel);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_munmap(gtt_map, w * h);
+	gem_close(intel_fd, intel_handle);
 }
 
 /* test 2, see if we can copy from linear to intel X format safely
@@ -685,43 +684,40 @@ static void test3_base(int tile_src, int tile_dst)
 	uint32_t dst_x = 2 * cpp, dst_y = 26;
 	uint32_t w = 298 * cpp, h = 298;
 
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", 2048 * cpp * 768, 4096);
-	igt_assert(test_intel_bo);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
-	igt_assert_lte(0, prime_fd);
+	intel_handle = gem_create(intel_fd, 2048 * cpp * 768);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	nv_bo_alloc(&bo_intel, &intel, 2048 * cpp, 768, tile_dst, prime_fd, 0);
 	nv_bo_alloc(&bo_nvidia, &nvidia, 300 * cpp, 300, tile_src, -1, NOUVEAU_BO_VRAM);
 	nv_bo_alloc(&bo_linear, &linear, 2048 * cpp, 768, 0, -1, NOUVEAU_BO_GART);
 
-	noop_intel(test_intel_bo);
+	noop_intel(intel_handle);
 	memset(bo_linear->map, 0x80, bo_linear->size);
 	perform_copy(bo_intel, &intel, 0, 0, bo_linear, &linear, 0, 0, linear.pitch, linear.h);
-	noop_intel(test_intel_bo);
+	noop_intel(intel_handle);
 
 	memset(bo_linear->map, 0x04, bo_linear->size);
 	perform_copy(bo_nvidia, &nvidia, 0, 0, bo_linear, &linear, 0, 0, nvidia.pitch, nvidia.h);
 
 	/* Perform the actual sub rectangle copy */
-	noop_intel(test_intel_bo);
+	noop_intel(intel_handle);
 	perform_copy(bo_intel, &intel, dst_x, dst_y, bo_nvidia, &nvidia, src_x, src_y, w, h);
-	noop_intel(test_intel_bo);
+	noop_intel(intel_handle);
 
 	memset(bo_linear->map, 0x3, bo_linear->size);
-	noop_intel(test_intel_bo);
+	noop_intel(intel_handle);
 	perform_copy(bo_linear, &linear, 0, 0, bo_intel, &intel, 0, 0, intel.pitch, intel.h);
-	noop_intel(test_intel_bo);
+	noop_intel(intel_handle);
 
 	check3(bo_linear->map, linear.pitch, linear.h, dst_x, dst_y, w, h);
 
 	nouveau_bo_ref(NULL, &bo_linear);
 	nouveau_bo_ref(NULL, &bo_nvidia);
 	nouveau_bo_ref(NULL, &bo_intel);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 static void test3_1(void)
@@ -767,25 +763,23 @@ static void test3_5(void)
 /* Test only new style semaphores, old ones are AWFUL */
 static void test_semaphore(void)
 {
-	drm_intel_bo *test_intel_bo = NULL;
+	uint32_t intel_handle;
 	struct nouveau_bo *sema_bo = NULL;
 	int prime_fd;
-	uint32_t *sema;
+	uint32_t *sema, *gtt_map;
 	struct nouveau_pushbuf *push = npush;
 
 	igt_skip_on(ndev->chipset < 0x84);
 
 	/* Should probably be kept in sysmem */
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "semaphore bo", 4096, 4096);
-	igt_assert(test_intel_bo);
+	intel_handle = gem_create(intel_fd, 4096);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
-	igt_assert_lte(0, prime_fd);
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &sema_bo) == 0);
 	close(prime_fd);
 
-	igt_assert(drm_intel_gem_bo_map_gtt(test_intel_bo) == 0);
-	sema = test_intel_bo->virtual;
+	gtt_map = gem_mmap__gtt(intel_fd, intel_handle, 4096, PROT_READ | PROT_WRITE);
+	sema = gtt_map;
 	sema++;
 	*sema = 0;
 
@@ -845,7 +839,8 @@ static void test_semaphore(void)
 	igt_assert(*sema == 9);
 
 	nouveau_bo_ref(NULL, &sema_bo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_munmap(gtt_map, 4096);
+	gem_close(intel_fd, intel_handle);
 }
 
 igt_main
@@ -856,19 +851,8 @@ igt_main
 		igt_require(nouveau_fd != -1);
 		igt_require(intel_fd != -1);
 
-		/* set up intel bufmgr */
-		bufmgr = drm_intel_bufmgr_gem_init(intel_fd, 4096);
-		igt_assert(bufmgr);
-		/* Do not enable reuse, we share (almost) all buffers. */
-		//drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
 		/* set up nouveau bufmgr */
 		init_nouveau();
-
-		/* set up an intel batch buffer */
-		devid = intel_get_drm_devid(intel_fd);
-		batch = intel_batchbuffer_alloc(bufmgr, devid);
-		igt_assert(batch);
 	}
 
 #define xtest(x, args...) \
@@ -893,11 +877,8 @@ igt_main
 		nouveau_pushbuf_del(&npush);
 		nouveau_object_del(&nchannel);
 
-		intel_batchbuffer_free(batch);
-
 		nouveau_client_del(&nclient);
 		nouveau_device_del(&ndev);
-		drm_intel_bufmgr_destroy(bufmgr);
 
 		close(intel_fd);
 		close(nouveau_fd);
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index 81d142f42e..bc2579604d 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -23,15 +23,13 @@
 #include <sys/stat.h>
 #include <sys/ioctl.h>
 
-#include "intel_bufmgr.h"
+#include "i915/gem_create.h"
 #include "nouveau.h"
 
 int intel_fd = -1, nouveau_fd = -1;
-drm_intel_bufmgr *bufmgr;
+struct buf_ops *bops;
 struct nouveau_device *ndev;
 struct nouveau_client *nclient;
-uint32_t devid;
-struct intel_batchbuffer *intel_batch;
 
 #define BO_SIZE (256*1024)
 
@@ -83,20 +81,18 @@ static int find_and_open_devices(void)
  */
 static void test_i915_nv_sharing(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-	igt_assert(test_intel_bo);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	close(prime_fd);
 
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 /*
@@ -109,7 +105,7 @@ static void test_i915_nv_sharing(void)
  */
 static void test_nv_i915_sharing(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo;
 
@@ -117,12 +113,11 @@ static void test_nv_i915_sharing(void)
 				  0, BO_SIZE, NULL, &nvbo) == 0);
 	igt_assert(nouveau_bo_set_prime(nvbo, &prime_fd) == 0);
 
-	test_intel_bo = drm_intel_bo_gem_create_from_prime(bufmgr, prime_fd, BO_SIZE);
+	intel_handle = prime_fd_to_handle(intel_fd, prime_fd);
 	close(prime_fd);
-	igt_assert(test_intel_bo);
 
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_close(intel_fd, intel_handle);
 }
 
 /*
@@ -131,14 +126,13 @@ static void test_nv_i915_sharing(void)
  */
 static void test_nv_write_i915_cpu_mmap_read(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL;
 	uint32_t *ptr;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	close(prime_fd);
@@ -147,13 +141,12 @@ static void test_nv_write_i915_cpu_mmap_read(void)
 	ptr = nvbo->map;
 	*ptr = 0xdeadbeef;
 
-	drm_intel_bo_map(test_intel_bo, 1);
-	ptr = test_intel_bo->virtual;
-	igt_assert(ptr);
+	ptr = gem_mmap__cpu(intel_fd, intel_handle, 0, BO_SIZE, PROT_READ | PROT_WRITE);
 
 	igt_assert(*ptr == 0xdeadbeef);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_munmap(ptr, BO_SIZE);
+	gem_close(intel_fd, intel_handle);
 }
 
 /*
@@ -162,14 +155,13 @@ static void test_nv_write_i915_cpu_mmap_read(void)
  */
 static void test_nv_write_i915_gtt_mmap_read(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL;
 	uint32_t *ptr;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	close(prime_fd);
@@ -177,14 +169,13 @@ static void test_nv_write_i915_gtt_mmap_read(void)
 	ptr = nvbo->map;
 	*ptr = 0xdeadbeef;
 
-	drm_intel_gem_bo_map_gtt(test_intel_bo);
-	ptr = test_intel_bo->virtual;
-	igt_assert(ptr);
+	ptr = gem_mmap__gtt(intel_fd, intel_handle, BO_SIZE, PROT_READ | PROT_WRITE);
 
 	igt_assert(*ptr == 0xdeadbeef);
 
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_munmap(ptr, BO_SIZE);
+	gem_close(intel_fd, intel_handle);
 }
 
 /* test drm_intel_bo_map doesn't work properly,
@@ -192,7 +183,7 @@ static void test_nv_write_i915_gtt_mmap_read(void)
    for these objects */
 __noreturn static void test_i915_import_cpu_mmap(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo;
 	uint32_t *ptr;
@@ -202,22 +193,20 @@ __noreturn static void test_i915_import_cpu_mmap(void)
 	igt_assert(nouveau_bo_new(ndev, NOUVEAU_BO_GART | NOUVEAU_BO_MAP,
 				  0, BO_SIZE, NULL, &nvbo) == 0);
 	igt_assert(nouveau_bo_set_prime(nvbo, &prime_fd) == 0);
-	test_intel_bo = drm_intel_bo_gem_create_from_prime(bufmgr, prime_fd, BO_SIZE);
+	intel_handle = prime_fd_to_handle(intel_fd, prime_fd);
 	close(prime_fd);
-	igt_assert(test_intel_bo);
 
 	igt_assert(nouveau_bo_map(nvbo, NOUVEAU_BO_RDWR, nclient) == 0);
 
 	ptr = nvbo->map;
 	*ptr = 0xdeadbeef;
 
-	igt_assert(drm_intel_bo_map(test_intel_bo, 0) == 0);
-	igt_assert(test_intel_bo->virtual);
-	ptr = test_intel_bo->virtual;
+	ptr = gem_mmap__cpu(intel_fd, intel_handle, 0, BO_SIZE, PROT_READ);
 
 	igt_assert(*ptr == 0xdeadbeef);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_munmap(ptr, BO_SIZE);
+	gem_close(intel_fd, intel_handle);
 }
 
 /* test drm_intel_bo_map_gtt works properly,
@@ -225,7 +214,7 @@ __noreturn static void test_i915_import_cpu_mmap(void)
    for these objects */
 static void test_i915_import_gtt_mmap(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo;
 	uint32_t *ptr;
@@ -234,9 +223,8 @@ static void test_i915_import_gtt_mmap(void)
 				  0, BO_SIZE, NULL, &nvbo) == 0);
 	igt_assert(nouveau_bo_set_prime(nvbo, &prime_fd) == 0);
 
-	test_intel_bo = drm_intel_bo_gem_create_from_prime(bufmgr, prime_fd, BO_SIZE);
+	intel_handle = prime_fd_to_handle(intel_fd, prime_fd);
 	close(prime_fd);
-	igt_assert(test_intel_bo);
 
 	igt_assert(nouveau_bo_map(nvbo, NOUVEAU_BO_RDWR, nclient) == 0);
 
@@ -244,19 +232,18 @@ static void test_i915_import_gtt_mmap(void)
 	*ptr = 0xdeadbeef;
 	*(ptr + 1) = 0xa55a55;
 
-	igt_assert(drm_intel_gem_bo_map_gtt(test_intel_bo) == 0);
-	igt_assert(test_intel_bo->virtual);
-	ptr = test_intel_bo->virtual;
+	ptr = gem_mmap__gtt(intel_fd, intel_handle, BO_SIZE, PROT_READ | PROT_WRITE);
 
 	igt_assert(*ptr == 0xdeadbeef);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+	gem_munmap(ptr, BO_SIZE);
+	gem_close(intel_fd, intel_handle);
 }
 
 /* test 7 - import from nouveau into intel, test pread/pwrite fail */
 static void test_i915_import_pread_pwrite(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo;
 	uint32_t *ptr;
@@ -266,85 +253,90 @@ static void test_i915_import_pread_pwrite(void)
 				  0, BO_SIZE, NULL, &nvbo) == 0);
 	igt_assert(nouveau_bo_set_prime(nvbo, &prime_fd) == 0);
 
-	test_intel_bo = drm_intel_bo_gem_create_from_prime(bufmgr, prime_fd, BO_SIZE);
+	intel_handle = prime_fd_to_handle(intel_fd, prime_fd);
 	close(prime_fd);
-	igt_assert(test_intel_bo);
 
 	igt_assert(nouveau_bo_map(nvbo, NOUVEAU_BO_RDWR, nclient) == 0);
 
 	ptr = nvbo->map;
 	*ptr = 0xdeadbeef;
 
-	gem_read(intel_fd, test_intel_bo->handle, 0, buf, 256);
+	gem_read(intel_fd, intel_handle, 0, buf, 256);
 	igt_assert(buf[0] == 0xdeadbeef);
 	buf[0] = 0xabcdef55;
 
-	gem_write(intel_fd, test_intel_bo->handle, 0, buf, 4);
+	gem_write(intel_fd, intel_handle, 0, buf, 4);
 
 	igt_assert(*ptr == 0xabcdef55);
 
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
-}
-
-static void
-set_bo(drm_intel_bo *bo, uint32_t val, int width, int height)
-{
-        int size = width * height;
-        uint32_t *vaddr;
-
-        drm_intel_gem_bo_start_gtt_access(bo, true);
-        vaddr = bo->virtual;
-        while (size--)
-                *vaddr++ = val;
+	gem_close(intel_fd, intel_handle);
 }
 
-static drm_intel_bo *
-create_bo(drm_intel_bufmgr *ibufmgr, uint32_t val, int width, int height)
+static uint32_t create_bo(uint32_t val, int width, int height)
 {
-        drm_intel_bo *bo;
+	uint32_t intel_handle;
+	int size = width * height;
+	uint32_t *ptr, *currptr;
 
-        bo = drm_intel_bo_alloc(ibufmgr, "bo", 4*width*height, 0);
-        igt_assert(bo);
+	intel_handle = gem_create(intel_fd, 4*width*height);
+	igt_assert(intel_handle);
 
         /* gtt map doesn't have a write parameter, so just keep the mapping
          * around (to avoid the set_domain with the gtt write domain set) and
          * manually tell the kernel when we start access the gtt. */
-        drm_intel_gem_bo_map_gtt(bo);
+	ptr = gem_mmap__gtt(intel_fd, intel_handle, size, PROT_READ | PROT_WRITE);
+	gem_set_domain(intel_fd, intel_handle, I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
+
+	currptr = ptr;
+	while (size--)
+		*currptr++ = val;
 
-        set_bo(bo, val, width, height);
+	gem_munmap(ptr, size);
 
-        return bo;
+	return intel_handle;
 }
 
 /* use intel hw to fill the BO with a blit from another BO,
    then readback from the nouveau bo, check value is correct */
 static void test_i915_blt_fill_nv_read(void)
 {
-	drm_intel_bo *test_intel_bo, *src_bo;
+	uint32_t dst_handle, src_handle;
 	int prime_fd;
 	struct nouveau_bo *nvbo = NULL;
 	uint32_t *ptr;
+	struct intel_bb *ibb;
+	struct intel_buf src, dst;
+	int w = 256;
+	int h = 4; /* for intel_bb_copy size requirement % 4096 */
 
-	src_bo = create_bo(bufmgr, 0xaa55aa55, 256, 1);
+	ibb = intel_bb_create(intel_fd, 4096);
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
+	src_handle = create_bo(0xaa55aa55, w, h);
+	dst_handle = gem_create(intel_fd, BO_SIZE);
 
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
+	prime_fd = prime_handle_to_fd(intel_fd, dst_handle);
 
 	igt_assert(nouveau_bo_prime_handle_ref(ndev, prime_fd, &nvbo) == 0);
 	close(prime_fd);
 
-	intel_copy_bo(intel_batch, test_intel_bo, src_bo, BO_SIZE);
+	intel_buf_init_using_handle(bops, src_handle, &src, w, h, 32, 0,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	intel_buf_init_using_handle(bops, dst_handle, &dst, w, 256, 32, 0,
+				    I915_TILING_NONE, I915_COMPRESSION_NONE);
+	intel_bb_copy_intel_buf(ibb, &dst, &src, w * h * 4);
 
 	igt_assert(nouveau_bo_map(nvbo, NOUVEAU_BO_RDWR, nclient) == 0);
 
-	drm_intel_bo_map(test_intel_bo, 0);
-
 	ptr = nvbo->map;
 	igt_assert(*ptr == 0xaa55aa55);
 	nouveau_bo_ref(NULL, &nvbo);
-	drm_intel_bo_unreference(test_intel_bo);
+
+	intel_buf_destroy(&src);
+	intel_buf_destroy(&dst);
+	intel_bb_destroy(ibb);
+	gem_close(intel_fd, dst_handle);
+	gem_close(intel_fd, src_handle);
 }
 
 /* test 8 use nouveau to do blit */
@@ -358,20 +350,12 @@ igt_main
 
 		igt_require(nouveau_fd != -1);
 		igt_require(intel_fd != -1);
-
-		/* set up intel bufmgr */
-		bufmgr = drm_intel_bufmgr_gem_init(intel_fd, 4096);
-		igt_assert(bufmgr);
-		/* Do not enable reuse, we share (almost) all buffers. */
-		//drm_intel_bufmgr_gem_enable_reuse(bufmgr);
+		bops = buf_ops_create(intel_fd);
 
 		/* set up nouveau bufmgr */
 		igt_assert(nouveau_device_wrap(nouveau_fd, 0, &ndev) == 0);
 		igt_assert(nouveau_client_new(ndev, &nclient) == 0);
 
-		/* set up an intel batch buffer */
-		devid = intel_get_drm_devid(intel_fd);
-		intel_batch = intel_batchbuffer_alloc(bufmgr, devid);
 	}
 
 #define xtest(name) \
@@ -388,11 +372,9 @@ igt_main
 	xtest(i915_blt_fill_nv_read);
 
 	igt_fixture {
-		intel_batchbuffer_free(intel_batch);
-
 		nouveau_device_del(&ndev);
-		drm_intel_bufmgr_destroy(bufmgr);
 
+		buf_ops_destroy(bops);
 		close(intel_fd);
 		close(nouveau_fd);
 	}
-- 
2.34.1
