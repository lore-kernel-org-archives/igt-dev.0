Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF8B10E735
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 03:01:07 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 17 Oct 2022 23:00:51 -0400
Message-ID: <20221018030055.73636-3-vitaly.prosyak@amd.com>
In-Reply-To: <20221018030055.73636-1-vitaly.prosyak@amd.com>
References: <20221018030055.73636-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/7] tests/amdgpu: add deadlock test for gfx,
 compute and sdma
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: pierre-eric.pelloux-prayer@amd.com, marek.olsak@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index e1b508fcf..c7e8e05e9 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -26,7 +26,21 @@
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_dispatch.h"
+#include "lib/amdgpu/amd_deadlock_helpers.h"
+
+static bool with_thread = true;
+
+static void
+amdgpu_deadlock_gfx(amdgpu_device_handle device_handle)
+{
+	amdgpu_deadlock_helper(device_handle, AMDGPU_HW_IP_GFX, with_thread);
+}
 
+static void
+amdgpu_deadlock_compute(amdgpu_device_handle device_handle)
+{
+	amdgpu_deadlock_helper(device_handle, AMDGPU_HW_IP_COMPUTE, with_thread);
+}
 static void
 amdgpu_dispatch_hang_slow_gfx(amdgpu_device_handle device_handle)
 {
@@ -65,6 +79,15 @@ igt_main
 
 	}
 
+	igt_subtest("amdgpu_deadlock_gfx")
+	amdgpu_deadlock_gfx(device);
+
+	igt_subtest("amdgpu_deadlock_sdma")
+	amdgpu_deadlock_sdma(device, with_thread);
+
+	igt_subtest("amdgpu_deadlock_compute")
+	amdgpu_deadlock_compute(device);
+
 	igt_subtest("dispatch_hang_slow_compute")
 	amdgpu_dispatch_hang_slow_compute(device);
 
-- 
2.25.1
