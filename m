Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D326E536
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Oct 2021 18:11:14 +0000 (UTC)
Date: Wed, 6 Oct 2021 20:11:03 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211006181103.GA33983@zkempczy-mobl2>
References: <20211005222935.42609-1-ashutosh.dixit@intel.com>
 <20211005222935.42609-2-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211005222935.42609-2-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib: Typechecking minmax
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris.p.wilson@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 03:29:35PM -0700, Ashutosh Dixit wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
>=20
> Add typechecking to the min/max macros and make their locals truly
> unique-ish to reduce the risk of shadowing.
>=20
> v2: small bug fix, write also height coordinate on rotation
>     test. (jheikkil)
> v3: Fix up a couple of other max/max_t instances (Ashutosh)
>=20
> Signed-off-by: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> ---
>  lib/i915/intel_memory_region.c     |  9 ++----
>  lib/i915/intel_memory_region.h     |  2 +-
>  lib/igt_aux.h                      | 48 ++++++++++++++++++++----------
>  lib/igt_fb.c                       | 13 ++++----
>  lib/intel_allocator.c              |  2 +-
>  lib/intel_allocator_random.c       |  2 +-
>  lib/intel_allocator_reloc.c        |  2 +-
>  runner/resultgen.c                 |  7 +++--
>  tests/i915/api_intel_bb.c          |  2 +-
>  tests/i915/gem_eio.c               |  4 +--
>  tests/i915/gem_exec_alignment.c    |  4 +--
>  tests/i915/gem_exec_capture.c      |  2 +-
>  tests/i915/gem_exec_fair.c         |  2 +-
>  tests/i915/gem_stress.c            |  2 +-
>  tests/i915/gem_tiled_swapping.c    |  5 ++--
>  tests/i915/gem_userptr_blits.c     |  2 +-
>  tests/i915/i915_pm_rc6_residency.c |  2 +-
>  tests/i915/kms_big_fb.c            |  2 +-
>  tests/i915/perf_pmu.c              |  2 +-
>  tests/kms_atomic_transition.c      |  2 +-
>  tests/kms_chamelium.c              |  2 +-
>  tests/kms_content_protection.c     |  4 +--
>  tests/kms_invalid_mode.c           |  4 +--
>  tests/kms_multipipe_modeset.c      |  3 +-
>  tests/kms_rotation_crc.c           | 21 ++++++++-----
>  tests/kms_setmode.c                | 11 ++-----
>  tests/sw_sync.c                    |  5 ++--
>  tools/intel_vbt_decode.c           |  3 +-
>  28 files changed, 93 insertions(+), 76 deletions(-)
>=20
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_regio=
n.c
> index bc2f66dbff5..058b273dcf8 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -146,19 +146,16 @@ out:
>   *
>   * Returns: Number of found lmem regions.
>   */
> -uint8_t gem_get_lmem_region_count(int fd)
> +unsigned int gem_get_lmem_region_count(int fd)
>  {
>  	struct drm_i915_query_memory_regions *query_info;
> -	uint8_t num_regions;
> -	uint8_t lmem_regions =3D 0;
> +	unsigned int lmem_regions =3D 0;
> =20
>  	query_info =3D gem_get_query_memory_regions(fd);
>  	if (!query_info)
>  		goto out;
> =20
> -	num_regions =3D query_info->num_regions;
> -
> -	for (int i =3D 0; i < num_regions; i++) {
> +	for (unsigned int i =3D 0; i < query_info->num_regions; i++) {
>  		if (query_info->regions[i].region.memory_class =3D=3D I915_MEMORY_CLAS=
S_DEVICE)
>  			lmem_regions +=3D 1;
>  	}
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_regio=
n.h
> index 024c76d3644..8b427b7e729 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -58,7 +58,7 @@ uint32_t gem_get_batch_size(int fd, uint8_t mem_region_=
type);
> =20
>  struct drm_i915_query_memory_regions *gem_get_query_memory_regions(int f=
d);
> =20
> -uint8_t gem_get_lmem_region_count(int fd);
> +unsigned int gem_get_lmem_region_count(int fd);
> =20
>  bool gem_has_lmem(int fd);

Above changes in memory regions should be part of another patch as it
not related to typechecking.=20

> =20
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index bf57ccf50df..30b175d70d8 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -40,6 +40,8 @@
> =20
>  #include <i915/gem_submission.h>
> =20
> +#include "igt_core.h"
> +
>  /* signal interrupt helpers */
>  #ifdef __linux__
>  # ifndef HAVE_GETTID
> @@ -212,26 +214,42 @@ void intel_require_files(uint64_t count);
>  #define CHECK_RAM 0x1
>  #define CHECK_SWAP 0x2
> =20
> -#define min(a, b) ({			\
> -	typeof(a) _a =3D (a);		\
> -	typeof(b) _b =3D (b);		\
> -	_a < _b ? _a : _b;		\
> -})
> -#define max(a, b) ({			\
> -	typeof(a) _a =3D (a);		\
> -	typeof(b) _b =3D (b);		\
> -	_a > _b ? _a : _b;		\
> -})
> +#define __typecheck(x, y) \
> +        (!!(sizeof((typeof(x) *)1 =3D=3D (typeof(y) *)1)))
> =20
> -#define clamp(x, min, max) ({		\
> -	typeof(min) _min =3D (min);	\
> -	typeof(max) _max =3D (max);	\
> -	typeof(x) _x =3D (x);		\
> -	_x < _min ? _min : _x > _max ? _max : _x;	\
> +#define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
> +
> +#define __cmp_once(x, y, unique_x, unique_y, op) ({     \
> +	typeof(x) unique_x =3D (x);               \
> +	typeof(y) unique_y =3D (y);               \
> +	__cmp(unique_x, unique_y, op);		\
>  })
> =20
> +#define __is_constexpr(x) \
> +	(sizeof(int) =3D=3D sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)=
))
> +
> +#define __no_side_effects(x, y) \
> +	(__is_constexpr(x) && __is_constexpr(y))
> +
> +#define __safe_cmp(x, y) \
> +	(__typecheck(x, y) && __no_side_effects(x, y))
> +
> +#define __careful_cmp(x, y, op, prefix) \
> +	__builtin_choose_expr(__safe_cmp(x, y), \
> +			      __cmp(x, y, op), \
> +			      __cmp_once(x, y, igt_unique(igt_tokencat(prefix, __x)), igt_uni=
que(igt_tokencat(prefix, __y)), op))
> +
> +#define min(x, y)	__careful_cmp(x, y, <, min)
> +#define max(x, y)	__careful_cmp(x, y, >, max)
> +
> +#define clamp(val, lo, hi) min(max(val, lo), hi)
> +
> +#define min_t(t, x, y)	__careful_cmp((typeof(t))x, (typeof(t))y, <, min_=
t)
> +#define max_t(t, x, y)	__careful_cmp((typeof(t))x, (typeof(t))y, >, max_=
t)
> +
>  #define igt_swap(a, b) do {	\
>  	typeof(a) _tmp =3D (a);	\
> +	_Static_assert(__typecheck(a, b), "type mismatch for swap"); \
>  	(a) =3D (b);		\
>  	(b) =3D _tmp;		\
>  } while (0)

Transplanted from kernel, ok. __is_constexpr() is really mindblowing.


> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ea4d83ab736..fba835a0b8f 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -733,7 +733,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, =
int plane)
>  		 * tiled. But then that failure is expected.
>  		 */
> =20
> -		stride =3D max(min_stride, 512);
> +		stride =3D max(min_stride, 512u);
>  		stride =3D roundup_power_of_two(stride);
> =20
>  		return stride;
> @@ -747,7 +747,7 @@ static uint32_t calc_plane_stride(struct igt_fb *fb, =
int plane)
>  		/*
>  		 * For amdgpu device with tiling mode
>  		 */
> -		unsigned int tile_width, tile_height;
> +		uint32_t tile_width, tile_height;
> =20
>  		igt_amd_fb_calculate_tile_dimension(fb->plane_bpp[plane],
>  				     &tile_width, &tile_height);
> @@ -812,9 +812,9 @@ static uint64_t calc_plane_size(struct igt_fb *fb, in=
t plane)
>  	if (fb->modifier !=3D DRM_FORMAT_MOD_NONE &&
>  	    is_i915_device(fb->fd) &&
>  	    intel_display_ver(intel_get_drm_devid(fb->fd)) <=3D 3) {
> -		uint64_t min_size =3D (uint64_t) fb->strides[plane] *
> +		uint64_t size =3D (uint64_t) fb->strides[plane] *
>  			fb->plane_height[plane];
> -		uint64_t size;
> +		uint64_t min_size =3D 1024 * 1024;
> =20
>  		/* Round the tiling up to the next power-of-two and the region
>  		 * up to the next pot fence size so that this works on all
> @@ -824,10 +824,7 @@ static uint64_t calc_plane_size(struct igt_fb *fb, i=
nt plane)
>  		 * tiled. But then that failure is expected.
>  		 */
> =20
> -		size =3D max(min_size, 1024*1024);
> -		size =3D roundup_power_of_two(size);
> -
> -		return size;
> +		return roundup_power_of_two(max(size, min_size));
>  	} else if (fb->modifier !=3D DRM_FORMAT_MOD_NONE && is_amdgpu_device(fb=
->fd)) {
>  		/*
>  		 * For amdgpu device with tiling mode
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c
> index 133176ed42e..eabff1f9a13 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -1088,7 +1088,7 @@ uint64_t __intel_allocator_alloc(uint64_t allocator=
_handle, uint32_t handle,
>  	struct alloc_resp resp;
> =20
>  	igt_assert((alignment & (alignment-1)) =3D=3D 0);
> -	req.alloc.alignment =3D max(alignment, 1 << 12);
> +	req.alloc.alignment =3D max_t(uint64_t, alignment, 1 << 12);
> =20
>  	igt_assert(handle_request(&req, &resp) =3D=3D 0);
>  	igt_assert(resp.response_type =3D=3D RESP_ALLOC);
> diff --git a/lib/intel_allocator_random.c b/lib/intel_allocator_random.c
> index 9e31426179b..d22f8176705 100644
> --- a/lib/intel_allocator_random.c
> +++ b/lib/intel_allocator_random.c
> @@ -180,7 +180,7 @@ intel_allocator_random_create(int fd, uint64_t start,=
 uint64_t end)
>  	igt_assert(ial->priv);
>  	ialr->prng =3D (uint32_t) to_user_pointer(ial);
> =20
> -	start =3D max(start, BIAS);
> +	start =3D max_t(uint64_t, start, BIAS);
>  	igt_assert(start < end);
>  	ialr->start =3D start;
>  	ialr->end =3D end;
> diff --git a/lib/intel_allocator_reloc.c b/lib/intel_allocator_reloc.c
> index 1790e6c7975..ee3ad43f4a5 100644
> --- a/lib/intel_allocator_reloc.c
> +++ b/lib/intel_allocator_reloc.c
> @@ -176,7 +176,7 @@ intel_allocator_reloc_create(int fd, uint64_t start, =
uint64_t end)
>  	igt_assert(ial->priv);
>  	ialr->prng =3D (uint32_t) to_user_pointer(ial);
> =20
> -	start =3D max(start, BIAS);
> +	start =3D max_t(uint64_t, start, BIAS);
>  	igt_assert(start < end);
>  	ialr->offset =3D ialr->start =3D start;
>  	ialr->end =3D end;
> diff --git a/runner/resultgen.c b/runner/resultgen.c
> index b74970a6e65..bccfca12a48 100644
> --- a/runner/resultgen.c
> +++ b/runner/resultgen.c
> @@ -481,12 +481,15 @@ static int find_subtest_idx_limited(struct matches =
matches,
>  	if (line_len < 0)
>  		return -1;
> =20
> -	for (k =3D first; k < last; k++)
> +	for (k =3D first; k < last; k++) {
> +		ptrdiff_t rem =3D bufend - matches.items[k].where;
> +
>  		if (matches.items[k].what =3D=3D linekey &&
>  		    !memcmp(matches.items[k].where,
>  			    full_line,
> -			    min(line_len, bufend - matches.items[k].where)))
> +			    min_t(ptrdiff_t, line_len, rem)))
>  			break;
> +	}
> =20
>  	free(full_line);
> =20
> diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> index 293720b4b3c..82943a34191 100644
> --- a/tests/i915/api_intel_bb.c
> +++ b/tests/i915/api_intel_bb.c
> @@ -904,7 +904,7 @@ static int compare_bufs(struct intel_buf *buf1, struc=
t intel_buf *buf2,
>  	return ret;
>  }
> =20
> -#define LINELEN 76
> +#define LINELEN 76ul
>  static int dump_base64(const char *name, struct intel_buf *buf)
>  {
>  	void *ptr;
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index d9ff1981a71..3d094433b7b 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -489,7 +489,7 @@ static void test_inflight(int fd, unsigned int wait)
> =20
>  	max =3D gem_measure_ring_inflight(fd, -1, 0);
>  	igt_require(max > 1);
> -	max =3D min(max - 1, ARRAY_SIZE(fence));
> +	max =3D min_t(max, max - 1, ARRAY_SIZE(fence));
>  	igt_debug("Using %d inflight batches\n", max);
> =20
>  	for_each_ring(e, parent_fd) {
> @@ -558,7 +558,7 @@ static void test_inflight_suspend(int fd)
> =20
>  	max =3D gem_measure_ring_inflight(fd, -1, 0);
>  	igt_require(max > 1);
> -	max =3D min(max - 1, ARRAY_SIZE(fence));
> +	max =3D min_t(max, max - 1, ARRAY_SIZE(fence));
>  	igt_debug("Using %d inflight batches\n", max);
> =20
>  	fd =3D reopen_device(fd);
> diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignm=
ent.c
> index c4611bd1ee2..68b95c869c9 100644
> --- a/tests/i915/gem_exec_alignment.c
> +++ b/tests/i915/gem_exec_alignment.c
> @@ -166,7 +166,7 @@ naughty_child(int i915, int link, uint32_t shared, un=
signed int flags)
>  	if (!gem_uses_full_ppgtt(i915))
>  		gtt_size /=3D 2; /* We have to *share* our GTT! */
> =20
> -	ram_size =3D min(intel_get_total_ram_mb(), 4096);
> +	ram_size =3D min_t(uint64_t, intel_get_total_ram_mb(), 4096);
>  	ram_size *=3D 1024 * 1024;
> =20
>  	count =3D min(gtt_size, ram_size) / 16384;
> @@ -376,7 +376,7 @@ setup_many(int i915, unsigned long *out)
>  	if (!gem_uses_full_ppgtt(i915))
>  		gtt_size /=3D 2; /* We have to *share* our GTT! */
> =20
> -	ram_size =3D min(intel_get_total_ram_mb(), 4096);
> +	ram_size =3D min_t(uint64_t, intel_get_total_ram_mb(), 4096);
>  	ram_size *=3D 1024 * 1024;
> =20
>  	count =3D min(gtt_size, ram_size) / 16384;
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 19f3836e385..7e0a8b8addb 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -566,7 +566,7 @@ static void prioinv(int fd, int dir, const intel_ctx_=
t *ctx,
>  		  gtt, ram);
> =20
>  	count =3D min(gtt, ram) / 4;
> -	count =3D min(count, 256); /* Keep the duration within reason */
> +	count =3D min(count, 256ul); /* Keep the duration within reason */
>  	igt_require(count > 1);
> =20
>  	intel_require_memory(count, size, CHECK_RAM);
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index ef5a450f6ca..89945d40e3c 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -605,7 +605,7 @@ static void fair_child(int i915, const intel_ctx_t *c=
tx,
>  		map =3D gem_mmap__device_coherent(i915, obj[0].handle,
>  						0, 4096, PROT_WRITE);
>  		igt_assert(map[0]);
> -		for (n =3D 1; n < min(count, 512); n++) {
> +		for (n =3D 1; n < min(count, 512ul); n++) {
>  			igt_assert(map[n]);
>  			map[n - 1] =3D map[n] - map[n - 1];
>  		}
> diff --git a/tests/i915/gem_stress.c b/tests/i915/gem_stress.c
> index 3e4d4907605..3765ab14bdb 100644
> --- a/tests/i915/gem_stress.c
> +++ b/tests/i915/gem_stress.c
> @@ -769,7 +769,7 @@ static void init(void)
> =20
>  	if (options.num_buffers =3D=3D 0) {
>  		tmp =3D gem_aperture_size(drm_fd);
> -		tmp =3D min(256 * (1024 * 1024), tmp);
> +		tmp =3D min(256 * 1024 * 1024u, tmp);
>  		num_buffers =3D 2 * tmp / options.scratch_buf_size / 3;
>  		num_buffers /=3D 2;
>  		igt_info("using %u buffers\n", num_buffers);
> diff --git a/tests/i915/gem_tiled_swapping.c b/tests/i915/gem_tiled_swapp=
ing.c
> index d33b76dbd5b..d66b6ca7f9b 100644
> --- a/tests/i915/gem_tiled_swapping.c
> +++ b/tests/i915/gem_tiled_swapping.c
> @@ -67,7 +67,7 @@ IGT_TEST_DESCRIPTION("Exercise swizzle code for swappin=
g.");
>  static uint32_t current_tiling_mode;
> =20
>  #define PAGE_SIZE 4096
> -#define AVAIL_RAM 512
> +#define AVAIL_RAM 512ul
> =20
>  static uint32_t
>  create_bo(int fd)
> @@ -183,7 +183,8 @@ igt_main
>  		/* lock RAM, leaving only 512MB available */
>  		count =3D intel_get_total_ram_mb() - intel_get_avail_ram_mb();
>  		count =3D max(count + 64, AVAIL_RAM);
> -		lock_size =3D max(0, intel_get_total_ram_mb() - count);
> +		count =3D intel_get_total_ram_mb() - count;
> +		lock_size =3D max_t(long, 0, count);
>  		igt_info("Mlocking %zdMiB of %ld/%ldMiB\n",
>  			 lock_size,
>  			 (long)intel_get_avail_ram_mb(),
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blit=
s.c
> index 756bd6e4786..078c75c3947 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -1693,7 +1693,7 @@ static void test_forking_evictions(int fd, int size=
, int count,
>  	 * processes meaning swapping will be triggered system
>  	 * wide even if one process on it's own can't do it.
>  	 */
> -	num_threads =3D min(sysconf(_SC_NPROCESSORS_ONLN) * 4, 12);
> +	num_threads =3D min_t(int, sysconf(_SC_NPROCESSORS_ONLN) * 4, 12);
>  	trash_count /=3D num_threads;
>  	if (count > trash_count)
>  		count =3D trash_count;
> diff --git a/tests/i915/i915_pm_rc6_residency.c b/tests/i915/i915_pm_rc6_=
residency.c
> index 96a951406f5..cf9eae90278 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -345,7 +345,7 @@ static void bg_load(int i915, unsigned int flags, uns=
igned long *ctl)
>  		ctl[1]++;
> =20
>  		/* aim for ~1% busy */
> -		usleep(min(elapsed / 10, 50 * 1000));
> +		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
>  	} while (!READ_ONCE(*ctl));
>  }
> =20
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> index 308227c9113..8665903827d 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -400,9 +400,9 @@ static bool test_plane(data_t *data)
> =20
>  static bool test_pipe(data_t *data)
>  {
> +	uint16_t width, height;
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
> -	int width, height;
>  	bool ret =3D false;
> =20
>  	if (data->format =3D=3D DRM_FORMAT_C8 &&
> diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
> index 1214cda8c32..e9df0290dd7 100644
> --- a/tests/i915/perf_pmu.c
> +++ b/tests/i915/perf_pmu.c
> @@ -1413,7 +1413,7 @@ static int target_num_interrupts(int i915)
>  {
>  	const intel_ctx_cfg_t cfg =3D intel_ctx_cfg_all_physical(i915);
> =20
> -	return min(gem_submission_measure(i915, &cfg, I915_EXEC_DEFAULT), 30);
> +	return min(gem_submission_measure(i915, &cfg, I915_EXEC_DEFAULT), 30u);
>  }
> =20
>  static void
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index bc0a1c81b46..9c0a91bf201 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -789,7 +789,7 @@ static void run_modeset_tests(data_t *data, int howma=
ny, bool nonblocking, bool
>  	unsigned iter_max;
>  	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] =3D { 0 };
>  	igt_output_t *output;
> -	unsigned width =3D 0, height =3D 0;
> +	uint16_t width =3D 0, height =3D 0;
> =20
>  	for (i =3D 0; i < data->display.n_outputs; i++)
>  		igt_output_set_pipe(&data->display.outputs[i], PIPE_NONE);
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 1ab411cecfb..11926bbcfa8 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -2399,7 +2399,7 @@ static void test_display_planes_random(data_t *data,
>  		igt_output_count_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
> =20
>  	/* Limit the number of planes to a reasonable scene. */
> -	overlay_planes_max =3D min(overlay_planes_max, 4);
> +	overlay_planes_max =3D min(overlay_planes_max, 4u);
> =20
>  	overlay_planes_count =3D (rand() % overlay_planes_max) + 1;
>  	igt_debug("Using %d overlay planes\n", overlay_planes_count);
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index e8002df2711..f2047173a34 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -703,9 +703,9 @@ static void test_content_protection_cleanup(void)
> =20
>  static void create_fbs(void)
>  {
> -	igt_output_t *output;
> -	int width =3D 0, height =3D 0;
> +	uint16_t width =3D 0, height =3D 0;
>  	drmModeModeInfo *mode;
> +	igt_output_t *output;
> =20
>  	for_each_connected_output(&data.display, output) {
>  		mode =3D igt_output_get_mode(output);
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index d4feba327fd..11960dfd799 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -195,8 +195,8 @@ test_output(data_t *data)
>  		return 0;
> =20
>  	igt_create_fb(data->drm_fd,
> -		      max(mode.hdisplay, 64),
> -		      max(mode.vdisplay, 64),
> +		      max_t(uint16_t, mode.hdisplay, 64),
> +		      max_t(uint16_t, mode.vdisplay, 64),
>  		      DRM_FORMAT_XRGB8888,
>  		      DRM_FORMAT_MOD_NONE,
>  		      &fb);
> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
> index b1dbc73a39b..97499508f1b 100644
> --- a/tests/kms_multipipe_modeset.c
> +++ b/tests/kms_multipipe_modeset.c
> @@ -40,10 +40,11 @@ static void run_test(data_t *data, int valid_outputs)
>  	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] =3D { 0 };
>  	igt_crc_t ref_crcs[IGT_MAX_PIPES], new_crcs[IGT_MAX_PIPES];
>  	igt_display_t *display =3D &data->display;
> -	int width =3D 0, height =3D 0, i =3D 0;
> +	uint16_t width =3D 0, height =3D 0;
>  	igt_pipe_t *pipe;
>  	igt_plane_t *plane;
>  	drmModeModeInfo *mode;
> +	int i =3D 0;
> =20
>  	for_each_connected_output(display, output) {
>  		mode =3D igt_output_get_mode(output);
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 11401a6d00a..a7f4d22f91f 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -214,6 +214,11 @@ static void prepare_crtc(data_t *data, igt_output_t =
*output, enum pipe pipe,
>  		igt_pipe_crc_start(data->pipe_crc);
>  }
> =20
> +#define TEST_WIDTH(km) \
> +	 min_t((km)->hdisplay, (km)->hdisplay, TEST_MAX_WIDTH)
> +#define TEST_HEIGHT(km) \
> +	 min_t((km)->vdisplay, (km)->vdisplay, TEST_MAX_HEIGHT)
> +
>  static void prepare_fbs(data_t *data, igt_output_t *output,
>  			igt_plane_t *plane, enum rectangle_type rect, uint32_t format)
>  {
> @@ -234,8 +239,8 @@ static void prepare_fbs(data_t *data, igt_output_t *o=
utput,
>  			w =3D mode->hdisplay;
>  			h =3D mode->vdisplay;
>  		} else {
> -			w =3D min(TEST_MAX_WIDTH, mode->hdisplay);
> -			h =3D min(TEST_MAX_HEIGHT, mode->vdisplay);
> +			w =3D TEST_WIDTH(mode);
> +			h =3D TEST_HEIGHT(mode);
>  		}
> =20
>  		min_w =3D 256;
> @@ -614,7 +619,7 @@ static void pointlocation(data_t *data, planeinfos *p=
, drmModeModeInfo *mode,
>  			  int c)
>  {
>  	if (data->planepos[c].origo & p_right) {
> -		p[c].x1 =3D (int32_t)(data->planepos[c].x * min(TEST_MAX_WIDTH, mode->=
hdisplay)
> +		p[c].x1 =3D (int32_t)(data->planepos[c].x * TEST_WIDTH(mode)
>  				+ mode->hdisplay);
>  		p[c].x1 &=3D ~3;
>  		/*
> @@ -625,17 +630,17 @@ static void pointlocation(data_t *data, planeinfos =
*p, drmModeModeInfo *mode,
>  		 */
>  		p[c].x1 -=3D mode->hdisplay & 2;
>  	} else {
> -		p[c].x1 =3D (int32_t)(data->planepos[c].x * min(TEST_MAX_WIDTH, mode->=
hdisplay));
> +		p[c].x1 =3D (int32_t)(data->planepos[c].x * TEST_WIDTH(mode));
>  		p[c].x1 &=3D ~3;
>  	}
> =20
>  	if (data->planepos[c].origo & p_bottom) {
> -		p[c].y1 =3D (int32_t)(data->planepos[c].y * min(TEST_MAX_HEIGHT, mode-=
>vdisplay)
> +		p[c].y1 =3D (int32_t)(data->planepos[c].y * TEST_HEIGHT(mode)
>  				+ mode->vdisplay);
>  		p[c].y1 &=3D ~3;
>  		p[c].y1 -=3D mode->vdisplay & 2;
>  	} else {
> -		p[c].y1 =3D (int32_t)(data->planepos[c].y * min(TEST_MAX_HEIGHT, mode-=
>vdisplay));
> +		p[c].y1 =3D (int32_t)(data->planepos[c].y * TEST_HEIGHT(mode));
>  		p[c].y1 &=3D ~3;
>  	}
>  }
> @@ -698,8 +703,8 @@ static void test_multi_plane_rotation(data_t *data, e=
num pipe pipe)
>  		igt_display_require_output(display);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
> =20
> -		used_w =3D min(TEST_MAX_WIDTH, mode->hdisplay);
> -		used_h =3D min(TEST_MAX_HEIGHT, mode->vdisplay);
> +		used_w =3D TEST_WIDTH(mode);
> +		used_h =3D TEST_HEIGHT(mode);
> =20
>  		p[0].plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMAR=
Y);
>  		p[1].plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLA=
Y);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 80665204c68..d62251742a4 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -421,15 +421,8 @@ static int test_stealing(int fd, struct crtc_config =
*crtc, uint32_t *ids)
>  	return ret;
>  }
> =20
> -static double frame_time(const drmModeModeInfo *kmode)
> -{
> -	return 1000.0 * kmode->htotal * kmode->vtotal / kmode->clock;
> -}
> -
> -static double line_time(const drmModeModeInfo *kmode)
> -{
> -	return 1000.0 * kmode->htotal / kmode->clock;
> -}
> +#define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clo=
ck)
> +#define line_time(km) (1000.0 * (km)->htotal / (km)->clock)

These changes in kms_setmode also don't match typechecking patch subject
and should be part of another patch IMO.

Other changes with typechecking looks ok. I would split this patch to
three - memory regions changes, change function to definitions in kms_setmo=
de
and typechecking.

--
Zbigniew

> =20
>  static void check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  {
> diff --git a/tests/sw_sync.c b/tests/sw_sync.c
> index d3d2bec15bb..cbd773fcb97 100644
> --- a/tests/sw_sync.c
> +++ b/tests/sw_sync.c
> @@ -837,8 +837,9 @@ igt_main
>  	igt_fixture {
>  		igt_require_sw_sync();
>  		multi_consumer_threads =3D
> -			min(multi_consumer_threads,
> -			    sysconf(_SC_NPROCESSORS_ONLN));
> +			min_t(multi_consumer_threads,
> +			      multi_consumer_threads,
> +			      sysconf(_SC_NPROCESSORS_ONLN));
>  	}
> =20
>  	igt_subtest("alloc_timeline")
> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> index 625dc078752..b063af8469d 100644
> --- a/tools/intel_vbt_decode.c
> +++ b/tools/intel_vbt_decode.c
> @@ -534,10 +534,11 @@ static void dump_child_devices(struct context *cont=
ext, const uint8_t *devices,
>  	 * initialized to zero.
>  	 */
>  	child =3D calloc(1, sizeof(*child));
> +	igt_assert(child);
> =20
>  	for (i =3D 0; i < child_dev_num; i++) {
>  		memcpy(child, devices + i * child_dev_size,
> -		       min(sizeof(*child), child_dev_size));
> +		       min_t(child_dev_size, sizeof(*child), child_dev_size));
> =20
>  		dump_child_device(context, child);
>  	}
> --=20
> 2.33.0
>=20
