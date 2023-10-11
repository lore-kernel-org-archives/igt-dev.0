Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4536710E410
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 01:25:24 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 11 Oct 2023 09:25:17 +0800
Message-ID: <20231011012517.1861841-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/amd_dispatch: add negative test
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

Dispatch a bad program on gfx/compute ring.
Check wether they will hang.
Expose the additional parameter 'hung' to the upper layer.
Dispatch existent a binary shader that waits for the register to be changed,
but it does not occur and as a result, we have GPU reset and check this.

V3:
  -add detail description and fix code style(Kamil)
  -Improve test description(Vitaly)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse zhang <jesse.zhang@amd.com>
Reviewed-by : Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_dispatch.c   |  4 ++--
 lib/amdgpu/amd_dispatch.h   |  2 +-
 tests/amdgpu/amd_dispatch.c | 38 ++++++++++++++++++++++++++++++++-----
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 9de3986ba..040381a11 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -524,7 +524,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 }
 
-void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type)
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, int hang)
 {
 	int r;
 	struct drm_amdgpu_info_hw_ip info;
@@ -547,7 +547,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
 					    version);
 		amdgpu_memcpy_dispatch_test(device_handle, ip_type, ring_id,
-					    version, 0);
+					    version, hang);
 	}
 }
 
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index c500b5b3f..4df8b1355 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -27,7 +27,7 @@
 #include <amdgpu.h>
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
-			      uint32_t ip_type);
+			      uint32_t ip_type, int hang);
 
 void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					uint32_t ip_type,
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 769f26cd0..323284306 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -24,6 +24,18 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
 	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
 }
 
+static void
+amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
+{
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 1);
+}
+
+static void
+amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
+{
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
+}
+
 static void
 amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
 {
@@ -54,8 +66,8 @@ amdgpu_gpu_reset_test(amdgpu_device_handle device_handle, int drm_amdgpu)
 	r = amdgpu_cs_ctx_free(context_handle);
 	igt_assert_eq(r, 0);
 
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX, 0);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 0);
 }
 
 igt_main
@@ -85,7 +97,7 @@ igt_main
 		asic_rings_readness(device, 1, arr_cap);
 
 	}
-	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-compute-ring");
+	igt_describe("Test GPU reset using a binary shader to slow hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-test-compute")
@@ -93,7 +105,7 @@ igt_main
 		}
 	}
 
-	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-gfx-ring");
+	igt_describe("Test GPU reset using a binary shader to slow hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
 		if (arr_cap[AMD_IP_GFX]) {
 			igt_dynamic_f("amdgpu-dispatch-test-gfx")
@@ -101,7 +113,23 @@ igt_main
 		}
 	}
 
-	igt_describe("Test-GPU-reset-using-amdgpu-debugfs-to-hang-the-job-on-gfx-ring");
+	igt_describe("Test GPU reset using a binary shader to hang the job on gfx ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
+			amdgpu_dispatch_hang_gfx(device);
+		}
+	}
+
+	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
+			amdgpu_dispatch_hang_compute(device);
+		}
+	}
+
+	igt_describe("Test GPU reset using amdgpu debugfs to hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-reset-test-gfx-with-IP-GFX-and-COMPUTE") {
 		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-reset-gfx-compute")
-- 
2.25.1
