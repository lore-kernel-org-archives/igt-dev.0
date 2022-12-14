Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EEF510E437
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 16:47:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 17:47:38 +0100
Message-Id: <20221214164747.68626-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
References: <20221214164747.68626-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 02/11] tests/prime_udl: Remove
 intel-libdrm dependency
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

To remove all intel-libdrm code in intel_batchbuffer we need to rewrite
and drop it in all dependent code. Currently CI doesn't exercise this
test and I don't have DisplayLink hardware so this is blind rewrite
(instead of removing the test). Common xf86drmMode calls are left
intact as igt likely won't remove libdrm totally.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Acked-by: Petri Latvala <petri.latvala@intel.com>
---
 tests/prime_udl.c | 64 ++++++++++++++++-------------------------------
 1 file changed, 21 insertions(+), 43 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 582e31f5df..884bf69fea 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -11,14 +11,11 @@
 #include "xf86drm.h"
 #include <xf86drmMode.h>
 
-#include "intel_bufmgr.h"
+#include "i915/gem_create.h"
 
 IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
 
 int intel_fd = -1, udl_fd = -1;
-drm_intel_bufmgr *bufmgr;
-uint32_t devid;
-struct intel_batchbuffer *intel_batch;
 
 #define BO_SIZE (640*480*2)
 
@@ -78,57 +75,50 @@ static int dumb_bo_destroy(int fd, uint32_t handle)
 /*
  * simple share and import
  */
-static int test1(void)
+static void test1(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle, udl_handle;
 	int prime_fd;
-	int ret;
-	uint32_t udl_handle;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
 
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
+	igt_assert(prime_fd >= 0);
 
-	ret = drmPrimeFDToHandle(udl_fd, prime_fd, &udl_handle);
+	udl_handle = prime_fd_to_handle(udl_fd, prime_fd);
+	igt_assert(udl_handle > 0);
 
 	dumb_bo_destroy(udl_fd, udl_handle);
-	drm_intel_bo_unreference(test_intel_bo);
-	return ret;
+	gem_close(intel_fd, intel_handle);
 }
 
-static int test2(void)
+static void test2(void)
 {
-	drm_intel_bo *test_intel_bo;
+	uint32_t intel_handle, udl_handle;
 	uint32_t fb_id;
 	drmModeClip clip;
 	int prime_fd;
-	uint32_t udl_handle;
 	int ret;
 
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
+	intel_handle = gem_create(intel_fd, BO_SIZE);
 
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
+	prime_fd = prime_handle_to_fd(intel_fd, intel_handle);
+	igt_assert(prime_fd >= 0);
 
-	ret = drmPrimeFDToHandle(udl_fd, prime_fd, &udl_handle);
-	if (ret)
-		goto out;
+	udl_handle = prime_fd_to_handle(udl_fd, prime_fd);
 
 	ret = drmModeAddFB(udl_fd, 640, 480, 16, 16, 640, udl_handle, &fb_id);
-	if (ret)
-		goto out;
+	igt_assert(ret == 0);
 
 	clip.x1 = 0;
 	clip.y1 = 0;
 	clip.x2 = 10;
 	clip.y2 = 10;
 	ret = drmModeDirtyFB(udl_fd, fb_id, &clip, 1);
-	if (ret) {
-		return ret;
-	}
-out:
+	igt_assert(ret == 0);
+
 	dumb_bo_destroy(udl_fd, udl_handle);
-	drm_intel_bo_unreference(test_intel_bo);
-	return ret;
+	gem_close(intel_fd, intel_handle);
 }
 
 igt_simple_main
@@ -138,22 +128,10 @@ igt_simple_main
 	igt_skip_on(udl_fd == -1);
 	igt_skip_on(intel_fd == -1);
 
-	/* set up intel bufmgr */
-	bufmgr = drm_intel_bufmgr_gem_init(intel_fd, 4096);
-	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
-	/* set up an intel batch buffer */
-	devid = intel_get_drm_devid(intel_fd);
-	intel_batch = intel_batchbuffer_alloc(bufmgr, devid);
-
 	/* create an object on the i915 */
-	igt_assert(test1() == 0);
-
-	igt_assert(test2() == 0);
-
-	intel_batchbuffer_free(intel_batch);
+	test1();
 
-	drm_intel_bufmgr_destroy(bufmgr);
+	test2();
 
 	close(intel_fd);
 	close(udl_fd);
-- 
2.34.1
