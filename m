Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF5F10E2B4
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 14:58:46 +0000 (UTC)
Date: Mon, 19 Dec 2022 06:58:40 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20221219145840.tcuvd7qzsscn7jw7@ldmartin-desk2.lan>
References: <20221219091154.21828-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221219091154.21828-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] lib/igt_draw: Change MOCS settings
 for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 19, 2022 at 02:41:54PM +0530, Jeevan B wrote:
>On MTL, we want the table entry labelled "UC (GO:Mem)"
>which has index 5.  This means that the MOCS value is 10.
>
>v2: Add define for MOCS settings. (Lucas)
>
>Signed-off-by: Jeevan B <jeevan.b@intel.com>
>---
> lib/igt_draw.c | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/lib/igt_draw.c b/lib/igt_draw.c
>index 975d65cd..4e19e42a 100644
>--- a/lib/igt_draw.c
>+++ b/lib/igt_draw.c
>@@ -651,13 +651,16 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
> 	return buf;
> }
>
>+#define DG2_MOCS_UC_GO_MEM	2	/* MOCS index 0x1 */
>+#define MTL_MOCS_UC_GO_MEM	10	/* MOCS index 0x5 */
>+
> static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
> 			  struct buf_data *buf, struct rect *rect,
> 			  uint32_t tiling, uint32_t color)
> {
> 	struct intel_bb *ibb;
> 	struct intel_buf *dst;
>-	int blt_cmd_len, blt_cmd_tiling, blt_cmd_depth;
>+	int blt_cmd_len, blt_cmd_tiling, blt_cmd_depth, mocs_val;
> 	uint32_t devid = intel_get_drm_devid(fd);
> 	int gen = intel_gen(devid);
> 	int pitch;
>@@ -702,8 +705,11 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
> 		pitch = tiling ? buf->stride / 4 : buf->stride;
>
> 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
>-		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
>-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
>+		if (IS_METEORLAKE(intel_get_drm_devid(fd)))
>+			mocs_val = MTL_MOCS_UC_GO_MEM;
>+		else
>+			mocs_val = DG2_MOCS_UC_GO_MEM;

nit: doing this before the calls to intel_bb_out() would be better since
it's what is done for all the other fields (e.g. pitch, bld_cmd_depth,
etc). With that
	
	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>+		intel_bb_out(ibb, blt_cmd_tiling | mocs_val << 21 | (pitch-1));
> 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
> 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
> 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
>-- 
>2.36.0
>
