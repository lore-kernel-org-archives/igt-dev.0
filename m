Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20626.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::626])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC3D310E0EF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Sep 2023 18:51:56 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 5 Sep 2023 14:51:46 -0400
Message-ID: <20230905185146.76834-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] lib/amdgpu: add GFX1036,
 GFX1037 chips for IGT tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alex Deucher <alexander.deucher@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jesse Zhang <jesse.zhang@amd.com>

Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com> 
---
 lib/amdgpu/amd_family.h       | 2 ++
 lib/amdgpu/amd_ip_blocks.c    | 6 ++++++
 lib/amdgpu/amdgpu_asic_addr.h | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 5b172d3a7..9e534208d 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -97,6 +97,8 @@ enum radeon_family {
 	CHIP_DIMGREY_CAVEFISH,
 	CHIP_BEIGE_GOBY,
 	CHIP_YELLOW_CARP,
+	CHIP_GFX1036,
+	CHIP_GFX1037,
 	CHIP_GFX1100,
 	CHIP_GFX1101,
 	CHIP_GFX1102,
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 02dcaa431..be9ff38c6 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -620,6 +620,12 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case FAMILY_YC:
 		identify_chip(YELLOW_CARP);
 		break;
+	case FAMILY_GFX1036:
+		identify_chip(GFX1036);
+		break;
+	case FAMILY_GFX1037:
+		identify_chip(GFX1037);
+		break;
 	case FAMILY_GFX1100:
 		identify_chip(GFX1100);
 		identify_chip(GFX1101);
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 5e600e305..1178a920e 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -28,6 +28,8 @@
 #define FAMILY_GFX1100 0x91
 #define FAMILY_YC      0x92
 #define FAMILY_GFX1103 0x94
+#define FAMILY_GFX1036 0x95
+#define FAMILY_GFX1037 0x97
 
 // AMDGPU_FAMILY_IS(familyId, familyName)
 #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
@@ -42,6 +44,8 @@
 #define FAMILY_IS_RV(f)      FAMILY_IS(f, RV)
 #define FAMILY_IS_NV(f)      FAMILY_IS(f, NV)
 #define FAMILY_IS_YC(f)      FAMILY_IS(f, YC)
+#define FAMILY_IS_GFX1036(f) FAMILY_IS(f, GFX1036)
+#define FAMILY_IS_GFX1037(f) FAMILY_IS(f, GFX1037)
 #define FAMILY_IS_GFX1100(f) FAMILY_IS(f, GFX1100)
 
 #define AMDGPU_UNKNOWN          0xFF
@@ -91,6 +95,8 @@
 #define AMDGPU_BEIGE_GOBY_RANGE          0x46, 0x50
 #define AMDGPU_VANGOGH_RANGE      0x01, 0xFF
 #define AMDGPU_YELLOW_CARP_RANGE  0x01, 0xFF
+#define AMDGPU_GFX1036_RANGE  0x01, 0xFF
+#define AMDGPU_GFX1037_RANGE  0x01, 0xFF
 
 
 #define AMDGPU_GFX1100_RANGE     0x01, 0x10 //# 01 <= x < 16
@@ -153,6 +159,8 @@
 
 #define ASICREV_IS_VANGOGH(r)          ASICREV_IS(r, VANGOGH)
 #define ASICREV_IS_YELLOW_CARP(r)      ASICREV_IS(r, YELLOW_CARP)
+#define ASICREV_IS_GFX1036(r)          ASICREV_IS(r, GFX1036)
+#define ASICREV_IS_GFX1037(r)          ASICREV_IS(r, GFX1037)
 
 #define ASICREV_IS_GFX1100(r)          ASICREV_IS(r, GFX1100)
 #define ASICREV_IS_GFX1101(r)          ASICREV_IS(r, GFX1101)
-- 
2.25.1
