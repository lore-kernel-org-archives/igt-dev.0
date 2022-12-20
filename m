Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E648B10E0ED
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 17:26:40 +0000 (UTC)
Date: Tue, 20 Dec 2022 18:22:37 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y6HvXYhqD0gR8RhD@kamilkon-desk1>
References: <20221220155754.63808-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221220155754.63808-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_ctx_shared: Release offset
 after use
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

I have small nit below.

On 2022-12-20 at 16:57:54 +0100, Zbigniew Kempczyński wrote:
> Changes in reloc allocator requires releasing offsets. Additionally
> allocator provides consecutive offsets (gem_close() + put_offset())
---------------------------------------- ^
Do we need this here ?

Rest of this lgtm,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> allowing batches to be executed without stalls. As offsets quickly can
> reach 32b ppgtt border adding 48B flag for objects is now necessary.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/7672
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_ctx_shared.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 55d3d5a975..18d8cc013d 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -538,13 +538,13 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
>  	obj[2].handle = gem_create(i915, 4096);
>  	if (ahnd) {
>  		obj[0].offset = get_offset(ahnd, cork, cork_size, 0);
> -		obj[0].flags |= EXEC_OBJECT_PINNED;
> +		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>  		obj[1].offset = get_offset(ahnd, target, target_size, 0);
> -		obj[1].flags |= EXEC_OBJECT_PINNED;
> +		obj[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>  		if (write_domain)
>  			obj[1].flags |= EXEC_OBJECT_WRITE;
>  		obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0x0);
> -		obj[2].flags |= EXEC_OBJECT_PINNED;
> +		obj[2].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
>  		execbuf.flags |= I915_EXEC_NO_RELOC;
>  	} else {
>  		obj[0].offset = cork << 20;
> @@ -581,6 +581,7 @@ static void store_dword(int i915, uint64_t ahnd, const intel_ctx_t *ctx,
>  	gem_write(i915, obj[2].handle, 0, batch, sizeof(batch));
>  	gem_execbuf(i915, &execbuf);
>  	gem_close(i915, obj[2].handle);
> +	put_offset(ahnd, obj[2].handle);
>  }
>  
>  static const intel_ctx_t *
> -- 
> 2.34.1
> 
