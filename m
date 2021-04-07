Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E5AB89949
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Apr 2021 09:49:24 +0000 (UTC)
From: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Date: Wed,  7 Apr 2021 15:08:57 +0530
Message-Id: <20210407093857.45333-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [i-g-t] lib/gem_execbuf_wr: Add gem_has_relocations check
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
Cc: hariom.pandey@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Check if relocation and execbuf ioctls are supported on
respective platform or not. This will mark it skip instead
of misleading fail if relocations are not supported.

Gitlab#3276

Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
---
 lib/ioctl_wrappers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 4440004c..465da0bc 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -57,6 +57,7 @@
 #include "igt_sysfs.h"
 #include "config.h"
 #include "i915/gem_mman.h"
+#include "i915/gem_submission.h"
 
 #ifdef HAVE_VALGRIND
 #include <valgrind/valgrind.h>
@@ -636,6 +637,9 @@ void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 {
 	int err = 0;
+
+	/* Check if relocations is supported with execbuffer2 */
+	igt_require(gem_has_relocations(fd));
 	if (igt_ioctl(fd, DRM_IOCTL_I915_GEM_EXECBUFFER2_WR, execbuf)) {
 		err = -errno;
 		igt_assume(err != 0);
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
