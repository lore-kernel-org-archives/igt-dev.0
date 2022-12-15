Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A7510E126
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 22:33:50 +0000 (UTC)
Date: Thu, 15 Dec 2022 14:33:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20221215223329.2hrikyubmjtb434m@ldmartin-desk2.lan>
References: <20221215081934.13919-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221215081934.13919-1-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Change MOCS settings for
 MTL
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

On Thu, Dec 15, 2022 at 01:49:34PM +0530, Jeevan B wrote:
>On MTL, we want the table entry labelled "UC (GO:Mem)"
>which has index 5.  This means that the MOCS value is 10.
>
>Signed-off-by: Jeevan B <jeevan.b@intel.com>
>---
> lib/igt_draw.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/lib/igt_draw.c b/lib/igt_draw.c
>index 975d65cd..d8cc60f9 100644
>--- a/lib/igt_draw.c
>+++ b/lib/igt_draw.c
>@@ -703,7 +703,10 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>
> 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
> 		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
>-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
>+		if (IS_METEORLAKE(intel_get_drm_devid(fd)))
>+			intel_bb_out(ibb, blt_cmd_tiling | 10 << 21 | (pitch-1));
>+		else
>+			intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));

if we avoid the magic number, we also don't need the comment. At the
beginning of this file we can do:

#define DG2_MOCS_UC_GO_MEM	2	/* MOCS index 0x1 */
#define MTL_MOCS_UC_GO_MEM	10	/* MOCS index 0x5 */

draw_rect_blt()
{
..
if (IS_METEORLAKE(intel_get_drm_devid(fd))
	mocs_val = MTL_MOCS_UC_GO_MEM;
else
	mocs_val = DG2_MOCS_UC_GO_MEM;

...
intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
intel_bb_out(ibb, blt_cmd_tiling | mocs_val << 21 | (pitch-1));

Lucas De Marchi

> 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
> 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
> 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
>-- 
>2.36.0
>
