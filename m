Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7398F6EA8C
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 16:07:48 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso2564107wmq.2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 09:07:48 -0700 (PDT)
Date: Thu, 15 Apr 2021 18:07:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YHhk0IXLUgb0uZBp@phenom.ffwll.local>
References: <20210413035350.261794-1-jason@jlekstrand.net>
 <20210413035350.261794-8-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210413035350.261794-8-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 07/74] lib/i915/gem_context: Add
 gem_context_create_ext helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 10:52:43PM -0500, Jason Ekstrand wrote:
> ---
>  lib/i915/gem_context.c | 57 ++++++++++++++++++++++++++++++++++++++++++
>  lib/i915/gem_context.h |  3 +++
>  2 files changed, 60 insertions(+)
> 
> diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
> index 79411e10..49ed7120 100644
> --- a/lib/i915/gem_context.c
> +++ b/lib/i915/gem_context.c
> @@ -107,6 +107,40 @@ int __gem_context_create(int fd, uint32_t *ctx_id)
>         return err;
>  }
>  
> +/**
> + * __gem_context_create_config:
> + * @fd: open i915 drm file descriptor
> + * @flags: context create flags
> + * @extensions: first extension struct, or 0 for no extensions
> + * @ctx_id: on success, the context ID is written here
> + *
> + * Creates a new GEM context with flags and extensions.  If no flags or
> + * extensions are required, it's the same as __gem_context_create and works
> + * on older kernels.
> + */
> +int __gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions,
> +			     uint32_t *ctx_id)
> +{
> +	struct drm_i915_gem_context_create_ext ctx_create;
> +	int err = 0;
> +
> +	if (!flags && !extensions)
> +		return __gem_context_create(fd, ctx_id);
> +
> +	memset(&ctx_create, 0, sizeof(ctx_create));
> +	ctx_create.flags = flags;
> +	if (extensions) {
> +		ctx_create.flags |= I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS;
> +		ctx_create.extensions = extensions;
> +	}
> +
> +	err = create_ext_ioctl(fd, &ctx_create);
> +	if (!err)
> +		*ctx_id = ctx_create.ctx_id;
> +
> +	return err;
> +}
> +
>  /**
>   * gem_context_create:
>   * @fd: open i915 drm file descriptor
> @@ -127,6 +161,29 @@ uint32_t gem_context_create(int fd)
>  	return ctx_id;
>  }
>  
> +/**
> + * __gem_context_create_config:

Uh this should warn ... I guess you're not seeing the warning in all
the other gtkdoc fail?

> + * @fd: open i915 drm file descriptor
> + * @flags: context create flags
> + * @extensions: first extension struct, or 0 for no extensions
> + * @ctx_id: on success, the context ID is written here
> + *
> + * Creates a new GEM context with flags and extensions.  If no flags or
> + * extensions are required, it's the same as gem_context_create and works
> + * on older kernels.
> + *
> + * Returns: The id of the allocated context.
> + */
> +uint32_t gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions)
> +{
> +	uint32_t ctx_id;
> +
> +	igt_assert_eq(__gem_context_create_ext(fd, flags, extensions, &ctx_id), 0);
> +	igt_assert(ctx_id != 0);
> +
> +	return ctx_id;
> +}
> +
>  int __gem_context_destroy(int fd, uint32_t ctx_id)
>  {
>  	struct drm_i915_gem_context_destroy destroy = { ctx_id };
> diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
> index c2c2b827..91bb9e7f 100644
> --- a/lib/i915/gem_context.h
> +++ b/lib/i915/gem_context.h
> @@ -30,7 +30,10 @@
>  struct drm_i915_gem_context_param;
>  
>  uint32_t gem_context_create(int fd);
> +uint32_t gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions);
>  int __gem_context_create(int fd, uint32_t *ctx_id);
> +int __gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions,
> +			     uint32_t *ctx_id);

With the gtkdoc fixed: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>  void gem_context_destroy(int fd, uint32_t ctx_id);
>  int __gem_context_destroy(int fd, uint32_t ctx_id);
>  
> -- 
> 2.31.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
