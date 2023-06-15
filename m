Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F80B10E10F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 03:42:19 +0000 (UTC)
From: Jasber Chen <yipeng.chen@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 15 Jun 2023 11:41:43 +0800
Message-ID: <20230615034143.1319444-1-yipeng.chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] From: Jasber Chen <yipeng.chen@amd.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jasber Chen <yipeng.chen@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

tests/amdgpu skips query-timestamp-while-idle test on raven/raven2 asic.
Querying GPU clocks can not work as expected when GPU is idling.

Change-Id: If2c6e9e358ce826a5e5d5f909819285b6ada821e
Signed-off-by: Jasber Chen <yipeng.chen@amd.com>
---
 tests/amdgpu/amd_info.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index d6aea827..644c370f 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -28,6 +28,8 @@
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 
+#include "lib/amdgpu/amdgpu_asic_addr.h"
+
 static amdgpu_device_handle dev;
 
 static void query_firmware_version_test(void)
@@ -121,9 +123,12 @@ static void query_timestamp_test(uint32_t sleep_time, int sample_count)
 
 IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
 		     "DRM_AMDGPU_INFO IOCTL");
+
 igt_main
 {
 	int fd = -1;
+	int r = -1;
+	struct amdgpu_gpu_info gpu_info = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -136,6 +141,9 @@ igt_main
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+
+		r = amdgpu_query_gpu_info(dev, &gpu_info);
+		igt_assert_eq(r, 0);
 	}
 
 	igt_describe("Make sure we can retrieve the firmware version");
@@ -150,7 +158,13 @@ igt_main
 	igt_describe("Check that the GPU time keeps on ticking, even during "
 		     "long idle times which could lead to clock/power gating");
 	igt_subtest("query-timestamp-while-idle")
+	/* Skip query-timestamp-while-idle test on Raven / Raven2 */
+	/* GPU clocks may not work as expected when GPU is idling */
+	if(!ASICREV_IS_RAVEN(gpu_info.chip_external_rev) &&
+	   !ASICREV_IS_RAVEN2(gpu_info.chip_external_rev) )
+	{
 		query_timestamp_test(7000000, 1);
+	}
 
 	igt_fixture {
 		amdgpu_device_deinitialize(dev);
-- 
2.25.1
