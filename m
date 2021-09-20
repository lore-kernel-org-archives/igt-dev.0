Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5A6E452
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Sep 2021 09:24:45 +0000 (UTC)
Date: Mon, 20 Sep 2021 11:24:32 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210920092432.GA4614@zkempczy-mobl2>
References: <20210920075623.31580-1-vidya.srinivas@intel.com>
 <20210920080047.31650-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210920080047.31650-1-vidya.srinivas@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/intel_bufops: Fix regression on 5.4
 kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, Bhanuprakash.Modem@intel.com, markyacoub@google.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 20, 2021 at 01:30:47PM +0530, Vidya Srinivas wrote:
> Starting commit 8759c4a3020ce4 "Add intel_buf_init_in_region"
> __intel_buf_init uses gem_create_in_memory_regions instead of
> gem_create. Older kernels like 5.4 still dont have support for
> I915_GEM_CREATE_EXT_MEMORY_REGIONS (i915_gem_create_ext_ioctl)
> from kernel commit (https://patchwork.freedesktop.org/patch/431581/?series=89648&rev=1)
> Due to this, the flip-vs-fences tests are failing on kernel 5.4
> Patch adds fall back to gem_create when __gem_create_in_memory_region_list fails.
> 
> v2 - Addressed review comments from Zbigniew and Mark
> Added the fall back in __intel_buf_init
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  lib/intel_bufops.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index f5f67eddabd7..c8c0a730ccfa 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -818,8 +818,12 @@ static void __intel_buf_init(struct buf_ops *bops,
>  
>  	if (handle)
>  		buf->handle = handle;
> -	else
> -		buf->handle = gem_create_in_memory_regions(bops->fd, size, region);
> +	else {
> +		if( __gem_create_in_memory_regions(bops->fd, &handle, size, region) != 0)
                  ^---- missing space

Fix minor syntax nit, then:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> +			buf->handle = gem_create(bops->fd, size);
> +		else
> +			buf->handle = handle;
> +	}
>  
>  	set_hw_tiled(bops, buf);
>  }
> -- 
> 2.33.0
> 
