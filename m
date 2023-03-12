Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF5110E272
 for <igt-dev@lists.freedesktop.org>; Sun, 12 Mar 2023 19:07:13 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 13 Mar 2023 00:34:14 +0530
Message-Id: <20230312190416.1056981-2-vikas.srivastava@intel.com>
In-Reply-To: <20230312190416.1056981-1-vikas.srivastava@intel.com>
References: <20230312190416.1056981-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/intel_batchbuffer: Enable
 XY_FAST_COPY_BLT support for api_intel_bb
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

Test case uses legacy command XY_SRC_COPY_BLT_CMD which is not supported
starting from PVC. Modified test to use XY_FAST_COPY_BLT.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 lib/intel_batchbuffer.c | 54 ++++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 8695f1b7ac..dae49ee1bc 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2339,11 +2339,15 @@ uint32_t intel_bb_copy_data(struct intel_bb *ibb,
  */
 void intel_bb_blit_start(struct intel_bb *ibb, uint32_t flags)
 {
-	intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
-		     XY_SRC_COPY_BLT_WRITE_ALPHA |
-		     XY_SRC_COPY_BLT_WRITE_RGB |
-		     flags |
-		     (6 + 2 * (ibb->gen >= 8)));
+	if (intel_graphics_ver(ibb->devid) >= IP_VER(12, 60))
+		intel_bb_out(ibb, XY_FAST_COPY_BLT | flags);
+	else
+
+		intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
+			     XY_SRC_COPY_BLT_WRITE_ALPHA |
+			     XY_SRC_COPY_BLT_WRITE_RGB |
+			     flags |
+			     (6 + 2 * (ibb->gen >= 8)));
 }
 
 /*
@@ -2381,12 +2385,18 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
 
 	if (gen >= 4 && src->tiling != I915_TILING_NONE) {
 		src_pitch /= 4;
-		cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
+		if (intel_graphics_ver(ibb->devid) >= IP_VER(12, 60))
+			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
+		else
+			cmd_bits |= XY_SRC_COPY_BLT_SRC_TILED;
 	}
 
 	if (gen >= 4 && dst->tiling != I915_TILING_NONE) {
 		dst_pitch /= 4;
-		cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
+		if (intel_graphics_ver(ibb->devid) >= IP_VER(12, 60))
+			cmd_bits |= fast_copy_dword0(src->tiling, dst->tiling);
+		else
+			cmd_bits |= XY_SRC_COPY_BLT_DST_TILED;
 	}
 
 	CHECK_RANGE(src_x1); CHECK_RANGE(src_y1);
@@ -2397,19 +2407,23 @@ void intel_bb_emit_blt_copy(struct intel_bb *ibb,
 	CHECK_RANGE(src_pitch); CHECK_RANGE(dst_pitch);
 
 	br13_bits = 0;
-	switch (bpp) {
-	case 8:
-		break;
-	case 16:		/* supporting only RGB565, not ARGB1555 */
-		br13_bits |= 1 << 24;
-		break;
-	case 32:
-		br13_bits |= 3 << 24;
-		cmd_bits |= (XY_SRC_COPY_BLT_WRITE_ALPHA |
-			     XY_SRC_COPY_BLT_WRITE_RGB);
-		break;
-	default:
-		igt_fail(IGT_EXIT_FAILURE);
+	if (intel_graphics_ver(ibb->devid) < IP_VER(12, 60)) {
+		switch (bpp) {
+		case 8:
+			break;
+		case 16:		/* supporting only RGB565, not ARGB1555 */
+			br13_bits |= 1 << 24;
+			break;
+		case 32:
+			br13_bits |= 3 << 24;
+			cmd_bits |= (XY_SRC_COPY_BLT_WRITE_ALPHA |
+				     XY_SRC_COPY_BLT_WRITE_RGB);
+			break;
+		default:
+			igt_fail(IGT_EXIT_FAILURE);
+		}
+	} else {
+		br13_bits = fast_copy_dword1(src->tiling, dst->tiling, bpp);
 	}
 
 	if ((src->tiling | dst->tiling) >= I915_TILING_Y) {
-- 
2.25.1
