Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D2910E03A
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Sep 2023 02:42:41 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 1 Sep 2023 22:42:32 -0400
Message-ID: <20230902024232.135892-3-vitaly.prosyak@amd.com>
In-Reply-To: <20230902024232.135892-1-vitaly.prosyak@amd.com>
References: <20230902024232.135892-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 3/3] lib/amdgpu: add chip details to match the
 amdgpu kernel
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
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: I60ca4c23485c744532a6e083fe3f0f640130f967
---
 lib/amdgpu/amd_family.h       |  6 ++++++
 lib/amdgpu/amd_ip_blocks.c    | 16 ++++++++++++++--
 lib/amdgpu/amdgpu_asic_addr.h | 21 +++++++++++++++++----
 3 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index bf3431bc1..5b172d3a7 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -97,6 +97,11 @@ enum radeon_family {
 	CHIP_DIMGREY_CAVEFISH,
 	CHIP_BEIGE_GOBY,
 	CHIP_YELLOW_CARP,
+	CHIP_GFX1100,
+	CHIP_GFX1101,
+	CHIP_GFX1102,
+	CHIP_GFX1103_R1,
+	CHIP_GFX1103_R2,
 	CHIP_LAST,
 };
 
@@ -115,6 +120,7 @@ enum chip_class {
 	GFX9,
 	GFX10,
 	GFX10_3,
+	GFX11,
 	NUM_GFX_VERSIONS
 };
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 99f1ea7fb..02dcaa431 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -557,6 +557,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		{"GFX9",				GFX9},
 		{"GFX10",				GFX10},
 		{"GFX10_3",				GFX10_3},
+		{"GFX11",				GFX11},
 		{},
 	};
 	struct chip_info *info = &g_chip;
@@ -619,6 +620,15 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case FAMILY_YC:
 		identify_chip(YELLOW_CARP);
 		break;
+	case FAMILY_GFX1100:
+		identify_chip(GFX1100);
+		identify_chip(GFX1101);
+		identify_chip(GFX1102);
+		break;
+	case FAMILY_GFX1103:
+		identify_chip(GFX1103_R1);
+		identify_chip(GFX1103_R2);
+		break;
 	}
 	if (!info->name) {
 		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
@@ -629,7 +639,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 				info->name, amdinfo->family_id, amdinfo->chip_external_rev);
 	}
 
-	if (info->family >= CHIP_SIENNA_CICHLID) {
+	if (info->family >= CHIP_GFX1100) {
+		info->chip_class = GFX11;
+	} else if (info->family >= CHIP_SIENNA_CICHLID) {
 		info->chip_class = GFX10_3;
 	} else if (info->family >= CHIP_NAVI10) {
 		info->chip_class = GFX10;
@@ -668,7 +680,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		igt_assert_eq(sdma_v3_x_ip_block.funcs->family_id, FAMILY_VI);
 		break;
 	default:
-		igt_info("amdgpu: GFX or old.\n");
+		igt_info("amdgpu: GFX11 or old.\n");
 		return -1;
 	}
 	info->dev = device;
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 92c347d84..5e600e305 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -25,7 +25,9 @@
 #define FAMILY_RV      0x8E
 #define FAMILY_NV      0x8F
 #define FAMILY_VGH     0x90
+#define FAMILY_GFX1100 0x91
 #define FAMILY_YC      0x92
+#define FAMILY_GFX1103 0x94
 
 // AMDGPU_FAMILY_IS(familyId, familyName)
 #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
@@ -40,6 +42,7 @@
 #define FAMILY_IS_RV(f)      FAMILY_IS(f, RV)
 #define FAMILY_IS_NV(f)      FAMILY_IS(f, NV)
 #define FAMILY_IS_YC(f)      FAMILY_IS(f, YC)
+#define FAMILY_IS_GFX1100(f) FAMILY_IS(f, GFX1100)
 
 #define AMDGPU_UNKNOWN          0xFF
 
@@ -74,6 +77,7 @@
 #define AMDGPU_ARCTURUS_RANGE    0x32, 0x3C
 #define AMDGPU_ALDEBARAN_RANGE   0x3C, 0xFF
 
+
 #define AMDGPU_RAVEN_RANGE       0x01, 0x81
 #define AMDGPU_RAVEN2_RANGE      0x81, 0x91
 #define AMDGPU_RENOIR_RANGE      0x91, 0xFF
@@ -85,16 +89,20 @@
 #define AMDGPU_NAVY_FLOUNDER_RANGE       0x32, 0x3C
 #define AMDGPU_DIMGREY_CAVEFISH_RANGE    0x3C, 0x46
 #define AMDGPU_BEIGE_GOBY_RANGE          0x46, 0x50
-
 #define AMDGPU_VANGOGH_RANGE      0x01, 0xFF
-
 #define AMDGPU_YELLOW_CARP_RANGE  0x01, 0xFF
 
+
+#define AMDGPU_GFX1100_RANGE     0x01, 0x10 //# 01 <= x < 16
+#define AMDGPU_GFX1101_RANGE     0x20, 0xFF //# 32 <= x < 255
+#define AMDGPU_GFX1102_RANGE     0x10, 0x20 //# 16 <= x < 32
+#define AMDGPU_GFX1103_R1_RANGE  0x01, 0x80 //# 1 <= x < 128
+#define AMDGPU_GFX1103_R2_RANGE  0x80, 0xFF //# 128 <= x < max
+
 #define AMDGPU_EXPAND_FIX(x) x
 #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
 #define AMDGPU_IN_RANGE(val, ...)   AMDGPU_EXPAND_FIX(AMDGPU_RANGE_HELPER(val, __VA_ARGS__))
 
-
 // ASICREV_IS(eRevisionId, revisionName)
 #define ASICREV_IS(r, rn)              AMDGPU_IN_RANGE(r, AMDGPU_##rn##_RANGE)
 #define ASICREV_IS_TAHITI_P(r)         ASICREV_IS(r, TAHITI)
@@ -144,7 +152,12 @@
 #define ASICREV_IS_BEIGE_GOBY(r)       ASICREV_IS(r, BEIGE_GOBY)
 
 #define ASICREV_IS_VANGOGH(r)          ASICREV_IS(r, VANGOGH)
-
 #define ASICREV_IS_YELLOW_CARP(r)      ASICREV_IS(r, YELLOW_CARP)
 
+#define ASICREV_IS_GFX1100(r)          ASICREV_IS(r, GFX1100)
+#define ASICREV_IS_GFX1101(r)          ASICREV_IS(r, GFX1101)
+#define ASICREV_IS_GFX1102(r)          ASICREV_IS(r, GFX1102)
+#define ASICREV_IS_GFX1103_R1(r)       ASICREV_IS(r, GFX1103_R1)
+#define ASICREV_IS_GFX1103_R2(r)       ASICREV_IS(r, GFX1103_R2)
+
 #endif // _AMDGPU_ASIC_ADDR_H
-- 
2.25.1
