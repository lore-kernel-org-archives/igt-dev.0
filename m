Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD0410ED8D
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Apr 2023 05:55:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Apr 2023 07:54:51 +0200
Message-Id: <20230421055457.13035-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230421055457.13035-1-zbigniew.kempczynski@intel.com>
References: <20230421055457.13035-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 04/10] lib/intel_allocator: Add allocator
 support for Xe
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

Start supporting va range configuration for xe allocator.

During opening allocator has to be aware of vm range (start and end).
i915 driver doesn't expose vm range information so those variables
have to be detected. In xe driver we get information of va size from
the kernel query so va end can be directly configured. At the moment
there's no autodetection of va start for xe what might need to be
address in the future if for some reason lower offsets might not be
in use.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

---
v2: Fix review comments (Kamil)
---
 lib/intel_allocator.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)

diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
index 2b08dd5996..45c1168ab5 100644
--- a/lib/intel_allocator.c
+++ b/lib/intel_allocator.c
@@ -16,6 +16,7 @@
 #include "igt_map.h"
 #include "intel_allocator.h"
 #include "intel_allocator_msgchannel.h"
+#include "xe/xe_query.h"
 
 //#define ALLOCDBG
 #ifdef ALLOCDBG
@@ -910,24 +911,33 @@ static uint64_t __intel_allocator_open_full(int fd, uint32_t ctx,
 	struct alloc_resp resp;
 	uint64_t gtt_size;
 
-	if (!start)
-		req.open.start = gem_detect_safe_start_offset(fd);
+	if (is_i915_device(fd)) {
+		if (!start)
+			req.open.start = gem_detect_safe_start_offset(fd);
 
-	if (!end) {
-		igt_assert_f(can_report_gtt_size(fd), "Invalid fd\n");
-		gtt_size = gem_aperture_size(fd);
-		if (!gem_uses_full_ppgtt(fd))
-			gtt_size /= 2;
-		else
-			gtt_size -= RESERVED;
+		if (!end) {
+			igt_assert_f(can_report_gtt_size(fd), "Invalid fd\n");
+			gtt_size = gem_aperture_size(fd);
+			if (!gem_uses_full_ppgtt(fd))
+				gtt_size /= 2;
+			else
+				gtt_size -= RESERVED;
 
-		req.open.end = gtt_size;
-	}
+			req.open.end = gtt_size;
+		}
 
-	if (!default_alignment)
-		req.open.default_alignment = gem_detect_safe_alignment(fd);
+		if (!default_alignment)
+			req.open.default_alignment = gem_detect_safe_alignment(fd);
+
+		req.open.start = ALIGN(req.open.start, req.open.default_alignment);
+	} else {
+		struct xe_device *xe_dev = xe_device_get(fd);
 
-	req.open.start = ALIGN(req.open.start, req.open.default_alignment);
+		igt_assert(xe_dev);
+
+		if (!end)
+			req.open.end = 1ull << xe_dev->va_bits;
+	}
 
 	/* Get child_tid only once at open() */
 	if (child_tid == -1)
@@ -998,7 +1008,7 @@ uint64_t intel_allocator_open_vm_full(int fd, uint32_t vm,
 
 /**
  * intel_allocator_open:
- * @fd: i915 descriptor
+ * @fd: i915 or xe descriptor
  * @ctx: context
  * @allocator_type: one of INTEL_ALLOCATOR_* define
  *
-- 
2.34.1
