Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F04A10E453
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 14:06:49 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Mar 2022 19:36:35 +0530
Message-Id: <20220303140636.26652-2-anshuman.gupta@intel.com>
In-Reply-To: <20220303140636.26652-1-anshuman.gupta@intel.com>
References: <20220303140636.26652-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_eio: Exercise object creation
 while wedged
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com, Chris Wilson <chris@chris-wilson.co.uk>,
 CQ Tang <cq.tang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris@chris-wilson.co.uk>

Make sure that we can continue to create buffers, primarily to service as
frameuffers for scanout, even while the device is wedged.

Cc: CQ Tang <cq.tang@intel.com>
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 lib/i915/gem_memory_topology.c | 79 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_memory_topology.h | 45 +++++++++++++++++++
 lib/meson.build                |  1 +
 tests/i915/gem_eio.c           | 40 +++++++++++++++++
 4 files changed, 165 insertions(+)
 create mode 100644 lib/i915/gem_memory_topology.c
 create mode 100644 lib/i915/gem_memory_topology.h

diff --git a/lib/i915/gem_memory_topology.c b/lib/i915/gem_memory_topology.c
new file mode 100644
index 000000000..6ee1cb832
--- /dev/null
+++ b/lib/i915/gem_memory_topology.c
@@ -0,0 +1,79 @@
+/*
+ * Copyright © 2021 Intel Corporation
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
+#include <stddef.h>
+#include <stdlib.h>
+
+#include "gem_memory_topology.h"
+#include "igt_aux.h"
+#include "igt_core.h"
+#include "intel_memory_region.h"
+
+static const char *
+region_repr(const struct drm_i915_gem_memory_class_instance *ci)
+{
+	switch (ci->memory_class) {
+	case I915_MEMORY_CLASS_SYSTEM:
+		return "smem";
+	case I915_MEMORY_CLASS_DEVICE:
+		return "lmem";
+	default:
+		return "unknown";
+	}
+}
+
+struct gem_memory_region *__gem_get_memory_regions(int i915)
+{
+	struct drm_i915_query_memory_regions *info;
+	struct gem_memory_region *first = NULL;
+
+	info = gem_get_query_memory_regions(i915);
+	for (int i = 0; info && i < info->num_regions; i++) {
+		struct gem_memory_region *r;
+
+		r = malloc(sizeof(*r));
+		igt_assert(r);
+
+		r->ci = info->regions[i].region;
+		r->size = info->regions[i].probed_size;
+		if (r->size == -1ull)
+			r->size = intel_get_avail_ram_mb() << 20;
+
+		asprintf(&r->name, "%s%d",
+			 region_repr(&r->ci), r->ci.memory_instance);
+
+		r->next = first;
+		first = r;
+	}
+	free(info);
+
+	return first;
+}
+
+struct gem_memory_region *__gem_next_memory_region(struct gem_memory_region *r)
+{
+	struct gem_memory_region *next = r->next;
+	free(r->name);
+	free(r);
+	return next;
+}
diff --git a/lib/i915/gem_memory_topology.h b/lib/i915/gem_memory_topology.h
new file mode 100644
index 000000000..8daec8b5b
--- /dev/null
+++ b/lib/i915/gem_memory_topology.h
@@ -0,0 +1,45 @@
+/*
+ * Copyright © 2021 Intel Corporation
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
+#ifndef GEM_MEMORY_TOPOLOGY_H
+#define GEM_MEMORY_TOPOLOGY_H
+
+#include <stdint.h>
+
+#include "i915_drm.h"
+
+struct gem_memory_region {
+	struct gem_memory_region *next;
+	char *name;
+
+	struct drm_i915_gem_memory_class_instance ci;
+	uint64_t size;
+};
+
+struct gem_memory_region *__gem_get_memory_regions(int i915);
+struct gem_memory_region *
+__gem_next_memory_region(struct gem_memory_region *r);
+
+#define for_each_memory_region(r__, fd__) for (struct gem_memory_region *r__ = __gem_get_memory_regions(fd__); r__; r__ = __gem_next_memory_region(r__))
+
+#endif /* GEM_MEMORY_TOPOLOGY_H */
diff --git a/lib/meson.build b/lib/meson.build
index 3e43316d1..6b369d5bb 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -5,6 +5,7 @@ lib_sources = [
 	'i915/gem_context.c',
 	'i915/gem_create.c',
 	'i915/gem_engine_topology.c',
+	'i915/gem_memory_topology.c',
 	'i915/gem_scheduler.c',
 	'i915/gem_submission.c',
 	'i915/gem_ring.c',
diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index 3d094433b..898636406 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -44,6 +44,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/gem_memory_topology.h"
 #include "i915/gem_ring.h"
 #include "igt.h"
 #include "igt_device.h"
@@ -122,6 +123,39 @@ static void test_throttle(int fd)
 	trigger_reset(fd);
 }
 
+static void test_create(int fd)
+{
+	wedge_gpu(fd);
+
+	gem_close(fd, gem_create(fd, 4096));
+
+	trigger_reset(fd);
+}
+
+static void test_create_ext(int fd)
+{
+	wedge_gpu(fd);
+
+	for_each_memory_region(r, fd) {
+		uint64_t size = 4096;
+		uint32_t handle;
+
+		igt_debug("Creating object in %s\n", r->name);
+		igt_assert_eq(__gem_create_in_memory_region_list(fd,
+								 &handle,
+								 &size,
+								 &r->ci, 1),
+			      0);
+
+		gem_read(fd, handle, size/2, &size, sizeof(size));
+		igt_assert_eq_u64(size, 0);
+
+		gem_close(fd, handle);
+	}
+
+	trigger_reset(fd);
+}
+
 static void test_context_create(int fd)
 {
 	uint32_t ctx;
@@ -997,6 +1031,12 @@ igt_main
 	igt_subtest("throttle")
 		test_throttle(fd);
 
+	igt_subtest("create")
+		test_create(fd);
+
+	igt_subtest("create-ext")
+		test_create_ext(fd);
+
 	igt_subtest("context-create")
 		test_context_create(fd);
 
-- 
2.26.2
