Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12846E8FC
 for <igt-dev@lists.freedesktop.org>; Mon, 17 May 2021 08:48:09 +0000 (UTC)
Date: Mon, 17 May 2021 10:48:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210517084804.GA3994@zkempczy-mobl2>
References: <20210423214853.876911-1-jason@jlekstrand.net>
 <20210423214853.876911-10-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210423214853.876911-10-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 09/89] lib: Add an intel_ctx wrapper
 struct and helpers (v4)
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

On Fri, Apr 23, 2021 at 04:47:33PM -0500, Jason Ekstrand wrote:
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
> =

> v2 (Jason Ekstrand):
>  - Make all intel_ctx_t's const
> =

> v3 (Jason Ekstrand):
>  - Fix up the docs so they build properly
> =

> v4 (Jason Ekstrand):
>  - Add an intel_ctx_create_for_engine helper
> =

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>  lib/intel_ctx.c                               | 272 ++++++++++++++++++
>  lib/intel_ctx.h                               |  75 +++++
>  lib/meson.build                               |   1 +
>  4 files changed, 349 insertions(+)
>  create mode 100644 lib/intel_ctx.c
>  create mode 100644 lib/intel_ctx.h
> =

> diff --git a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml b/docs/r=
eference/igt-gpu-tools/igt-gpu-tools-docs.xml
> index 2e85f361..0f49b4a3 100644
> --- a/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> +++ b/docs/reference/igt-gpu-tools/igt-gpu-tools-docs.xml
> @@ -58,6 +58,7 @@
>      <xi:include href=3D"xml/gem_engine_topology.xml"/>
>      <xi:include href=3D"xml/gem_scheduler.xml"/>
>      <xi:include href=3D"xml/gem_submission.xml"/>
> +    <xi:include href=3D"xml/intel_ctx.xml"/>
>    </chapter>
>    <xi:include href=3D"xml/igt_test_programs.xml"/>
>  =

> diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
> new file mode 100644
> index 00000000..271bb812
> --- /dev/null
> +++ b/lib/intel_ctx.c
> @@ -0,0 +1,272 @@
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

We likely should use SPDX here.

> +
> +#include <stddef.h>
> +
> +#include "intel_ctx.h"
> +#include "ioctl_wrappers.h"
> +#include "i915/gem_engine_topology.h"
> +
> +/**
> + * SECTION:intel_ctx
> + * @short_description: Wrapper structs for dealing with contexts
> + * @title: Intel Context Wrapper
> + *
> + * This helper library contains a couple of wrapper structs for easier
> + * dealing with GEM contexts.  This includes a context configuration str=
uct
> + * which represents important context construction parameters and a cont=
ext
> + * struct which contains the context ID and its configuration.  This mak=
es
> + * it easier to pass around a context without loosing the context create
> + * information.
> + */
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
> +/**
> + * intel_ctx_cfg_all_physical:
> + * @fd: open i915 drm file descriptor
> + *
> + * Returns an intel_ctx_cfg_t containing all physical engines.  On kerne=
ls
> + * without the engines API, a default context configuration will be
> + * returned.
> + */
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

So we loose flags and capabilities here. I've walked through the code
and caps are related to HEVC decoding and SFC. I don't think we will
have some embedded test h265 stream soon in IGT so this is likely
not a problem. Some doubts comes with SFC because we already have =

copyfunc which is using VEBOX engine. I'm not sure how much effort
do we need to scale / convert using SFC in this pipeline and do we
really need to test this in IGT. If you think we need only engine
class/instance I got no objections here.

> +	}
> +
> +	return cfg;
> +}
> +
> +/**
> + * intel_ctx_cfg_for_engine:
> + * @class: engine class
> + * @inst: engine instance
> + *
> + * Returns an intel_ctx_cfg_t containing exactly one engine.
> + */
> +intel_ctx_cfg_t intel_ctx_cfg_for_engine(unsigned int class, unsigned in=
t inst)
> +{
> +	return (intel_ctx_cfg_t) {
> +		.num_engines =3D 1,
> +		.engines =3D {
> +			{ .engine_class =3D class, .engine_instance =3D inst },
> +		},
> +	};
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
> +/**
> + * __intel_ctx_create:
> + * @fd: open i915 drm file descriptor
> + * @cfg: configuration for the created context
> + * @out_ctx: on success, the new intel_ctx_t pointer is written here
> + *
> + * Like intel_ctx_create but returns an error instead of asserting.
> + */
> +int __intel_ctx_create(int fd, const intel_ctx_cfg_t *cfg,
> +		       const intel_ctx_t **out_ctx)
> +{
> +	uint32_t ctx_id;
> +	intel_ctx_t *ctx;
> +	int err;

This is public and wouldn't assume cfg won't be NULL here. I would just
add igt_assert() to avoid surprises.

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
> +	if (cfg)
> +		ctx->cfg =3D *cfg;
> +
> +	*out_ctx =3D ctx;
> +	return 0;
> +}
> +
> +/**
> + * intel_ctx_create:
> + * @fd: open i915 drm file descriptor
> + * @cfg: configuration for the created context
> + *
> + * Creates a new intel_ctx_t with the given config
> + */
> +const intel_ctx_t *intel_ctx_create(int fd, const intel_ctx_cfg_t *cfg)
> +{
> +	const intel_ctx_t *ctx;
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
> +/**
> + * intel_ctx_0:
> + * @fd: open i915 drm file descriptor
> + *
> + * Returns an intel_ctx_t representing the default context.
> + */
> +const intel_ctx_t *intel_ctx_0(int fd)
> +{
> +	(void)fd;
> +	return &__intel_ctx_0;
> +}
> +
> +/**
> + * intel_ctx_create_for_engine:
> + * @fd: open i915 drm file descriptor
> + * @class: engine class
> + * @inst: engine instance
> + *
> + * Returns an intel_ctx_t containing the specified engine.
> + */
> +const intel_ctx_t *
> +intel_ctx_create_for_engine(int fd, unsigned int class, unsigned int ins=
t)
> +{
> +	intel_ctx_cfg_t cfg =3D intel_ctx_cfg_for_engine(class, inst);
> +	return intel_ctx_create(fd, &cfg);
> +}
> +
> +/**
> + * intel_ctx_create_all_physical:
> + * @fd: open i915 drm file descriptor
> + *
> + * Creates an intel_ctx_t containing all physical engines.  On kernels
> + * without the engines API, the created context will be the same as
> + * intel_ctx_0() except that it will be a new GEM context.  On kernels or
> + * hardware which do not support contexts, it is the same as intel_ctx_0=
().
> + */
> +const intel_ctx_t *intel_ctx_create_all_physical(int fd)
> +{
> +	intel_ctx_cfg_t cfg;
> +
> +	if (!gem_has_contexts(fd))
> +		return intel_ctx_0(fd);
> +
> +	cfg =3D intel_ctx_cfg_all_physical(fd);
> +	return intel_ctx_create(fd, &cfg);
> +}
> +
> +/**
> + * intel_ctx_destroy:
> + * @fd: open i915 drm file descriptor
> + * @ctx: context to destroy, or NULL
> + *
> + * Destroys an intel_ctx_t.
> + */
> +void intel_ctx_destroy(int fd, const intel_ctx_t *ctx)
> +{
> +	if (!ctx || ctx->id =3D=3D 0)
> +		return;

Shouldn't we assert here instead of silence quit on !ctx?

> +
> +	gem_context_destroy(fd, ctx->id);
> +	free((void *)ctx);
> +}
> +
> +/**
> + * intel_ctx_engine_class:
> + * @ctx: an intel_ctx_t
> + * @engine: an engine specifier
> + *
> + * Returns the class for the given engine.
> + */
> +unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int=
 engine)
> +{
> +	if (ctx->cfg.num_engines) {
> +		igt_assert(engine < ctx->cfg.num_engines);
> +		return ctx->cfg.engines[engine].engine_class;
> +	} else {
> +		return gem_execbuf_flags_to_engine_class(engine);
> +	}
> +}
> diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
> new file mode 100644
> index 00000000..79bc1154
> --- /dev/null
> +++ b/lib/intel_ctx.h
> @@ -0,0 +1,75 @@
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

Use SPDX.

--
Zbigniew

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
> +intel_ctx_cfg_t intel_ctx_cfg_for_engine(unsigned int class, unsigned in=
t inst);
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
> +int __intel_ctx_create(int fd, const intel_ctx_cfg_t *cfg,
> +		       const intel_ctx_t **out_ctx);
> +const intel_ctx_t *intel_ctx_create(int i915, const intel_ctx_cfg_t *cfg=
);
> +const intel_ctx_t *intel_ctx_0(int fd);
> +const intel_ctx_t *intel_ctx_create_for_engine(int fd, unsigned int clas=
s,
> +					       unsigned int inst);
> +const intel_ctx_t *intel_ctx_create_all_physical(int fd);
> +void intel_ctx_destroy(int fd, const intel_ctx_t *ctx);
> +
> +unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int=
 engine);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index 9929520e..d66748ad 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -42,6 +42,7 @@ lib_sources =3D [
>  	'intel_batchbuffer.c',
>  	'intel_bufops.c',
>  	'intel_chipset.c',
> +	'intel_ctx.c',
>  	'intel_device_info.c',
>  	'intel_os.c',
>  	'intel_mmio.c',
> -- =

> 2.31.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
