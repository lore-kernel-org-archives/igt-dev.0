Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC47606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 03:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F8810E2C8;
	Thu, 12 Nov 2026 03:50:49 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (unknown [165.204.217.251])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3056C10E2C8
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 03:45:55 +0000 (UTC)
Received: from amd-X570-AORUS-ELITE.amd.com (localhost [127.0.0.1])
 by amd-X570-AORUS-ELITE.amd.com (8.18.1/8.18.1/Debian-2) with ESMTP id
 6AC3a15t701722; Thu, 12 Nov 2026 09:06:01 +0530
Received: (from amd@localhost)
 by amd-X570-AORUS-ELITE.amd.com (8.18.1/8.18.1/Submit) id 6AC3a1aq701715;
 Thu, 12 Nov 2026 09:06:01 +0530
From: Sunil Khatri <sunil.khatri@amd.com>
To: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Subject: [PATCH 1/5] lib/amdgpu: add gfx13 family id
Date: Thu, 12 Nov 2026 09:05:56 +0530
Message-ID: <20261112033600.701688-1-sunil.khatri@amd.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add support of gfx13 family ID.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 lib/amdgpu/amd_family.h       | 2 ++
 lib/amdgpu/amd_ip_blocks.c    | 9 ++++++++-
 lib/amdgpu/amdgpu_asic_addr.h | 3 +++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_family.h b/lib/amdgpu/amd_family.h
index 3b1582995..b3443482b 100644
--- a/lib/amdgpu/amd_family.h
+++ b/lib/amdgpu/amd_family.h
@@ -110,6 +110,7 @@ enum radeon_family {
 	CHIP_GFX1153,
 	CHIP_GFX1154,
 	CHIP_GFX1200,
+	CHIP_GFX1300,
 	CHIP_LAST,
 };
 
@@ -130,6 +131,7 @@ enum chip_class {
 	GFX10_3,
 	GFX11,
 	GFX12,
+	GFX13,
 	NUM_GFX_VERSIONS
 };
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 8abde9228..d9374381c 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1486,6 +1486,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		{"GFX10_3",				GFX10_3},
 		{"GFX11",				GFX11},
 		{"GFX12",				GFX12},
+		{"GFX13",				GFX13},
 		{},
 	};
 	struct chip_info *info = &g_chip;
@@ -1578,6 +1579,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case FAMILY_GFX1200:
 		identify_chip(GFX1200);
 		break;
+	case FAMILY_GFX1300:
+		identify_chip(GFX1300);
+		break;
 	}
 	if (!info->name) {
 		igt_info("amdgpu: unknown (family_id, chip_external_rev): (%u, %u)\n",
@@ -1587,7 +1591,9 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	igt_info("amdgpu: %s (family_id, chip_external_rev): (%u, %u)\n",
 				info->name, amdinfo->family_id, amdinfo->chip_external_rev);
 
-	if (info->family >= CHIP_GFX1200) {
+	if (info->family >= CHIP_GFX1300) {
+		info->chip_class = GFX13;
+	} else if (info->family >= CHIP_GFX1200) {
 		info->chip_class = GFX12;
 	} else if (info->family >= CHIP_GFX1100) {
 		info->chip_class = GFX11;
@@ -1620,6 +1626,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 	case GFX10_3: /* tested */
 	case GFX11: /* tested */
 	case GFX12: /* tested */
+	case GFX13: /* tested */
 		/* extra precaution if re-factor again */
 		igt_assert_eq(gfx_v8_x_ip_block.major, 8);
 		igt_assert_eq(compute_v8_x_ip_block.major, 8);
diff --git a/lib/amdgpu/amdgpu_asic_addr.h b/lib/amdgpu/amdgpu_asic_addr.h
index 8b6910751..dc6b80af5 100644
--- a/lib/amdgpu/amdgpu_asic_addr.h
+++ b/lib/amdgpu/amdgpu_asic_addr.h
@@ -33,6 +33,7 @@
 #define FAMILY_GFX1154 0x9a
 #define FAMILY_GFX1037 0x97
 #define FAMILY_GFX1200 0x98
+#define FAMILY_GFX1300 0x99
 
 // AMDGPU_FAMILY_IS(familyId, familyName)
 #define FAMILY_IS(f, fn)     (f == FAMILY_##fn)
@@ -116,6 +117,7 @@
 #define AMDGPU_GFX1153_RANGE     0x50, 0xC0 //# 80 <= x < 192
 #define AMDGPU_GFX1154_RANGE     0x01, 0x80 //# 01 <= x < 128
 #define AMDGPU_GFX1200_RANGE     0x01, 0xFF //# 01 <= x < 255
+#define AMDGPU_GFX1300_RANGE     0x01, 0x50 //# 01 <= x < 80
 
 #define AMDGPU_EXPAND_FIX(x) x
 #define AMDGPU_RANGE_HELPER(val, min, max) ((val >= min) && (val < max))
@@ -185,5 +187,6 @@
 #define ASICREV_IS_GFX1152(r)          ASICREV_IS(r, GFX1152)
 #define ASICREV_IS_GFX1153(r)          ASICREV_IS(r, GFX1153)
 #define ASICREV_IS_GFX1200(r)          ASICREV_IS(r, GFX1200)
+#define ASICREV_IS_GFX1300(r)          ASICREV_IS(r, GFX1300)
 
 #endif // _AMDGPU_ASIC_ADDR_H
-- 
2.43.0

