Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20620.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::620])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9535810E25A
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 05:53:02 +0000 (UTC)
From: Jasber Chen <yipeng.chen@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 20 Jun 2023 13:52:40 +0800
Message-ID: <20230620055240.1599974-1-yipeng.chen@amd.com>
In-Reply-To: <20230619025836.1514883-1-yipeng.chen@amd.com>
References: <20230619025836.1514883-1-yipeng.chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] tests/amdgpu: skips query-timestamp-while-idle test on
 raven/raven2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jasber Chen <yipeng.chen@amd.com>,
 Jasber Chen <yipeng.chen@amd.corp-partner.google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jasber Chen <yipeng.chen@amd.corp-partner.google.com>

tests/amdgpu: skips query-timestamp-while-idle test on raven/raven2.
Querying GPU clocks can not work as expected when GPU is idling.

Signed-off-by: Jasber Chen <yipeng.chen@amd.com>
Reviewed by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_info.c | 47 ++++++++++++++++++-----------------------
 1 file changed, 20 insertions(+), 27 deletions(-)

diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index d6aea827..9c063429 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -1,24 +1,8 @@
 /*
+ * SPDX-License-Identifier: MIT
+ * Copyright 2023 Advanced Micro Devices, Inc.
  * Copyright 2014 Advanced Micro Devices, Inc.
  * Copyright 2021 Valve Corporation
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
  */
 
 #include "config.h"
@@ -27,10 +11,10 @@
 
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
+#include "lib/amdgpu/amdgpu_asic_addr.h"
 
-static amdgpu_device_handle dev;
 
-static void query_firmware_version_test(void)
+static void query_firmware_version_test(amdgpu_device_handle dev)
 {
 	struct amdgpu_gpu_info gpu_info = {};
 	uint32_t version, feature;
@@ -43,7 +27,7 @@ static void query_firmware_version_test(void)
 		     "Failed to query the firmware version\n");
 }
 
-static void query_timestamp_test(uint32_t sleep_time, int sample_count)
+static void query_timestamp_test(amdgpu_device_handle dev, uint32_t sleep_time, int sample_count)
 {
 	struct amdgpu_gpu_info gpu_info = {};
 	double median, std_err, err_95_conf;
@@ -123,7 +107,10 @@ IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
 		     "DRM_AMDGPU_INFO IOCTL");
 igt_main
 {
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
 	int fd = -1;
+	int r = -1;
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -131,29 +118,35 @@ igt_main
 
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
-		err = amdgpu_device_initialize(fd, &major, &minor, &dev);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
 	}
 
 	igt_describe("Make sure we can retrieve the firmware version");
 	igt_subtest("query-firmware-version")
-		query_firmware_version_test();
+		query_firmware_version_test(device);
 
 	igt_describe("Check that the GPU time ticks constantly, and at the "
 		     "same rate as the CPU");
 	igt_subtest("query-timestamp")
-		query_timestamp_test(10000, 100);
+		query_timestamp_test(device, 10000, 100);
 
 	igt_describe("Check that the GPU time keeps on ticking, even during "
 		     "long idle times which could lead to clock/power gating");
-	igt_subtest("query-timestamp-while-idle")
-		query_timestamp_test(7000000, 1);
+	igt_subtest("query-timestamp-while-idle") {
+		igt_skip_on(ASICREV_IS_RAVEN(gpu_info.chip_external_rev) ||
+			    ASICREV_IS_RAVEN2(gpu_info.chip_external_rev));
+		query_timestamp_test(device, 7000000, 1);
+	}
 
 	igt_fixture {
-		amdgpu_device_deinitialize(dev);
+		amdgpu_device_deinitialize(device);
 		close(fd);
 	}
 }
-- 
2.39.2
