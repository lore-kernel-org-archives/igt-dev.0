Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B55D6EBA0
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:12 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:40:57 +0200
Message-Id: <20210806134145.24634-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 08/56] lib/huc_copy: Extend huc copy
 prototype to pass allocator handle
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For testing gem_huc_copy on no-reloc platforms we need to pass
allocator handle and object sizes to properly acquire offsets from
allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/huc_copy.c            | 27 +++++++++++++++++++++++----
 lib/huc_copy.h            |  4 ++--
 lib/intel_batchbuffer.h   |  6 ++++--
 tests/i915/gem_huc_copy.c | 12 ++++++++++--
 4 files changed, 39 insertions(+), 10 deletions(-)

diff --git a/lib/huc_copy.c b/lib/huc_copy.c
index bc98b1f9f..6ec68864b 100644
--- a/lib/huc_copy.c
+++ b/lib/huc_copy.c
@@ -23,7 +23,9 @@
  */
 
 #include <i915_drm.h>
+#include "drmtest.h"
 #include "huc_copy.h"
+#include "intel_allocator.h"
 
 static void
 gen9_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
@@ -40,6 +42,7 @@ gen9_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
 			buf[(*i)++] = src->offset;
 
 			reloc_src->target_handle = src->handle;
+			reloc_src->presumed_offset = src->offset;
 			reloc_src->delta = 0;
 			reloc_src->offset = (*i - 1) * sizeof(buf[0]);
 			reloc_src->read_domains = 0;
@@ -48,6 +51,7 @@ gen9_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
 			buf[(*i)++] = dst->offset;
 
 			reloc_dst->target_handle = dst->handle;
+			reloc_dst->presumed_offset = dst->offset;
 			reloc_dst->delta = 0;
 			reloc_dst->offset = (*i - 1) * sizeof(buf[0]);
 			reloc_dst->read_domains = 0;
@@ -61,8 +65,8 @@ gen9_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
 }
 
 void
-gen9_huc_copyfunc(int fd,
-		struct drm_i915_gem_exec_object2 *obj)
+gen9_huc_copyfunc(int fd, uint64_t ahnd,
+		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize)
 {
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -86,6 +90,21 @@ gen9_huc_copyfunc(int fd,
 	buf[i++] = MFX_WAIT;
 
 	memset(reloc, 0, sizeof(reloc));
+
+	if (ahnd) {
+		obj[0].flags = EXEC_OBJECT_PINNED;
+		obj[1].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[2].flags = EXEC_OBJECT_PINNED;
+		obj[0].offset = get_offset(ahnd, obj[0].handle, objsize[0], 0);
+		obj[1].offset = get_offset(ahnd, obj[1].handle, objsize[1], 0);
+		obj[2].offset = get_offset(ahnd, obj[2].handle, objsize[2], 0);
+	} else {
+		obj[0].offset = 1 << 20;
+		obj[1].offset = ALIGN(obj[0].offset + objsize[0], 1 << 20);
+		obj[2].offset = ALIGN(obj[1].offset + objsize[1], 1 << 20);
+		obj[1].flags = EXEC_OBJECT_WRITE;
+	}
+
 	gen9_emit_huc_virtual_addr_state(&obj[0], &obj[1], &reloc[0], &reloc[1], buf, &i);
 
 	buf[i++] = HUC_START;
@@ -94,13 +113,13 @@ gen9_huc_copyfunc(int fd,
 	buf[i++] = MI_BATCH_BUFFER_END;
 
 	gem_write(fd, obj[2].handle, 0, buf, sizeof(buf));
-	obj[2].relocation_count = 2;
+	obj[2].relocation_count = !ahnd ? 2 : 0;
 	obj[2].relocs_ptr = to_user_pointer(reloc);
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(obj);
 	execbuf.buffer_count = 3;
-	execbuf.flags = I915_EXEC_BSD;
+	execbuf.flags = I915_EXEC_BSD | I915_EXEC_NO_RELOC;
 
 	gem_execbuf(fd, &execbuf);
 }
diff --git a/lib/huc_copy.h b/lib/huc_copy.h
index ac31d8009..69d140933 100644
--- a/lib/huc_copy.h
+++ b/lib/huc_copy.h
@@ -43,7 +43,7 @@
 #define HUC_VIRTUAL_ADDR_REGION_DST	14
 
 void
-gen9_huc_copyfunc(int fd,
-		struct drm_i915_gem_exec_object2 *obj);
+gen9_huc_copyfunc(int fd, uint64_t ahnd,
+		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
 
 #endif /* HUC_COPY_H */
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index c1974fe73..0839d7612 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -679,10 +679,12 @@ void intel_bb_copy_intel_buf(struct intel_bb *ibb,
 /**
  * igt_huc_copyfunc_t:
  * @fd: drm fd
+ * @ahnd: allocator handle, if it is equal to 0 we use relocations
  * @obj: drm_i915_gem_exec_object2 buffer array
  *       obj[0] is source buffer
  *       obj[1] is destination buffer
  *       obj[2] is execution buffer
+ * @objsize: corresponding buffer sizes to @obj
  *
  * This is the type of the per-platform huc copy functions.
  *
@@ -690,8 +692,8 @@ void intel_bb_copy_intel_buf(struct intel_bb *ibb,
  * invoke the HuC Copy kernel to copy 4K bytes from the source buffer
  * to the destination buffer.
  */
-typedef void (*igt_huc_copyfunc_t)(int fd,
-		struct drm_i915_gem_exec_object2 *obj);
+typedef void (*igt_huc_copyfunc_t)(int fd, uint64_t ahnd,
+		struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
 
 igt_huc_copyfunc_t	igt_get_huc_copyfunc(int devid);
 #endif
diff --git a/tests/i915/gem_huc_copy.c b/tests/i915/gem_huc_copy.c
index 9a32893ea..ea32b705a 100644
--- a/tests/i915/gem_huc_copy.c
+++ b/tests/i915/gem_huc_copy.c
@@ -89,6 +89,7 @@ igt_main
 	int drm_fd = -1;
 	uint32_t devid;
 	igt_huc_copyfunc_t huc_copy;
+	uint64_t ahnd;
 
 	igt_fixture {
 		drm_fd = drm_open_driver(DRIVER_INTEL);
@@ -97,6 +98,8 @@ igt_main
 		huc_copy = igt_get_huc_copyfunc(devid);
 
 		igt_require_f(huc_copy, "no huc_copy function\n");
+
+		ahnd = get_reloc_ahnd(drm_fd, 0);
 	}
 
 	igt_describe("Make sure that Huc firmware works"
@@ -106,6 +109,9 @@ igt_main
 	igt_subtest("huc-copy") {
 		char inputs[HUC_COPY_DATA_BUF_SIZE];
 		struct drm_i915_gem_exec_object2 obj[3];
+		uint64_t objsize[3] = { HUC_COPY_DATA_BUF_SIZE,
+					HUC_COPY_DATA_BUF_SIZE,
+					4096 };
 
 		test_huc_load(drm_fd);
 		/* Initialize src buffer randomly */
@@ -123,7 +129,7 @@ igt_main
 
 		gem_write(drm_fd, obj[0].handle, 0, inputs, HUC_COPY_DATA_BUF_SIZE);
 
-		huc_copy(drm_fd, obj);
+		huc_copy(drm_fd, ahnd, obj, objsize);
 		compare_huc_copy_result(drm_fd, obj[0].handle, obj[1].handle);
 
 		gem_close(drm_fd, obj[0].handle);
@@ -131,6 +137,8 @@ igt_main
 		gem_close(drm_fd, obj[2].handle);
 	}
 
-	igt_fixture
+	igt_fixture {
+		put_ahnd(ahnd);
 		close(drm_fd);
+	}
 }
-- 
2.26.0
