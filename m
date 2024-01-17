Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA1310E636
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jan 2024 04:55:10 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 2/2] tests/amdgpu: add gang cs test
Date: Tue, 16 Jan 2024 23:54:41 -0500
Message-ID: <20240117045441.256498-2-vitaly.prosyak@amd.com>
In-Reply-To: <20240117045441.256498-1-vitaly.prosyak@amd.com>
References: <20240117045441.256498-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add gang command submission test.
We submit ibs from different HW IP as a single command.
The test submits the copy command to the gfx ring and then
waits for the completion of another copy command to the compute
ring which takes longer due to its much bigger copy size.
So the copy commands are executed on COMPUTE and GFX ring as a
single command from the user.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_gang_cs.c | 229 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |   6 +-
 2 files changed, 234 insertions(+), 1 deletion(-)
 create mode 100644 tests/amdgpu/amd_gang_cs.c

diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
new file mode 100644
index 000000000..b6aa3940d
--- /dev/null
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: MIT
+// Copyright 2023 Advanced Micro Devices, Inc.
+
+#include "igt.h"
+#include "drmtest.h"
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+#include "lib/amdgpu/amd_memory.h"
+
+#define IB_SIZE	4096
+
+static void
+prepare_compute_cp_packet(amdgpu_device_handle device,
+		struct amdgpu_ring_context *ring_context,
+		const struct amdgpu_ip_block_version *ip_block)
+{
+	int r;
+
+	/* allocate buffer for compute  ring*/
+	r = amdgpu_bo_alloc_and_map(device,
+					ring_context->write_length * sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo, (void **)&ring_context->bo_cpu,
+					&ring_context->bo_mc, &ring_context->va_handle);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo_cpu, 0,
+			ring_context->write_length * sizeof(uint32_t));
+
+	/* allocate buffer for pm4 packet for compute ring*/
+	r = amdgpu_bo_alloc_and_map(device, IB_SIZE + ring_context->write_length *
+					sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo2, (void **)&ring_context->bo2_cpu,
+					&ring_context->bo_mc2, &ring_context->va_handle2);
+	igt_assert_eq(r, 0);
+
+	memset((void *)ring_context->bo2_cpu, 0,
+				ring_context->write_length * sizeof(uint32_t));
+	/* assign fields used by ASIC dependent function */
+	ring_context->pm4 = (uint32_t *)ring_context->bo2_cpu;
+	ip_block->funcs->write_linear(ip_block->funcs, ring_context,
+				&ring_context->pm4_dw);
+}
+
+static void
+prepare_gfx_cp_mem_packet(amdgpu_device_handle device,
+		struct amdgpu_ring_context *ring_context,
+		const struct amdgpu_ip_block_version *ip_block)
+{
+	int r;
+	uint32_t write_length;
+	uint64_t bo_mc;
+
+	/* allocate buffer for gfx  */
+	r = amdgpu_bo_alloc_and_map(device,
+					ring_context->write_length2 * sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo3, (void **)&ring_context->bo3_cpu,
+					&ring_context->bo_mc3, &ring_context->va_handle3);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo3_cpu, 0,
+			ring_context->write_length2 * sizeof(uint32_t));
+
+	/* allocate buffer for pm4 packet gfx*/
+	r = amdgpu_bo_alloc_and_map(device,  IB_SIZE + ring_context->write_length2 *
+					sizeof(uint32_t),
+					IB_SIZE, AMDGPU_GEM_DOMAIN_GTT, 0,
+					&ring_context->bo4, (void **)&ring_context->bo4_cpu,
+					&ring_context->bo_mc4, &ring_context->va_handle4);
+	igt_assert_eq(r, 0);
+	memset((void *)ring_context->bo4_cpu, 0,
+			ring_context->write_length2 * sizeof(uint32_t));
+	/* assign fields used by ASIC dependent functions */
+	ring_context->pm4 = (uint32_t *)ring_context->bo4_cpu;
+	bo_mc = ring_context->bo_mc;
+	ring_context->bo_mc = ring_context->bo_mc3;
+	write_length = ring_context->write_length;
+	ring_context->write_length = ring_context->write_length2;
+
+	ip_block->funcs->write_linear(ip_block->funcs, ring_context,
+				&ring_context->pm4_dw2);
+	/* addr -1 of compute buf*/
+	ring_context->bo_mc = bo_mc + (write_length - 1) * 4;
+	ip_block->funcs->wait_reg_mem(ip_block->funcs, ring_context,
+				&ring_context->pm4_dw2);
+	ring_context->bo_mc = bo_mc;
+}
+
+static void
+amdgpu_cs_gang(amdgpu_device_handle device)
+{
+	/* keep as big as ib can hold for compute write data packet so that even
+	 * for powerful gpu, wait_data packet in gfx queue will have need to wait.
+	 */
+	const int sdma_write_length_compute = IB_SIZE * 3;
+	/* keep it small for gfx write data packet so that gfx need to wait for compute */
+	const int sdma_write_length_gfx = 4;
+
+	amdgpu_context_handle context_handle;
+	struct amdgpu_ring_context *ring_context = NULL;
+
+	int r;
+
+	const struct amdgpu_ip_block_version *gfx_ip_block =
+			get_ip_block(device, AMD_IP_GFX);
+	const struct amdgpu_ip_block_version *compute_ip_block =
+			get_ip_block(device, AMD_IP_COMPUTE);
+
+	struct amdgpu_cs_request ibs_request = {0};
+	struct amdgpu_cs_ib_info_gang ib_info_gang[2] = {0};
+	struct amdgpu_cs_fence fence_status = {0};
+	uint32_t expired;
+
+	ring_context = malloc(sizeof(*ring_context));
+	memset(ring_context, 0, sizeof(*ring_context));
+	ring_context->write_length = sdma_write_length_compute;
+	ring_context->write_length2 = sdma_write_length_gfx;
+
+	r = amdgpu_cs_ctx_create(device, &context_handle);
+	igt_assert_eq(r, 0);
+
+	prepare_compute_cp_packet(device, ring_context, compute_ip_block);
+	prepare_gfx_cp_mem_packet(device, ring_context, gfx_ip_block);
+
+	ib_info_gang[0].ib_mc_address = ring_context->bo_mc2; /* pm4 packet addr compute */
+	ib_info_gang[0].size = ring_context->pm4_dw; /*size p4 compute */
+	ib_info_gang[0].ip_type = AMDGPU_HW_IP_COMPUTE;
+	ib_info_gang[0].ip_instance = 0;
+	ib_info_gang[0].ring = 0;
+
+	ib_info_gang[1].ib_mc_address = ring_context->bo_mc4; /* p4 packet addr gfx */
+	ib_info_gang[1].size = ring_context->pm4_dw2;	/* size p4 gfx */
+	ib_info_gang[1].ip_type =  AMDGPU_HW_IP_GFX;
+	ib_info_gang[1].ip_instance = 0;
+	ib_info_gang[1].ring = 0;
+
+	ibs_request.ip_type = AMDGPU_HW_IP_GFX;
+	ibs_request.number_of_ibs = 2;
+	ibs_request.ibs_gang = ib_info_gang;
+	ibs_request.fence_info.handle = NULL;
+
+	r = amdgpu_get_bo_list(device, ring_context->bo4,
+			ring_context->bo2, &ibs_request.resources);
+	igt_assert_eq(r, 0);
+
+	/* submit pm4 packets for gfx and compute as gang */
+	r = amdgpu_cs_submit_gang(context_handle, 0, &ibs_request, 1);
+	igt_assert_eq(r, 0);
+
+	/* wait for fence */
+	fence_status.context = context_handle;
+	fence_status.ip_type = AMDGPU_HW_IP_GFX;
+	fence_status.fence = ibs_request.seq_no;
+	r = amdgpu_cs_wait_fences(&fence_status, 1, 1,
+				  AMDGPU_TIMEOUT_INFINITE,
+				  &expired, NULL);
+	igt_assert_eq(r, 0);
+
+	/* verify compute test result meets with expected */
+
+	ring_context->bo_cpu = ring_context->bo_cpu;
+	ring_context->write_length = sdma_write_length_gfx;
+	gfx_ip_block->funcs->compare(gfx_ip_block->funcs, ring_context, 1);
+
+	ring_context->bo_cpu = ring_context->bo3_cpu;
+	ring_context->write_length = sdma_write_length_compute;
+	compute_ip_block->funcs->compare(compute_ip_block->funcs, ring_context, 1);
+
+
+	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle,
+			ring_context->bo_mc, sdma_write_length_gfx * sizeof(uint32_t));
+
+	amdgpu_bo_unmap_and_free(ring_context->bo2, ring_context->va_handle2,
+			ring_context->bo_mc2, IB_SIZE);
+
+	amdgpu_bo_unmap_and_free(ring_context->bo3, ring_context->va_handle3,
+			ring_context->bo_mc3, sdma_write_length_compute * sizeof(uint32_t));
+
+	amdgpu_bo_unmap_and_free(ring_context->bo4, ring_context->va_handle4,
+			ring_context->bo_mc4, IB_SIZE);
+
+	r = amdgpu_cs_ctx_free(context_handle);
+	igt_assert_eq(r, 0);
+	free(ring_context);
+}
+
+igt_main
+{
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {0};
+	int fd = -1;
+	int r;
+	bool arr_cap[AMD_IP_MAX] = {0};
+
+	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
+		igt_assert_eq(r, 0);
+		asic_rings_readness(device, 1, arr_cap);
+
+	}
+
+	igt_describe("Test GPU gang cs for gfx and compute rings");
+	igt_subtest_with_dynamic("amdgpu-cs-gang") {
+		if (arr_cap[AMD_IP_GFX] && arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-cs-gang-AMD_IP_GFX-AMD_IP_COMPUTE")
+				amdgpu_cs_gang(device);
+		}
+	}
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index bbb8edc93..6798668c2 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -54,7 +54,11 @@ if libdrm_amdgpu.found()
 	else
 		warning('libdrm <= 2.4.109 found, amd_pstate test not applicable')
 	endif
-
+	if libdrm_amdgpu.version().version_compare('> 2.4.120')
+		amdgpu_progs +=[ 'amd_gang_cs', ]
+	else
+		warning('libdrm <= 2.4.120 found, amd_gang_cs test not applicable')
+	endif
 	amdgpu_deps += libdrm_amdgpu
 endif
 
-- 
2.25.1
