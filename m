Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	igt-dev@lists.freedesktop.org
Date: Thu, 16 Mar 2023 10:47:23 +0100
Message-Id: <20230316094723.63713-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] tests/xe/xe_noexec_ping_pong: Add a test
 to expose unnecessary rebinds
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This test creates compute vms, binds a couple of bos and an engine each,
thus redying it for execution. However, VRAM memory is over-
committed and while there is still nothing to execute, an eviction
will trigger the VM's rebind worker to rebind the evicted bo, which
will in turn trigger another eviction and so on.

Since we don't have eviction stats yet we need to watch "top" for
the rebind kworkers using a lot of CPU while the test idles.

The correct driver behaviour should be not to rebind anything unless
there is work queued on one of the VM's compute engines.

v2:
- Use the ALIGN macro for aligning
- Reduce the idle pause duration to 10s. (Matthew Brost)
- Add an IGT_TEST_DESCRIPTION()
- Explicity use gt0 for testing.
- Skip if no VRAM available.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/meson.build              |   1 +
 tests/xe/xe_noexec_ping_pong.c | 106 +++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 tests/xe/xe_noexec_ping_pong.c

diff --git a/tests/meson.build b/tests/meson.build
index 632e36e0..2e62ff23 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -256,6 +256,7 @@ xe_progs = [
 	'xe_huc_copy',
 	'xe_mmap',
 	'xe_mmio',
+	'xe_noexec_ping_pong',
 	'xe_pm',
 	'xe_prime_self_import',
 	'xe_query',
diff --git a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c
new file mode 100644
index 00000000..dc14f8cf
--- /dev/null
+++ b/tests/xe/xe_noexec_ping_pong.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <unistd.h>
+
+#include "drmtest.h"
+#include "igt.h"
+
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define NUM_VMS 10
+#define NUM_BOS 1
+#define SECONDS_TO_WAIT 10
+
+/**
+ * TEST: Expose compute VM's unnecessary rebinds
+ * Category: Software building block
+ * Sub-category: compute
+ * Test category: functionality test
+ */
+
+/*
+ * This test creates compute vms, binds a couple of bos and an engine each,
+ * thus redying it for execution. However, VRAM memory is over-
+ * committed and while there is still nothing to execute, an eviction
+ * will trigger the VM's rebind worker to rebind the evicted bo, which
+ * will in turn trigger another eviction and so on.
+ *
+ * Since we don't have eviction stats yet we need to watch "top" for
+ * the rebind kworkers using a lot of CPU while the test idles.
+ *
+ * The correct driver behaviour should be not to rebind anything unless
+ * there is worked queued on one of the VM's compute engines.
+ */
+static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	size_t vram_size = xe_vram_size(fd, 0);
+	size_t align = xe_get_default_alignment(fd);
+	size_t bo_size = vram_size / NUM_VMS / NUM_BOS;
+	uint32_t vm[NUM_VMS];
+	uint32_t bo[NUM_VMS][NUM_BOS];
+	uint32_t engines[NUM_VMS];
+	unsigned int i, j;
+
+	igt_skip_on(!bo_size);
+
+	/* Align and make sure we overcommit vram with at least 10% */
+	bo_size = ALIGN(bo_size + bo_size / 10, align);
+
+	/*
+	 * This should not start ping-ponging memory between system and
+	 * VRAM. For now look at top to determine. TODO: Look at eviction
+	 * stats.
+	 */
+	for (i = 0; i < NUM_VMS; ++i) {
+		struct drm_xe_ext_engine_set_property ext = {
+			.base.next_extension = 0,
+			.base.name = XE_ENGINE_EXTENSION_SET_PROPERTY,
+			.property = XE_ENGINE_SET_PROPERTY_COMPUTE_MODE,
+			.value = 1,
+		};
+
+		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
+		for (j = 0; j < NUM_BOS; ++j) {
+			igt_debug("Creating bo size %lu for vm %u\n",
+				  (unsigned long) bo_size,
+				  (unsigned int) vm[i]);
+
+			bo[i][j] = xe_bo_create_flags(fd, vm[i], bo_size,
+						      vram_memory(fd, 0));
+			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
+				   bo_size, NULL, 0);
+		}
+		engines[i] = xe_engine_create(fd, vm[i], eci,
+					      to_user_pointer(&ext));
+	}
+
+	igt_info("Now sleeping for %ds.\n", SECONDS_TO_WAIT);
+	igt_info("Watch \"top\" for high-cpu kworkers!\n");
+	sleep(SECONDS_TO_WAIT);
+
+	for (i = 0; i < NUM_VMS; ++i) {
+		xe_engine_destroy(fd, engines[i]);
+		for (j = 0; j < NUM_BOS; ++j)
+			gem_close(fd, bo[i][j]);
+		xe_vm_destroy(fd, vm[i]);
+	}
+}
+
+static int fd;
+
+IGT_TEST_DESCRIPTION("Expose compute VM's unnecessary rebinds");
+igt_simple_main
+{
+
+	fd = drm_open_driver(DRIVER_XE);
+	xe_device_get(fd);
+
+	test_ping_pong(fd, xe_hw_engine(fd, 0));
+
+	xe_device_put(fd);
+	close(fd);
+}
-- 
2.39.2
