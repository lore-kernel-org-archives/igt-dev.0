Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3D6F10EC1C
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 02:27:07 +0000 (UTC)
From: Zack Rusin <zack@kde.org>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Mar 2023 22:26:57 -0400
Message-Id: <20230316022659.73202-7-zack@kde.org>
In-Reply-To: <20230316022659.73202-1-zack@kde.org>
References: <20230316022659.73202-1-zack@kde.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 6/8] igt/vmwgfx: Add mob stress test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, banackm@vmware.com, mombasawalam@vmware.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Maaz Mombasawala <mombasawalam@vmware.com>

This test checks the limits of the number and capacity of mobs that
vmwgfx can support.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
---
 tests/vmwgfx/meson.build  |  3 +-
 tests/vmwgfx/mob_stress.c | 99 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 tests/vmwgfx/mob_stress.c

diff --git a/tests/vmwgfx/meson.build b/tests/vmwgfx/meson.build
index 7c688e92..c84dcc28 100644
--- a/tests/vmwgfx/meson.build
+++ b/tests/vmwgfx/meson.build
@@ -2,7 +2,8 @@
 vmwgfx_progs = [
 	'tri',
 	'execution_buffer',
-	'surface_copy'
+	'surface_copy',
+	'mob_stress'
 ]
 vmwgfx_deps = test_deps
 
diff --git a/tests/vmwgfx/mob_stress.c b/tests/vmwgfx/mob_stress.c
new file mode 100644
index 00000000..9c8fb110
--- /dev/null
+++ b/tests/vmwgfx/mob_stress.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/**********************************************************
+ * Copyright 2021-2022 VMware, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person
+ * obtaining a copy of this software and associated documentation
+ * files (the "Software"), to deal in the Software without
+ * restriction, including without limitation the rights to use, copy,
+ * modify, merge, publish, distribute, sublicense, and/or sell copies
+ * of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be
+ * included in all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
+ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
+ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
+ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
+ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+ * SOFTWARE.
+ *
+ **********************************************************/
+
+#include "igt_vmwgfx.h"
+
+static void test_triangle_render(struct vmw_svga_device *device, int32 cid)
+{
+	uint8 *rendered_tri;
+	struct vmw_default_objects objects;
+
+	vmw_create_default_objects(device, cid, &objects,
+				   &vmw_default_rect_size);
+	rendered_tri = vmw_triangle_draw(device, cid, &objects, true);
+	vmw_triangle_assert_values(rendered_tri, objects.color_rt);
+
+	free(rendered_tri);
+	vmw_destroy_default_objects(device, &objects);
+}
+
+igt_main
+{
+	struct vmw_svga_device device;
+	int32 cid;
+	uint64 max_mob_mem;
+	uint64 max_mob_size;
+
+	igt_fixture
+	{
+		vmw_svga_device_init(&device, vmw_svga_device_node_render);
+		igt_require(device.drm_fd != -1);
+
+		cid = vmw_ioctl_context_create(device.drm_fd);
+		igt_require(cid != SVGA3D_INVALID_ID);
+
+		max_mob_mem = vmw_ioctl_get_param(device.drm_fd,
+						  DRM_VMW_PARAM_MAX_MOB_MEMORY);
+		max_mob_size = vmw_ioctl_get_param(device.drm_fd,
+						   DRM_VMW_PARAM_MAX_MOB_SIZE);
+	}
+
+	igt_subtest("max_mob_mem_stress")
+	{
+		uint32 mob_num;
+		struct vmw_mob **mob_objs;
+		int i;
+
+		mob_num = max_mob_mem / max_mob_size;
+		mob_objs = (struct vmw_mob **)calloc(mob_num,
+						     sizeof(struct vmw_mob *));
+
+		/* Enough mobs to reach max_mob_mem */
+		for (i = 0; i < mob_num; i++) {
+			char *readback;
+
+			mob_objs[i] = vmw_ioctl_mob_create(device.drm_fd,
+							   max_mob_size);
+			/* Writing mob to ensure it gets created */
+			readback =
+				vmw_ioctl_mob_map(device.drm_fd, mob_objs[i]);
+			memset(readback, 0, mob_objs[i]->size);
+			vmw_ioctl_mob_unmap(mob_objs[i]);
+		}
+
+		test_triangle_render(&device, cid);
+
+		for (i = 0; i < mob_num; i++)
+			vmw_ioctl_mob_close_handle(device.drm_fd, mob_objs[i]);
+		free(mob_objs);
+	}
+
+	igt_fixture
+	{
+		vmw_ioctl_context_destroy(device.drm_fd, cid);
+		vmw_svga_device_fini(&device);
+	}
+}
-- 
2.38.1
