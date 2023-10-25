Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3025A10E614
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Oct 2023 09:25:04 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 25 Oct 2023 17:24:32 +0800
Message-ID: <20231025092432.726460-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amd_dispatch: add dispatch test for gfx and
 compute
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Huang <tim.huang@amd.com>, Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add dispatch test on gfx and compute ring.
Through  memset shader and memcpy shader,
and validate the result.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Tim Huang <tim.huang@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_dispatch.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 323284306..d62dc7a3d 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -36,6 +36,16 @@ amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
 	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
 }
 
+static void
+amdgpu_gfx_dispatch_test_gfx(amdgpu_device_handle device_handle) {
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
+}
+
+static void
+amdgpu_gfx_dispatch_test_compute(amdgpu_device_handle device_handle) {
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
+}
+
 static void
 amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
 {
@@ -97,6 +107,23 @@ igt_main
 		asic_rings_readness(device, 1, arr_cap);
 
 	}
+
+	igt_describe("Check-dispatch-test-gfx-for-each-ring-using-memset-memcpy-shaders-and-validate-after");
+	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("amdgpu-dispatch-test-gfx")
+			amdgpu_gfx_dispatch_test_gfx(device);
+		}
+	}
+
+	igt_describe("Check-dispatch-test-compute-for-each-ring-using-memset-memcpy-shaders-and-validate-after");
+	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-test-compute")
+			amdgpu_gfx_dispatch_test_compute(device);
+		}
+	}
+
 	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
-- 
2.25.1
