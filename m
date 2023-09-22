Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B50B10E725
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 23:42:13 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Sep 2023 19:42:03 -0400
Message-ID: <20230922234204.9782-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 1/2] tests/amdgpu: split deadlock tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Split GPU reset (known as deadlock) tests into
command-based (deadlock) and the other using binary shaders
(dispatch).The one of primary reasons for splitting is to use
new functions like 'amdgpu_cs_query_reset_state2' in next commits.
No functional change.
Some code formatting  improvements to meet IGT guidelines.
Added igt_describe for GPU reset tests known now as deadlock and
dispatch based tests.

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 60 +++++++++---------------------------
 tests/amdgpu/amd_dispatch.c | 61 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build    |  1 +
 3 files changed, 76 insertions(+), 46 deletions(-)
 create mode 100644 tests/amdgpu/amd_dispatch.c

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index d805b8d18..0a81f3717 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -1,45 +1,14 @@
-/* SPDX-License-Identifier: MIT
+// SPDX-License-Identifier: MIT
+/*
  * Copyright 2014 Advanced Micro Devices, Inc.
  * Copyright 2022 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Based on libdrm/tests/amdgpu/deadlock_tests.c
+ * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
-#include "lib/amdgpu/amd_dispatch.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
 
-static void
-amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle)
-{
-	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_GFX);
-}
-
-static void
-amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
-{
-	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
-}
-
 static void
 amdgpu_deadlock_gfx(amdgpu_device_handle device_handle)
 {
@@ -91,31 +60,30 @@ igt_main
 
 		r = amdgpu_query_gpu_info(device, &gpu_info);
 		igt_assert_eq(r, 0);
-		r = setup_amdgpu_ip_blocks( major, minor,  &gpu_info, device);
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
 
 	}
-	igt_subtest("amdgpu_deadlock_sdma")
+	igt_describe("Test-GPU-reset-by-flooding-sdma-ring-with-jobs");
+	igt_subtest("amdgpu-deadlock-sdma")
 	amdgpu_deadlock_sdma(device);
 
-	igt_subtest("amdgpu_gfx_illegal_reg_access")
+	igt_describe("Test-GPU-reset-by-access-gfx-illegal-reg");
+	igt_subtest("amdgpu-gfx-illegal-reg-access")
 	amdgpu_gfx_illegal_reg_access(device);
 
-	igt_subtest("amdgpu_gfx_illegal_mem_access")
+	igt_describe("Test-GPU-reset-by-access-gfx-illegal-mem-addr");
+	igt_subtest("amdgpu-gfx-illegal-mem-access")
 	amdgpu_gfx_illegal_mem_access(device);
 
-	igt_subtest("amdgpu_deadlock_gfx")
+	igt_describe("Test-GPU-reset-by-flooding-gfx-ring-with-jobs");
+	igt_subtest("amdgpu-deadlock-gfx")
 	amdgpu_deadlock_gfx(device);
 
-	igt_subtest("amdgpu_deadlock_compute")
+	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
+	igt_subtest("amdgpu-deadlock-compute")
 	amdgpu_deadlock_compute(device);
 
-	igt_subtest("dispatch_hang_slow_compute")
-	amdgpu_dispatch_hang_slow_compute(device);
-
-	igt_subtest("dispatch_hang_slow_gfx")
-	amdgpu_dispatch_hang_slow_gfx(device);
-
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
new file mode 100644
index 000000000..f87acbcae
--- /dev/null
+++ b/tests/amdgpu/amd_dispatch.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ */
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_command_submission.h"
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
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+	}
+	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-compute-ring");
+	igt_subtest("dispatch-hang-slow-compute")
+	amdgpu_dispatch_hang_slow_compute(device);
+
+	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-gfx-ring");
+	igt_subtest("dispatch-hang-slow-gfx")
+	amdgpu_dispatch_hang_slow_gfx(device);
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index ebf52bf38..37e09b5fb 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -11,6 +11,7 @@ if libdrm_amdgpu.found()
 			  'amd_cp_dma_misc',
 			  'amd_cs_nop',
 			  'amd_deadlock',
+			  'amd_dispatch',
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
 			  'amd_hotplug',
-- 
2.25.1
