Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3756210E48A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jan 2023 00:53:35 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 4 Jan 2023 19:53:20 -0500
Message-ID: <20230105005320.157831-4-vitaly.prosyak@amd.com>
In-Reply-To: <20230105005320.157831-1-vitaly.prosyak@amd.com>
References: <20230105005320.157831-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 4/4] tests/amdgpu: add cp dma tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, pierre-eric.pelloux-prayer@amd.com,
 jiadong.zhu@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Combine subtests in the tables of phases and engines and
loop through the use cases of the following combinations:
GTT, VRAM for GFX and COMPUTE rings.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_cp_dma_misc.c | 125 +++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build       |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 tests/amdgpu/amd_cp_dma_misc.c

diff --git a/tests/amdgpu/amd_cp_dma_misc.c b/tests/amdgpu/amd_cp_dma_misc.c
new file mode 100644
index 000000000..37b6114a9
--- /dev/null
+++ b/tests/amdgpu/amd_cp_dma_misc.c
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the next
+ * paragraph) shall be included in all copies or substantial portions of the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+ * IN THE SOFTWARE.
+ */
+
+#include "igt.h"
+#include "drmtest.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+#include "lib/amdgpu/amd_cp_dma.h"
+#include "lib/amdgpu/amd_ip_blocks.h"
+
+igt_main
+{
+	amdgpu_device_handle device;
+	amdgpu_device_handle device2;
+	uint32_t major, minor;
+	int r;
+
+	int drm_amdgpu_fds[MAX_CARDS_SUPPORTED];
+	struct amdgpu_gpu_info gpu_info = {};
+	struct amdgpu_gpu_info gpu_info2 = {};
+	int num_devices = 0;
+
+	const struct phase {
+		const char *name;
+		unsigned int src_memory;
+		unsigned int dst_memory;
+	} phase[] = {
+		{ "GTT_to_VRAM",  AMDGPU_GEM_DOMAIN_GTT,  AMDGPU_GEM_DOMAIN_VRAM },
+		{ "VRAM_to_GTT",  AMDGPU_GEM_DOMAIN_VRAM, AMDGPU_GEM_DOMAIN_GTT  },
+		{ "VRAM_to_VRAM", AMDGPU_GEM_DOMAIN_VRAM, AMDGPU_GEM_DOMAIN_VRAM },
+		{ },
+	}, *p;
+
+	const struct engine {
+		const char *name;
+		unsigned int ip_type;
+	} engines[] = {
+		{ "AMDGPU_HW_IP_GFX",		AMDGPU_HW_IP_GFX     },
+		{ "AMDGPU_HW_IP_COMPUTE",   AMDGPU_HW_IP_COMPUTE },
+		{ },
+	}, *e;
+
+
+	igt_fixture {
+		num_devices = amdgpu_open_devices(true, MAX_CARDS_SUPPORTED, drm_amdgpu_fds);
+		igt_require(num_devices > 0);
+		r = amdgpu_device_initialize(drm_amdgpu_fds[0], &major,
+										 &minor, &device);
+		igt_require(r == 0);
+		igt_info("Initialized amdgpu, driver version %d.%d\n", major, minor);
+		r = amdgpu_query_gpu_info(device, &gpu_info);
+		igt_assert_eq(r, 0);
+		r = setup_amdgpu_ip_blocks( major, minor,  &gpu_info, device);
+		igt_assert_eq(r, 0);
+
+		if (num_devices > 1 ) {
+			/* do test for 2 only */
+			igt_assert_eq(num_devices, 2);
+			r = amdgpu_device_initialize(drm_amdgpu_fds[1], &major,
+											 &minor, &device2);
+			igt_require(r == 0);
+			igt_info("Initialized amdgpu, driver2 version %d.%d\n", major, minor);
+			r = amdgpu_query_gpu_info(device2, &gpu_info2);
+			igt_assert_eq(r, 0);
+		}
+	}
+	if (amdgpu_cp_dma_misc_is_supported(&gpu_info)) {
+		for (p = phase; p->name; p++) {
+			for (e = engines; e->name; e++) {
+				if (e->ip_type == AMDGPU_HW_IP_GFX && asic_is_gfx_pipe_removed(&gpu_info))
+					continue;
+				igt_subtest_f("%s-%s0", p->name, e->name)
+				amdgpu_cp_dma_generic(device, NULL, e->ip_type,p->src_memory, p->dst_memory);
+			}
+		}
+	} else {
+		igt_info("SKIP due to testing device has ASIC family %d that is not supported by CP-DMA test\n",
+				gpu_info.family_id);
+	}
+
+	if (num_devices > 1 && 	amdgpu_cp_dma_misc_p2p_is_supported(&gpu_info2)) {
+		for (p = phase; p->name; p++) {
+			for (e = engines; e->name; e++) {
+				if (e->ip_type == AMDGPU_HW_IP_GFX && asic_is_gfx_pipe_removed(&gpu_info2))
+					continue;
+				igt_subtest_f("%s-%s0", p->name, e->name)
+				amdgpu_cp_dma_generic(device, device2, e->ip_type,p->src_memory, p->dst_memory);
+			}
+		}
+	} else {
+		igt_info("SKIP due to more than one ASIC is required or testing device has ASIC family %d that is not supported by CP-DMA P2P test\n",
+				gpu_info2.family_id);
+	}
+
+	igt_fixture {
+		amdgpu_device_deinitialize(device);
+		close(drm_amdgpu_fds[0]);
+		if (num_devices > 1) {
+			amdgpu_device_deinitialize(device2);
+			close(drm_amdgpu_fds[1]);
+		}
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 48b916925..7fff7602f 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -8,6 +8,7 @@ if libdrm_amdgpu.found()
 			  'amd_bypass',
 			  'amd_deadlock',
 			  'amd_pci_unplug',
+			  'amd_cp_dma_misc',
 			  'amd_color',
 			  'amd_cs_nop',
 			  'amd_hotplug',
-- 
2.25.1
