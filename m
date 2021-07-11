Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DCB6EB89
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:23 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:06 -0700
Message-Id: <20210711061211.2879015-5-lucas.demarchi@intel.com>
In-Reply-To: <20210711061211.2879015-1-lucas.demarchi@intel.com>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 4/9] lib/ioctl_wrappers: drop
 gem_require_stolen_support()
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

There is no such thing in the kernel as ioctl
DRM_COMMAND_BASE + DRM_I915_GEM_GET_APERTURE returning a struct with
stolen_total_size. So gem_total_stolen_size() always returns 0.

Also there are no callers for gem_total_stolen_size(), except for
gem_require_stolen_support() which is unused.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/ioctl_wrappers.c | 28 ----------------------------
 lib/ioctl_wrappers.h | 11 -----------
 2 files changed, 39 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 48526d29..25c5e495 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -986,34 +986,6 @@ bool gem_has_bsd2(int fd)
 	return has_param(fd, I915_PARAM_HAS_BSD2);
 }
 
-struct local_i915_gem_get_aperture {
-	__u64 aper_size;
-	__u64 aper_available_size;
-	__u64 version;
-	__u64 map_total_size;
-	__u64 stolen_total_size;
-};
-#define DRM_I915_GEM_GET_APERTURE	0x23
-#define LOCAL_IOCTL_I915_GEM_GET_APERTURE DRM_IOR  (DRM_COMMAND_BASE + DRM_I915_GEM_GET_APERTURE, struct local_i915_gem_get_aperture)
-
-/**
- * gem_total_stolen_size:
- * @fd: open i915 drm file descriptor
- *
- * Feature test macro to query the kernel for the total stolen size.
- *
- * Returns: Total stolen memory.
- */
-uint64_t gem_total_stolen_size(int fd)
-{
-	struct local_i915_gem_get_aperture aperture;
-
-	memset(&aperture, 0, sizeof(aperture));
-	do_ioctl(fd, LOCAL_IOCTL_I915_GEM_GET_APERTURE, &aperture);
-
-	return aperture.stolen_total_size;
-}
-
 /**
  * gem_has_softpin:
  * @fd: open i915 drm file descriptor
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 689e6d53..0ed67b6e 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -89,17 +89,6 @@ int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 #define I915_GEM_DOMAIN_WC 0x80
 #endif
 
-/**
- * gem_require_stolen_support:
- * @fd: open i915 drm file descriptor
- *
- * Test macro to query whether support for allocating objects from stolen
- * memory is available. Automatically skips through igt_require() if not.
- */
-#define gem_require_stolen_support(fd) \
-			igt_require(gem_create__has_stolen_support(fd) && \
-				    (gem_total_stolen_size(fd) > 0))
-
 int gem_madvise(int fd, uint32_t handle, int state);
 
 void gem_userptr(int fd, void *ptr, uint64_t size, int read_only, uint32_t flags, uint32_t *handle);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
