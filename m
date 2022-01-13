Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 12:53:38 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113205337.GA11185@jons-linux-dev-box>
References: <20220113195947.1536897-8-John.C.Harrison@Intel.com>
 <20220113205029.1549598-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220113205029.1549598-1-John.C.Harrison@Intel.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] lib/store: Refactor common
 store code into helper function
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 12:50:29PM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>=20
> A lot of tests use almost identical code for creating a batch buffer
> which does a single write to memory and another is about to be added.
> Instead, move the most generic version into a common helper function.
> Unfortunately, the other instances are all subtly different enough to
> make it not so trivial to try to use the helper. It could be done but
> it is unclear if it is worth the effort at this point. This patch
> proves the concept, if people like it enough then it can be extended.
>=20
> v2: Fix up object address vs store offset confusion (with help from
> Zbigniew K).
> v3: Cope with >32bit store_offset (review feedback from Matthew Brost).
>=20
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  lib/igt_store.c             | 100 ++++++++++++++++++++++++++++++++++++
>  lib/igt_store.h             |  12 +++++
>  lib/meson.build             |   1 +
>  tests/i915/gem_exec_fence.c |  77 ++-------------------------
>  tests/i915/i915_hangman.c   |   1 +
>  5 files changed, 119 insertions(+), 72 deletions(-)
>  create mode 100644 lib/igt_store.c
>  create mode 100644 lib/igt_store.h
>=20
> diff --git a/lib/igt_store.c b/lib/igt_store.c
> new file mode 100644
> index 000000000..98c6c4fbd
> --- /dev/null
> +++ b/lib/igt_store.c
> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
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
> +		    uint64_t target_gpu_addr,
> +		    uint64_t store_offset, uint32_t store_value)
> +{
> +	const int SCRATCH =3D 0;
> +	const int BATCH =3D 1;
> +	const unsigned int gen =3D intel_gen(intel_get_drm_devid(fd));
> +	struct drm_i915_gem_exec_object2 obj[2];
> +	struct drm_i915_gem_relocation_entry reloc;
> +	struct drm_i915_gem_execbuffer2 execbuf;
> +	uint32_t batch[16];
> +	uint64_t bb_offset, delta;
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
> +	delta =3D sizeof(uint32_t) * store_offset;
> +	if (!ahnd) {
> +		reloc.target_handle =3D obj[SCRATCH].handle;
> +		reloc.presumed_offset =3D -1;
> +		reloc.offset =3D sizeof(uint32_t) * (i + 1);
> +		reloc.delta =3D lower_32_bits(delta);
> +		igt_assert_eq(upper_32_bits(delta), 0);
> +		reloc.read_domains =3D I915_GEM_DOMAIN_INSTRUCTION;
> +		reloc.write_domain =3D I915_GEM_DOMAIN_INSTRUCTION;
> +	} else {
> +		obj[SCRATCH].offset =3D target_gpu_addr;
> +		obj[SCRATCH].flags |=3D EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
> +		obj[BATCH].offset =3D bb_offset;
> +		obj[BATCH].flags |=3D EXEC_OBJECT_PINNED;
> +	}
> +	batch[i] =3D MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
> +	if (gen >=3D 8) {
> +		uint64_t addr =3D target_gpu_addr + delta;
> +		batch[++i] =3D lower_32_bits(addr);
> +		batch[++i] =3D upper_32_bits(addr);
> +	} else if (gen >=3D 4) {
> +		batch[++i] =3D 0;
> +		batch[++i] =3D lower_32_bits(delta);
> +		igt_assert_eq(upper_32_bits(delta), 0);
> +		reloc.offset +=3D sizeof(uint32_t);
> +	} else {
> +		batch[i]--;
> +		batch[++i] =3D lower_32_bits(delta);
> +		igt_assert_eq(upper_32_bits(delta), 0);
> +	}
> +	batch[++i] =3D store_value;
> +	batch[++i] =3D MI_BATCH_BUFFER_END;
> +	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
> +	gem_execbuf(fd, &execbuf);
> +	gem_close(fd, obj[BATCH].handle);
> +	put_offset(ahnd, obj[BATCH].handle);
> +}
> diff --git a/lib/igt_store.h b/lib/igt_store.h
> new file mode 100644
> index 000000000..5c6c8263c
> --- /dev/null
> +++ b/lib/igt_store.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +
> +#include "igt_gt.h"
> +
> +void igt_store_word(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
> +		    const struct intel_execution_engine2 *e,
> +		    int fence, uint32_t target_handle,
> +		    uint64_t target_gpu_addr,
> +		    uint64_t store_offset, uint32_t store_value);
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
> index 9a6336ce9..196236b27 100644
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
> +				       scratch, scratch_offset, i, i);
>  		} else {
>  			igt_fork(child, 1) {
>  				ahnd =3D get_reloc_ahnd(fd, ctx->id);
> -				store(fd, ahnd, ctx, e2, spin->out_fence,
> -				      scratch, scratch_offset, i);
> +				igt_store_word(fd, ahnd, ctx, e2, spin->out_fence,
> +					       scratch, scratch_offset, i, i);
>  				put_ahnd(ahnd);
>  			}
>  		}
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index 6656b3fcd..5a0c9497c 100644
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
> --=20
> 2.25.1
>=20
