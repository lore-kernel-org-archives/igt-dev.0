Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB6810E258
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 10:59:36 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Petri Latvala <petri.latvala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emma Anholt <emma@anholt.net>,
 Jason Ekstrand <jason.ekstrand@collabora.com>,
 Iago Toral Quiroga <itoral@igalia.com>, Rob Clark <robdclark@chromium.org>
Date: Tue,  3 Jan 2023 07:58:33 -0300
Message-Id: <20230103105835.604394-4-mcanal@igalia.com>
In-Reply-To: <20230103105835.604394-1-mcanal@igalia.com>
References: <20230103105835.604394-1-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/6] lib/v3d: Introduce the struct v3d_cl_job
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Create a struct to encapsulate all the resources needed for a CL
submission on v3d: it has BOs for tile allocation and tile state and
command lists for the binner and the render. A CL job submission needs the
command list (CL) structure, so bring part of the v3dv_cl file [1] for
IGT use. The v3dv_cl header file was renamed to v3d_cl and it will help
in emitting commands to the GPU.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/22.3/src/broadcom/vulkan/v3dv_cl.h

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.h    |  11 ++++
 lib/v3d/v3d_cl.h | 157 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 168 insertions(+)
 create mode 100644 lib/v3d/v3d_cl.h

diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index 2edb0f03..2533d7c4 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -28,6 +28,8 @@
 
 #define PAGE_SIZE 4096
 
+struct v3d_cl;
+
 struct v3d_bo {
 	int handle;
 	uint32_t offset;
@@ -35,6 +37,15 @@ struct v3d_bo {
 	void *map;
 };
 
+struct v3d_cl_job {
+	struct drm_v3d_submit_cl *submit;
+	struct v3d_cl *bcl;
+	struct v3d_cl *rcl;
+	struct v3d_cl *icl;
+	struct v3d_bo *tile_alloc;
+	struct v3d_bo *tile_state;
+};
+
 struct v3d_bo *igt_v3d_create_bo(int fd, size_t size);
 void igt_v3d_free_bo(int fd, struct v3d_bo *bo);
 
diff --git a/lib/v3d/v3d_cl.h b/lib/v3d/v3d_cl.h
new file mode 100644
index 00000000..8a5c53b0
--- /dev/null
+++ b/lib/v3d/v3d_cl.h
@@ -0,0 +1,157 @@
+/*
+ * Copyright © 2019 Raspberry Pi Ltd
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#ifndef V3D_CL_H
+#define V3D_CL_H
+
+#include "v3d_packet_helpers.h"
+#include "igt_v3d.h"
+
+/**
+ * Undefined structure, used for typechecking that you're passing the pointers
+ * to these functions correctly.
+ */
+struct v3d_cl_out;
+
+/** A reference to a BO used in the CL packing functions */
+struct v3d_cl_reloc {
+   struct v3d_bo *bo;
+   uint32_t offset;
+};
+
+#define __gen_user_data struct v3d_cl
+#define __gen_address_type struct v3d_cl_reloc
+#define __gen_address_offset(reloc) (((reloc)->bo ? (reloc)->bo->offset : 0) + \
+                                     (reloc)->offset)
+#define __gen_emit_reloc cl_pack_emit_reloc
+#define __gen_unpack_address(cl, s, e) __unpack_address(cl, s, e)
+
+struct v3d_cl {
+   void *base;
+   struct v3d_cl_out *next;
+   struct v3d_bo *bo;
+   uint32_t size;
+};
+
+static inline struct v3d_cl_reloc
+__unpack_address(const uint8_t *cl, uint32_t s, uint32_t e)
+{
+    struct v3d_cl_reloc reloc =
+            { NULL, __gen_unpack_uint(cl, s, e) << (31 - (e - s)) };
+    return reloc;
+}
+
+static inline uint32_t
+v3d_cl_offset(struct v3d_cl *cl)
+{
+   return (char *)cl->next - (char *)cl->base;
+}
+
+static inline struct v3d_cl_reloc
+v3d_cl_address(struct v3d_bo *bo, uint32_t offset)
+{
+   struct v3d_cl_reloc reloc = {
+      .bo = bo,
+      .offset = offset,
+   };
+   return reloc;
+}
+
+static inline struct v3d_cl_reloc
+v3d_cl_get_address(struct v3d_cl *cl)
+{
+   return (struct v3d_cl_reloc){ .bo = cl->bo, .offset = v3d_cl_offset(cl) };
+}
+
+static inline struct v3d_cl_out *
+cl_start(struct v3d_cl *cl)
+{
+   return cl->next;
+}
+
+static inline void
+cl_end(struct v3d_cl *cl, struct v3d_cl_out *next)
+{
+   cl->next = next;
+   assert(v3d_cl_offset(cl) <= cl->size);
+}
+
+static inline void
+cl_advance(struct v3d_cl_out **cl, uint32_t n)
+{
+   (*cl) = (struct v3d_cl_out *)((char *)(*cl) + n);
+}
+
+#define V3DX(x) V3D42_##x
+#define v3dX(x) V3D42_##x
+
+#define cl_packet_header(packet) V3DX(packet ## _header)
+#define cl_packet_length(packet) V3DX(packet ## _length)
+#define cl_packet_pack(packet)   V3DX(packet ## _pack)
+#define cl_packet_struct(packet) V3DX(packet)
+
+/* Macro for setting up an emit of a CL struct.  A temporary unpacked struct
+ * is created, which you get to set fields in of the form:
+ *
+ * cl_emit(bcl, FLAT_SHADE_FLAGS, flags) {
+ *     .flags.flat_shade_flags = 1 << 2,
+ * }
+ *
+ * or default values only can be emitted with just:
+ *
+ * cl_emit(bcl, FLAT_SHADE_FLAGS, flags);
+ *
+ * The trick here is that we make a for loop that will execute the body
+ * (either the block or the ';' after the macro invocation) exactly once.
+ */
+#define cl_emit(cl, packet, name)                                \
+        for (struct cl_packet_struct(packet) name = {            \
+                cl_packet_header(packet)                         \
+        },                                                       \
+        *_loop_terminate = &name;                                \
+        __builtin_expect(_loop_terminate != NULL, 1);            \
+        ({                                                       \
+                struct v3d_cl_out *cl_out = cl_start(cl);        \
+                cl_packet_pack(packet)(cl, (uint8_t *)cl_out, &name); \
+                cl_advance(&cl_out, cl_packet_length(packet));   \
+                cl_end(cl, cl_out);                              \
+                _loop_terminate = NULL;                          \
+        }))                                                      \
+
+/*
+ * Helper function called by the XML-generated pack functions for filling in
+ * an address field in shader records.
+ *
+ * Since we have a private address space as of V3D, our BOs can have lifelong
+ * offsets, and all the kernel needs to know is which BOs need to be paged in
+ * for this exec.
+ */
+static inline void
+cl_pack_emit_reloc(struct v3d_cl *cl, const struct v3d_cl_reloc *reloc)
+{
+   /*
+    * Mock emit reloc, as it is not needed for IGT tests.
+    */
+}
+
+#endif /* V3D_CL_H */
-- 
2.38.1
