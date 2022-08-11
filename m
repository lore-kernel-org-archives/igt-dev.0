Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DB2A2BCB0
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Aug 2022 00:29:53 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 20:29:20 -0400
Message-ID: <20220811002920.32207-7-vitaly.prosyak@amd.com>
In-Reply-To: <20220811002920.32207-1-vitaly.prosyak@amd.com>
References: <20220811002920.32207-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 7/7] tests/amdgpu: add deadlock tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Added following sub tests:
 - dispatch_hang_slow_compute
 - dispatch_hang_slow_gfx
 - draw_hang_slow_gfx

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 83 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build    |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 tests/amdgpu/amd_deadlock.c

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
new file mode 100644
index 000000000..f1e1b1c29
--- /dev/null
+++ b/tests/amdgpu/amd_deadlock.c
@@ -0,0 +1,83 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ * Based on libdrm/tests/amdgpu/deadlock_tests.c
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_draw.h"
+#include "lib/amdgpu/amd_dispatch.h"
+
+static void
+amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle)
+{
+	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX);
+}
+
+static void
+amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
+{
+	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
+}
+
+igt_main
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	int fd = -1;
+	int r;
+
+	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks( major, minor,  &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+	}
+
+	igt_subtest("dispatch_hang_slow_compute")
+	amdgpu_dispatch_hang_slow_compute(device);
+
+	igt_subtest("dispatch_hang_slow_gfx")
+	amdgpu_dispatch_hang_slow_gfx(device);
+
+	igt_subtest("amdgpu_draw_hang_slow_gfx")
+	amdgpu_draw_hang_slow_gfx(device);
+
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		close(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 12c2ba99d..36b83ab1c 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -6,6 +6,7 @@ if libdrm_amdgpu.found()
 			  'amd_assr',
 			  'amd_basic',
 			  'amd_bypass',
+			  'amd_deadlock',
 			  'amd_color',
 			  'amd_cs_nop',
 			  'amd_hotplug',
-- 
2.25.1
