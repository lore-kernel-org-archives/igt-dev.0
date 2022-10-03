Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B984710E3CA
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Oct 2022 14:24:43 +0000 (UTC)
Date: Mon, 3 Oct 2022 16:24:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yzrwp82oZWckDIbe@kamilkon-desk1>
References: <20221003112926.33388-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221003112926.33388-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_mmap_offset: Ignore ENOSPC
 error for making residency execbuf
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

Hi Zbigniew,

On 2022-10-03 at 13:29:26 +0200, Zbigniew Kempczyński wrote:
> Platforms without ppgtt may be affected by ENOSPC when object is too big
> to fit in gtt. Still we expect object will be cleared in pagefault path
> so we can move forward even if execbuf is failing. To verify object
> is cleared in both paths (execbuf/pagefault handler) we select them
> randomly.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6973
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_mmap_offset.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index f51d7e38f5..13da26c784 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -102,7 +102,7 @@ static void make_resident(int i915, uint32_t batch, uint32_t handle)
>  		.buffer_count = ARRAY_SIZE(obj),
>  	};
>  
> -	gem_execbuf(i915, &eb);

imho it would help to put here short comment why we ignore
error.

> +	__gem_execbuf(i915, &eb);
>  	if (obj[1].handle != batch)
>  		gem_close(i915, obj[1].handle);
>  }
> @@ -704,7 +704,8 @@ static void *thread_clear(void *data)
>  		size = npages << 12;
>  
>  		igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
> -		make_resident(i915, batch, handle);

Same here, put short comment why we make it random.

With that fixed
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> +		if (random() & 1)
> +			make_resident(i915, batch, handle);
>  
>  		ptr = __mmap_offset(i915, handle, 0, size,
>  				    PROT_READ | PROT_WRITE,
> -- 
> 2.34.1
> 
