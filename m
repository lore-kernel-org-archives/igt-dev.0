Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2EA10E724
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Sep 2023 23:42:13 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Sep 2023 19:42:04 -0400
Message-ID: <20230922234204.9782-2-vitaly.prosyak@amd.com>
In-Reply-To: <20230922234204.9782-1-vitaly.prosyak@amd.com>
References: <20230922234204.9782-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/2] tests/amdgpu: add GFX11 to dispatch tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add GFX11 to dispatch tests known as GPU reset
with binary shaders.
Improve GPU reset tests by validating flags, if no reset
or reset is still in progress then avoid asserting the
status.
Use the amdgpu_cs_query_reset_state2 which  is available
on drmlib > 2.4.99.
Remove dispatch tests from basic tests due to duplicate.

 v2:
     - restricted build for dispatch tests due to build failure
       for drmlib < 2.4.99 (Kamil)
     - spelling correction and formatting issues (Kamil)
     - improve comment (Luben)

Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |  2 +
 lib/amdgpu/amd_dispatch.c     | 82 +++++++++++++++++------------------
 tests/amdgpu/amd_basic.c      | 28 ------------
 tests/amdgpu/amd_dispatch.c   | 18 ++++++--
 tests/amdgpu/meson.build      |  6 ++-
 5 files changed, 60 insertions(+), 76 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 0cbd1540a..323137f42 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -225,6 +225,8 @@ union drm_amdgpu_bo_list {
 /* indicate some errors are detected by RAS */
 #define AMDGPU_CTX_QUERY2_FLAGS_RAS_CE   (1<<3)
 #define AMDGPU_CTX_QUERY2_FLAGS_RAS_UE   (1<<4)
+/* indicate that the reset hasn't completed yet */
+#define AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS (1<<5)
 
 /* Context priority level */
 #define AMDGPU_CTX_PRIORITY_UNSET       -2048
diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index f17240f5c..9de3986ba 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -1,27 +1,8 @@
-/* SPDX-License-Identifier: MIT
- * Copyright 2014 Advanced Micro Devices, Inc.
- * Copyright 2022 Advanced Micro Devices, Inc.
- *  *
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
- *
- */
+// SPDX-License-Identifier: MIT
+// Copyright 2014 Advanced Micro Devices, Inc.
+// Copyright 2022 Advanced Micro Devices, Inc.
+// Copyright 2023 Advanced Micro Devices, Inc.
+
 #include <amdgpu.h>
 #include "amd_memory.h"
 #include "amd_dispatch.h"
@@ -48,12 +29,13 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	int bo_shader_size = 4096;
 	int bo_cmd_size = 4096;
 	struct amdgpu_cs_request ibs_request = {0};
-	struct amdgpu_cs_ib_info ib_info= {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
+
 	amdgpu_bo_list_handle bo_list;
 	struct amdgpu_cs_fence fence_status = {0};
 	uint32_t expired;
 
-	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
 	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
 	igt_assert_eq(r, 0);
@@ -103,6 +85,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x74fac);
 	else if (version == 10)
 		base_cmd->emit(base_cmd, 0x1104bfac);
+	else if (version == 11)
+		base_cmd->emit(base_cmd, 0x1003dfac);
 
 	/* Sets a range of pixel shader constants */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
@@ -119,7 +103,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, 0);
 
 	/* dispatch direct command */
-	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,3));
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
 	base_cmd->emit(base_cmd, 0x10);
 	base_cmd->emit(base_cmd, 1);
 	base_cmd->emit(base_cmd, 1);
@@ -163,9 +147,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 
 	/* verify if memset test result meets with expected */
 	i = 0;
-	while(i < bo_dst_size) {
+	while (i < bo_dst_size)
 		igt_assert_eq(ptr_dst[i++], 0x22);
-	}
 
 	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
@@ -192,12 +175,12 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	int bo_shader_size = 4096;
 	int bo_cmd_size = 4096;
 	struct amdgpu_cs_request ibs_request = {0};
-	struct amdgpu_cs_ib_info ib_info= {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
 	uint32_t expired, hang_state, hangs;
 	enum cs_type cs_type;
 	amdgpu_bo_list_handle bo_list;
 	struct amdgpu_cs_fence fence_status = {0};
-	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
 	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
 	igt_assert_eq(r, 0);
@@ -251,11 +234,11 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 
 	base_cmd->emit(base_cmd, 0x400);
 	if (version == 9)
-		base_cmd->emit(base_cmd,0x74fac);
+		base_cmd->emit(base_cmd, 0x74fac);
 	else if (version == 10)
-		base_cmd->emit(base_cmd,0x1104bfac);
+		base_cmd->emit(base_cmd, 0x1104bfac);
 	else if (version == 11)
-		base_cmd->emit(base_cmd,0x1003dfac);
+		base_cmd->emit(base_cmd, 0x1003dfac);
 
 	/* Writes the UAV constant data to the SGPRs. */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
@@ -276,7 +259,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	base_cmd->emit(base_cmd, 0);
 
 	/* dispatch direct command */
-	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT,3));
+	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PACKET3_DISPATCH_DIRECT, 3));
 	base_cmd->emit(base_cmd, 0x10);
 	base_cmd->emit(base_cmd, 1);
 	base_cmd->emit(base_cmd, 1);
@@ -321,7 +304,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 		/* verify if memcpy test result meets with expected */
 		i = 0;
 		/*it works up to 12287 ? vs required 16384 for gfx 8*/
-		while(i < bo_dst_size) {
+		while (i < bo_dst_size) {
 			igt_assert_eq(ptr_dst[i], ptr_src[i]);
 			i++;
 		}
@@ -351,22 +334,22 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	void *ptr_shader;
 	unsigned char *ptr_src;
 	uint32_t *ptr_cmd;
-	uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_address_cmd;
+	uint64_t mc_address_src, mc_address_dst, mc_address_shader, mc_address_cmd, reset_flags;
 	amdgpu_va_handle va_src, va_dst, va_shader, va_cmd;
-	int r;
+	int r, r2;
 
 	int bo_dst_size = 0x4000000;
 	int bo_shader_size = 0x400000;
 	int bo_cmd_size = 4096;
 
 	struct amdgpu_cs_request ibs_request = {0};
-	struct amdgpu_cs_ib_info ib_info= {0};
+	struct amdgpu_cs_ib_info ib_info = {0};
 	uint32_t hang_state, hangs, expired;
 	struct amdgpu_gpu_info gpu_info = {0};
 	amdgpu_bo_list_handle bo_list;
 	struct amdgpu_cs_fence fence_status = {0};
 
-	struct amdgpu_cmd_base * base_cmd = get_cmd_base();
+	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
 
 	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
 	igt_assert_eq(r, 0);
@@ -404,7 +387,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 
 	memset(ptr_src, 0x55, bo_dst_size);
 
-	amdgpu_dispatch_init(ip_type, base_cmd, version );
+	amdgpu_dispatch_init(ip_type, base_cmd, version);
 
 
 
@@ -425,6 +408,8 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 		base_cmd->emit(base_cmd, 0x74fac);
 	else if (version == 10)
 		base_cmd->emit(base_cmd, 0x1104bfac);
+	else if (version == 11)
+		base_cmd->emit(base_cmd, 0x1003dfac);
 
 
 	/* Writes the UAV constant data to the SGPRs. */
@@ -485,7 +470,18 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 
 	r = amdgpu_cs_query_reset_state(context_handle, &hang_state, &hangs);
 	igt_assert_eq(r, 0);
-	igt_assert_eq(hang_state, gpu_reset_status_equel);
+	r2 = amdgpu_cs_query_reset_state2(context_handle, &reset_flags);
+	igt_assert_eq(r2, 0);
+
+	if (!(reset_flags == 0 ||
+		  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
+
+		/* If we're in reset and reset hasn't occurred, then check
+		 * that the hang state is equal to the GPU reset status and
+		 * assert otherwise.
+		 */
+		igt_assert_eq(hang_state, gpu_reset_status_equel);
+	}
 
 	r = amdgpu_bo_list_destroy(bo_list);
 	igt_assert_eq(r, 0);
@@ -513,7 +509,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
 	version = info.hw_ip_version_major;
-	if (version != 9 && version != 10 /*&& version != 11*/) {
+	if (version != 9 && version != 10 && version != 11) {
 		igt_info("SKIP ... unsupported gfx version %d\n", version);
 		return;
 	}
diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 24c70a9f7..88fdbd980 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -612,18 +612,6 @@ amdgpu_sync_dependency_test(amdgpu_device_handle device_handle)
 	free_cmd_base(base);
 }
 
-static void
-amdgpu_gfx_dispatch_test_gfx(amdgpu_device_handle device_handle)
-{
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_GFX);
-}
-
-static void
-amdgpu_gfx_dispatch_test_compute(amdgpu_device_handle device_handle)
-{
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE);
-}
-
 igt_main
 {
 	amdgpu_device_handle device;
@@ -723,22 +711,6 @@ igt_main
 		}
 	}
 
-	igt_describe("Check-dispatch-test-compute-for-each-ring-using-memset-memcpy-shaders-and-validate-after");
-	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
-		if (arr_cap[AMD_IP_COMPUTE]) {
-			igt_dynamic_f("amdgpu-dispatch-test-compute")
-			amdgpu_gfx_dispatch_test_compute(device);
-		}
-	}
-
-	igt_describe("Check-dispatch-test-gfx-for-each-ring-using-memset-memcpy-shaders-and-validate-after");
-	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
-		if (arr_cap[AMD_IP_GFX]) {
-			igt_dynamic_f("amdgpu-dispatch-test-gfx")
-			amdgpu_gfx_dispatch_test_gfx(device);
-		}
-	}
-
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index f87acbcae..77d63f7ad 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -27,6 +27,7 @@ igt_main
 	struct amdgpu_gpu_info gpu_info = {0};
 	int fd = -1;
 	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -44,15 +45,24 @@ igt_main
 		igt_assert_eq(r, 0);
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
+		asic_rings_readness(device, 1, arr_cap);
 
 	}
 	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-compute-ring");
-	igt_subtest("dispatch-hang-slow-compute")
-	amdgpu_dispatch_hang_slow_compute(device);
+	igt_subtest_with_dynamic("amdgpu-dispatch-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-test-compute")
+			amdgpu_dispatch_hang_slow_compute(device);
+		}
+	}
 
 	igt_describe("Test-GPU-reset-using-a-binary-shader-to-hang-the-job-on-gfx-ring");
-	igt_subtest("dispatch-hang-slow-gfx")
-	amdgpu_dispatch_hang_slow_gfx(device);
+	igt_subtest_with_dynamic("amdgpu-dispatch-test-gfx-with-IP-GFX") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("amdgpu-dispatch-test-gfx")
+			 amdgpu_dispatch_hang_slow_gfx(device);
+		}
+	}
 
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 37e09b5fb..2949249a4 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -11,7 +11,6 @@ if libdrm_amdgpu.found()
 			  'amd_cp_dma_misc',
 			  'amd_cs_nop',
 			  'amd_deadlock',
-			  'amd_dispatch',
 			  'amd_dp_dsc',
 			  'amd_freesync_video_mode',
 			  'amd_hotplug',
@@ -43,6 +42,11 @@ if libdrm_amdgpu.found()
 	else
 		warning('libdrm <= 2.4.97 found, amd_syncobj test not applicable')
 	endif
+	if libdrm_amdgpu.version().version_compare('> 2.4.99')
+		amdgpu_progs +=[ 'amd_dispatch',]
+	else
+		warning('libdrm <= 2.4.99 found, amdgpu_cs_query_reset_state2 not applicable')
+	endif
 	amdgpu_deps += libdrm_amdgpu
 endif
 
-- 
2.25.1
