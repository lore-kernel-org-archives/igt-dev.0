Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1118010E746
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 10:27:32 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Wed, 16 Feb 2022 15:56:28 +0530
Message-Id: <20220216102633.26949-11-jeevan.b@intel.com>
In-Reply-To: <20220216102633.26949-1-jeevan.b@intel.com>
References: <20220216102633.26949-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 10/15] lib/igt_draw: Use
 XY_FAST_COLOR_BLT on DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

The XY_COLOR_BLT instruction used by igt_draw's blitter implementation
doesn't support F-tile (plus we've heard informally from the hardware
team that the instruction is deprecated in general).  Switch to
XY_FAST_COLOR_BLT to perform our solid fills on DG2.  This instruction
will also allow us to extend the igt_draw support to 64bit+ color depths
in the future too if we have tests that start wanting to test that.

Note that we don't currently pass enough information down to this
routine to pick an appropriate value for the smem vs lmem performance
hint bit, but that doesn't impact the output generated.

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_draw.c  | 107 ++++++++++++++++++++++++++++++++++++------------
 lib/intel_reg.h |   2 +
 2 files changed, 83 insertions(+), 26 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index d78ecdf0..056101b9 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -666,36 +666,91 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
 	ibb = intel_bb_create(fd, PAGE_SIZE);
 	intel_bb_add_intel_buf(ibb, dst, true);
 
-	switch (buf->bpp) {
-	case 8:
-		blt_cmd_depth = 0;
-		break;
-	case 16: /* we're assuming 565 */
-		blt_cmd_depth = 1 << 24;
-		break;
-	case 32:
-		blt_cmd_depth = 3 << 24;
-		break;
-	default:
-		igt_assert(false);
-	}
+	if (IS_DG2(intel_get_drm_devid(fd))) {
+		int buf_height = buf->size / buf->stride;
+
+		switch (buf->bpp) {
+		case 8:
+			blt_cmd_depth = 0;
+			break;
+		case 16: /* we're assuming 565 */
+			blt_cmd_depth = 1 << 19;
+			break;
+		case 32:
+			blt_cmd_depth = 2 << 19;
+			break;
+		case 64:
+			/* Not used or supported yet */
+		default:
+			igt_assert(false);
+		}
+
+		switch (tiling) {
+		case I915_TILING_NONE:
+			blt_cmd_tiling = 0;
+			break;
+		case I915_TILING_X:
+			blt_cmd_tiling = 1 << 30;
+			break;
+		case I915_TILING_4:
+			blt_cmd_tiling = 2 << 30;
+			break;
+		default:
+			igt_assert(false);
+		}
+
+		pitch = tiling ? buf->stride / 4 : buf->stride;
+
+		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
+		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
+		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
+		intel_bb_out(ibb, (rect->y << 16) | rect->x);
+		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
+		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
+					   I915_GEM_DOMAIN_RENDER, 0,
+					   dst->addr.offset);
+		intel_bb_out(ibb, 0);	/* TODO: Pass down enough info for target memory hint */
+		intel_bb_out(ibb, color);
+		intel_bb_out(ibb, 0);	/* 64 bit color */
+		intel_bb_out(ibb, 0);	/* 96 bit color */
+		intel_bb_out(ibb, 0);	/* 128 bit color */
+		intel_bb_out(ibb, 0);	/* clear address */
+		intel_bb_out(ibb, 0);	/* clear address */
+		intel_bb_out(ibb, (1 << 29) | ((pitch-1) << 14) | (buf_height-1));
+		intel_bb_out(ibb, 0);	/* mipmap levels / qpitch */
+		intel_bb_out(ibb, 0);	/* mipmap index / alignment */
+	} else {
+		switch (buf->bpp) {
+		case 8:
+			blt_cmd_depth = 0;
+			break;
+		case 16: /* we're assuming 565 */
+			blt_cmd_depth = 1 << 24;
+			break;
+		case 32:
+			blt_cmd_depth = 3 << 24;
+			break;
+		default:
+			igt_assert(false);
+		}
 
-	blt_cmd_len = (gen >= 8) ?  0x5 : 0x4;
-	blt_cmd_tiling = (tiling) ? XY_COLOR_BLT_TILED : 0;
-	pitch = (gen >= 4 && tiling) ? buf->stride / 4 : buf->stride;
+		blt_cmd_len = (gen >= 8) ?  0x5 : 0x4;
+		blt_cmd_tiling = (tiling) ? XY_COLOR_BLT_TILED : 0;
+		pitch = (gen >= 4 && tiling) ? buf->stride / 4 : buf->stride;
 
-	switch_blt_tiling(ibb, tiling, true);
+		switch_blt_tiling(ibb, tiling, true);
 
-	intel_bb_out(ibb, XY_COLOR_BLT_CMD_NOLEN | XY_COLOR_BLT_WRITE_ALPHA |
-		     XY_COLOR_BLT_WRITE_RGB | blt_cmd_tiling | blt_cmd_len);
-	intel_bb_out(ibb, blt_cmd_depth | (0xF0 << 16) | pitch);
-	intel_bb_out(ibb, (rect->y << 16) | rect->x);
-	intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
-	intel_bb_emit_reloc_fenced(ibb, dst->handle, 0, I915_GEM_DOMAIN_RENDER,
-				   0, dst->addr.offset);
-	intel_bb_out(ibb, color);
+		intel_bb_out(ibb, XY_COLOR_BLT_CMD_NOLEN | XY_COLOR_BLT_WRITE_ALPHA |
+			     XY_COLOR_BLT_WRITE_RGB | blt_cmd_tiling | blt_cmd_len);
+		intel_bb_out(ibb, blt_cmd_depth | (0xF0 << 16) | pitch);
+		intel_bb_out(ibb, (rect->y << 16) | rect->x);
+		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
+		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0, I915_GEM_DOMAIN_RENDER,
+					   0, dst->addr.offset);
+		intel_bb_out(ibb, color);
 
-	switch_blt_tiling(ibb, tiling, false);
+		switch_blt_tiling(ibb, tiling, false);
+	}
 
 	intel_bb_flush_blit(ibb);
 	intel_bb_destroy(ibb);
diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 44b0d480..cb627288 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -2557,6 +2557,8 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define XY_MONO_SRC_BLT_WRITE_ALPHA	(1<<21)
 #define XY_MONO_SRC_BLT_WRITE_RGB	(1<<20)
 
+#define XY_FAST_COLOR_BLT		((0x2<<29)|(0x44<<22)|0xe)
+
 #define XY_FAST_COPY_BLT				((2<<29)|(0x42<<22)|0x8)
 /* dword 0 */
 #define   XY_FAST_COPY_SRC_TILING_LINEAR		(0 << 20)
-- 
2.17.1
