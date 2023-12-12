Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19C710E53A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 01:13:33 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v5 1/6] lib: Add blt command properties for lunarlake
Date: Tue, 12 Dec 2023 05:13:10 -0800
Message-Id: <abc1347fe6a34f6d72d11c47f822b00aa7cc41ec.1702386259.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702386259.git.akshata.jahagirdar@intel.com>
References: <cover.1702386259.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 akshata.jahagirdar@intel.com, matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add blt_cmd_info struct to describe properties of XY_BLOCK_COPY for XE2 platform.
Reuse XY_FAST_COPY struct from DG2 and Update the definitions for Lunarlake.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_cmds_info.c   | 16 ++++++++++++++++
 lib/intel_cmds_info.h   |  1 +
 lib/intel_device_info.c |  2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index 2e51ec081..56073bd6d 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -67,6 +67,15 @@ static const struct blt_cmd_info
 						 BLT_CMD_EXTENDED |
 						 BLT_CMD_SUPPORTS_COMPRESSION);
 
+static const struct blt_cmd_info
+		xe2_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
+						 BIT(T_LINEAR) |
+						 BIT(T_XMAJOR) |
+						 BIT(T_TILE4)  |
+						 BIT(T_TILE64),
+						 BLT_CMD_EXTENDED |
+						 BLT_CMD_SUPPORTS_COMPRESSION);
+
 static const struct blt_cmd_info
 		mtl_xy_block_copy = BLT_INFO_EXT(XY_BLOCK_COPY,
 						 BIT(T_LINEAR) |
@@ -169,6 +178,13 @@ const struct intel_cmds_info gen12_pvc_cmds_info = {
 	}
 };
 
+const struct intel_cmds_info xe2_cmds_info  = {
+	.blt_cmds = {
+		[XY_FAST_COPY] = &dg2_xy_fast_copy,
+		[XY_BLOCK_COPY] = &xe2_xy_block_copy,
+	}
+};
+
 const struct blt_cmd_info *blt_get_cmd_info(const struct intel_cmds_info *cmds_info,
 					    enum blt_cmd_type cmd)
 {
diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
index f9e3932d1..0a83b6a44 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -55,6 +55,7 @@ extern const struct intel_cmds_info gen12_cmds_info;
 extern const struct intel_cmds_info gen12_dg2_cmds_info;
 extern const struct intel_cmds_info gen12_mtl_cmds_info;
 extern const struct intel_cmds_info gen12_pvc_cmds_info;
+extern const struct intel_cmds_info xe2_cmds_info;
 
 #define for_each_tiling(__tiling) \
 	for (__tiling = T_LINEAR; __tiling < __BLT_MAX_TILING; __tiling++)
diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 34817f7b6..a669797c3 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -511,7 +511,7 @@ static const struct intel_device_info intel_lunarlake_info = {
 	.has_4tile = true,
 	.is_lunarlake = true,
 	.codename = "lunarlake",
-	.cmds_info = &gen12_pvc_cmds_info,
+	.cmds_info = &xe2_cmds_info,
 };
 
 static const struct pci_id_match intel_device_match[] = {
-- 
2.34.1
