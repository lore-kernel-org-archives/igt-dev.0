Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7086B10E2B3
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Sep 2023 20:28:03 +0000 (UTC)
Date: Thu, 14 Sep 2023 13:27:46 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <janga.rahul.kumar@intel.com>
Message-ID: <20230914202746.GE233750@mdroper-desk1.amr.corp.intel.com>
References: <20230914102156.412238-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230914102156.412238-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_vm : Validate tile mask
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 14, 2023 at 03:51:56PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Tile mask should be always less than or equal to tile count.
> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_vm.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 4952ea786..3b11b8a68 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include "igt.h"
> +#include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_reg.h"
>  #include "xe_drm.h"
> @@ -905,10 +906,11 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		uint64_t pad;
>  		uint32_t data;
>  	} *data;
> -	int i, b;
> +	int i, b, tile_count;
>  
>  	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
>  
> +	tile_count = xe_sysfs_get_num_tiles(fd);
>  	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>  	bo_size = sizeof(*data) * n_execs;
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> @@ -928,6 +930,10 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		bind_ops[i].range = bo_size;
>  		bind_ops[i].addr = addr;
>  		bind_ops[i].tile_mask = 0x1 << eci->gt_id;

The problem is here --- you shouldn't be building a tile mask from a GT
ID (you'd want to use the tile ID instead).  Tiles and GTs are different
things and you can't use them interchangeably.

> +
> +		if (bind_ops[i].tile_mask >= tile_count)
> +			bind_ops[i].tile_mask = tile_count - 1;

This check doesn't seem to make sense.  If you're trying to target the
second tile, then your tile mask would be 0x2, which is equal to
tile_count on a 2-tile system (so following this condition would just
force you back to a mask representing the first tile no matter what).

And if you were on a 4-tile system, then trying to target either the
third or fourth tiles would mean the mask is 0x8 or 0x4, both of which
match the condition here and cause you to update the mask to 0x3.  And
even higher tile counts would similarly be broken.


Matt

> +
>  		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
>  		bind_ops[i].region = 0;
>  		bind_ops[i].reserved[0] = 0;
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
