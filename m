Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E994510E11F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 15:49:15 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 08:49:12 -0700
Message-Id: <20231004154922.3478014-4-lucas.demarchi@intel.com>
In-Reply-To: <20231004154922.3478014-1-lucas.demarchi@intel.com>
References: <20231004154922.3478014-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 03/13] lib/gpu_cmds: Reorder if/else
 ladder according to IP version
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Make it easier to follow the flow by following the convention of "latest
platform earlier".

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/gpu_cmds.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 648451f74..0fd8f8213 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -270,17 +270,15 @@ fill_binding_table(struct intel_bb *ibb, struct intel_buf *buf)
 	binding_table = intel_bb_ptr(ibb);
 	intel_bb_ptr_add(ibb, 64);
 
-	if (IS_GEN7(devid))
-		binding_table[0] = gen7_fill_surface_state(ibb, buf,
-							   SURFACEFORMAT_R8_UNORM, 1);
-
-	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+	if (intel_graphics_ver(devid) >= IP_VER(12, 50))
 		binding_table[0] = xehp_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
-
-	else
+	else if (intel_graphics_ver(devid) >= IP_VER(8, 0))
 		binding_table[0] = gen8_fill_surface_state(ibb, buf,
 							   SURFACEFORMAT_R8_UNORM, 1);
+	else
+		binding_table[0] = gen7_fill_surface_state(ibb, buf,
+							   SURFACEFORMAT_R8_UNORM, 1);
 
 	return binding_table_offset;
 }
-- 
2.40.1
