Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3DA410EA3F
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Jan 2023 16:25:14 +0000 (UTC)
Date: Fri, 13 Jan 2023 09:24:56 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20230113162456.cr3nqigv63n7p2wj@ldmartin-desk2>
References: <20230113062233.14750-1-jeevan.b@intel.com>
 <20230113062233.14750-2-jeevan.b@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230113062233.14750-2-jeevan.b@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_draw: Use intel_get_uc_mocs
 to get MOCS value
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

On Fri, Jan 13, 2023 at 11:52:32AM +0530, Jeevan B wrote:
>Use intel_get_uc_mocs instead of hardcoding to get table entry.
>
>Signed-off-by: Jeevan B <jeevan.b@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> lib/igt_draw.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/lib/igt_draw.c b/lib/igt_draw.c
>index 975d65cd..d8f4596a 100644
>--- a/lib/igt_draw.c
>+++ b/lib/igt_draw.c
>@@ -703,7 +703,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>
> 		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
> 		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
>-		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
>+		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
> 		intel_bb_out(ibb, (rect->y << 16) | rect->x);
> 		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
> 		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
>-- 
>2.19.1
>
