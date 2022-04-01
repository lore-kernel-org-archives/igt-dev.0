Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9001710EB1E
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Apr 2022 06:10:54 +0000 (UTC)
Date: Fri, 1 Apr 2022 08:10:50 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <YkaXav8Za1AAOl+S@zkempczy-mobl2>
References: <20220331163430.73167-1-kamil.konieczny@linux.intel.com>
 <20220331163430.73167-2-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220331163430.73167-2-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_batchbuffer: add create
 without relocs
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

On Thu, Mar 31, 2022 at 06:34:28PM +0200, Kamil Konieczny wrote:
> There is create function with relocations, so add its
> counterpart without it.
> 
> v3: moved down after intel_bb_create_with_relocs_and_context,
>     added function description (Zbigniew review)
> v2: change to HIGH_TO_LOW allocation (Zbigniew)
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
> ---
>  lib/intel_batchbuffer.c | 21 +++++++++++++++++++++
>  lib/intel_batchbuffer.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index 2cd472d1..ebf3c598 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1558,6 +1558,27 @@ intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size)
>  				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
>  }
>  
> +/**
> + * intel_bb_create_no_relocs:
> + * @i915: drm fd
> + * @size: size of the batchbuffer
> + *
> + * Creates bb with disabled relocations.
> + * This enables passing addresses and requires pinning objects.
> + *
> + * Returns:
> + *
> + * Pointer the intel_bb, asserts on failure.
> + */
> +struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size)
> +{
> +	igt_require(gem_uses_full_ppgtt(i915));
> +
> +	return __intel_bb_create(i915, 0, size, false, 0, 0,
> +				 INTEL_ALLOCATOR_SIMPLE,
> +				 ALLOC_STRATEGY_HIGH_TO_LOW);
> +}
> +
>  static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
>  {
>  	uint32_t i;
> diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
> index 75d41ea3..36b6b61d 100644
> --- a/lib/intel_batchbuffer.h
> +++ b/lib/intel_batchbuffer.h
> @@ -526,6 +526,7 @@ intel_bb_create_with_context(int i915, uint32_t ctx, uint32_t size);
>  struct intel_bb *intel_bb_create_with_relocs(int i915, uint32_t size);
>  struct intel_bb *
>  intel_bb_create_with_relocs_and_context(int i915, uint32_t ctx, uint32_t size);
> +struct intel_bb *intel_bb_create_no_relocs(int i915, uint32_t size);
>  void intel_bb_destroy(struct intel_bb *ibb);
>  
>  /* make it safe to use intel_allocator after failed test */
> -- 
> 2.32.0
> 
