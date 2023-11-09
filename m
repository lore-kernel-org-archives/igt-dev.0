Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDB410E0C0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 02:42:48 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 10:42:29 +0800
Message-ID: <20231109024229.2950206-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/amdgpu:fix the error when skip
 hotplug test
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

For skipped cases, we should print "SKIP"
rather than "failure." For example

IGT-Version: 1.28-g4b3e1dc37 (x86_64) (Linux: 6.3.7+ x86_64)
Starting subtest: amdgpu_hotunplug_simple
SKIP ... more than 1 GPU is required for this test
(amd_pci_unplug:70496) amdgpu/amd_pci_unplug-CRITICAL: Test assertion failure function amdgpu_hotunplug_test, file ../lib/amdgpu/amd_pci_unplug.c:305:
(amd_pci_unplug:70496) amdgpu/amd_pci_unplug-CRITICAL: Failed assertion: r == 1
(amd_pci_unplug:70496) amdgpu/amd_pci_unplug-CRITICAL: Last errno: 22, Invalid argument
(amd_pci_unplug:70496) amdgpu/amd_pci_unplug-CRITICAL: error: 0 != 1
Stack trace:
  #0 ../lib/igt_core.c:1988 __igt_fail_assert()
  #1 ../lib/amdgpu/amd_pci_unplug.c:305 amdgpu_hotunplug_test.constprop.0.isra.0()
  #2 [amdgpu_hotunplug_simple+0x29]
  #3 ../tests/amdgpu/amd_pci_unplug.c:44 __igt_unique____real_main34()
  #4 ../tests/amdgpu/amd_pci_unplug.c:34 main()
  #5 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
  #6 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
  #7 [_start+0x25]
Subtest amdgpu_hotunplug_simple failed.

V2:
  - replace igt_skip_on with igt_skip_f(Kamil)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Tim Huang <tim.huang@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_pci_unplug.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
index b7af95dec..8346aeb98 100644
--- a/lib/amdgpu/amd_pci_unplug.c
+++ b/lib/amdgpu/amd_pci_unplug.c
@@ -101,8 +101,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 
 	if (setup->open_device && setup->open_device2 && unplug->num_devices < 2) {
 		/*Not enough board for the test*/
-		printf("SKIP ... more than 1 GPU is required for this test\n");
-		goto release;
+		igt_skip_on_f(ret, "SKIP ... more than 1 GPU is required for this test\n");
 	}
 
 	tmp_str = amdgpu_get_device_from_fd(unplug->drm_amdgpu_fds[0]);
@@ -117,7 +116,9 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 		goto release;
 
 	if (minor_version < setup->minor_version_req)
-		goto release;
+		igt_skip_on_f(minor_version < setup->minor_version_req,
+			"It has minor_version: %d but it is required: %d for this test\n",
+			minor_version, setup->minor_version_req);
 
 	/* skip hotplug test on APU (Accelerated Processing Unit CPU + iGPU) */
 	r = amdgpu_query_gpu_info(unplug->device_handle, &gpu_info);
@@ -138,7 +139,9 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 		if (r != 0)
 			goto release;
 		if (minor_version < setup->minor_version_req)
-			goto release;
+			igt_skip_on_f(minor_version < setup->minor_version_req,
+				"It has minor_version: %d but it is required: %d for this test\n",
+				minor_version, setup->minor_version_req);
 
 		r = amdgpu_query_gpu_info(unplug->device_handle2, &gpu_info);
 		igt_assert_eq(r, 0);
-- 
2.25.1
