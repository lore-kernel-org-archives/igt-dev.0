Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14B110E0FC
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jun 2023 02:20:49 +0000 (UTC)
From: Jasber Chen <yipeng.chen@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 20 Jun 2023 10:20:28 +0800
Message-ID: <20230620022028.1533754-1-yipeng.chen@amd.com>
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

tests/amdgpu: skips query-timestamp-while-idle test on raven/raven2.
Querying GPU clocks can not work as expected when GPU is idling.

Signed-off-by: Jasber Chen <yipeng.chen@amd.com>
---
 tests/amdgpu/amd_info.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_info.c b/tests/amdgpu/amd_info.c
index d6aea827..8e14e511 100644
--- a/tests/amdgpu/amd_info.c
+++ b/tests/amdgpu/amd_info.c
@@ -27,6 +27,7 @@
 
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
+#include "lib/amdgpu/amdgpu_asic_addr.h"
 
 static amdgpu_device_handle dev;
 
@@ -124,6 +125,8 @@ IGT_TEST_DESCRIPTION("Test the consistency of the data provided through the "
 igt_main
 {
 	int fd = -1;
+	int r = -1;
+	struct amdgpu_gpu_info gpu_info = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -136,6 +139,9 @@ igt_main
 
 		igt_info("Initialized amdgpu, driver version %d.%d\n",
 			 major, minor);
+
+		r = amdgpu_query_gpu_info(dev, &gpu_info);
+		igt_assert_eq(r, 0);
 	}
 
 	igt_describe("Make sure we can retrieve the firmware version");
@@ -149,8 +155,12 @@ igt_main
 
 	igt_describe("Check that the GPU time keeps on ticking, even during "
 		     "long idle times which could lead to clock/power gating");
-	igt_subtest("query-timestamp-while-idle")
+	igt_subtest("query-timestamp-while-idle") {
+		igt_skip_on(ASICREV_IS_RAVEN(gpu_info.chip_external_rev) ||
+			    ASICREV_IS_RAVEN2(gpu_info.chip_external_rev));
 		query_timestamp_test(7000000, 1);
+	}
 
 	igt_fixture {
 		amdgpu_device_deinitialize(dev);
-- 
2.39.2
