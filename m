Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 139F910E0A7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 11:27:55 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Mar 2023 16:54:55 +0530
Message-Id: <20230316112455.1462396-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] lib/huc_copy: Use softpinning for Gen12+
 platforms.
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

From: "Ye, Tony" <tony.ye@intel.com>

Stop using relocs and the legacy execbuf flags.

Signed-off-by: Tony Ye <tony.ye@intel.com>
Co-developed-by: Vikas Srivastava <vikas.srivastava@intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 lib/huc_copy.c          | 80 +++++++++++++++++++++++++++++++++++++++++
 lib/huc_copy.h          |  4 +++
 lib/intel_batchbuffer.c |  8 +++--
 3 files changed, 90 insertions(+), 2 deletions(-)

diff --git a/lib/huc_copy.c b/lib/huc_copy.c
index bf8254c612..97643f07f7 100644
--- a/lib/huc_copy.c
+++ b/lib/huc_copy.c
@@ -26,6 +26,8 @@
 #include "drmtest.h"
 #include "huc_copy.h"
 #include "intel_allocator.h"
+#include "intel_ctx.h"
+#include "i915/gem_engine_topology.h"
 
 static void
 gen9_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
@@ -123,3 +125,81 @@ gen9_huc_copyfunc(int fd, uint64_t ahnd,
 
 	gem_execbuf(fd, &execbuf);
 }
+
+static void
+gen12_emit_huc_virtual_addr_state(struct drm_i915_gem_exec_object2 *src,
+				  struct drm_i915_gem_exec_object2 *dst,
+				  uint32_t *buf,
+				  int *i)
+{
+	buf[(*i)++] = HUC_VIRTUAL_ADDR_STATE;
+
+	igt_assert((src->offset + sizeof(src->offset)) <= 32 || \
+	(dst->offset + sizeof(dst->offset)) <= 32);
+	for (int j = 0; j < HUC_VIRTUAL_ADDR_REGION_NUM; j++) {
+		if (j == HUC_VIRTUAL_ADDR_REGION_SRC) {
+			buf[(*i)++] = upper_32_bits(src->offset);
+		} else if (j == HUC_VIRTUAL_ADDR_REGION_DST) {
+			buf[(*i)++] = upper_32_bits(dst->offset);
+		} else {
+			buf[(*i)++] = 0;
+			buf[(*i)++] = 0;
+		}
+
+		buf[(*i)++] = 0;
+	}
+}
+
+void
+gen12_huc_copyfunc(int fd, uint64_t ahnd,
+		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize)
+{
+	struct drm_i915_gem_execbuffer2 execbuf;
+	int i = 0;
+	uint32_t buf[63];
+	const intel_ctx_t *ctx;
+
+	/* load huc kernel */
+	buf[i++] = HUC_IMEM_STATE;
+	buf[i++] = 0;
+	buf[i++] = 0;
+	buf[i++] = 0;
+	buf[i++] = 0x3;
+
+	buf[i++] = MFX_WAIT;
+	buf[i++] = MFX_WAIT;
+
+	buf[i++] = HUC_PIPE_MODE_SELECT;
+	buf[i++] = 0;
+	buf[i++] = 0;
+
+	buf[i++] = MFX_WAIT;
+
+	obj[0].offset = get_offset(ahnd, obj[0].handle, objsize[0], 0);
+	obj[0].flags |= EXEC_OBJECT_PINNED;
+	obj[1].offset = get_offset(ahnd, obj[1].handle, objsize[1], 0);
+	obj[1].flags |= EXEC_OBJECT_PINNED;
+	obj[1].flags |= EXEC_OBJECT_WRITE;
+	obj[2].offset = get_offset(ahnd, obj[2].handle, objsize[2], 0);
+	obj[2].flags |= EXEC_OBJECT_PINNED;
+	gen12_emit_huc_virtual_addr_state(&obj[0], &obj[1], buf, &i);
+
+	buf[i++] = HUC_START;
+	buf[i++] = 1;
+
+	buf[i++] = MI_BATCH_BUFFER_END;
+
+	gem_write(fd, obj[2].handle, 0, buf, sizeof(buf));
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(obj);
+	execbuf.buffer_count = 3;
+	execbuf.flags = I915_EXEC_DEFAULT;
+
+	ctx = intel_ctx_create_for_engine(fd, I915_ENGINE_CLASS_VIDEO, 0);
+	execbuf.rsvd1 = ctx->id;
+
+	gem_execbuf(fd, &execbuf);
+
+	intel_ctx_destroy(fd, ctx);
+}
diff --git a/lib/huc_copy.h b/lib/huc_copy.h
index 1789e87359..4ee7de1288 100644
--- a/lib/huc_copy.h
+++ b/lib/huc_copy.h
@@ -46,4 +46,8 @@ void
 gen9_huc_copyfunc(int fd, uint64_t ahnd,
 		  struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
 
+void
+gen12_huc_copyfunc(int fd, uint64_t ahnd,
+		   struct drm_i915_gem_exec_object2 *obj, uint64_t *objsize);
+
 #endif /* HUC_COPY_H */
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 8695f1b7ac..fa90f6b19e 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2504,14 +2504,18 @@ void intel_bb_copy_intel_buf(struct intel_bb *ibb,
  * Returns:
  *
  * The platform-specific huc copy function pointer for the device specified
- * with @devid. Will return NULL when no media spin function is implemented.
+ * with @devid. Will return NULL when no huc copy function is implemented.
  */
 igt_huc_copyfunc_t igt_get_huc_copyfunc(int devid)
 {
 	igt_huc_copyfunc_t copy = NULL;
 
-	if (IS_GEN12(devid) || IS_GEN11(devid) || IS_GEN9(devid))
+	if (AT_LEAST_GEN(devid, 12))
+		copy = gen12_huc_copyfunc;
+	else if (IS_GEN11(devid) || IS_GEN9(devid))
 		copy = gen9_huc_copyfunc;
+	else
+		copy = NULL;
 
 	return copy;
 }
-- 
2.25.1
