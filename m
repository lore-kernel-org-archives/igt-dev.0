Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E819F6E30D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 18:58:52 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id a12so3198095wrq.13
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Apr 2021 11:58:52 -0700 (PDT)
Date: Thu, 8 Apr 2021 20:58:48 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YG9SaFhDMULr4PFs@phenom.ffwll.local>
References: <20210401021243.4147604-1-jason@jlekstrand.net>
 <20210401021243.4147604-3-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401021243.4147604-3-jason@jlekstrand.net>
Subject: Re: [igt-dev] [RFC 02/30] lib: Add an intel_ctx wrapper struct and
 helpers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 31, 2021 at 09:12:15PM -0500, Jason Ekstrand wrote:
> We're trying to clean up some of our technical debt in the i915 API.  In
> particular, context mutability and unnecessary getparam().  There's
> quite a bit of the introspection stuff that's not used by any userspace
> other than IGT.  Most drivers don't care about fetching the set of
> engines, for instance, because they don't forget about what set of
> engines they asked for int the first place.
> =

> Unfortunately, IGT relies heavily on context introspection for just
> about everything when it comes to multi-engine testing.  It also likes
> to use ctx0 as temporary storage for whatever the current test config
> is.  While effective at keeping IGC simple in some ways, this means
> we're making heavy use of context mutability.  Also, passing data around
> with in tests isn't really what contexts are for.
> =

> This patch adds a new intel_ctx_t struct which wraps a context and
> remembers the full context configuration.  This will provide similar
> ease-of-use without having use ctx0 as temporary storage.
> ---
>  lib/i915/gem_context.c |  34 +++++++++
>  lib/i915/gem_context.h |   2 +
>  lib/intel_ctx.c        | 159 +++++++++++++++++++++++++++++++++++++++++

Maybe a bit a bikeshed, but I think the idea is to long-term move/keep all
the i915-gem interface helpers in lib/i915, which I think makes sense.
At least it reflects the structure we've implemented on the tests/ side of
things.

I don't have an opinion on the intel_ctx vs gem_context bikeshed :-)

Also excellent that you opt to document stuff, but please make sure it's
actually picked up (you need to add each file to an .xml file iirc, and it
needs an overview section explaining in a few words what that library
does). As explained in the previous patch, I think we need to just bite
that bullet.

doc building works with the ninja -C build igt-gpu-tools-doc targe, see
README.md. Gives something fairly prety in the end:

https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html

Core libraries docs probably the best example we have. Scroll down past
the index for some of the overview docs we have and how you can link to
reference docs it to make it reasonable useful.

>  lib/intel_ctx.h        | 110 ++++++++++++++++++++++++++++
>  lib/meson.build        |   1 +
>  5 files changed, 306 insertions(+)
>  create mode 100644 lib/intel_ctx.c
>  create mode 100644 lib/intel_ctx.h
> =

> diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
> index 79411e10..0df42d02 100644
> --- a/lib/i915/gem_context.c
> +++ b/lib/i915/gem_context.c
> @@ -107,6 +107,40 @@ int __gem_context_create(int fd, uint32_t *ctx_id)
>         return err;
>  }
>  =

> +/**
> + * __gem_context_create_config:
> + * @fd: open i915 drm file descriptor
> + * @flags: context create flags
> + * @extensions: first extension struct, or 0 for no extensions
> + * @ctx_id: on success, the context ID is written here
> + *
> + * Creates a new GEM context with flags and extensions.  If no flags or
> + * extensions are required, it's the same as __gem_context_create and wo=
rks
> + * on older kernels.
> + */
> +int __gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions,
> +			     uint32_t *ctx_id)

Stuff this into the same library file, make it static? Documenting
internals is imo just confusing.
-Daniel

> +{
> +	struct drm_i915_gem_context_create_ext ctx_create;
> +	int err =3D 0;
> +
> +	if (!flags && !extensions)
> +		return __gem_context_create(fd, ctx_id);
> +
> +	memset(&ctx_create, 0, sizeof(ctx_create));
> +	ctx_create.flags =3D flags;
> +	if (extensions) {
> +		ctx_create.flags |=3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS;
> +		ctx_create.extensions =3D extensions;
> +	}
> +
> +	err =3D create_ext_ioctl(fd, &ctx_create);
> +	if (!err)
> +		*ctx_id =3D ctx_create.ctx_id;
> +
> +	return err;
> +}
> +
>  /**
>   * gem_context_create:
>   * @fd: open i915 drm file descriptor
> diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
> index c2c2b827..9748953c 100644
> --- a/lib/i915/gem_context.h
> +++ b/lib/i915/gem_context.h
> @@ -31,6 +31,8 @@ struct drm_i915_gem_context_param;
>  =

>  uint32_t gem_context_create(int fd);
>  int __gem_context_create(int fd, uint32_t *ctx_id);
> +int __gem_context_create_ext(int fd, uint32_t flags, uint64_t extensions,
> +			     uint32_t *ctx_id);
>  void gem_context_destroy(int fd, uint32_t ctx_id);
>  int __gem_context_destroy(int fd, uint32_t ctx_id);
>  =

> diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
> new file mode 100644
> index 00000000..406e85cb
> --- /dev/null
> +++ b/lib/intel_ctx.c
> @@ -0,0 +1,159 @@
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <stddef.h>
> +
> +#include "intel_ctx.h"
> +#include "ioctl_wrappers.h"
> +#include "i915/gem_engine_topology.h"
> +
> +static void
> +add_user_ext(uint64_t *root_ext_u64, struct i915_user_extension *ext)
> +{
> +	ext->next_extension =3D *root_ext_u64;
> +	*root_ext_u64 =3D to_user_pointer(ext);
> +}
> +
> +static size_t sizeof_param_engines(int count)
> +{
> +	return offsetof(struct i915_context_param_engines, engines[count]);
> +}
> +
> +#define SIZEOF_QUERY		offsetof(struct drm_i915_query_engine_info, \
> +					 engines[GEM_MAX_ENGINES])
> +
> +intel_ctx_cfg_t intel_ctx_cfg_all_physical(int fd)
> +{
> +	uint8_t buff[SIZEOF_QUERY] =3D { };
> +	struct drm_i915_query_engine_info *qei =3D (void *) buff;
> +	intel_ctx_cfg_t cfg =3D {};
> +	int i;
> +
> +	if (__gem_query_engines(fd, qei, SIZEOF_QUERY) =3D=3D 0) {
> +		cfg.num_engines =3D qei->num_engines;
> +		for (i =3D 0; i < qei->num_engines; i++)
> +			cfg.engines[i] =3D qei->engines[i].engine;
> +	}
> +
> +	return cfg;
> +}
> +
> +static int
> +__context_create_cfg(int fd, const intel_ctx_cfg_t *cfg, uint32_t *ctx_i=
d)
> +{
> +	uint64_t ext_root =3D 0;
> +	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, GEM_MAX_ENGINES);
> +	struct drm_i915_gem_context_create_ext_setparam engines_param, vm_param;
> +	uint32_t i;
> +
> +	if (cfg->vm) {
> +		vm_param =3D (struct drm_i915_gem_context_create_ext_setparam) {
> +			.base =3D {
> +				.name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> +			},
> +			.param =3D {
> +				.param =3D I915_CONTEXT_PARAM_VM,
> +				.value =3D cfg->vm,
> +			},
> +		};
> +		add_user_ext(&ext_root, &vm_param.base);
> +	}
> +
> +	if (cfg->num_engines) {
> +		memset(&engines, 0, sizeof(engines));
> +		for (i =3D 0; i < cfg->num_engines; i++)
> +			engines.engines[i] =3D cfg->engines[i];
> +
> +		engines_param =3D (struct drm_i915_gem_context_create_ext_setparam) {
> +			.base =3D {
> +				.name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> +			},
> +			.param =3D {
> +				.param =3D I915_CONTEXT_PARAM_ENGINES,
> +				.size =3D sizeof_param_engines(cfg->num_engines),
> +				.value =3D to_user_pointer(&engines),
> +			},
> +		};
> +		add_user_ext(&ext_root, &engines_param.base);
> +	}
> +
> +	return __gem_context_create_ext(fd, cfg->flags, ext_root, ctx_id);
> +}
> +
> +int __intel_ctx_create(int fd, const intel_ctx_cfg_t *cfg,
> +		       intel_ctx_t **out_ctx)
> +{
> +	uint32_t ctx_id;
> +	intel_ctx_t *ctx;
> +	int err;
> +
> +	if (cfg)
> +		err =3D __context_create_cfg(fd, cfg, &ctx_id);
> +	else
> +		err =3D __gem_context_create(fd, &ctx_id);
> +	if (err)
> +		return err;
> +
> +	ctx =3D calloc(1, sizeof(*ctx));
> +	igt_assert(ctx);
> +
> +	ctx->id =3D ctx_id;
> +	ctx->cfg =3D *cfg;
> +
> +	*out_ctx =3D ctx;
> +	return 0;
> +}
> +
> +intel_ctx_t *intel_ctx_create(int fd, const intel_ctx_cfg_t *cfg)
> +{
> +	intel_ctx_t *ctx;
> +	int err;
> +
> +	err =3D __intel_ctx_create(fd, cfg, &ctx);
> +	igt_assert_eq(err, 0);
> +
> +	return ctx;
> +}
> +
> +static const intel_ctx_t __intel_ctx_0 =3D {};
> +
> +const intel_ctx_t *intel_ctx_0(int fd)
> +{
> +	(void)fd;
> +	return &__intel_ctx_0;
> +}
> +
> +intel_ctx_t *intel_ctx_create_all_physical(int fd)
> +{
> +	intel_ctx_cfg_t cfg =3D intel_ctx_cfg_all_physical(fd);
> +	return intel_ctx_create(fd, &cfg);
> +}
> +
> +void intel_ctx_destroy(int fd, intel_ctx_t *ctx)
> +{
> +	if (!ctx)
> +		return;
> +
> +	gem_context_destroy(fd, ctx->id);
> +	free(ctx);
> +}
> diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
> new file mode 100644
> index 00000000..94bd667a
> --- /dev/null
> +++ b/lib/intel_ctx.h
> @@ -0,0 +1,110 @@
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#ifndef INTEL_CTX_H
> +#define INTEL_CTX_H
> +
> +#include "igt_core.h"
> +
> +#include "i915_drm.h"
> +
> +#define GEM_MAX_ENGINES		I915_EXEC_RING_MASK + 1
> +
> +/**
> + * intel_ctx_cfg_t:
> + * @flags: Context create flags
> + * @vm: VM to inherit or 0 for using a per-context VM
> + * @num_engines: Number of client-specified engines or 0 for legacy mode
> + * @engines: Client-specified engines
> + *
> + * Represents the full configuration of an intel_ctx.
> + */
> +typedef struct intel_ctx_cfg {
> +	uint32_t flags;
> +	uint32_t vm;
> +	unsigned int num_engines;
> +	struct i915_engine_class_instance engines[GEM_MAX_ENGINES];
> +} intel_ctx_cfg_t;
> +
> +intel_ctx_cfg_t intel_ctx_cfg_all_physical(int fd);
> +
> +/**
> + * intel_ctx_t:
> + * @id: the context id/handle
> + * @cfg: the config used to create this context
> + *
> + * Represents the full configuration of an intel_ctx.
> + */
> +typedef struct intel_ctx {
> +	uint32_t id;
> +	intel_ctx_cfg_t cfg;
> +} intel_ctx_t;
> +
> +/**
> + * __intel_ctx_create:
> + * @fd: open i915 drm file descriptor
> + * @cfg: configuration for the created context
> + * @out_ctx: on success, the new intel_ctx_t pointer is written here
> + *
> + * Like intel_ctx_create but returns an error instead of asserting.
> + */
> +int __intel_ctx_create(int fd, const intel_ctx_cfg_t *cfg,
> +		       intel_ctx_t **out_ctx);
> +
> +/**
> + * intel_ctx_create:
> + * @fd: open i915 drm file descriptor
> + * @cfg: configuration for the created context
> + *
> + * Creates a new intel_ctx_t with the given config
> + */
> +intel_ctx_t *intel_ctx_create(int i915, const intel_ctx_cfg_t *cfg);
> +
> +/**
> + * intel_ctx_0:
> + * @fd: open i915 drm file descriptor
> + *
> + * Returns an intel_ctx_t representing the default context.
> + */
> +const intel_ctx_t *intel_ctx_0(int fd);
> +
> +/**
> + * intel_ctx_create_all_physical:
> + * @fd: open i915 drm file descriptor
> + *
> + * Creates an intel_ctx_t containing all physical engines.  On kernels
> + * without the engines API, the created context will be the same as
> + * intel_ctx_0() except that it will be a new GEM context.
> + */
> +intel_ctx_t *intel_ctx_create_all_physical(int fd);
> +
> +/**
> + * intel_ctx_destroy:
> + * @fd: open i915 drm file descriptor
> + * @ctx: context to destroy, or NULL
> + *
> + * Destroys an intel_ctx_t.
> + */
> +void intel_ctx_destroy(int fd, intel_ctx_t *ctx);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 672b4206..871c7795 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -37,6 +37,7 @@ lib_sources =3D [
>  	'intel_batchbuffer.c',
>  	'intel_bufops.c',
>  	'intel_chipset.c',
> +	'intel_ctx.c',
>  	'intel_device_info.c',
>  	'intel_os.c',
>  	'intel_mmio.c',
> -- =

> 2.29.2
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
