Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 16 Dec 2021 08:46:13 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YbruxWHUL7+Mrkze@zkempczy-mobl2>
References: <20211213232914.2523139-1-John.C.Harrison@Intel.com>
 <20211213232914.2523139-9-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211213232914.2523139-9-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 08/11] lib/store: Refactor common store
 code into helper function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@intel.com
Cc: IGT-Dev@lists.freedesktop.org, Intel-GFX@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Dec 13, 2021 at 03:29:11PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> A lot of tests use almost identical code for creating a batch buffer
> which does a single write to memory. This patch collects two such
> instances into a common helper function. Unfortunately, the other
> instances are all subtly different enough to make it not so trivial to
> try to use the helper. It could be done but it is unclear if it is
> worth the effort at this point. This patch proves the concept, if
> people like it enough then it can be extended.
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>  lib/igt_store.c             | 114 ++++++++++++++++++++++++++++++++++++
>  lib/igt_store.h             |  30 ++++++++++
>  lib/meson.build             |   1 +
>  tests/i915/gem_exec_fence.c |  77 ++----------------------
>  tests/i915/i915_hangman.c   |  61 +------------------
>  5 files changed, 152 insertions(+), 131 deletions(-)
>  create mode 100644 lib/igt_store.c
>  create mode 100644 lib/igt_store.h
>=20
> diff --git a/lib/igt_store.c b/lib/igt_store.c
> new file mode 100644
> index 000000000..6d9869b58
> --- /dev/null
> +++ b/lib/igt_store.c
> @@ -0,0 +1,114 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
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
> + *
> + */

Use SPDX. I like idea of extracting this.

> +
> +#include "i915/gem_create.h"
> +#include "igt_core.h"
> +#include "drmtest.h"
> +#include "igt_store.h"
> +#include "intel_chipset.h"
> +#include "intel_reg.h"
> +#include "ioctl_wrappers.h"
> +#include "lib/intel_allocator.h"
> +
> +/**
> + * SECTION:igt_store_word
> + * @short_description: Library for writing a value to memory
> + * @title: StoreWord
> + * @include: igt.h
> + *
> + * A lot of igt testcases need some mechanism for writing a value to mem=
ory
> + * as a test that a batch buffer has executed.
> + *
> + * NB: Requires master for STORE_DWORD on gen4/5.
> + */
> +void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> +		    const struct intel_execution_engine2 *e,
> +		    int fence, uint32_t target_handle,
> +		    uint64_t target_offset, uint32_t target_value)
> +{
> +	const int SCRATCH =3D 0;
> +	const int BATCH =3D 1;
> +	const unsigned int gen =3D intel_gen(intel_get_drm_devid(fd));
> +	struct drm_i915_gem_exec_object2 obj[2];
> +	struct drm_i915_gem_relocation_entry reloc;
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	uint32_t batch[16], delta;
> +	uint64_t bb_offset;
> +	int i;
> +
> +	memset(&execbuf, 0, sizeof(execbuf));
> +	execbuf.buffers_ptr =3D to_user_pointer(obj);
> +	execbuf.buffer_count =3D ARRAY_SIZE(obj);
> +	execbuf.flags =3D e->flags;
> +	execbuf.rsvd1 =3D ctx->id;
> +	if (fence !=3D -1) {
> +		execbuf.flags |=3D I915_EXEC_FENCE_IN;
> +		execbuf.rsvd2 =3D fence;
> +	}
> +	if (gen < 6)
> +		execbuf.flags |=3D I915_EXEC_SECURE;
> +
> +	memset(obj, 0, sizeof(obj));
> +	obj[SCRATCH].handle =3D target_handle;
> +
> +	obj[BATCH].handle =3D gem_create(fd, 4096);
> +	obj[BATCH].relocs_ptr =3D to_user_pointer(&reloc);
> +	obj[BATCH].relocation_count =3D !ahnd ? 1 : 0;
> +	bb_offset =3D get_offset(ahnd, obj[BATCH].handle, 4096, 0);
> +	memset(&reloc, 0, sizeof(reloc));
> +
> +	i =3D 0;
> +	delta =3D sizeof(uint32_t) * target_value;	/* why value not offset??? */

I guess I know why there's problem here. target_offset is address in vm
passed by the caller. This is regarding to some limitations of allocator
infrastructure - for "reloc" pseudo-allocator you would get new offset=20
(internally it returns offset and then add size for new "allocation").
With this we don't need to wait for rebind offset for new execbuf.=20
With "simple" allocator put will release offset so new allocation will
reuse same offset. Ashutosh proposed how to join both functionalities
(stepping as with reloc, stateful like in simple) but I got no time to
code this.

Regarding issue here, target_offset passed from the caller is to avoid=20
rebind if get_offset() would be called for "reloc" allocator.
So there's not real value offset within bo. I would add separate=20
value_offset (shift) to allow caller to put place where it wants to=20
write the value.


> +	if (!ahnd) {
> +		reloc.target_handle =3D obj[SCRATCH].handle;
> +		reloc.presumed_offset =3D -1;
> +		reloc.offset =3D sizeof(uint32_t) * (i + 1);
> +		reloc.delta =3D delta;
> +		reloc.read_domains =3D I915_GEM_DOMAIN_INSTRUCTION;
> +		reloc.write_domain =3D I915_GEM_DOMAIN_INSTRUCTION;
> +	} else {
> +		obj[SCRATCH].offset =3D target_offset;
> +		obj[SCRATCH].flags |=3D EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> +		obj[BATCH].offset =3D bb_offset;
> +		obj[BATCH].flags |=3D EXEC_OBJECT_PINNED;
> +	}
> +	batch[i] =3D MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> +	if (gen >=3D 8) {
> +		batch[++i] =3D target_offset + delta;
> +		batch[++i] =3D target_offset >> 32;

Probably I've added this in previous code, for being safe I would
add (target_offset + delta) >> 32 for avoid risk passing invalid higher
offset part on 32b boundary.

> +	} else if (gen >=3D 4) {
> +		batch[++i] =3D 0;
> +		batch[++i] =3D delta;
> +		reloc.offset +=3D sizeof(uint32_t);
> +	} else {
> +		batch[i]--;
> +		batch[++i] =3D delta;
> +	}
> +	batch[++i] =3D target_value;
> +	batch[++i] =3D MI_BATCH_BUFFER_END;
> +	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
> +	gem_execbuf(fd, &execbuf);
> +	gem_close(fd, obj[BATCH].handle);
> +	put_offset(ahnd, obj[BATCH].handle);
> +}
> diff --git a/lib/igt_store.h b/lib/igt_store.h
> new file mode 100644
> index 000000000..4d5979e07
> --- /dev/null
> +++ b/lib/igt_store.h
> @@ -0,0 +1,30 @@
> +/*
> + * Copyright =A9 2020 Intel Corporation
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
> + *
> + */

Use SPDX and 2021.

--
Zbigniew

> +
> +#include "igt_gt.h"
> +
> +void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> +		    const struct intel_execution_engine2 *e,
> +		    int fence, uint32_t target_handle,
> +		    uint64_t target_offset, uint32_t target_value);
> diff --git a/lib/meson.build b/lib/meson.build
> index b9568a71b..3e43316d1 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -72,6 +72,7 @@ lib_sources =3D [
>  	'igt_map.c',
>  	'igt_pm.c',
>  	'igt_dummyload.c',
> +	'igt_store.c',
>  	'uwildmat/uwildmat.c',
>  	'igt_kmod.c',
>  	'igt_panfrost.c',
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 9a6336ce9..c4091a454 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -28,6 +28,7 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +#include "igt_store.h"
>  #include "igt_syncobj.h"
>  #include "igt_sysfs.h"
>  #include "igt_vgem.h"
> @@ -57,74 +58,6 @@ struct sync_merge_data {
>  #define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
>  #define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
> =20
> -static void store(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> -		  const struct intel_execution_engine2 *e,
> -		  int fence, uint32_t target, uint64_t target_offset,
> -		  unsigned offset_value)
> -{
> -	const int SCRATCH =3D 0;
> -	const int BATCH =3D 1;
> -	const unsigned int gen =3D intel_gen(intel_get_drm_devid(fd));
> -	struct drm_i915_gem_exec_object2 obj[2];
> -	struct drm_i915_gem_relocation_entry reloc;
> -	struct drm_i915_gem_execbuffer2 execbuf;
> -	uint32_t batch[16], delta;
> -	uint64_t bb_offset;
> -	int i;
> -
> -	memset(&execbuf, 0, sizeof(execbuf));
> -	execbuf.buffers_ptr =3D to_user_pointer(obj);
> -	execbuf.buffer_count =3D 2;
> -	execbuf.flags =3D e->flags | I915_EXEC_FENCE_IN;
> -	execbuf.rsvd1 =3D ctx->id;
> -	execbuf.rsvd2 =3D fence;
> -	if (gen < 6)
> -		execbuf.flags |=3D I915_EXEC_SECURE;
> -
> -	memset(obj, 0, sizeof(obj));
> -	obj[SCRATCH].handle =3D target;
> -
> -	obj[BATCH].handle =3D gem_create(fd, 4096);
> -	obj[BATCH].relocs_ptr =3D to_user_pointer(&reloc);
> -	obj[BATCH].relocation_count =3D !ahnd ? 1 : 0;
> -	bb_offset =3D get_offset(ahnd, obj[BATCH].handle, 4096, 0);
> -	memset(&reloc, 0, sizeof(reloc));
> -
> -	i =3D 0;
> -	delta =3D sizeof(uint32_t) * offset_value;
> -	if (!ahnd) {
> -		reloc.target_handle =3D obj[SCRATCH].handle;
> -		reloc.presumed_offset =3D -1;
> -		reloc.offset =3D sizeof(uint32_t) * (i + 1);
> -		reloc.delta =3D delta;
> -		reloc.read_domains =3D I915_GEM_DOMAIN_INSTRUCTION;
> -		reloc.write_domain =3D I915_GEM_DOMAIN_INSTRUCTION;
> -	} else {
> -		obj[SCRATCH].offset =3D target_offset;
> -		obj[SCRATCH].flags |=3D EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> -		obj[BATCH].offset =3D bb_offset;
> -		obj[BATCH].flags |=3D EXEC_OBJECT_PINNED;
> -	}
> -	batch[i] =3D MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> -	if (gen >=3D 8) {
> -		batch[++i] =3D target_offset + delta;
> -		batch[++i] =3D target_offset >> 32;
> -	} else if (gen >=3D 4) {
> -		batch[++i] =3D 0;
> -		batch[++i] =3D delta;
> -		reloc.offset +=3D sizeof(uint32_t);
> -	} else {
> -		batch[i]--;
> -		batch[++i] =3D delta;
> -	}
> -	batch[++i] =3D offset_value;
> -	batch[++i] =3D MI_BATCH_BUFFER_END;
> -	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
> -	gem_execbuf(fd, &execbuf);
> -	gem_close(fd, obj[BATCH].handle);
> -	put_offset(ahnd, obj[BATCH].handle);
> -}
> -
>  static bool fence_busy(int fence)
>  {
>  	return poll(&(struct pollfd){fence, POLLIN}, 1, 0) =3D=3D 0;
> @@ -400,13 +333,13 @@ static void test_fence_await(int fd, const intel_ct=
x_t *ctx,
>  			continue;
> =20
>  		if (flags & NONBLOCK) {
> -			store(fd, ahnd, ctx, e2, spin->out_fence,
> -			      scratch, scratch_offset, i);
> +			igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
> +				       scratch, scratch_offset, i);
>  		} else {
>  			igt_fork(child, 1) {
>  				ahnd =3D get_reloc_ahnd(fd, ctx->id);
> -				store(fd, ahnd, ctx, e2, spin->out_fence,
> -				      scratch, scratch_offset, i);
> +				igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
> +					       scratch, scratch_offset, i);
>  				put_ahnd(ahnd);
>  			}
>  		}
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 20653b479..4cb9b8b85 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -36,6 +36,7 @@
>  #include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
> +#include "igt_store.h"
>  #include "igt_sysfs.h"
>  #include "igt_debugfs.h"
>  #include "sw_sync.h"
> @@ -51,64 +52,6 @@ static int sysfs =3D -1;
> =20
>  IGT_TEST_DESCRIPTION("Tests for hang detection and recovery");
> =20
> -/* Requires master for STORE_DWORD on gen4/5 */
> -static void store(int fd, const struct intel_execution_engine2 *e,
> -		  int fence, uint32_t target, unsigned offset_value)
> -{
> -	const int SCRATCH =3D 0;
> -	const int BATCH =3D 1;
> -	const int gen =3D intel_gen(intel_get_drm_devid(fd));
> -	struct drm_i915_gem_exec_object2 obj[2];
> -	struct drm_i915_gem_relocation_entry reloc;
> -	struct drm_i915_gem_execbuffer2 execbuf;
> -	uint32_t batch[16];
> -	int i;
> -
> -	memset(&execbuf, 0, sizeof(execbuf));
> -	execbuf.buffers_ptr =3D to_user_pointer(obj);
> -	execbuf.buffer_count =3D ARRAY_SIZE(obj);
> -	execbuf.flags =3D e->flags;
> -	if (fence !=3D -1) {
> -		execbuf.flags |=3D I915_EXEC_FENCE_IN;
> -		execbuf.rsvd2 =3D fence;
> -	}
> -	if (gen < 6)
> -		execbuf.flags |=3D I915_EXEC_SECURE;
> -
> -	memset(obj, 0, sizeof(obj));
> -	obj[SCRATCH].handle =3D target;
> -
> -	obj[BATCH].handle =3D gem_create(fd, 4096);
> -	obj[BATCH].relocs_ptr =3D to_user_pointer(&reloc);
> -	obj[BATCH].relocation_count =3D 1;
> -	memset(&reloc, 0, sizeof(reloc));
> -
> -	i =3D 0;
> -	reloc.target_handle =3D obj[SCRATCH].handle;
> -	reloc.presumed_offset =3D -1;
> -	reloc.offset =3D sizeof(uint32_t) * (i + 1);
> -	reloc.delta =3D sizeof(uint32_t) * offset_value;
> -	reloc.read_domains =3D I915_GEM_DOMAIN_INSTRUCTION;
> -	reloc.write_domain =3D I915_GEM_DOMAIN_INSTRUCTION;
> -	batch[i] =3D MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> -	if (gen >=3D 8) {
> -		batch[++i] =3D reloc.delta;
> -		batch[++i] =3D 0;
> -	} else if (gen >=3D 4) {
> -		batch[++i] =3D 0;
> -		batch[++i] =3D reloc.delta;
> -		reloc.offset +=3D sizeof(uint32_t);
> -	} else {
> -		batch[i]--;
> -		batch[++i] =3D reloc.delta;
> -	}
> -	batch[++i] =3D offset_value;
> -	batch[++i] =3D MI_BATCH_BUFFER_END;
> -	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
> -	gem_execbuf(fd, &execbuf);
> -	gem_close(fd, obj[BATCH].handle);
> -}
> -
>  static void check_alive(void)
>  {
>  	const struct intel_execution_engine2 *engine;
> @@ -138,7 +81,7 @@ static void check_alive(void)
>  			continue;
> =20
>  		/* +OFFSET_ALIVE to ensure engine zero doesn't get a false negative */
> -		store(fd, engine, -1, scratch, i + OFFSET_ALIVE);
> +		igt_store_word(fd, ahnd, ctx, engine, -1, scratch, i + OFFSET_ALIVE, i=
 + OFFSET_ALIVE);
>  		i++;
>  	}
> =20
> --=20
> 2.25.1
>=20
