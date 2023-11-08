Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712D810E6F8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Nov 2023 02:57:50 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 10:57:38 +0800
Message-ID: <20231108025738.2914175-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH V3 i-g-t 2/2] test/amdgpu: add apu check for
 pciplug test
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

It is integrated with cpu,
for APU(Accelerated Processing Unit CPU + iGPU).
So hotplug test should be unnecessary for it.

V3:
 - place the APU check in particular subtests.(Kamil)
 - Add igt_info about skipping tests (Vitaly)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Tim Huang <tim.huang@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_pci_unplug.c | 34 +++++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
index 9811e0cc2..1e795757d 100644
--- a/lib/amdgpu/amd_pci_unplug.c
+++ b/lib/amdgpu/amd_pci_unplug.c
@@ -92,6 +92,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 	bool ret = false;
 	int r;
 	uint32_t  major_version, minor_version;
+	struct amdgpu_gpu_info gpu_info = {0};
 
 	unplug->num_devices = amdgpu_open_devices(render_mode, MAX_CARDS_SUPPORTED,
 											  unplug->drm_amdgpu_fds);
@@ -101,7 +102,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 	if (setup->open_device && setup->open_device2 && unplug->num_devices < 2) {
 		/*Not enough board for the test*/
 		printf("SKIP ... more than 1 GPU is required for this test\n");
-		goto release;
+		igt_skip_on(!ret);
 	}
 
 	tmp_str = amdgpu_get_device_from_fd(unplug->drm_amdgpu_fds[0]);
@@ -115,8 +116,19 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 	if (r != 0)
 		goto release;
 
-	if (minor_version < setup->minor_version_req)
-		goto release;
+	if (minor_version < setup->minor_version_req) {
+		igt_info("SKIP ... minor_version:%d mismatch, required: %d for this test\n",
+			minor_version, setup->minor_version_req);
+		igt_skip_on(!ret);
+	}
+
+	/* skip hotplug test on APU (Accelerated Processing Unit CPU + iGPU) */
+	r = amdgpu_query_gpu_info(unplug->device_handle, &gpu_info);
+	igt_assert_eq(r, 0);
+	if (gpu_info.ids_flags & AMDGPU_IDS_FLAGS_FUSION) {
+		igt_info("SKIP ... APU does not require this test\n");
+		igt_skip_on(!ret);
+	}
 
 	if (!setup->open_device) {
 			/* device handle is not always required for test */
@@ -130,10 +142,22 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 						   &minor_version, &unplug->device_handle2);
 		if (r != 0)
 			goto release;
-		if (minor_version < setup->minor_version_req)
-			goto release;
+		if (minor_version < setup->minor_version_req) {
+			igt_info("SKIP ... minor_version:%d mismatch, required: %d for this test\n",
+				minor_version, setup->minor_version_req);
+			igt_skip_on(!ret);
+		}
+
+		/* skip hotplug test on APU (Accelerated Processing Unit CPU + iGPU) */
+		r = amdgpu_query_gpu_info(unplug->device_handle2, &gpu_info);
+		igt_assert_eq(r, 0);
+		if (gpu_info.ids_flags & AMDGPU_IDS_FLAGS_FUSION) {
+			igt_info("SKIP ... APU does not require this test\n");
+			igt_skip_on(!ret);
+		}
 	}
 	ret = true;
+
 release:
 	return ret;
 }
-- 
2.25.1
