Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36A610EF83
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Mar 2022 09:37:11 +0000 (UTC)
Date: Fri, 4 Mar 2022 10:37:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiHdw/lxHbEc9aO0@kamilkon-DESK1>
References: <20220304090202.32164-1-zbigniew.kempczynski@intel.com>
 <20220304090202.32164-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220304090202.32164-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/intel_batchbuffer: Use safe
 alignment for intel-bb
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Dnia 2022-03-04 at 10:02:00 +0100, Zbigniew Kempczyński napisał(a):
> Discrete cards can have different memory alignment requirements
> when objects used in execbuffer comes from different memory regions.
> Lets use safe alignment which should be fine regardless objects
> location.
> 
> v2: ensure passed alignment is power of two (Kamil)
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  lib/intel_batchbuffer.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> index ddb8d8c1fd..460f5f2bb3 100644
> --- a/lib/intel_batchbuffer.c
> +++ b/lib/intel_batchbuffer.c
> @@ -1370,7 +1370,7 @@ __intel_bb_create(int i915, uint32_t ctx, uint32_t size, bool do_relocs,
>  	ibb->enforce_relocs = do_relocs;
>  	ibb->handle = gem_create(i915, size);
>  	ibb->size = size;
> -	ibb->alignment = 4096;
> +	ibb->alignment = gem_detect_safe_alignment(i915);
>  	ibb->ctx = ctx;
>  	ibb->vm_id = 0;
>  	ibb->batch = calloc(1, size);
> @@ -1925,9 +1925,10 @@ intel_bb_add_object(struct intel_bb *ibb, uint32_t handle, uint64_t size,
>  
>  	igt_assert(INVALID_ADDR(offset) || alignment == 0
>  		   || ALIGN(offset, alignment) == offset);
> +	igt_assert(is_power_of_two(alignment));
>  
>  	object = __add_to_cache(ibb, handle);
> -	alignment = alignment ?: 4096;
> +	alignment = max_t(uint64_t, alignment, gem_detect_safe_alignment(ibb->i915));
>  	__add_to_objects(ibb, object);
>  
>  	/*
> -- 
> 2.32.0
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
