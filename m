Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD9F10E617
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 08:50:12 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Fri,  3 Jun 2022 10:49:54 +0200
Message-Id: <20220603084958.35012-2-ryszard.knop@intel.com>
In-Reply-To: <20220603084958.35012-1-ryszard.knop@intel.com>
References: <20220603084958.35012-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/i915: Replace igt.h with individual
 header imports
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

Prevents pulling in unnecessary definitions in the library, tools etc.
Also makes it easier and faster to automatically analyze library files.
It's fine to use it in tests, benchmarks and the runner.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 lib/i915/gem.c        |  6 ++++--
 lib/i915/gem_mman.h   |  1 +
 lib/i915/i915_blt.c   | 17 +++++++++++++++--
 lib/i915/i915_blt.h   |  7 ++++++-
 lib/i915/intel_mocs.c |  6 ++++--
 5 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/lib/i915/gem.c b/lib/i915/gem.c
index 27b872c2..bb5ee125 100644
--- a/lib/i915/gem.c
+++ b/lib/i915/gem.c
@@ -26,10 +26,12 @@
 #include <fcntl.h>
 #include <sys/ioctl.h>
 
-#include "i915/gem.h"
-#include "igt.h"
+#include "igt_dummyload.h"
 #include "igt_debugfs.h"
+#include "igt_params.h"
 #include "igt_sysfs.h"
+#include "i915/gem.h"
+#include "drmtest.h"
 
 static void __restore_defaults(int engine)
 {
diff --git a/lib/i915/gem_mman.h b/lib/i915/gem_mman.h
index 5966ddb5..a5f12dee 100644
--- a/lib/i915/gem_mman.h
+++ b/lib/i915/gem_mman.h
@@ -26,6 +26,7 @@
 #define GEM_MMAN_H
 
 #include <stdint.h>
+#include <stdbool.h>
 
 void *gem_mmap__gtt(int fd, uint32_t handle, uint64_t size, unsigned prot);
 void *gem_mmap__cpu(int fd, uint32_t handle, uint64_t offset, uint64_t size, unsigned prot);
diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index d2d13a53..4e255f79 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -4,10 +4,23 @@
  */
 
 #include <malloc.h>
+#include <string.h>
+#include <inttypes.h>
+
 #include <cairo.h>
-#include "igt.h"
-#include "gem_create.h"
+
+#include "igt_core.h"
+#include "igt_aux.h"
+
 #include "i915_blt.h"
+#include "gem_mman.h"
+#include "gem_create.h"
+
+#include "intel_reg.h"
+#include "intel_chipset.h"
+#include "ioctl_wrappers.h"
+#include "intel_allocator.h"
+#include "intel_memory_region.h"
 
 #define BITRANGE(start, end) (end - start + 1)
 
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index e0e8b52b..2fe83900 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -42,11 +42,16 @@
  */
 
 #include <errno.h>
+#include <stdbool.h>
 #include <sys/ioctl.h>
 #include <sys/time.h>
 #include <malloc.h>
+
 #include "drm.h"
-#include "igt.h"
+
+#include "intel_ctx.h"
+#include "igt_gt.h"
+
 
 #define CCS_RATIO 256
 
diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
index df541ab0..083ed67b 100644
--- a/lib/i915/intel_mocs.c
+++ b/lib/i915/intel_mocs.c
@@ -3,9 +3,11 @@
  * Copyright © 2022 Intel Corporation
  */
 
-#include "igt.h"
-#include "i915/gem.h"
+#include "i915_drm.h"
+
+#include "intel_chipset.h"
 #include "intel_mocs.h"
+#include "i915/gem.h"
 
 #define DG1_MOCS_UC_IDX				1
 #define DG1_MOCS_WB_IDX				5
-- 
2.36.1
