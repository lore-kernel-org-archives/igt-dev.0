Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EBF910E240
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 01:56:58 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Mon, 14 Aug 2023 21:56:41 -0400
Message-ID: <20230815015641.125274-3-vitaly.prosyak@amd.com>
In-Reply-To: <20230815015641.125274-1-vitaly.prosyak@amd.com>
References: <20230815015641.125274-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 3/3] tests/amdgpu: fix cs nop test when no GFX IP
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Some ASICs may not have GFX IP. For such ASIC the test
would be skipped and the reason would be printed.
Added tests descriptions.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Acked-by: Christian Koenig <christian.koenig@amd.com>

---
 tests/amdgpu/amd_cs_nop.c | 41 ++++++++++++++-------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/tests/amdgpu/amd_cs_nop.c b/tests/amdgpu/amd_cs_nop.c
index 323c1b16a..5f7acb497 100644
--- a/tests/amdgpu/amd_cs_nop.c
+++ b/tests/amdgpu/amd_cs_nop.c
@@ -1,24 +1,7 @@
+// SPDX-License-Identifier: MIT
 /*
- * Copyright © 2017 Intel Corporation
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
- * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
- * IN THE SOFTWARE.
+ * Copyright 2017 Intel Corporation
+ * Copyright 2023 Advanced Micro Devices, Inc.
  */
 
 #include "igt.h"
@@ -27,12 +10,12 @@
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 #include "lib/amdgpu/amd_PM4.h"
-
+#include "lib/amdgpu/amd_ip_blocks.h"
 
 
 static int
-amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned size,
-			unsigned alignment, unsigned heap, uint64_t flags,
+amdgpu_bo_alloc_and_map(amdgpu_device_handle dev, unsigned int size,
+			unsigned int alignment, unsigned int heap, uint64_t flags,
 			amdgpu_bo_handle *bo, void **cpu, uint64_t *mc_address,
 			amdgpu_va_handle *va_handle)
 {
@@ -214,6 +197,7 @@ igt_main
 		{ },
 	}, *e;
 	int fd = -1;
+	bool arr_cap[AMD_IP_MAX] = {0};
 
 	igt_fixture {
 		uint32_t major, minor;
@@ -226,13 +210,18 @@ igt_main
 
 		err = amdgpu_cs_ctx_create(device, &context);
 		igt_assert_eq(err, 0);
+		asic_rings_readness(device, 1, arr_cap);
 	}
 
 	for (p = phase; p->name; p++) {
 		for (e = engines; e->name; e++) {
-			igt_subtest_f("%s-%s0", p->name, e->name)
-				nop_cs(device, context, e->name, e->ip_type,
-				       0, 20, p->flags);
+			igt_describe("Stressful-and-multiple-cs-of-nop-operations-using-multiple-processes-with-the-same-GPU-context");
+			igt_subtest_with_dynamic_f("cs-nops-with-%s-%s0", p->name, e->name) {
+				if (arr_cap[e->ip_type]) {
+					igt_dynamic_f("cs-nop-with-%s-%s0", p->name, e->name)
+					nop_cs(device, context, e->name, e->ip_type, 0, 20, p->flags);
+				}
+			}
 		}
 	}
 
-- 
2.25.1
