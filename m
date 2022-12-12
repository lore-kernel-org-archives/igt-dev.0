Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129110E2B1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 23:13:03 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Dec 2022 15:12:41 -0800
Message-Id: <20221212231254.2303-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
References: <20221212231254.2303-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 06/19] lib/vm_bind: Add vm_bind specific
 library functions
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: tvrtko.ursulin@intel.com, thomas.hellstrom@intel.com,
 matthew.auld@intel.com, daniel.vetter@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add vm_bind specific library interfaces.

v2: Add flags field

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 lib/i915/i915_vm_bind.c | 62 +++++++++++++++++++++++++++++++++++++++++
 lib/i915/i915_vm_bind.h | 16 +++++++++++
 lib/meson.build         |  1 +
 3 files changed, 79 insertions(+)
 create mode 100644 lib/i915/i915_vm_bind.c
 create mode 100644 lib/i915/i915_vm_bind.h

diff --git a/lib/i915/i915_vm_bind.c b/lib/i915/i915_vm_bind.c
new file mode 100644
index 000000000..201912b49
--- /dev/null
+++ b/lib/i915/i915_vm_bind.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <errno.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+#include "ioctl_wrappers.h"
+#include "i915_drm.h"
+#include "i915_drm_local.h"
+#include "i915_vm_bind.h"
+
+void i915_vm_bind(int i915, uint32_t vm_id, uint64_t va, uint32_t handle,
+		  uint64_t offset, uint64_t length, uint64_t flags,
+		  uint32_t syncobj, uint64_t fence_value)
+{
+	struct drm_i915_gem_vm_bind bind;
+
+	memset(&bind, 0, sizeof(bind));
+	bind.vm_id = vm_id;
+	bind.handle = handle;
+	bind.start = va;
+	bind.offset = offset;
+	bind.length = length;
+	bind.flags = flags;
+	if (syncobj) {
+		bind.fence.handle = syncobj;
+		bind.fence.value = fence_value;
+		bind.fence.flags = I915_TIMELINE_FENCE_SIGNAL;
+	}
+
+	gem_vm_bind(i915, &bind);
+}
+
+void i915_vm_unbind(int i915, uint32_t vm_id, uint64_t va, uint64_t length)
+{
+	struct drm_i915_gem_vm_unbind unbind;
+
+	memset(&unbind, 0, sizeof(unbind));
+	unbind.vm_id = vm_id;
+	unbind.start = va;
+	unbind.length = length;
+
+	gem_vm_unbind(i915, &unbind);
+}
+
+int i915_vm_bind_version(int i915)
+{
+	struct drm_i915_getparam gp;
+	int value = 0;
+
+	memset(&gp, 0, sizeof(gp));
+	gp.param = I915_PARAM_VM_BIND_VERSION;
+	gp.value = &value;
+
+	ioctl(i915, DRM_IOCTL_I915_GETPARAM, &gp, sizeof(gp));
+	errno = 0;
+
+	return value;
+}
diff --git a/lib/i915/i915_vm_bind.h b/lib/i915/i915_vm_bind.h
new file mode 100644
index 000000000..b11142cc8
--- /dev/null
+++ b/lib/i915/i915_vm_bind.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+#ifndef _I915_VM_BIND_H_
+#define _I915_VM_BIND_H_
+
+#include <stdint.h>
+
+void i915_vm_bind(int i915, uint32_t vm_id, uint64_t va, uint32_t handle,
+		  uint64_t offset, uint64_t length, uint64_t flags,
+		  uint32_t syncobj, uint64_t fence_value);
+void i915_vm_unbind(int i915, uint32_t vm_id, uint64_t va, uint64_t length);
+int i915_vm_bind_version(int i915);
+
+#endif /* _I915_VM_BIND_ */
diff --git a/lib/meson.build b/lib/meson.build
index 19d9f4f2c..a01482c38 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -15,6 +15,7 @@ lib_sources = [
 	'i915/intel_mocs.c',
 	'i915/i915_blt.c',
 	'i915/i915_crc.c',
+	'i915/i915_vm_bind.c',
 	'igt_collection.c',
 	'igt_color_encoding.c',
 	'igt_crc.c',
-- 
2.21.0.rc0.32.g243a4c7e27
