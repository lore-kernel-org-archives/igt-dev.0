Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD810E8E6
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 13:25:37 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 13 Oct 2022 09:25:27 -0400
Message-ID: <20221013132527.6104-6-vitaly.prosyak@amd.com>
In-Reply-To: <20221013132527.6104-1-vitaly.prosyak@amd.com>
References: <20221013132527.6104-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 6/6] tests/amdgpu: add tests for invalid memory
 and register access
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
 tests/amdgpu/amd_deadlock.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index c7e8e05e9..4fefe6935 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -53,6 +53,18 @@ amdgpu_dispatch_hang_slow_compute(amdgpu_device_handle device_handle)
 	amdgpu_dispatch_hang_slow_helper(device_handle, AMDGPU_HW_IP_COMPUTE);
 }
 
+static void
+amdgpu_illegal_reg_access(amdgpu_device_handle device_handle)
+{
+	bad_access_helper(device_handle, 1);
+}
+
+static void
+amdgpu_illegal_mem_access(amdgpu_device_handle device_handle)
+{
+	bad_access_helper(device_handle, 0);
+}
+
 igt_main
 {
 	amdgpu_device_handle device;
@@ -79,6 +91,12 @@ igt_main
 
 	}
 
+	igt_subtest("amdgpu_illegal_reg_access")
+	amdgpu_illegal_reg_access(device);
+
+	igt_subtest("amdgpu_illegal_mem_access")
+	amdgpu_illegal_mem_access(device);
+
 	igt_subtest("amdgpu_deadlock_gfx")
 	amdgpu_deadlock_gfx(device);
 
-- 
2.25.1
