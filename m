Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1C010E0F7
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Dec 2022 07:47:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  6 Dec 2022 08:47:06 +0100
Message-Id: <20221206074708.30690-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20221206074708.30690-1-zbigniew.kempczynski@intel.com>
References: <20221206074708.30690-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 09/11] lib/ioctl_wrappers: Remove
 gem_handle_to_libdrm_bo
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

Function is not used anymore in IGT so lets remove it, especially it
keeps libdrm dependency.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/ioctl_wrappers.c | 31 -------------------------------
 lib/ioctl_wrappers.h |  5 -----
 2 files changed, 36 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 09eb3ce7b5..1ab41ab6d6 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -92,37 +92,6 @@
 int (*igt_ioctl)(int fd, unsigned long request, void *arg) = drmIoctl;
 
 
-/**
- * gem_handle_to_libdrm_bo:
- * @bufmgr: libdrm buffer manager instance
- * @fd: open i915 drm file descriptor
- * @name: buffer name in libdrm
- * @handle: gem buffer object handle
- *
- * This helper function imports a raw gem buffer handle into the libdrm buffer
- * manager.
- *
- * Returns: The imported libdrm buffer manager object.
- */
-drm_intel_bo *
-gem_handle_to_libdrm_bo(drm_intel_bufmgr *bufmgr, int fd, const char *name, uint32_t handle)
-{
-	struct drm_gem_flink flink;
-	int ret;
-	drm_intel_bo *bo;
-
-	memset(&flink, 0, sizeof(handle));
-	flink.handle = handle;
-	ret = ioctl(fd, DRM_IOCTL_GEM_FLINK, &flink);
-	igt_assert(ret == 0);
-	errno = 0;
-
-	bo = drm_intel_bo_gem_create_from_name(bufmgr, name, flink.name);
-	igt_assert(bo);
-
-	return bo;
-}
-
 static int
 __gem_get_tiling(int fd, struct drm_i915_gem_get_tiling *arg)
 {
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 9a897fec23..cf228c2651 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -33,7 +33,6 @@
 #include <stdint.h>
 #include <stdbool.h>
 #include <sys/mman.h>
-#include <intel_bufmgr.h>
 #include <i915_drm.h>
 
 #include "i915/gem_context.h"
@@ -51,10 +50,6 @@
  */
 extern int (*igt_ioctl)(int fd, unsigned long request, void *arg);
 
-/* libdrm interfacing */
-drm_intel_bo * gem_handle_to_libdrm_bo(drm_intel_bufmgr *bufmgr, int fd,
-				       const char *name, uint32_t handle);
-
 /* ioctl_wrappers.c:
  *
  * ioctl wrappers and similar stuff for bare metal testing */
-- 
2.34.1
