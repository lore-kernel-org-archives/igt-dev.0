Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B65110E401
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jan 2023 18:13:24 +0000 (UTC)
Date: Tue, 3 Jan 2023 19:12:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y7RwKQBwb/o7Y+7L@kamilkon-desk1>
References: <20221226175429.570-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221226175429.570-1-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] lib/igt_draw: Change MOCS settings
 for MTL
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

Hi,

On 2022-12-26 at 23:24:29 +0530, Jeevan B wrote:
> On MTL, we want the table entry labelled "UC (GO:Mem)"
> which has index 5.  This means that the MOCS value is 10.
> 
> v2: Add define for MOCS settings. (Lucas)
> v3: Extending get_mocs_index and using get_mocs_index
>     to get mocs val. (Zbigniew)
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/i915/intel_mocs.c | 12 ++++++++----
>  lib/igt_draw.c        |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
> index df541ab0..f757bfbb 100644
> --- a/lib/i915/intel_mocs.c
> +++ b/lib/i915/intel_mocs.c
> @@ -11,6 +11,8 @@
>  #define DG1_MOCS_WB_IDX				5
>  #define DG2_MOCS_UC_IDX				1
>  #define DG2_MOCS_WB_IDX				3
> +#define MTL_MOCS_UC_IDX				5
> +#define MTL_MOCS_WB_IDX				10
>  #define GEN12_MOCS_UC_IDX			3
>  #define GEN12_MOCS_WB_IDX			2
>  #define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
> @@ -32,13 +34,15 @@ static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
>  	 * This helper function is providing current UC as well
>  	 * as WB MOCS index based on platform.
>  	 */
> -	if (IS_DG1(devid)) {
> -		mocs->uc_index = DG1_MOCS_UC_IDX;
> -		mocs->wb_index = DG1_MOCS_WB_IDX;

Please keep old code, DG1 first.

> +	if (IS_METEORLAKE(devid)) {
> +                mocs->uc_index = MTL_MOCS_UC_IDX;
> +                mocs->wb_index = MTL_MOCS_WB_IDX;
>  	} else if (IS_DG2(devid)) {
>  		mocs->uc_index = DG2_MOCS_UC_IDX;
>  		mocs->wb_index = DG2_MOCS_WB_IDX;
> -
> +	} else if (IS_DG1(devid)) {

Here put new one for MTL (instead of moving DG1 around).

> +		mocs->uc_index = DG1_MOCS_UC_IDX;
> +		mocs->wb_index = DG1_MOCS_WB_IDX;
>  	} else if (IS_GEN12(devid)) {
>  		mocs->uc_index = GEN12_MOCS_UC_IDX;
>  		mocs->wb_index = GEN12_MOCS_WB_IDX;
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 975d65cd..58ce0539 100644
> --- a/lib/igt_draw.c
> +++ b/lib/igt_draw.c
> @@ -36,6 +36,7 @@
>  #include "i830_reg.h"
>  #include "i915/gem_create.h"
>  #include "i915/gem_mman.h"
> +#include "i915/intel_mocs.h"
>  
>  #ifndef PAGE_ALIGN
>  #ifndef PAGE_SIZE
> @@ -702,8 +703,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  		pitch = tiling ? buf->stride / 4 : buf->stride;
>  
>  		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
> -		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
> -		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));

If you look at DG2 definitions you will see there is 1 and 3
so this change now looks like a fix for DG2 ?
Maybe this one should go first as a fix, then adding MTL defs ?
Or at least mention this fix in commit description.

Regards,
Kamil

> +		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
>  		intel_bb_out(ibb, (rect->y << 16) | rect->x);
>  		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
>  		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
> -- 
> 2.36.0
> 
