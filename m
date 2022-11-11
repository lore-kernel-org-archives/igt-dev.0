Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231A410E1C2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 21:53:04 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Nov 2022 16:52:11 -0500
Message-ID: <20221111215213.48679-7-vitaly.prosyak@amd.com>
In-Reply-To: <20221111215213.48679-1-vitaly.prosyak@amd.com>
References: <20221111215213.48679-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 7/9] tests/amdgpu: add tests for invalid memory
 and register access
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

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Pierre-eric Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index d4de20114..df650c921 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -58,6 +58,18 @@ amdgpu_deadlock_sdma(amdgpu_device_handle device_handle)
 	amdgpu_wait_memory_helper(device_handle, AMDGPU_HW_IP_DMA);
 }
 
+static void
+amdgpu_gfx_illegal_reg_access(amdgpu_device_handle device_handle)
+{
+	bad_access_helper(device_handle, 1, AMDGPU_HW_IP_GFX);
+}
+
+static void
+amdgpu_gfx_illegal_mem_access(amdgpu_device_handle device_handle)
+{
+	bad_access_helper(device_handle, 0, AMDGPU_HW_IP_GFX);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -86,6 +98,12 @@ igt_main
 	igt_subtest("amdgpu_deadlock_sdma")
 	amdgpu_deadlock_sdma(device);
 
+	igt_subtest("amdgpu_gfx_illegal_reg_access")
+	amdgpu_gfx_illegal_reg_access(device);
+
+	igt_subtest("amdgpu_gfx_illegal_mem_access")
+	amdgpu_gfx_illegal_mem_access(device);
+
 	igt_subtest("amdgpu_deadlock_gfx")
 	amdgpu_deadlock_gfx(device);
 
-- 
2.25.1
