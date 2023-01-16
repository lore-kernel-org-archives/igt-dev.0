Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 639E510E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jan 2023 19:15:14 +0000 (UTC)
Date: Mon, 16 Jan 2023 20:15:11 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230116191511.pvke5kkdn7hyiadu@kamilkon-desk1>
References: <20230113091041.27032-1-jeevan.b@intel.com>
 <20230113091041.27032-2-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230113091041.27032-2-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH 1/2] lib/igt_draw: Use intel_get_uc_mocs to
 get MOCS value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lucas.demarchi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

On 2023-01-13 at 14:40:40 +0530, Jeevan B wrote:
> Use intel_get_uc_mocs instead of hardcoding to get table entry.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_draw.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_draw.c b/lib/igt_draw.c
> index 975d65cd..bfe9cd50 100644
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
> @@ -703,7 +704,7 @@ static void draw_rect_blt(int fd, struct cmd_data *cmd_data,
>  
>  		intel_bb_out(ibb, XY_FAST_COLOR_BLT | blt_cmd_depth);
>  		/* DG2 MOCS entry 2 is "UC - Non-Coherent; GO:Memory" */
---------------- ^
Please remove this old comment from here as after change it will
start working for DG1 and other archs.

Btw this is independent from 2/2 and imho should be first.

Regards,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> -		intel_bb_out(ibb, blt_cmd_tiling | 2 << 21 | (pitch-1));
> +		intel_bb_out(ibb, blt_cmd_tiling | intel_get_uc_mocs(fd) << 21 | (pitch-1));
>  		intel_bb_out(ibb, (rect->y << 16) | rect->x);
>  		intel_bb_out(ibb, ((rect->y + rect->h) << 16) | (rect->x + rect->w));
>  		intel_bb_emit_reloc_fenced(ibb, dst->handle, 0,
> -- 
> 2.19.1
> 
