Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8537210E120
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Nov 2023 03:37:49 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 7 Nov 2023 11:37:33 +0800
Message-ID: <20231107033733.2772666-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH V2 i-g-t] test/amdgpu: add apu check for pciplug
 test
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

For apu, it is integrated with cpu.
So hotplug test should be unnecessary for it.

V2:
 -IGT built-in approach to check this condition
   in the fixture function. (Vitlay)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Tim Huang <tim.huang@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_pci_unplug.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_pci_unplug.c b/tests/amdgpu/amd_pci_unplug.c
index 4c055b99f..22e053795 100644
--- a/tests/amdgpu/amd_pci_unplug.c
+++ b/tests/amdgpu/amd_pci_unplug.c
@@ -30,15 +30,42 @@
 #include "lib/amdgpu/amd_pci_unplug.h"
 #include "lib/amdgpu/amd_ip_blocks.h"
 
+static bool
+is_hot_plug_test_enable(amdgpu_device_handle device_handle, const struct amdgpu_gpu_info *gpu_info)
+{
+	bool enable = true;
+
+		/* skip hotplug test on APUs */
+	if (gpu_info->ids_flags & AMDGPU_IDS_FLAGS_FUSION) {
+		igt_info("Don't support hot plug on APUs, hot plug test is disabled\n");
+		enable = false;
+	}
+	return enable;
+}
 
 igt_main
 {
 
 	struct amd_pci_unplug_setup setup = {0};
 	struct amd_pci_unplug unplug = {0};
+	amdgpu_device_handle device;
+	struct amdgpu_gpu_info gpu_info = {};
+	int fd = -1;
 
 	igt_fixture {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		err = amdgpu_device_initialize(fd, &major, &minor, &device);
+		igt_require(err == 0);
+		igt_info("Initialized amdgpu, driver version %d.%d\n",
+			 major, minor);
+		err = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(err, 0);
+
 		setup.minor_version_req = 46;
+		igt_skip_on(!is_hot_plug_test_enable(device, &gpu_info));
 	}
 
 	igt_subtest("amdgpu_hotunplug_simple")
@@ -54,5 +81,8 @@ igt_main
 	igt_subtest("amdgpu_hotunplug_with_exported_fence")
 		amdgpu_hotunplug_with_exported_fence(&setup, &unplug);
 
-	igt_fixture { }
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		drm_close_driver(fd);
+	}
 }
-- 
2.25.1
