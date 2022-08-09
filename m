Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0217FD471F
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:20 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:35 +0200
Message-Id: <20220809125037.1231032-17-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 16/19] lib/igt*,
 lib/intel*: Replace igt.h with individual header imports
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
 lib/igt_amd.c                    | 8 ++++++--
 lib/igt_amd.h                    | 3 ++-
 lib/igt_collection.c             | 3 ++-
 lib/igt_device.c                 | 9 +++++++--
 lib/igt_nouveau.c                | 2 +-
 lib/igt_syncobj.c                | 3 ++-
 lib/intel_allocator.c            | 9 ++++++++-
 lib/intel_allocator_msgchannel.c | 6 +++++-
 lib/intel_allocator_random.c     | 6 +++++-
 lib/intel_allocator_reloc.c      | 5 ++++-
 lib/intel_bufops.c               | 7 +++++--
 11 files changed, 47 insertions(+), 14 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index bef9c193..74a180b1 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -23,10 +23,14 @@
 #include <fcntl.h>
 #include <sys/stat.h>
 
+#include <amdgpu_drm.h>
+
+#include "igt_core.h"
 #include "igt_amd.h"
-#include "igt.h"
+#include "igt_kms.h"
 #include "igt_sysfs.h"
-#include <amdgpu_drm.h>
+#include "igt_debugfs.h"
+#include "drmtest.h"
 
 #define X0 1
 #define X1 2
diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 428bfe6f..901a19c7 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -24,8 +24,9 @@
 #define IGT_AMD_H
 
 #include <stdint.h>
-#include "igt.h"
+
 #include "igt_fb.h"
+#include "igt_kms.h"
 #include "igt_psr.h"
 
 /* Read & Write DSC parameters */
diff --git a/lib/igt_collection.c b/lib/igt_collection.c
index 35e09c89..1511ded9 100644
--- a/lib/igt_collection.c
+++ b/lib/igt_collection.c
@@ -21,7 +21,8 @@
  * IN THE SOFTWARE.
  */
 
-#include "igt.h"
+#include "igt_aux.h"
+#include "igt_core.h"
 #include "igt_collection.h"
 
 /**
diff --git a/lib/igt_device.c b/lib/igt_device.c
index 83ae7b21..526049a7 100644
--- a/lib/igt_device.c
+++ b/lib/igt_device.c
@@ -22,10 +22,15 @@
  *
  */
 #include <fcntl.h>
-
+#include <errno.h>
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
-#include "igt.h"
+
+#include <pciaccess.h>
+#include <xf86drm.h>
+
+#include "igt_core.h"
+#include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_sysfs.h"
 
diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
index 0a1326e9..0a47dc52 100644
--- a/lib/igt_nouveau.c
+++ b/lib/igt_nouveau.c
@@ -27,7 +27,7 @@
 #include <nouveau/nouveau.h>
 #include <nouveau/nvif/class.h>
 
-#include "igt.h"
+#include "igt_fb.h"
 #include "igt_list.h"
 #include "igt_nouveau.h"
 
diff --git a/lib/igt_syncobj.c b/lib/igt_syncobj.c
index a24ed10b..fe086e0f 100644
--- a/lib/igt_syncobj.c
+++ b/lib/igt_syncobj.c
@@ -24,8 +24,9 @@
 #include <errno.h>
 #include <xf86drm.h>
 
-#include "igt.h"
+#include "igt_core.h"
 #include "igt_syncobj.h"
+#include "ioctl_wrappers.h"
 
 /**
  * SECTION:igt_syncobj
diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 717d7fc5..46417b83 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -12,11 +12,18 @@
 #include <signal.h>
 #include <stdlib.h>
 #include <unistd.h>
-#include "igt.h"
+#include <errno.h>
+
 #include "igt_map.h"
+#include "ioctl_wrappers.h"
+
 #include "intel_allocator.h"
 #include "intel_allocator_msgchannel.h"
 
+#include "i915/gem_mman.h"
+#include "i915/gem_context.h"
+#include "i915/intel_memory_region.h"
+
 //#define ALLOCDBG
 #ifdef ALLOCDBG
 #define alloc_info igt_info
diff --git a/lib/intel_allocator_msgchannel.c b/lib/intel_allocator_msgchannel.c
index d1f6486c..2a45bf80 100644
--- a/lib/intel_allocator_msgchannel.c
+++ b/lib/intel_allocator_msgchannel.c
@@ -6,8 +6,12 @@
 #include <sys/types.h>
 #include <sys/ipc.h>
 #include <sys/msg.h>
+#include <stdbool.h>
+#include <string.h>
+#include <errno.h>
 #include <fcntl.h>
-#include "igt.h"
+
+#include "igt_core.h"
 #include "intel_allocator_msgchannel.h"
 
 extern __thread pid_t child_tid;
diff --git a/lib/intel_allocator_random.c b/lib/intel_allocator_random.c
index 9ed92383..d0a59dd2 100644
--- a/lib/intel_allocator_random.c
+++ b/lib/intel_allocator_random.c
@@ -4,8 +4,12 @@
  */
 
 #include <stdlib.h>
-#include "igt.h"
+#include <inttypes.h>
+
+#include "igt_aux.h"
 #include "igt_rand.h"
+#include "drmtest.h"
+#include "ioctl_wrappers.h"
 #include "intel_allocator.h"
 
 struct intel_allocator *
diff --git a/lib/intel_allocator_reloc.c b/lib/intel_allocator_reloc.c
index bf4d9c43..4db8ae4b 100644
--- a/lib/intel_allocator_reloc.c
+++ b/lib/intel_allocator_reloc.c
@@ -4,8 +4,11 @@
  */
 
 #include <stdlib.h>
-#include "igt.h"
+
+#include "igt_aux.h"
 #include "igt_rand.h"
+#include "drmtest.h"
+#include "ioctl_wrappers.h"
 #include "intel_allocator.h"
 
 struct intel_allocator *
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index c63a5760..356ffddf 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -25,10 +25,13 @@
 #include <sys/ioctl.h>
 #include <cairo.h>
 
-#include "i915/gem_create.h"
-#include "igt.h"
 #include "igt_x86.h"
 #include "intel_bufops.h"
+#include "intel_chipset.h"
+#include "ioctl_wrappers.h"
+
+#include "i915/gem_mman.h"
+#include "i915/gem_create.h"
 
 /**
  * SECTION:intel_bufops
-- 
2.37.1
