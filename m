Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2068.outbound.protection.outlook.com [40.107.244.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9727511AC38
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 18:22:26 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 7 Jul 2022 14:22:06 -0400
Message-ID: <20220707182207.3736-6-vitaly.prosyak@amd.com>
In-Reply-To: <20220707182207.3736-1-vitaly.prosyak@amd.com>
References: <20220707182207.3736-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 6/7] lib/amdgpu: add shaders in binary form
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: alexander.deucher@amd.com, marek.olsak@amd.com, christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_shaders.c | 51 ++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_shaders.h | 32 +++++++++++++++++++++++++
 lib/meson.build          |  1 +
 3 files changed, 84 insertions(+)
 create mode 100644 lib/amdgpu/amd_shaders.c
 create mode 100644 lib/amdgpu/amd_shaders.h

diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
new file mode 100644
index 00000000..31722744
--- /dev/null
+++ b/lib/amdgpu/amd_shaders.c
@@ -0,0 +1,51 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *  *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+
+#include "amd_shaders.h"
+
+
+#define CODE_OFFSET 512
+#define DATA_OFFSET 1024
+
+#define SWAP_32(num) (((num & 0xff000000) >> 24) | \
+		      ((num & 0x0000ff00) << 8) | \
+		      ((num & 0x00ff0000) >> 8) | \
+		      ((num & 0x000000ff) << 24))
+
+
+static  uint32_t shader_bin[] = {
+	SWAP_32(0x800082be), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP_32(0x040085bf),
+	SWAP_32(0x02810281), SWAP_32(0x02ff08bf), SWAP_32(0x7f969800), SWAP_32(0xfcff84bf),
+	SWAP_32(0xff0083be), SWAP_32(0x00f00000), SWAP_32(0xc10082be), SWAP_32(0xaa02007e),
+	SWAP_32(0x000070e0), SWAP_32(0x00000080), SWAP_32(0x000081bf)
+};
+
+const uint32_t * get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data_offset)
+{
+	*size_bytes = sizeof(shader_bin);
+	*code_offset =  CODE_OFFSET;
+	*data_offset = DATA_OFFSET;
+	return shader_bin;
+}
diff --git a/lib/amdgpu/amd_shaders.h b/lib/amdgpu/amd_shaders.h
new file mode 100644
index 00000000..1abb23ac
--- /dev/null
+++ b/lib/amdgpu/amd_shaders.h
@@ -0,0 +1,32 @@
+/*
+ * Copyright 2014 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a
+ * copy of this software and associated documentation files (the "Software"),
+ * to deal in the Software without restriction, including without limitation
+ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+ * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ * OTHER DEALINGS IN THE SOFTWARE.
+ *
+ *
+ */
+#ifndef AMD_SHADERS_H
+#define AMD_SHADERS_H
+
+#include "drmtest.h"
+
+const uint32_t * get_shader_bin(uint32_t *size_bytes, uint32_t *code_offset, uint32_t *data_offset);
+
+#endif
diff --git a/lib/meson.build b/lib/meson.build
index 12b2cc5d..98c2803b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -132,6 +132,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_compute.c',
 		'amdgpu/amd_gfx.c',
 		'amdgpu/amd_ip_blocks.c',
+		'amdgpu/amd_shaders.c',
 	]
 endif
 
-- 
2.25.1
