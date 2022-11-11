Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2047.outbound.protection.outlook.com [40.107.94.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271F210E1C3
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 21:52:49 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Nov 2022 16:52:09 -0500
Message-ID: <20221111215213.48679-5-vitaly.prosyak@amd.com>
In-Reply-To: <20221111215213.48679-1-vitaly.prosyak@amd.com>
References: <20221111215213.48679-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 5/9] tests/amdgpu: add GPU reset tests for gfx,
 compute and sdma.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pierre-eric
 Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>, marek.olsak@amd.com,
 christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Use the shared amdgpu_wait_memory_helper.
The GPU reset is occurred due to the wait for the register
in memory to be changed is not executed on time.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Pierre-eric Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 109aaac18..d4de20114 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -26,6 +26,7 @@
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_dispatch.h"
+#include "lib/amdgpu/amd_deadlock_helpers.h"
 
 static void
 amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle)
@@ -39,6 +40,24 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
 	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
 }
 
+static void
+amdgpu_deadlock_gfx(amdgpu_device_handle device_handle)
+{
+	amdgpu_wait_memory_helper(device_handle, AMDGPU_HW_IP_GFX);
+}
+
+static void
+amdgpu_deadlock_compute(amdgpu_device_handle device_handle)
+{
+	amdgpu_wait_memory_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
+}
+
+static void
+amdgpu_deadlock_sdma(amdgpu_device_handle device_handle)
+{
+	amdgpu_wait_memory_helper(device_handle, AMDGPU_HW_IP_DMA);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -64,6 +83,14 @@ igt_main
 		igt_assert_eq(r, 0);
 
 	}
+	igt_subtest("amdgpu_deadlock_sdma")
+	amdgpu_deadlock_sdma(device);
+
+	igt_subtest("amdgpu_deadlock_gfx")
+	amdgpu_deadlock_gfx(device);
+
+	igt_subtest("amdgpu_deadlock_compute")
+	amdgpu_deadlock_compute(device);
 
 	igt_subtest("dispatch_hang_slow_compute")
 	amdgpu_dispatch_hang_slow_compute(device);
-- 
2.25.1
