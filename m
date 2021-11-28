Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34446EBA6
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Nov 2021 07:18:23 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Sun, 28 Nov 2021 12:38:22 +0530
Message-Id: <20211128070823.1396652-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20211128070823.1396652-1-priyanka.dandamudi@intel.com>
References: <20211128070823.1396652-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Refactor common store code into
 helper function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

A lot of tests use almost identical code for creating a batch buffer
which does a single write to memory. This patch collects three such
instances into a common helper function. Unfortunately, the other
instances are all subtly different enough to make it not so trivial to
try to use the helper. It could be done but it is unclear if it is
worth the effort at this point. This patch proves the concept, if
people like it enough then it can be extended.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 lib/igt_store.c | 103 ++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_store.h |  30 ++++++++++++++
 lib/meson.build |   1 +
 3 files changed, 134 insertions(+)
 create mode 100644 lib/igt_store.c
 create mode 100644 lib/igt_store.h

diff --git a/lib/igt_store.c b/lib/igt_store.c
new file mode 100644
index 00000000..dc4d466a
--- /dev/null
+++ b/lib/igt_store.c
@@ -0,0 +1,103 @@
+/*
+ * Copyright © 2020 Intel Corporation
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
+ *
+ */
+
+#include "i915/gem_create.h"
+#include "igt_core.h"
+#include "drmtest.h"
+#include "igt_store.h"
+#include "intel_chipset.h"
+#include "intel_reg.h"
+#include "ioctl_wrappers.h"
+
+/**
+ * SECTION:igt_store_word
+ * @short_description: Library for writing a value to memory
+ * @title: StoreWord
+ * @include: igt.h
+ *
+ * A lot of igt testcases need some mechanism for writing a value to memory
+ * as a test that a batch buffer has executed.
+ *
+ * NB: Requires master for STORE_DWORD on gen4/5.
+ */
+void igt_store_word(int fd, const intel_ctx_t *ctx,
+		    const struct intel_execution_engine2 *e,
+		    int fence, uint32_t target_handle,
+		    uint32_t target_offset, uint32_t target_value)
+{
+	const int SCRATCH = 0;
+	const int BATCH = 1;
+	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
+	struct drm_i915_gem_exec_object2 obj[2];
+	struct drm_i915_gem_relocation_entry reloc;
+	struct drm_i915_gem_execbuffer2 execbuf;
+	uint32_t batch[16];
+	int i;
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffers_ptr = to_user_pointer(obj);
+	execbuf.buffer_count = ARRAY_SIZE(obj);
+	execbuf.flags = e->flags;
+	execbuf.rsvd1 = ctx->id;
+	if (fence != -1) {
+		execbuf.flags |= I915_EXEC_FENCE_IN;
+		execbuf.rsvd2 = fence;
+	}
+	if (gen < 6)
+		execbuf.flags |= I915_EXEC_SECURE;
+
+	memset(obj, 0, sizeof(obj));
+	obj[SCRATCH].handle = target_handle;
+
+	obj[BATCH].handle = gem_create(fd, 4096);
+	obj[BATCH].relocs_ptr = to_user_pointer(&reloc);
+	obj[BATCH].relocation_count = 1;
+
+	i = 0;
+	memset(&reloc, 0, sizeof(reloc));
+
+	reloc.target_handle = obj[SCRATCH].handle;
+	reloc.presumed_offset = -1;
+	reloc.offset = sizeof(uint32_t) * (i + 1);
+	reloc.delta = sizeof(uint32_t) * target_offset;
+	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+	reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
+	if (gen >= 8) {
+		batch[++i] = reloc.delta;
+		batch[++i] = 0;
+	} else if (gen >= 4) {
+		batch[++i] = 0;
+		batch[++i] = reloc.delta;
+		reloc.offset += sizeof(uint32_t);
+	} else {
+		batch[i]--;
+		batch[++i] = reloc.delta;
+	}
+	batch[++i] = target_value;
+	batch[++i] = MI_BATCH_BUFFER_END;
+	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
+	gem_execbuf(fd, &execbuf);
+	gem_close(fd, obj[BATCH].handle);
+}
diff --git a/lib/igt_store.h b/lib/igt_store.h
new file mode 100644
index 00000000..709d87e3
--- /dev/null
+++ b/lib/igt_store.h
@@ -0,0 +1,30 @@
+/*
+ * Copyright © 2020 Intel Corporation
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
+ *
+ */
+
+#include "igt_gt.h"
+
+void igt_store_word(int fd, const intel_ctx_t *ctx,
+		    const struct intel_execution_engine2 *e,
+		    int fence, uint32_t target_handle,
+		    uint32_t target_offset, uint32_t target_value);
diff --git a/lib/meson.build b/lib/meson.build
index 297b0ad2..a5799c34 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -71,6 +71,7 @@ lib_sources = [
 	'igt_map.c',
 	'igt_pm.c',
 	'igt_dummyload.c',
+	'igt_store.c',
 	'uwildmat/uwildmat.c',
 	'igt_kmod.c',
 	'igt_panfrost.c',
-- 
2.25.1
