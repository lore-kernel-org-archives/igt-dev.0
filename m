Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B372B10E754
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 03:01:11 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 17 Oct 2022 23:00:53 -0400
Message-ID: <20221018030055.73636-5-vitaly.prosyak@amd.com>
In-Reply-To: <20221018030055.73636-1-vitaly.prosyak@amd.com>
References: <20221018030055.73636-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 5/7] tests/amdgpu: add tests for invalid memory
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
