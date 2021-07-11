Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9B06EB87
 for <igt-dev@lists.freedesktop.org>; Sun, 11 Jul 2021 06:12:23 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
Date: Sat, 10 Jul 2021 23:12:05 -0700
Message-Id: <20210711061211.2879015-4-lucas.demarchi@intel.com>
In-Reply-To: <20210711061211.2879015-1-lucas.demarchi@intel.com>
References: <20210711061211.2879015-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 3/9] tests/i915/gem_mmap_wc: drop
 LOCAL_IOCTL_I915_GEM_MMAP_v2
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

LOCAL_IOCTL_I915_GEM_MMAP_v2 is not really a different ioctl, it's just
DRM_IOCTL_I915_GEM_MMAP and a check for version/

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/i915/gem_mmap_wc.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/tests/i915/gem_mmap_wc.c b/tests/i915/gem_mmap_wc.c
index 4fcf5478..abb89b8e 100644
--- a/tests/i915/gem_mmap_wc.c
+++ b/tests/i915/gem_mmap_wc.c
@@ -40,17 +40,6 @@
 #include "drm.h"
 #include "i915/gem_create.h"
 
-struct local_i915_gem_mmap_v2 {
-	uint32_t handle;
-	uint32_t pad;
-	uint64_t offset;
-	uint64_t size;
-	uint64_t addr_ptr;
-	uint64_t flags;
-#define I915_MMAP_WC 0x1
-};
-#define LOCAL_IOCTL_I915_GEM_MMAP_v2 DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_MMAP, struct local_i915_gem_mmap_v2)
-
 static int OBJECT_SIZE = 16*1024*1024;
 
 /*
@@ -103,7 +92,7 @@ static void
 test_invalid_flags(int fd)
 {
 	struct drm_i915_getparam gp;
-	struct local_i915_gem_mmap_v2 arg;
+	struct drm_i915_gem_mmap arg;
 	uint64_t flag = I915_MMAP_WC;
 	int val = -1;
 
@@ -128,7 +117,7 @@ test_invalid_flags(int fd)
 		while (flag) {
 			arg.flags = flag;
 			igt_assert(drmIoctl(fd,
-				   LOCAL_IOCTL_I915_GEM_MMAP_v2,
+				   DRM_IOCTL_I915_GEM_MMAP,
 				   &arg) == -1);
 			igt_assert_eq(errno, EINVAL);
 			flag <<= 1;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
