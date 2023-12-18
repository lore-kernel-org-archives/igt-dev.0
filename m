Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B17010E27E
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 18:20:17 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t V3] tests/amdgpu: fix VM test issue
Date: Mon, 18 Dec 2023 10:53:07 +0800
Message-ID: <20231218025307.1837517-1-jesse.zhang@amd.com>
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
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test case name:igt@amdgpu/amd_vm@amdgpu-vm-unaligned-map
Fail error: "Starting subtest: amdgpu-vm-unaligned-map
(amd_vm:8876) CRITICAL: Test assertion failure function amdgpu_vm_unaligned_map, file ../tests/amdgpu/amd_vm.c:131:
(amd_vm:8876) CRITICAL: Failed assertion: r == 0
(amd_vm:8876) CRITICAL: Last errno: 12, Cannot allocate memory
(amd_vm:8876) CRITICAL: error: -12 != 0
Subtest amdgpu-vm-unaligned-map failed.

V3:
   - Split the test into two, one for the 2M (using 8M allocations)
     case and one for the 1G case (using 4G allocation). (Christian)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_vm.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index 11be25ae8..dab91f291 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -115,11 +115,11 @@ amdgpu_vmid_reserve_test(amdgpu_device_handle device_handle,
 static void
 amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
 {
-	const uint64_t map_size = (4ULL << 30) - (2 << 12);
+	uint64_t map_size = (4ULL << 30) - (2 << 12);
 	struct amdgpu_bo_alloc_request request = {};
 	amdgpu_bo_handle buf_handle;
 	amdgpu_va_handle handle;
-	uint64_t vmc_addr;
+	uint64_t vmc_addr, alignment = 1ULL << 30;
 	int r;
 
 	request.alloc_size = 4ULL << 30;
@@ -127,11 +127,18 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
 	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
 	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
 
-	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
+	if (-ENOMEM == amdgpu_bo_alloc(device_handle, &request, &buf_handle)) {
+		/* Try allocate on the device of small memory */
+		request.alloc_size = 8ULL << 20;
+		map_size = (8ULL << 20) - (2 << 12);
+		alignment = 2ULL << 20;
+		r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
+	}
+
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_va_range_alloc(device_handle, amdgpu_gpu_va_range_general,
-				4ULL << 30, 1ULL << 30, 0, &vmc_addr,
+				request.alloc_size, alignment, 0, &vmc_addr,
 				&handle, 0);
 	igt_assert_eq(r, 0);
 
-- 
2.25.1
