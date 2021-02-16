Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from aibo.runbox.com (aibo.runbox.com [91.220.196.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BD36E952
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Feb 2021 13:16:13 +0000 (UTC)
From: Martin Peres <martin.peres@mupuf.org>
Date: Tue, 16 Feb 2021 14:32:35 +0200
Message-Id: <20210216123236.693768-1-martin.peres@mupuf.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] amdgpu/basic: move
 amdgpu_query_info_test to its own file
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
List-ID: <igt-dev@lists.freedesktop.org>

This will soon be followed by more amd_query_info tests, and the basic
file is already big-enough.

Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Signed-off-by: Martin Peres <martin.peres@mupuf.org>
---
 tests/amdgpu/amd_basic.c | 17 ----------
 tests/amdgpu/amd_info.c  | 71 ++++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |  1 +
 3 files changed, 72 insertions(+), 17 deletions(-)
 create mode 100644 tests/amdgpu/amd_info.c

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index bf626ece..6c9609b9 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -176,20 +176,6 @@ static void amdgpu_command_submission_copy_linear_helper(unsigned ip_type);
 #              define PACKET3_DMA_DATA_CMD_DAIC    (1 << 29)
 #              define PACKET3_DMA_DATA_CMD_RAW_WAIT  (1 << 30)
 
-static void amdgpu_query_info_test(void)
-{
-	struct amdgpu_gpu_info gpu_info = {};
-	uint32_t version, feature;
-	int r;
-
-	r = amdgpu_query_gpu_info(device, &gpu_info);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_query_firmware_version(device, AMDGPU_INFO_FW_VCE, 0,
-					  0, &version, &feature);
-	igt_assert_eq(r, 0);
-}
-
 static amdgpu_bo_handle gpu_mem_alloc(amdgpu_device_handle device_handle,
 				      uint64_t size,
 				      uint64_t alignment,
@@ -1397,9 +1383,6 @@ igt_main
 			 major, minor);
 	}
 
-	igt_subtest("query-info")
-		amdgpu_query_info_test();
-
 	igt_subtest("memory-alloc")
 		amdgpu_memory_alloc();
 
diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
new file mode 100644
index 00000000..fe113e14
--- /dev/null
+++ b/tests/amdgpu/amd_info.c
@@ -0,0 +1,71 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2021 Valve Corporation
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
+ */
+
+#include "config.h"
+
+#include "igt.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+static amdgpu_device_handle dev;
+
+static void query_firmware_version_test(void)
+{
+	struct amdgpu_gpu_info gpu_info = {};
+	uint32_t version, feature;
+	int r;
+
+	r = amdgpu_query_gpu_info(dev, &gpu_info);
+	igt_assert_eq(r, 0);
+
+	r = amdgpu_query_firmware_version(dev, AMDGPU_INFO_FW_VCE, 0, 0,
+					  &version, &feature);
+	igt_assert_eq(r, 0);
+}
+
+igt_main
+{
+	int fd = -1;
+
+	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &dev);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+	}
+
+	igt_subtest("query-firmware-version")
+		query_firmware_version_test();
+
+	igt_fixture {
+		amdgpu_device_deinitialize(dev);
+		close(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index b7982291..b92aa22b 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -7,6 +7,7 @@ if libdrm_amdgpu.found()
 			  'amd_bypass',
 			  'amd_color',
 			  'amd_cs_nop',
+			  'amd_info',
 			  'amd_prime',
 			]
 	amdgpu_deps += libdrm_amdgpu
-- 
2.30.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
