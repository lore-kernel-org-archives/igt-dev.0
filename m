Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5AF10E6BB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 07:26:17 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 09:25:35 +0200
Message-Id: <20230418072535.14946-11-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
References: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/10] tests/xe_gpgpu_fill: Exercise
 gpgpu fill on Xe
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

Reuse gpgpu fill already exercised on i915 on Xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist |   1 +
 tests/meson.build                        |   1 +
 tests/xe/xe_gpgpu_fill.c                 | 133 +++++++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 tests/xe/xe_gpgpu_fill.c

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 019804b579..e3ebce70b6 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -118,6 +118,7 @@ igt@xe_exec_threads@threads-mixed-fd-basic
 igt@xe_exec_threads@threads-bal-mixed-basic
 igt@xe_exec_threads@threads-bal-mixed-shared-vm-basic
 igt@xe_exec_threads@threads-bal-mixed-fd-basic
+igt@xe_gpgpu_fill@basic
 igt@xe_guc_pc@freq_basic_api
 igt@xe_guc_pc@freq_fixed_idle
 igt@xe_guc_pc@freq_range_idle
diff --git a/tests/meson.build b/tests/meson.build
index 3ec440710e..a6642b9dc1 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -253,6 +253,7 @@ xe_progs = [
 	'xe_exec_fault_mode',
 	'xe_exec_reset',
 	'xe_exec_threads',
+	'xe_gpgpu_fill',
 	'xe_guc_pc',
 	'xe_huc_copy',
 	'xe_intel_bb',
diff --git a/tests/xe/xe_gpgpu_fill.c b/tests/xe/xe_gpgpu_fill.c
new file mode 100644
index 0000000000..d9a932fde3
--- /dev/null
+++ b/tests/xe/xe_gpgpu_fill.c
@@ -0,0 +1,133 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+/**
+ * TEST: Basic tests for gpgpu functionality
+ * Category: Software building block
+ * Sub-category: gpgpu
+ * Test category: functionality test
+ */
+
+#include <stdbool.h>
+#include <unistd.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+#include <stdio.h>
+#include <string.h>
+#include <fcntl.h>
+#include <inttypes.h>
+#include <errno.h>
+#include <sys/stat.h>
+#include <sys/time.h>
+
+#include "drm.h"
+#include "i915/gem.h"
+#include "igt.h"
+#include "igt_collection.h"
+#include "intel_bufops.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
+
+#define WIDTH 64
+#define HEIGHT 64
+#define STRIDE (WIDTH)
+#define SIZE (HEIGHT*STRIDE)
+#define COLOR_C4	0xc4
+#define COLOR_4C	0x4c
+
+typedef struct {
+	int drm_fd;
+	uint32_t devid;
+	struct buf_ops *bops;
+} data_t;
+
+static struct intel_buf *
+create_buf(data_t *data, int width, int height, uint8_t color, uint64_t region)
+{
+	struct intel_buf *buf;
+	uint8_t *ptr;
+	int i;
+
+	buf = calloc(1, sizeof(*buf));
+	igt_assert(buf);
+
+	buf = intel_buf_create(data->bops, width/4, height, 32, 0,
+			       I915_TILING_NONE, 0);
+
+	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
+
+	for (i = 0; i < buf->surface[0].size; i++)
+		ptr[i] = color;
+
+	munmap(ptr, buf->surface[0].size);
+
+	return buf;
+}
+
+static void buf_check(uint8_t *ptr, int x, int y, uint8_t color)
+{
+	uint8_t val;
+
+	val = ptr[y * WIDTH + x];
+	igt_assert_f(val == color,
+		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
+		     color, val, x, y);
+}
+
+/**
+ * SUBTEST: basic
+ * Description: run gpgpu fill
+ * Run type: FULL
+ * TODO: change ``'Run type' == FULL`` to a better category
+ */
+
+static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
+{
+	struct intel_buf *buf;
+	uint8_t *ptr;
+	int i, j;
+
+	buf = create_buf(data, WIDTH, HEIGHT, COLOR_C4, region);
+	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
+
+	for (i = 0; i < WIDTH; i++)
+		for (j = 0; j < HEIGHT; j++)
+			buf_check(ptr, i, j, COLOR_C4);
+
+	fill(data->drm_fd, buf, 0, 0, WIDTH / 2, HEIGHT / 2, COLOR_4C);
+
+	for (i = 0; i < WIDTH; i++)
+		for (j = 0; j < HEIGHT; j++)
+			if (i < WIDTH / 2 && j < HEIGHT / 2)
+				buf_check(ptr, i, j, COLOR_4C);
+			else
+				buf_check(ptr, i, j, COLOR_C4);
+
+	munmap(ptr, buf->surface[0].size);
+}
+
+igt_main
+{
+	data_t data = {0, };
+	igt_fillfunc_t fill_fn = NULL;
+
+	igt_fixture {
+		data.drm_fd = drm_open_driver_render(DRIVER_XE);
+		data.devid = intel_get_drm_devid(data.drm_fd);
+		data.bops = buf_ops_create(data.drm_fd);
+
+		fill_fn = igt_get_gpgpu_fillfunc(data.devid);
+		xe_device_get(data.drm_fd);
+	}
+
+	igt_subtest("basic") {
+		gpgpu_fill(&data, fill_fn, 0);
+	}
+
+	igt_fixture {
+		xe_device_put(data.drm_fd);
+		buf_ops_destroy(data.bops);
+	}
+}
-- 
2.34.1
