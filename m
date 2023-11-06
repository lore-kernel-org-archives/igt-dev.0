Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::607])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D358F10E268
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 05:52:43 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 6 Nov 2023 13:52:27 +0800
Message-ID: <20231106055227.2740582-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/2] lib/amdgpu: add apu check for pciplug
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

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Tim Huang <tim.huang@amd.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_pci_unplug.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
index 9811e0cc2..6a4711de7 100644
--- a/lib/amdgpu/amd_pci_unplug.c
+++ b/lib/amdgpu/amd_pci_unplug.c
@@ -92,6 +92,7 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 	bool ret = false;
 	int r;
 	uint32_t  major_version, minor_version;
+	struct amdgpu_gpu_info gpu_info = {0};
 
 	unplug->num_devices = amdgpu_open_devices(render_mode, MAX_CARDS_SUPPORTED,
 											  unplug->drm_amdgpu_fds);
@@ -118,6 +119,12 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 	if (minor_version < setup->minor_version_req)
 		goto release;
 
+		/* skip hotplug test on APUs */
+	r = amdgpu_query_gpu_info(unplug->device_handle, &gpu_info);
+	igt_assert_eq(r, 0);
+	if (gpu_info.ids_flags & AMDGPU_IDS_FLAGS_FUSION)
+		goto release;
+
 	if (!setup->open_device) {
 			/* device handle is not always required for test */
 			/* but for drm version is required always */
@@ -132,6 +139,12 @@ amdgpu_hotunplug_setup_test(bool render_mode, const struct amd_pci_unplug_setup
 			goto release;
 		if (minor_version < setup->minor_version_req)
 			goto release;
+
+			/* skip hotplug test on APUs */
+		r = amdgpu_query_gpu_info(unplug->device_handle2, &gpu_info);
+		igt_assert_eq(r, 0);
+		if (gpu_info.ids_flags & AMDGPU_IDS_FLAGS_FUSION)
+			goto release;
 	}
 	ret = true;
 release:
-- 
2.25.1
