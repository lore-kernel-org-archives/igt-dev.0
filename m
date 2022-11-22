Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2B310E0D8
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 14:00:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 22 Nov 2022 15:00:04 +0100
Message-Id: <20221122140007.71246-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
References: <20221122140007.71246-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/prime_udl: Remove prime_udl test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On CI test is skipping and it uses libdrm so let's get rid of it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 tests/meson.build |   1 -
 tests/prime_udl.c | 160 ----------------------------------------------
 2 files changed, 161 deletions(-)
 delete mode 100644 tests/prime_udl.c

diff --git a/tests/meson.build b/tests/meson.build
index 12e53e0bd2..a030ff6f5e 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -73,7 +73,6 @@ test_progs = [
 	'prime_mmap_coherency',
 	'prime_mmap_kms',
 	'prime_self_import',
-	'prime_udl',
 	'prime_vgem',
 	'syncobj_basic',
 	'syncobj_wait',
diff --git a/tests/prime_udl.c b/tests/prime_udl.c
deleted file mode 100644
index 582e31f5df..0000000000
--- a/tests/prime_udl.c
+++ /dev/null
@@ -1,160 +0,0 @@
-#include "igt.h"
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <fcntl.h>
-#include <string.h>
-#include <sys/stat.h>
-#include <sys/ioctl.h>
-#include <errno.h>
-
-#include "xf86drm.h"
-#include <xf86drmMode.h>
-
-#include "intel_bufmgr.h"
-
-IGT_TEST_DESCRIPTION("Basic set of prime tests between Intel and DisplayLink");
-
-int intel_fd = -1, udl_fd = -1;
-drm_intel_bufmgr *bufmgr;
-uint32_t devid;
-struct intel_batchbuffer *intel_batch;
-
-#define BO_SIZE (640*480*2)
-
-static int find_and_open_devices(void)
-{
-	int i;
-	char path[80];
-	struct stat buf;
-	FILE *fl;
-	char vendor_id[8];
-	int venid;
-	for (i = 0; i < 9; i++) {
-		sprintf(path, "/sys/class/drm/card%d/device/vendor", i);
-		if (stat(path, &buf)) {
-			/* look for usb dev */
-			sprintf(path, "/sys/class/drm/card%d/device/idVendor", i);
-			if (stat(path, &buf))
-				break;
-		}
-
-		fl = fopen(path, "r");
-		if (!fl)
-			break;
-
-		igt_assert(fgets(vendor_id, 8, fl) != NULL);
-		fclose(fl);
-
-		venid = strtoul(vendor_id, NULL, 16);
-		sprintf(path, "/dev/dri/card%d", i);
-		if (venid == 0x8086) {
-			intel_fd = open(path, O_RDWR);
-			if (!intel_fd)
-				return -1;
-		} else if (venid == 0x17e9) {
-			udl_fd = open(path, O_RDWR);
-			if (!udl_fd)
-				return -1;
-		}
-	}
-	return 0;
-}
-
-static int dumb_bo_destroy(int fd, uint32_t handle)
-{
-
-	struct drm_mode_destroy_dumb arg;
-	int ret;
-	memset(&arg, 0, sizeof(arg));
-	arg.handle = handle;
-	ret = drmIoctl(fd, DRM_IOCTL_MODE_DESTROY_DUMB, &arg);
-	if (ret)
-		return -errno;
-	return 0;
-
-}
-
-/*
- * simple share and import
- */
-static int test1(void)
-{
-	drm_intel_bo *test_intel_bo;
-	int prime_fd;
-	int ret;
-	uint32_t udl_handle;
-
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
-
-	ret = drmPrimeFDToHandle(udl_fd, prime_fd, &udl_handle);
-
-	dumb_bo_destroy(udl_fd, udl_handle);
-	drm_intel_bo_unreference(test_intel_bo);
-	return ret;
-}
-
-static int test2(void)
-{
-	drm_intel_bo *test_intel_bo;
-	uint32_t fb_id;
-	drmModeClip clip;
-	int prime_fd;
-	uint32_t udl_handle;
-	int ret;
-
-	test_intel_bo = drm_intel_bo_alloc(bufmgr, "test bo", BO_SIZE, 4096);
-
-	drm_intel_bo_gem_export_to_prime(test_intel_bo, &prime_fd);
-
-	ret = drmPrimeFDToHandle(udl_fd, prime_fd, &udl_handle);
-	if (ret)
-		goto out;
-
-	ret = drmModeAddFB(udl_fd, 640, 480, 16, 16, 640, udl_handle, &fb_id);
-	if (ret)
-		goto out;
-
-	clip.x1 = 0;
-	clip.y1 = 0;
-	clip.x2 = 10;
-	clip.y2 = 10;
-	ret = drmModeDirtyFB(udl_fd, fb_id, &clip, 1);
-	if (ret) {
-		return ret;
-	}
-out:
-	dumb_bo_destroy(udl_fd, udl_handle);
-	drm_intel_bo_unreference(test_intel_bo);
-	return ret;
-}
-
-igt_simple_main
-{
-	igt_assert(find_and_open_devices() >= 0);
-
-	igt_skip_on(udl_fd == -1);
-	igt_skip_on(intel_fd == -1);
-
-	/* set up intel bufmgr */
-	bufmgr = drm_intel_bufmgr_gem_init(intel_fd, 4096);
-	drm_intel_bufmgr_gem_enable_reuse(bufmgr);
-
-	/* set up an intel batch buffer */
-	devid = intel_get_drm_devid(intel_fd);
-	intel_batch = intel_batchbuffer_alloc(bufmgr, devid);
-
-	/* create an object on the i915 */
-	igt_assert(test1() == 0);
-
-	igt_assert(test2() == 0);
-
-	intel_batchbuffer_free(intel_batch);
-
-	drm_intel_bufmgr_destroy(bufmgr);
-
-	close(intel_fd);
-	close(udl_fd);
-}
-- 
2.34.1
