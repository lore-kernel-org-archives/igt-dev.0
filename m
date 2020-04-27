Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2DA6E332
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Apr 2020 16:05:29 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date: Mon, 27 Apr 2020 08:51:38 -0700
Message-Id: <20200427155138.853-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/ioctl_wrappers: Delete
 gem_total_mappable_size()
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

gem_total_mappable_size() has no callers and calls the
DRM_I915_GEM_GET_APERTURE ioctl using 'struct
local_i915_gem_get_aperture' which has fields which are unsupported in
the kernel. Delete the function.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/ioctl_wrappers.c | 17 -----------------
 lib/ioctl_wrappers.h |  1 -
 2 files changed, 18 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 627717d2b..25d04b3e6 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -980,23 +980,6 @@ struct local_i915_gem_get_aperture {
 };
 #define DRM_I915_GEM_GET_APERTURE	0x23
 #define LOCAL_IOCTL_I915_GEM_GET_APERTURE DRM_IOR  (DRM_COMMAND_BASE + DRM_I915_GEM_GET_APERTURE, struct local_i915_gem_get_aperture)
-/**
- * gem_total_mappable_size:
- * @fd: open i915 drm file descriptor
- *
- * Feature test macro to query the kernel for the total mappable size.
- *
- * Returns: Total mappable address space size.
- */
-uint64_t gem_total_mappable_size(int fd)
-{
-	struct local_i915_gem_get_aperture aperture;
-
-	memset(&aperture, 0, sizeof(aperture));
-	do_ioctl(fd, LOCAL_IOCTL_I915_GEM_GET_APERTURE, &aperture);
-
-	return aperture.map_total_size;
-}
 
 /**
  * gem_total_stolen_size:
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 9b29fce81..799d90266 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -132,7 +132,6 @@ int gem_gpu_reset_type(int fd);
 bool gem_gpu_reset_enabled(int fd);
 bool gem_engine_reset_enabled(int fd);
 int gem_available_fences(int fd);
-uint64_t gem_total_mappable_size(int fd);
 uint64_t gem_total_stolen_size(int fd);
 uint64_t gem_available_aperture_size(int fd);
 uint64_t gem_aperture_size(int fd);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
