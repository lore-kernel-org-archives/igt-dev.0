Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CC611BDFD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Jul 2022 20:57:14 +0000 (UTC)
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 22 Jul 2022 16:56:48 -0400
Message-ID: <20220722205650.4791-5-vitaly.prosyak@amd.com>
In-Reply-To: <20220722205650.4791-1-vitaly.prosyak@amd.com>
References: <20220722205650.4791-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH 5/7] lib/amdgpu: add ASIC gfx 8 registers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_PM4.h | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 7de115c87..dec70c1a4 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -158,18 +158,29 @@
 #define     CONTEXT_CONTROL_LOAD_CE_RAM(x)     (((unsigned)(x) & 0x1) << 28)
 #define     CONTEXT_CONTROL_SHADOW_ENABLE(x)   (((unsigned)(x) & 0x1) << 31)
 
-#define PKT3_CLEAR_STATE                       0x12
+#define PKT3_CLEAR_STATE			0x12
 
-#define PKT3_SET_SH_REG                        0x76
-#define		PACKET3_SET_SH_REG_START			0x00002c00
+#define PKT3_SET_SH_REG				0x76
+#define	PACKET3_SET_SH_REG_START		0x00002c00
 
 #define PKT3_SET_SH_REG_INDEX			0x9B
 
-#define	PACKET3_DISPATCH_DIRECT				0x15
-#define PACKET3_EVENT_WRITE				0x46
-#define PACKET3_ACQUIRE_MEM				0x58
-#define PACKET3_SET_CONTEXT_REG				0x69
-#define PACKET3_SET_UCONFIG_REG				0x79
-#define PACKET3_DRAW_INDEX_AUTO				0x2D
+#define	PACKET3_DISPATCH_DIRECT			0x15
+#define PACKET3_EVENT_WRITE			0x46
+#define PACKET3_ACQUIRE_MEM			0x58
+#define PACKET3_SET_CONTEXT_REG			0x69
+#define PACKET3_SET_UCONFIG_REG			0x79
+#define PACKET3_DRAW_INDEX_AUTO			0x2D
+
+/*TODO organize as iit is in MESA*/
+/* gfx 8 */
+#define mmCOMPUTE_PGM_LO			0x2e0c
+#define mmCOMPUTE_PGM_RSRC1			0x2e12
+#define mmCOMPUTE_TMPRING_SIZE			0x2e18
+#define mmCOMPUTE_USER_DATA_0			0x2e40
+#define mmCOMPUTE_USER_DATA_1			0x2e41
+#define mmCOMPUTE_RESOURCE_LIMITS		0x2e15
+#define mmCOMPUTE_NUM_THREAD_X			0x2e07
+
 
 #endif
-- 
2.25.1
