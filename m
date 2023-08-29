Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B40A10E0C0
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 22:32:26 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 29 Aug 2023 18:31:59 -0400
Message-ID: <20230829223200.273589-2-vitaly.prosyak@amd.com>
In-Reply-To: <20230829223200.273589-1-vitaly.prosyak@amd.com>
References: <20230829223200.273589-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/3] lib/amdgpu: fix formatting warnings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Review-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_family.h       | 251 ++++++++++++++++------------------
 lib/amdgpu/amdgpu_asic_addr.h | 124 +++++++----------
 2 files changed, 166 insertions(+), 209 deletions(-)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 25c2c7db9..bf3431bc1 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -2,25 +2,8 @@
  * Copyright 2008 Corbin Simpson <MostAwesomeDude@gmail.com>
  * Copyright 2010 Marek Olšák <maraeo@gmail.com>
  * Copyright 2022 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * on the rights to use, copy, modify, merge, publish, distribute, sub
- * license, and/or sell copies of the Software, and to permit persons to whom
- * the Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
- * THE AUTHOR(S) AND/OR THEIR SUPPLIERS BE LIABLE FOR ANY CLAIM,
- * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
- * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
- * USE OR OTHER DEALINGS IN THE SOFTWARE. */
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ */
 
 #ifndef AMD_FAMILY_H
 #define AMD_FAMILY_H
@@ -29,127 +12,123 @@
 extern "C" {
 #endif
 
-enum radeon_family
-{
-   CHIP_UNKNOWN = 0,
-   CHIP_R300, /* R3xx-based cores. (GFX2) */
-   CHIP_R350,
-   CHIP_RV350,
-   CHIP_RV370,
-   CHIP_RV380,
-   CHIP_RS400,
-   CHIP_RC410,
-   CHIP_RS480,
-   CHIP_R420, /* R4xx-based cores. (GFX2) */
-   CHIP_R423,
-   CHIP_R430,
-   CHIP_R480,
-   CHIP_R481,
-   CHIP_RV410,
-   CHIP_RS600,
-   CHIP_RS690,
-   CHIP_RS740,
-   CHIP_RV515, /* R5xx-based cores. (GFX2) */
-   CHIP_R520,
-   CHIP_RV530,
-   CHIP_R580,
-   CHIP_RV560,
-   CHIP_RV570,
-   CHIP_R600, /* GFX3 (R6xx) */
-   CHIP_RV610,
-   CHIP_RV630,
-   CHIP_RV670,
-   CHIP_RV620,
-   CHIP_RV635,
-   CHIP_RS780,
-   CHIP_RS880,
-   CHIP_RV770, /* GFX3 (R7xx) */
-   CHIP_RV730,
-   CHIP_RV710,
-   CHIP_RV740,
-   CHIP_CEDAR, /* GFX4 (Evergreen) */
-   CHIP_REDWOOD,
-   CHIP_JUNIPER,
-   CHIP_CYPRESS,
-   CHIP_HEMLOCK,
-   CHIP_PALM,
-   CHIP_SUMO,
-   CHIP_SUMO2,
-   CHIP_BARTS,
-   CHIP_TURKS,
-   CHIP_CAICOS,
-   CHIP_CAYMAN, /* GFX5 (Northern Islands) */
-   CHIP_ARUBA,
-   CHIP_TAHITI, /* GFX6 (Southern Islands) */
-   CHIP_PITCAIRN,
-   CHIP_VERDE,
-   CHIP_OLAND,
-   CHIP_HAINAN,
-   CHIP_BONAIRE, /* GFX7 (Sea Islands) */
-   CHIP_KAVERI,
-   CHIP_KABINI,
-   CHIP_HAWAII,
-   CHIP_TONGA, /* GFX8 (Volcanic Islands & Polaris) */
-   CHIP_ICELAND,
-   CHIP_CARRIZO,
-   CHIP_FIJI,
-   CHIP_STONEY,
-   CHIP_POLARIS10,
-   CHIP_POLARIS11,
-   CHIP_POLARIS12,
-   CHIP_VEGAM,
-   CHIP_VEGA10, /* GFX9 (Vega) */
-   CHIP_VEGA12,
-   CHIP_VEGA20,
-   CHIP_RAVEN,
-   CHIP_RAVEN2,
-   CHIP_RENOIR,
-   CHIP_ARCTURUS,
-   CHIP_ALDEBARAN,
-   CHIP_NAVI10,
-   CHIP_NAVI12,
-   CHIP_NAVI14,
-   CHIP_SIENNA_CICHLID,
-   CHIP_NAVY_FLOUNDER,
-   CHIP_VANGOGH,
-   CHIP_DIMGREY_CAVEFISH,
-   CHIP_BEIGE_GOBY,
-   CHIP_YELLOW_CARP,
-   CHIP_LAST,
+enum radeon_family {
+	CHIP_UNKNOWN	= 0,
+	CHIP_R300,		/* R3xx-based cores. (GFX2) */
+	CHIP_R350,
+	CHIP_RV350,
+	CHIP_RV370,
+	CHIP_RV380,
+	CHIP_RS400,
+	CHIP_RC410,
+	CHIP_RS480,
+	CHIP_R420, /* R4xx-based cores. (GFX2) */
+	CHIP_R423,
+	CHIP_R430,
+	CHIP_R480,
+	CHIP_R481,
+	CHIP_RV410,
+	CHIP_RS600,
+	CHIP_RS690,
+	CHIP_RS740,
+	CHIP_RV515, /* R5xx-based cores. (GFX2) */
+	CHIP_R520,
+	CHIP_RV530,
+	CHIP_R580,
+	CHIP_RV560,
+	CHIP_RV570,
+	CHIP_R600, /* GFX3 (R6xx) */
+	CHIP_RV610,
+	CHIP_RV630,
+	CHIP_RV670,
+	CHIP_RV620,
+	CHIP_RV635,
+	CHIP_RS780,
+	CHIP_RS880,
+	CHIP_RV770, /* GFX3 (R7xx) */
+	CHIP_RV730,
+	CHIP_RV710,
+	CHIP_RV740,
+	CHIP_CEDAR, /* GFX4 (Evergreen) */
+	CHIP_REDWOOD,
+	CHIP_JUNIPER,
+	CHIP_CYPRESS,
+	CHIP_HEMLOCK,
+	CHIP_PALM,
+	CHIP_SUMO,
+	CHIP_SUMO2,
+	CHIP_BARTS,
+	CHIP_TURKS,
+	CHIP_CAICOS,
+	CHIP_CAYMAN, /* GFX5 (Northern Islands) */
+	CHIP_ARUBA,
+	CHIP_TAHITI, /* GFX6 (Southern Islands) */
+	CHIP_PITCAIRN,
+	CHIP_VERDE,
+	CHIP_OLAND,
+	CHIP_HAINAN,
+	CHIP_BONAIRE, /* GFX7 (Sea Islands) */
+	CHIP_KAVERI,
+	CHIP_KABINI,
+	CHIP_HAWAII,
+	CHIP_TONGA, /* GFX8 (Volcanic Islands & Polaris) */
+	CHIP_ICELAND,
+	CHIP_CARRIZO,
+	CHIP_FIJI,
+	CHIP_STONEY,
+	CHIP_POLARIS10,
+	CHIP_POLARIS11,
+	CHIP_POLARIS12,
+	CHIP_VEGAM,
+	CHIP_VEGA10, /* GFX9 (Vega) */
+	CHIP_VEGA12,
+	CHIP_VEGA20,
+	CHIP_RAVEN,
+	CHIP_RAVEN2,
+	CHIP_RENOIR,
+	CHIP_ARCTURUS,
+	CHIP_ALDEBARAN,
+	CHIP_NAVI10,
+	CHIP_NAVI12,
+	CHIP_NAVI14,
+	CHIP_SIENNA_CICHLID,
+	CHIP_NAVY_FLOUNDER,
+	CHIP_VANGOGH,
+	CHIP_DIMGREY_CAVEFISH,
+	CHIP_BEIGE_GOBY,
+	CHIP_YELLOW_CARP,
+	CHIP_LAST,
 };
 
-enum chip_class
-{
-   CLASS_UNKNOWN = 0,
-   R300,
-   R400,
-   R500,
-   R600,
-   R700,
-   EVERGREEN,
-   CAYMAN,
-   GFX6,
-   GFX7,
-   GFX8,
-   GFX9,
-   GFX10,
-   GFX10_3,
-
-   NUM_GFX_VERSIONS,
+enum chip_class {
+	CLASS_UNKNOWN = 0,
+	R300,
+	R400,
+	R500,
+	R600,
+	R700,
+	EVERGREEN,
+	CAYMAN,
+	GFX6,
+	GFX7,
+	GFX8,
+	GFX9,
+	GFX10,
+	GFX10_3,
+	NUM_GFX_VERSIONS
 };
 
-enum ring_type
-{
-   RING_GFX = 0,
-   RING_COMPUTE,
-   RING_DMA,
-   RING_UVD,
-   RING_VCE,
-   RING_UVD_ENC,
-   RING_VCN_DEC,
-   RING_VCN_ENC,
-   RING_VCN_JPEG,
-   NUM_RING_TYPES,
+enum ring_type {
+	RING_GFX = 0,
+	RING_COMPUTE,
+	RING_DMA,
+	RING_UVD,
+	RING_VCE,
+	RING_UVD_ENC,
+	RING_VCN_DEC,
+	RING_VCN_ENC,
+	RING_VCN_JPEG,
+	NUM_RING_TYPES,
 };
 
 const char *ac_get_family_name(enum radeon_family family);
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index dfae4935b..92c347d84 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -1,30 +1,8 @@
-/**
-***********************************************************************************************************************
-* SPDX-License-Identifier: MIT
-* Copyright © 2007-2021 Advanced Micro Devices, Inc.
-* Copyright 2022 Advanced Micro Devices, Inc.
-* All Rights Reserved.
-*
-* Permission is hereby granted, free of charge, to any person obtaining a
-* copy of this software and associated documentation files (the "Software"),
-* to deal in the Software without restriction, including without limitation
-* the rights to use, copy, modify, merge, publish, distribute, sublicense,
-* and/or sell copies of the Software, and to permit persons to whom the
-* Software is furnished to do so, subject to the following conditions:
-*
-* The above copyright notice and this permission notice shall be included in
-* all copies or substantial portions of the Software.
-*
-* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
-* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
-* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
-* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-* OTHER DEALINGS IN THE SOFTWARE
-*
-***********************************************************************************************************************
-*/
+/* SPDX-License-Identifier: MIT
+ * Copyright © 2007-2021 Advanced Micro Devices, Inc.
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ * Copyright 2023 Advanced Micro Devices, Inc.
+ */
 
 #ifndef _AMDGPU_ASIC_ADDR_H
 #define _AMDGPU_ASIC_ADDR_H
@@ -65,52 +43,52 @@
 
 #define AMDGPU_UNKNOWN          0xFF
 
-#define AMDGPU_TAHITI_RANGE     0x05, 0x14
-#define AMDGPU_PITCAIRN_RANGE   0x15, 0x28
-#define AMDGPU_CAPEVERDE_RANGE  0x29, 0x3C
-#define AMDGPU_OLAND_RANGE      0x3C, 0x46
-#define AMDGPU_HAINAN_RANGE     0x46, 0xFF
-
-#define AMDGPU_BONAIRE_RANGE    0x14, 0x28
-#define AMDGPU_HAWAII_RANGE     0x28, 0x3C
-
-#define AMDGPU_SPECTRE_RANGE    0x01, 0x41
-#define AMDGPU_SPOOKY_RANGE     0x41, 0x81
-#define AMDGPU_KALINDI_RANGE    0x81, 0xA1
-#define AMDGPU_GODAVARI_RANGE   0xA1, 0xFF
-
-#define AMDGPU_ICELAND_RANGE    0x01, 0x14
-#define AMDGPU_TONGA_RANGE      0x14, 0x28
-#define AMDGPU_FIJI_RANGE       0x3C, 0x50
-#define AMDGPU_POLARIS10_RANGE  0x50, 0x5A
-#define AMDGPU_POLARIS11_RANGE  0x5A, 0x64
-#define AMDGPU_POLARIS12_RANGE  0x64, 0x6E
-#define AMDGPU_VEGAM_RANGE      0x6E, 0xFF
-
-#define AMDGPU_CARRIZO_RANGE    0x01, 0x21
-#define AMDGPU_STONEY_RANGE     0x61, 0xFF
-
-#define AMDGPU_VEGA10_RANGE     0x01, 0x14
-#define AMDGPU_VEGA12_RANGE     0x14, 0x28
-#define AMDGPU_VEGA20_RANGE     0x28, 0x32
-#define AMDGPU_ARCTURUS_RANGE   0x32, 0x3C
-#define AMDGPU_ALDEBARAN_RANGE  0x3C, 0xFF
-
-#define AMDGPU_RAVEN_RANGE      0x01, 0x81
-#define AMDGPU_RAVEN2_RANGE     0x81, 0x91
-#define AMDGPU_RENOIR_RANGE     0x91, 0xFF
-
-#define AMDGPU_NAVI10_RANGE     0x01, 0x0A
-#define AMDGPU_NAVI12_RANGE     0x0A, 0x14
-#define AMDGPU_NAVI14_RANGE     0x14, 0x28
-#define AMDGPU_SIENNA_CICHLID_RANGE     0x28, 0x32
-#define AMDGPU_NAVY_FLOUNDER_RANGE      0x32, 0x3C
-#define AMDGPU_DIMGREY_CAVEFISH_RANGE   0x3C, 0x46
-#define AMDGPU_BEIGE_GOBY_RANGE         0x46, 0x50
-
-#define AMDGPU_VANGOGH_RANGE    0x01, 0xFF
-
-#define AMDGPU_YELLOW_CARP_RANGE 0x01, 0xFF
+#define AMDGPU_TAHITI_RANGE      0x05, 0x14
+#define AMDGPU_PITCAIRN_RANGE    0x15, 0x28
+#define AMDGPU_CAPEVERDE_RANGE   0x29, 0x3C
+#define AMDGPU_OLAND_RANGE       0x3C, 0x46
+#define AMDGPU_HAINAN_RANGE      0x46, 0xFF
+
+#define AMDGPU_BONAIRE_RANGE     0x14, 0x28
+#define AMDGPU_HAWAII_RANGE      0x28, 0x3C
+
+#define AMDGPU_SPECTRE_RANGE     0x01, 0x41
+#define AMDGPU_SPOOKY_RANGE      0x41, 0x81
+#define AMDGPU_KALINDI_RANGE     0x81, 0xA1
+#define AMDGPU_GODAVARI_RANGE    0xA1, 0xFF
+
+#define AMDGPU_ICELAND_RANGE     0x01, 0x14
+#define AMDGPU_TONGA_RANGE       0x14, 0x28
+#define AMDGPU_FIJI_RANGE        0x3C, 0x50
+#define AMDGPU_POLARIS10_RANGE   0x50, 0x5A
+#define AMDGPU_POLARIS11_RANGE   0x5A, 0x64
+#define AMDGPU_POLARIS12_RANGE   0x64, 0x6E
+#define AMDGPU_VEGAM_RANGE       0x6E, 0xFF
+
+#define AMDGPU_CARRIZO_RANGE     0x01, 0x21
+#define AMDGPU_STONEY_RANGE      0x61, 0xFF
+
+#define AMDGPU_VEGA10_RANGE      0x01, 0x14
+#define AMDGPU_VEGA12_RANGE      0x14, 0x28
+#define AMDGPU_VEGA20_RANGE      0x28, 0x32
+#define AMDGPU_ARCTURUS_RANGE    0x32, 0x3C
+#define AMDGPU_ALDEBARAN_RANGE   0x3C, 0xFF
+
+#define AMDGPU_RAVEN_RANGE       0x01, 0x81
+#define AMDGPU_RAVEN2_RANGE      0x81, 0x91
+#define AMDGPU_RENOIR_RANGE      0x91, 0xFF
+
+#define AMDGPU_NAVI10_RANGE      0x01, 0x0A
+#define AMDGPU_NAVI12_RANGE      0x0A, 0x14
+#define AMDGPU_NAVI14_RANGE      0x14, 0x28
+#define AMDGPU_SIENNA_CICHLID_RANGE      0x28, 0x32
+#define AMDGPU_NAVY_FLOUNDER_RANGE       0x32, 0x3C
+#define AMDGPU_DIMGREY_CAVEFISH_RANGE    0x3C, 0x46
+#define AMDGPU_BEIGE_GOBY_RANGE          0x46, 0x50
+
+#define AMDGPU_VANGOGH_RANGE      0x01, 0xFF
+
+#define AMDGPU_YELLOW_CARP_RANGE  0x01, 0xFF
 
 #define AMDGPU_EXPAND_FIX(x) x
 #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
-- 
2.25.1
