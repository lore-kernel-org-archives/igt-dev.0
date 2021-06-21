Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2489E47
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 11:00:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 21 Jun 2021 12:59:22 +0200
Message-Id: <20210621105922.48408-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210621105922.48408-1-zbigniew.kempczynski@intel.com>
References: <20210621105922.48408-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] lib: Ensure the spinner reuses the
 canonical address
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
Cc: Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@intel.com>

For resubmitting a spinner, we pinned the objects into their addresses
used for the initial submission (so that we can remove the relocations).
When supplying a pinned address, the kernel insists that it should be in
canonical form, so let's also make sure that it is on setting the pin
flag.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
---
 lib/igt_dummyload.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 63b1fc73b..75be2f7c7 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -40,6 +40,7 @@
 #include "igt_dummyload.h"
 #include "igt_gt.h"
 #include "igt_vgem.h"
+#include "intel_allocator.h"
 #include "intel_chipset.h"
 #include "intel_reg.h"
 #include "ioctl_wrappers.h"
@@ -92,7 +93,8 @@ emit_recursive_batch(igt_spin_t *spin,
 {
 #define SCRATCH 0
 #define BATCH IGT_SPIN_BATCH
-	const int gen = intel_gen(intel_get_drm_devid(fd));
+	const unsigned int devid = intel_get_drm_devid(fd);
+	const unsigned int gen = intel_gen(devid);
 	struct drm_i915_gem_relocation_entry relocs[3], *r;
 	struct drm_i915_gem_execbuffer2 *execbuf;
 	struct drm_i915_gem_exec_object2 *obj;
@@ -381,7 +383,8 @@ emit_recursive_batch(igt_spin_t *spin,
 	for (i = 0; i < ARRAY_SIZE(spin->obj); i++) {
 		spin->obj[i].relocation_count = 0;
 		spin->obj[i].relocs_ptr = 0;
-		spin->obj[i].flags = EXEC_OBJECT_PINNED;
+		spin->obj[i].offset = CANONICAL(spin->obj[i].offset);
+		spin->obj[i].flags |= EXEC_OBJECT_PINNED;
 	}
 
 	spin->cmd_precondition = *spin->condition;
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
