Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B15910E0C4
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 23:55:56 +0000 (UTC)
Date: Thu, 21 Sep 2023 16:55:28 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: <janga.rahul.kumar@intel.com>
Message-ID: <20230921235528.GS2706891@mdroper-desk1.amr.corp.intel.com>
References: <20230915155846.481999-1-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230915155846.481999-1-janga.rahul.kumar@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_vm : Update tile mask
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

On Fri, Sep 15, 2023 at 09:28:46PM +0530, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Tile mask shouldn't be derived based on GT id. Setting tile mask to 0
> to create bind to all tiles.

Before the test was intentionally binding on a single tile (although we
weren't selecting the proper tile properly, which is what caused the
bug); with this change it will now bind to all tiles.  You won't hit an
error anymore, but does that behavior change impact what this test is
attempting to exercise?  I'm not really familiar with this specific
test, so I'm not sure whether restricting to the single proper tile is
important to ensure proper coverage or not.

BTW, I see some other questionable use of gt_id elsewhere in this test
as well.  I.e., in the xe_bo_create_flags parameter a little bit above
this point.  Does that need to be fixed as well so that we're using the
proper tile ID instead of the GT ID?  Maybe it doesn't break anything
today since we have no platforms with both VRAM and standalone media
yet, but we surely will in the future.


Matt

> 
> Cc: Stuart Summers <stuart.summers@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> ---
>  tests/intel/xe_vm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> index 4952ea786..a92a5cc66 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -927,7 +927,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		bind_ops[i].obj_offset = 0;
>  		bind_ops[i].range = bo_size;
>  		bind_ops[i].addr = addr;
> -		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
> +		bind_ops[i].tile_mask = 0;
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
