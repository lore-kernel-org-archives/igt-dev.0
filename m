Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::61a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 102F810E056
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 19:01:04 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 4 Jul 2023 15:00:53 -0400
Message-ID: <20230704190053.81697-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2] tests/amdgpu: skips
 query-timestamp-while-idle test on raven/raven2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: yipeng.chen@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The RLC counter used for GPU clocks can not keep counting in auto level dpm.
Skips testing GPU clocks on raven/raven2 while GPU is idling, since result
may not be as expected.

v2
  - Add separate function time_stamp_test_enable.
  - Using EXPERIMENTAL --fix-inplace option for checkpatch.pl to fix the
    WARNING: quoted string split across lines. It works.

Signed-off-by: Jasber Chen <yipeng.chen@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_info.c | 89 +++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 43 deletions(-)

diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index c1137ab4d..53706003f 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -1,24 +1,7 @@
+// SPDX-License-Identifier: MIT
 /*
- * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2023 Advanced Micro Devices, Inc.
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
@@ -28,9 +11,11 @@
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 
-static amdgpu_device_handle dev;
+#include "lib/amdgpu/amdgpu_asic_addr.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
 
-static void query_firmware_version_test(void)
+static void
+query_firmware_version_test(amdgpu_device_handle dev)
 {
 	struct amdgpu_gpu_info gpu_info = {};
 	uint32_t version, feature;
@@ -43,7 +28,8 @@ static void query_firmware_version_test(void)
 		     "Failed to query the firmware version\n");
 }
 
-static void query_timestamp_test(uint32_t sleep_time, int sample_count)
+static void
+query_timestamp_test(amdgpu_device_handle dev, uint32_t sleep_time, int sample_count)
 {
 	struct amdgpu_gpu_info gpu_info = {};
 	double median, std_err, err_95_conf;
@@ -87,9 +73,8 @@ static void query_timestamp_test(uint32_t sleep_time, int sample_count)
 
 		/* make sure the GPU timestamps are ordered */
 		igt_assert_f(gpu_delta > 0,
-			     "The GPU time is not moving or is ticking in the "
-			     "wrong direction (start=%lu, end=%lu, "
-			     "end-start=%lu)\n", ts_start, ts_end, gpu_delta);
+			     "The GPU time is not moving or is ticking in the wrong direction (start=%lu, end=%lu, end-start=%lu)\n",
+			     ts_start, ts_end, gpu_delta);
 
 		igt_stats_push_float(&stats, corrected_gpu_delta / cpu_delta);
 	}
@@ -100,12 +85,10 @@ static void query_timestamp_test(uint32_t sleep_time, int sample_count)
 	err_95_conf = std_err * 1.96;
 
 	/* check that the median ticking rate is ~1.0, meaning that the
-	 * the GPU and CPU timestamps grow at the same rate
+	 * GPU and CPU timestamps grow at the same rate
 	 */
 	igt_assert_f(median > 0.99 && median < 1.01,
-		     "The GPU time elapses at %.2f%% (+/- %.2f%% at 95%% "
-		     "confidence) of the CPU's speed\ngpu_counter_freq=%u kHz, "
-		     "should be %.0f kHz (+/- %.1f kHz at 95%% confidence)\n",
+		     "The GPU time elapses at %.2f%% (+/- %.2f%% at 95%% confidence) of the CPU's speed\ngpu_counter_freq=%u kHz, should be %.0f kHz (+/- %.1f kHz at 95%% confidence)\n",
 		     median * 100.0, err_95_conf * 100.0,
 		     gpu_info.gpu_counter_freq,
 		     gpu_info.gpu_counter_freq * median,
@@ -113,17 +96,33 @@ static void query_timestamp_test(uint32_t sleep_time, int sample_count)
 
 	/* check the jitter in the ticking rate */
 	igt_assert_f(err_95_conf < 0.01,
-		     "The GPU time ticks with a jitter greater than 1%%, at "
-		     "95%% confidence (+/- %.3f%%)\n", err_95_conf * 100.0);
+		     "The GPU time ticks with a jitter greater than 1%%, at 95%% confidence (+/- %.3f%%)\n",
+		     err_95_conf * 100.0);
 
 	igt_stats_fini(&stats);
 }
 
-IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
-		     "DRM_AMDGPU_INFO IOCTL");
+IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the DRM_AMDGPU_INFO IOCTL");
+
+static bool
+time_stamp_test_enable(struct amdgpu_gpu_info *gpu_info)
+{
+	/* except rv/rv2 see */
+	/* https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23481 */
+	if (gpu_info->family_id == FAMILY_RV &&
+		(ASICREV_IS_RAVEN(gpu_info->chip_external_rev) ||
+		ASICREV_IS_RAVEN2(gpu_info->chip_external_rev))) {
+		return false;
+	}
+	return true;
+}
+
 igt_main
 {
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {};
 	int fd = -1;
+	int r = -1;
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -131,29 +130,33 @@ igt_main
 
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
-		err = amdgpu_device_initialize(fd, &major, &minor, &dev);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
 		igt_require(err == 0);
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		igt_skip_on(!time_stamp_test_enable(&gpu_info));
+
 	}
 
 	igt_describe("Make sure we can retrieve the firmware version");
 	igt_subtest("query-firmware-version")
-		query_firmware_version_test();
+		query_firmware_version_test(device);
 
-	igt_describe("Check that the GPU time ticks constantly, and at the "
-		     "same rate as the CPU");
+	igt_describe("Check that the GPU time ticks constantly, and at the same rate as the CPU");
 	igt_subtest("query-timestamp")
-		query_timestamp_test(10000, 100);
+		query_timestamp_test(device, 10000, 100);
 
-	igt_describe("Check that the GPU time keeps on ticking, even during "
-		     "long idle times which could lead to clock/power gating");
-	igt_subtest("query-timestamp-while-idle")
-		query_timestamp_test(7000000, 1);
+	igt_describe("Check that the GPU time keeps on ticking, even during long idle times which could lead to clock/power gating");
+	igt_subtest("query-timestamp-while-idle") {
+		query_timestamp_test(device, 7000000, 1);
+	}
 
 	igt_fixture {
-		amdgpu_device_deinitialize(dev);
+		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
 	}
 }
-- 
2.25.1
