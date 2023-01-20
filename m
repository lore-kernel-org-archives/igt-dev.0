Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595A710EA5B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jan 2023 07:42:44 +0000 (UTC)
Message-ID: <3b72a7e7-5ea9-7d0d-bece-84b74f6daec0@intel.com>
Date: Fri, 20 Jan 2023 08:42:35 +0100
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=c5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20230120072549.11277-1-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
In-Reply-To: <20230120072549.11277-1-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ccs: Change allocator type and
 enforce softpinning
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

On 20.01.2023 08:25, Zbigniew Kempczyński wrote:
> For all subtests which uses simple allocator change them to reloc.
> There's nothing wrong with simple, but when it is freeing offset
> it might be used again in next allocation. From the execution point
> of view it leads to stalls. We don't want that here, especially in
> ctrl-surf-copy* subtests, where we join restoring ccs data for the
> surface and block-copy immediate after that.
> 
> Ensure we use softpinning for all subtests for the case where kernel
> still supports relocations and get_*_ahnd() helpers would return
> invalid allocator handle.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Stolarek <karolina.stolarek@intel.com>

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   tests/i915/gem_ccs.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/i915/gem_ccs.c b/tests/i915/gem_ccs.c
> index ff28c6d889..e9d66ca95b 100644
> --- a/tests/i915/gem_ccs.c
> +++ b/tests/i915/gem_ccs.c
> @@ -437,9 +437,7 @@ static void block_copy(int i915,
>   	struct blt_copy_object *src, *mid, *dst;
>   	const uint32_t bpp = 32;
>   	uint64_t bb_size = 4096;
> -	uint64_t ahnd = intel_allocator_open_full(i915, ctx->id, 0, 0,
> -						  INTEL_ALLOCATOR_SIMPLE,
> -						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +	uint64_t ahnd = intel_allocator_open(i915, ctx->id, INTEL_ALLOCATOR_RELOC);
>   	uint32_t run_id = mid_tiling;
>   	uint32_t mid_region = region2, bb;
>   	uint32_t width = param.width, height = param.height;
> @@ -500,9 +498,8 @@ static void block_copy(int i915,
>   			cfg.engines[0].engine_instance = e->instance;
>   			surf_ctx = intel_ctx_create(i915, &cfg);
>   			surf_e.flags = 0;
> -			surf_ahnd = intel_allocator_open_full(i915, surf_ctx->id, 0, 0,
> -							      INTEL_ALLOCATOR_SIMPLE,
> -							      ALLOC_STRATEGY_LOW_TO_HIGH, 0);
> +			surf_ahnd = intel_allocator_open(i915, ctx->id,
> +							 INTEL_ALLOCATOR_RELOC);
>   		}
>   
>   		surf_copy(i915, surf_ctx, &surf_e, surf_ahnd, src, mid, dst, run_id,
> @@ -555,7 +552,7 @@ static void block_multicopy(int i915,
>   	struct blt_copy_object *src, *mid, *dst, *final;
>   	const uint32_t bpp = 32;
>   	uint64_t bb_size = 4096;
> -	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
> +	uint64_t ahnd = intel_allocator_open(i915, ctx->id, INTEL_ALLOCATOR_RELOC);
>   	uint32_t run_id = mid_tiling;
>   	uint32_t mid_region = region2, bb;
>   	uint32_t width = param.width, height = param.height;
