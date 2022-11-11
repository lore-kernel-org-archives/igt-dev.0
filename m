Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319EF10E1AF
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 21:52:30 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 11 Nov 2022 16:52:06 -0500
Message-ID: <20221111215213.48679-2-vitaly.prosyak@amd.com>
In-Reply-To: <20221111215213.48679-1-vitaly.prosyak@amd.com>
References: <20221111215213.48679-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 2/9] lib/amdgpu: add predefined constants for PM4
 and SDMA
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Pierre-eric
 Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>, marek.olsak@amd.com,
 christian.koenig@amd.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Pierre-eric Pelloux-prayer <Pierre-eric.Pelloux-prayer@amd.com>
---
 lib/amdgpu/amd_PM4.h  | 43 +++++++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_sdma.h |  3 +++
 2 files changed, 46 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index ec4de1f62..7672da034 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -169,4 +169,47 @@
 #define PACKET3_SET_UCONFIG_REG			0x79
 #define PACKET3_DRAW_INDEX_AUTO			0x2D
 
+#define	PACKET3_WAIT_REG_MEM				0x3C
+#define		WAIT_REG_MEM_FUNCTION(x)                ((x) << 0)
+		/* 0 - always
+		 * 1 - <
+		 * 2 - <=
+		 * 3 - ==
+		 * 4 - !=
+		 * 5 - >=
+		 * 6 - >
+		 */
+#define		WAIT_REG_MEM_MEM_SPACE(x)               ((x) << 4)
+		/* 0 - reg
+		 * 1 - mem
+		 */
+#define		WAIT_REG_MEM_OPERATION(x)               ((x) << 6)
+		/* 0 - wait_reg_mem
+		 * 1 - wr_wait_wr_reg
+		 */
+#define		WAIT_REG_MEM_ENGINE(x)                  ((x) << 8)
+		/* 0 - me
+		 * 1 - pfp
+		 */
+
+#define	PACKET3_WRITE_DATA				0x37
+#define		WRITE_DATA_DST_SEL(x)                   ((x) << 8)
+		/* 0 - register
+		 * 1 - memory (sync - via GRBM)
+		 * 2 - gl2
+		 * 3 - gds
+		 * 4 - reserved
+		 * 5 - memory (async - direct)
+		 */
+#define		WR_ONE_ADDR                             (1 << 16)
+#define		WR_CONFIRM                              (1 << 20)
+#define		WRITE_DATA_CACHE_POLICY(x)              ((x) << 25)
+		/* 0 - LRU
+		 * 1 - Stream
+		 */
+#define		WRITE_DATA_ENGINE_SEL(x)                ((x) << 30)
+		/* 0 - me
+		 * 1 - pfp
+		 * 2 - ce
+		 */
 #endif
diff --git a/lib/amdgpu/amd_sdma.h b/lib/amdgpu/amd_sdma.h
index 630535bb1..102df1024 100644
--- a/lib/amdgpu/amd_sdma.h
+++ b/lib/amdgpu/amd_sdma.h
@@ -35,6 +35,9 @@
 	/* 0 = byte fill
 	 * 2 = DW fill
 	 */
+
+#define SDMA_OP_POLL_REGMEM  8
+
 #define SDMA_PACKET(op, sub_op, e)	((((e) & 0xFFFF) << 16) |	\
 					(((sub_op) & 0xFF) << 8) |	\
 					(((op) & 0xFF) << 0))
-- 
2.25.1
