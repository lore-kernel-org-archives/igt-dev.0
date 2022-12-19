Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C08010E07D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Dec 2022 13:17:40 +0000 (UTC)
Date: Mon, 19 Dec 2022 14:17:36 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Y6BkcIUb5k9TNvCK@kamilkon-desk1>
References: <20221219115834.55838-1-zbigniew.kempczynski@intel.com>
 <20221219115834.55838-2-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221219115834.55838-2-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/gem_*: Fix release offsets
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

On 2022-12-19 at 12:58:33 +0100, Zbigniew Kempczyński wrote:
> After changing reloc allocator to track offsets allocations all
> shortcommings started to be visible. Release offsets requires
> handles, not offsets so fix this in the tests.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_blits.c         | 12 ++++++------
>  tests/i915/gem_ctx_isolation.c |  6 +++---
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/gem_blits.c b/tests/i915/gem_blits.c
> index 24e83b9f51..d9296cf2d1 100644
> --- a/tests/i915/gem_blits.c
> +++ b/tests/i915/gem_blits.c
> @@ -264,11 +264,11 @@ static void buffer_set_tiling(const struct device *device,
>  	gem_execbuf(device->fd, &execbuf);
>  
>  	gem_close(device->fd, obj[2].handle);
> -	put_offset(device->ahnd, obj[2].offset);
> +	put_offset(device->ahnd, obj[2].handle);
>  
>  	gem_close(device->fd, obj[1].handle);
> +	put_offset(device->ahnd, obj[1].handle);
>  
> -	put_offset(device->ahnd, buffer->gtt_offset);
>  	buffer->gtt_offset = obj[0].offset;
>  	buffer->handle = obj[0].handle;
>  
> @@ -403,11 +403,11 @@ static bool blit_to_linear(const struct device *device,
>  
>  	gem_execbuf(device->fd, &execbuf);
>  	gem_close(device->fd, obj[2].handle);
> -	put_offset(device->ahnd, obj[2].offset);
> +	put_offset(device->ahnd, obj[2].handle);
>  
>  	gem_sync(device->fd, obj[0].handle);
>  	gem_close(device->fd, obj[0].handle);
> -	put_offset(device->ahnd, obj[0].offset);
> +	put_offset(device->ahnd, obj[0].handle);
>  
>  	return true;
>  }
> @@ -531,7 +531,7 @@ static void buffer_free(const struct device *device, struct buffer *buffer)
>  {
>  	igt_assert(buffer_check(device, buffer, GTT));
>  	gem_close(device->fd, buffer->handle);
> -	put_offset(device->ahnd, buffer->gtt_offset);
> +	put_offset(device->ahnd, buffer->handle);
>  	free(buffer);
>  }
>  
> @@ -744,7 +744,7 @@ blit(const struct device *device,
>  
>  	gem_execbuf(device->fd, &execbuf);
>  	gem_close(device->fd, obj[2].handle);
> -	put_offset(device->ahnd, obj[2].offset);
> +	put_offset(device->ahnd, obj[2].handle);
>  
>  	dst->gtt_offset = obj[0].offset;
>  	src->gtt_offset = obj[1].offset;
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index ec69357140..2def529ac3 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -437,7 +437,7 @@ static void write_regs(int fd, uint64_t ahnd,
>  	}
>  	gem_execbuf(fd, &execbuf);
>  	gem_close(fd, obj.handle);
> -	put_offset(ahnd, obj.offset);
> +	put_offset(ahnd, obj.handle);
>  }
>  
>  static void restore_regs(int fd,
> @@ -524,8 +524,8 @@ static void restore_regs(int fd,
>  	execbuf.rsvd1 = ctx->id;
>  	gem_execbuf(fd, &execbuf);
>  	gem_close(fd, obj[1].handle);
> -	put_offset(ahnd, obj[0].offset);
> -	put_offset(ahnd, obj[1].offset);
> +	put_offset(ahnd, obj[0].handle);
> +	put_offset(ahnd, obj[1].handle);
>  }
>  
>  __attribute__((unused))
> -- 
> 2.34.1
> 
