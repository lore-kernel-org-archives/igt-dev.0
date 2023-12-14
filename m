Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::60c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E173910E919
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Dec 2023 09:08:45 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH i-g-t] tests/amdgpu: fix VM test issue
Date: Thu, 14 Dec 2023 17:07:49 +0800
Message-ID: <20231214090749.1711421-1-jesse.zhang@amd.com>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

In some cases, the size of Vram and GTT is not large, such as mobile devices.
It should be skipped.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_vm.c b/tests/amdgpu/amd_vm.c
index 11be25ae8..0dde28e2e 100644
--- a/tests/amdgpu/amd_vm.c
+++ b/tests/amdgpu/amd_vm.c
@@ -127,8 +127,8 @@ amdgpu_vm_unaligned_map(amdgpu_device_handle device_handle)
 	request.preferred_heap = AMDGPU_GEM_DOMAIN_VRAM;
 	request.flags = AMDGPU_GEM_CREATE_NO_CPU_ACCESS;
 
-	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
-	igt_assert_eq(r, 0);
+	/* Don't let the test fail if the device doesn't have enough VRAM */
+	igt_skip_on(amdgpu_bo_alloc(device_handle, &request, &buf_handle));
 
 	r = amdgpu_va_range_alloc(device_handle, amdgpu_gpu_va_range_general,
 				4ULL << 30, 1ULL << 30, 0, &vmc_addr,
-- 
2.25.1
