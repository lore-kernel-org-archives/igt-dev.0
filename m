Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF016E214
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Sep 2021 17:40:26 +0000 (UTC)
Date: Mon, 13 Sep 2021 19:39:26 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210913173926.GA60883@zkempczy-mobl2>
References: <20210901154846.3323879-1-apoorva1.singh@intel.com>
 <20210901154846.3323879-2-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210901154846.3323879-2-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/intel_bufops: Add
 intel_buf_init_in_region
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: thomas.hellstrom@linux.intel.com, igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Sep 01, 2021 at 09:18:45PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
> Add intel_buf_init_in_region which allows memory region
> to be specified for new BO being created.
> Same as intel_buf_init with the additional region argument.
> 
> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  lib/intel_bufops.c | 28 +++++++++++++++++++++++-----
>  lib/intel_bufops.h |  5 +++++
>  2 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index faca4406..f5f67edd 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -730,7 +730,8 @@ static void __intel_buf_init(struct buf_ops *bops,
>  			     struct intel_buf *buf,
>  			     int width, int height, int bpp, int alignment,
>  			     uint32_t req_tiling, uint32_t compression,
> -			     uint64_t bo_size, int bo_stride)
> +			     uint64_t bo_size, int bo_stride,
> +			     uint32_t region)
>  {
>  	uint32_t tiling = req_tiling;
>  	uint64_t size;
> @@ -818,7 +819,7 @@ static void __intel_buf_init(struct buf_ops *bops,
>  	if (handle)
>  		buf->handle = handle;
>  	else
> -		buf->handle = gem_create(bops->fd, size);
> +		buf->handle = gem_create_in_memory_regions(bops->fd, size, region);
>  
>  	set_hw_tiled(bops, buf);
>  }
> @@ -845,7 +846,24 @@ void intel_buf_init(struct buf_ops *bops,
>  		    uint32_t tiling, uint32_t compression)
>  {
>  	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
> -			 tiling, compression, 0, 0);
> +			 tiling, compression, 0, 0, I915_SYSTEM_MEMORY);
> +
> +	intel_buf_set_ownership(buf, true);
> +}
> +
> +/**
> + * intel_buf_init_in_region
> + *
> + * Same as intel_buf_init with the additional region argument
> + */
> +void intel_buf_init_in_region(struct buf_ops *bops,
> +			      struct intel_buf *buf,
> +			      int width, int height, int bpp, int alignment,
> +			      uint32_t tiling, uint32_t compression,
> +			      uint32_t region)
> +{
> +	__intel_buf_init(bops, 0, buf, width, height, bpp, alignment,
> +			 tiling, compression, 0, 0, region);
>  
>  	intel_buf_set_ownership(buf, true);
>  }
> @@ -904,7 +922,7 @@ void intel_buf_init_using_handle(struct buf_ops *bops,
>  				 uint32_t req_tiling, uint32_t compression)
>  {
>  	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
> -			 req_tiling, compression, 0, 0);
> +			 req_tiling, compression, 0, 0, -1);
>  }
>  
>  /**
> @@ -990,7 +1008,7 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
>  	igt_assert(buf);
>  
>  	__intel_buf_init(bops, handle, buf, width, height, bpp, alignment,
> -			 req_tiling, compression, size, stride);
> +			 req_tiling, compression, size, stride, -1);
>  
>  	return buf;
>  }
> diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
> index 9e57d53e..54f2ce45 100644
> --- a/lib/intel_bufops.h
> +++ b/lib/intel_bufops.h
> @@ -125,6 +125,11 @@ static inline void intel_buf_set_ownership(struct intel_buf *buf, bool is_owner)
>  void intel_buf_init(struct buf_ops *bops, struct intel_buf *buf,
>  		    int width, int height, int bpp, int alignment,
>  		    uint32_t tiling, uint32_t compression);
> +void intel_buf_init_in_region(struct buf_ops *bops,
> +			      struct intel_buf *buf,
> +			      int width, int height, int bpp, int alignment,
> +			      uint32_t tiling, uint32_t compression,
> +			      uint32_t region);
>  void intel_buf_close(struct buf_ops *bops, struct intel_buf *buf);
>  
>  void intel_buf_init_using_handle(struct buf_ops *bops,
> -- 
> 2.25.1
>

Looks ok, 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew 
