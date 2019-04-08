Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 037B289254
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 19:25:53 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id s15so8544837qtn.3
 for <igt-dev@lists.freedesktop.org>; Mon, 08 Apr 2019 12:25:53 -0700 (PDT)
Date: Mon, 8 Apr 2019 16:25:48 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190408192548.nglfufwkp5i2274u@smtp.gmail.com>
References: <20190405002738.18310-1-jose.souza@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190405002738.18310-1-jose.souza@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] test/gem_exec_schedule: Fix variable
 shadow warning
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0122848962=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0122848962==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7j5kkuovamymcsr5"
Content-Disposition: inline


--7j5kkuovamymcsr5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jos=C3=A9 Roberto,

This patch looks nice IMHO :)

I just recommend you to update the commit message for something that
describes the change related to =E2=80=9Cfor_each_physical_engine=E2=80=9D =
and shows the
warning fix as a consequence of this patch improvements.

Additionally, I tested your patch on my computer with i915 just for
checking if the CI pointed out some false positive message. IHMO this is
the case, because in my laptop most of the =E2=80=9CIssues hit=E2=80=9C poi=
nted by the
CI worked without any problem. The interesting exceptions are:

 igt@kms_lease@atomic_implicit_crtc
 igt@kms_lease@setcrtc_implicit_plane
 igt@kms_plane_alpha_blend@pipe-b-alpha-transparant-fb

Note that the above tests failed with and without your patch (maybe, I
made something wrong in my setup). With this in mind, I believe that
your patch is correct.

Best Regards
Rodrigo Siqueira

On 04/04, Jos=C3=A9 Roberto de Souza wrote:
> Although it is not causing any bug, lets get rid of this warning by
> adding the iter parameter to for_each_physical_engine().
>=20
> [313/558] Compiling C object 'tests/59830eb@@gem_exec_schedule@exe/i915_g=
em_exec_schedule.c.o'.
> In file included from ../lib/igt.h:40,
>                  from ../tests/i915/gem_exec_schedule.c:31:
> ../tests/i915/gem_exec_schedule.c: In function =E2=80=98measure_semaphore=
_power=E2=80=99:
> ../lib/igt_gt.h:84:44: warning: declaration of =E2=80=98e__=E2=80=99 shad=
ows a previous local [-Wshadow]
>   for (const struct intel_execution_engine *e__ =3D intel_execution_engin=
es;\
>                                             ^~~
> ../tests/i915/gem_exec_schedule.c:1316:3: note: in expansion of macro =E2=
=80=98for_each_physical_engine=E2=80=99
>    for_each_physical_engine(i915, engine) {
>    ^~~~~~~~~~~~~~~~~~~~~~~~
> ../lib/igt_gt.h:84:44: note: shadowed declaration is here
>   for (const struct intel_execution_engine *e__ =3D intel_execution_engin=
es;\
>                                             ^~~
> ../tests/i915/gem_exec_schedule.c:1297:2: note: in expansion of macro =E2=
=80=98for_each_physical_engine=E2=80=99
>   for_each_physical_engine(i915, signaler) {
>   ^~~~~~~~~~~~~~~~~~~~~~~~
>=20
> Fixes: 8c69d24ebef3 ("i915/gem_exec_schedule: Measure semaphore power con=
sumption")
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
> ---
>  lib/i915/gem_ring.c             |  3 +-
>  lib/i915/gem_submission.c       |  4 ++-
>  lib/igt_dummyload.c             |  3 +-
>  lib/igt_gt.h                    | 10 +++---
>  tests/amdgpu/amd_prime.c        |  3 +-
>  tests/i915/gem_busy.c           |  6 ++--
>  tests/i915/gem_concurrent_all.c |  3 +-
>  tests/i915/gem_ctx_create.c     |  3 +-
>  tests/i915/gem_ctx_switch.c     |  5 +--
>  tests/i915/gem_ctx_thrash.c     |  6 ++--
>  tests/i915/gem_exec_async.c     |  3 +-
>  tests/i915/gem_exec_await.c     |  3 +-
>  tests/i915/gem_exec_create.c    |  3 +-
>  tests/i915/gem_exec_fence.c     |  9 ++++--
>  tests/i915/gem_exec_gttfill.c   |  3 +-
>  tests/i915/gem_exec_latency.c   | 10 +++---
>  tests/i915/gem_exec_nop.c       | 24 +++++++++------
>  tests/i915/gem_exec_parallel.c  |  4 ++-
>  tests/i915/gem_exec_reloc.c     |  4 ++-
>  tests/i915/gem_exec_schedule.c  | 42 ++++++++++++++++---------
>  tests/i915/gem_exec_store.c     |  3 +-
>  tests/i915/gem_exec_suspend.c   |  7 +++--
>  tests/i915/gem_exec_whisper.c   |  4 ++-
>  tests/i915/gem_ring_sync_loop.c |  3 +-
>  tests/i915/gem_spin_batch.c     |  3 +-
>  tests/i915/gem_sync.c           | 54 ++++++++++++++++++++++-----------
>  26 files changed, 148 insertions(+), 77 deletions(-)
>=20
> diff --git a/lib/i915/gem_ring.c b/lib/i915/gem_ring.c
> index fdb9fc1b..e22015bf 100644
> --- a/lib/i915/gem_ring.c
> +++ b/lib/i915/gem_ring.c
> @@ -140,9 +140,10 @@ unsigned int
>  gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring=
_flags flags)
>  {
>  	if (engine =3D=3D ALL_ENGINES) {
> +		const struct intel_execution_engine *exec_engine_iter;
>  		unsigned int global_min =3D ~0u;
> =20
> -		for_each_physical_engine(fd, engine) {
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			unsigned int engine_min =3D __gem_measure_ring_inflight(fd, engine, f=
lags);
> =20
>  			if (engine_min < global_min)
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 2fd460d5..db1df8c9 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -215,7 +215,9 @@ void gem_test_engine(int i915, unsigned int engine)
>  	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
> =20
>  	if (engine =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(i915, engine) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(i915, exec_engine_iter, engine) {
>  			execbuf.flags =3D engine;
>  			gem_execbuf(i915, &execbuf);
>  		}
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 47f6b92b..a68f6948 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -94,9 +94,10 @@ emit_recursive_batch(igt_spin_t *spin,
> =20
>  	nengine =3D 0;
>  	if (opts->engine =3D=3D ALL_ENGINES) {
> +		const struct intel_execution_engine *exec_engine_iter;
>  		unsigned int engine;
> =20
> -		for_each_physical_engine(fd, engine) {
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			if (opts->flags & IGT_SPIN_POLL_RUN &&
>  			    !gem_can_store_dword(fd, engine))
>  				continue;
> diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> index 54e95da9..94b56b01 100644
> --- a/lib/igt_gt.h
> +++ b/lib/igt_gt.h
> @@ -80,11 +80,11 @@ extern const struct intel_execution_engine {
>  	     e__++) \
>  		for_if (gem_has_ring(fd__, flags__ =3D e__->exec_id | e__->flags))
> =20
> -#define for_each_physical_engine(fd__, flags__) \
> -	for (const struct intel_execution_engine *e__ =3D intel_execution_engin=
es;\
> -	     e__->name; \
> -	     e__++) \
> -		for_if (gem_ring_has_physical_engine(fd__, flags__ =3D e__->exec_id | =
e__->flags))
> +#define for_each_physical_engine(fd__, iter, flags__) \
> +	for (iter =3D intel_execution_engines;\
> +	     iter->name; \
> +	     iter++) \
> +		for_if (gem_ring_has_physical_engine(fd__, flags__ =3D iter->exec_id |=
 iter->flags))
> =20
>  bool gem_ring_is_physical_engine(int fd, unsigned int ring);
>  bool gem_ring_has_physical_engine(int fd, unsigned int ring);
> diff --git a/tests/amdgpu/amd_prime.c b/tests/amdgpu/amd_prime.c
> index dc71ac70..f151a8ac 100644
> --- a/tests/amdgpu/amd_prime.c
> +++ b/tests/amdgpu/amd_prime.c
> @@ -170,6 +170,7 @@ static void unplug(struct cork *c)
> =20
>  static void i915_to_amd(int i915, int amd, amdgpu_device_handle device)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const uint32_t bbe =3D MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_exec_object2 obj[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
> @@ -179,7 +180,7 @@ static void i915_to_amd(int i915, int amd, amdgpu_dev=
ice_handle device)
>  	struct cork c;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(i915, engine)
> +	for_each_physical_engine(i915, exec_engine_iter, engine)
>  		engines[nengine++] =3D engine;
>  	igt_require(nengine);
> =20
> diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
> index ad853468..db3583c3 100644
> --- a/tests/i915/gem_busy.c
> +++ b/tests/i915/gem_busy.c
> @@ -263,16 +263,18 @@ static void one(int fd, unsigned ring, unsigned tes=
t_flags)
>  	__gem_busy(fd, obj[BATCH].handle, &read[BATCH], &write[BATCH]);
> =20
>  	if (test_flags & PARALLEL) {
> +		const struct intel_execution_engine *exec_engine_iter;
>  		unsigned other;
> =20
> -		for_each_physical_engine(fd, other) {
> +		for_each_physical_engine(fd, exec_engine_iter, other) {
>  			if (other =3D=3D ring)
>  				continue;
> =20
>  			if (!gem_can_store_dword(fd, other))
>  				continue;
> =20
> -			igt_debug("Testing %s in parallel\n", e__->name);
> +			igt_debug("Testing %s in parallel\n",
> +				  exec_engine_iter->name);
>  			one(fd, other, 0);
>  		}
>  	}
> diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_=
all.c
> index 6049372d..03274b0b 100644
> --- a/tests/i915/gem_concurrent_all.c
> +++ b/tests/i915/gem_concurrent_all.c
> @@ -949,9 +949,10 @@ static igt_hang_t rcs_hang(void)
>  static igt_hang_t all_hang(void)
>  {
>  	igt_hang_t hang =3D igt_hang_ring(fd, I915_EXEC_RENDER);
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned engine;
> =20
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		struct drm_i915_gem_execbuffer2 eb =3D hang.spin->execbuf;
> =20
>  		if (engine =3D=3D I915_EXEC_RENDER)
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index a664070d..9b098fd7 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -315,13 +315,14 @@ igt_main
>  	int fd =3D -1;
> =20
>  	igt_fixture {
> +		const struct intel_execution_engine *exec_engine_iter;
>  		unsigned engine;
> =20
>  		fd =3D drm_open_driver(DRIVER_INTEL);
>  		igt_require_gem(fd);
>  		gem_require_contexts(fd);
> =20
> -		for_each_physical_engine(fd, engine)
> +		for_each_physical_engine(fd, exec_engine_iter, engine)
>  			all_engines[all_nengine++] =3D engine;
>  		igt_require(all_nengine);
> =20
> diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
> index 87e13b91..b525e18b 100644
> --- a/tests/i915/gem_ctx_switch.c
> +++ b/tests/i915/gem_ctx_switch.c
> @@ -216,6 +216,7 @@ static void single(int fd, uint32_t handle,
> =20
>  static void all(int fd, uint32_t handle, unsigned flags, int timeout)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 obj[2];
>  	unsigned int engine[16], e;
> @@ -225,9 +226,9 @@ static void all(int fd, uint32_t handle, unsigned fla=
gs, int timeout)
>  	int n, qlen;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, e) {
> +	for_each_physical_engine(fd, exec_engine_iter, e) {
>  		engine[nengine] =3D e;
> -		name[nengine] =3D e__->name;
> +		name[nengine] =3D exec_engine_iter->name;
>  		nengine++;
>  	}
>  	igt_require(nengine);
> diff --git a/tests/i915/gem_ctx_thrash.c b/tests/i915/gem_ctx_thrash.c
> index b25f95f1..09310408 100644
> --- a/tests/i915/gem_ctx_thrash.c
> +++ b/tests/i915/gem_ctx_thrash.c
> @@ -103,9 +103,10 @@ static void single(const char *name, bool all_engine=
s)
> =20
>  	num_engines =3D 0;
>  	if (all_engines) {
> +		const struct intel_execution_engine *exec_engine_iter;
>  		unsigned engine;
> =20
> -		for_each_physical_engine(fd, engine) {
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			if (!gem_can_store_dword(fd, engine))
>  				continue;
> =20
> @@ -220,6 +221,7 @@ static void single(const char *name, bool all_engines)
> =20
>  static void processes(void)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned engines[16], engine;
>  	int num_engines;
>  	struct rlimit rlim;
> @@ -230,7 +232,7 @@ static void processes(void)
>  	fd =3D drm_open_driver(DRIVER_INTEL);
> =20
>  	num_engines =3D 0;
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		engines[num_engines++] =3D engine;
>  		if (num_engines =3D=3D ARRAY_SIZE(engines))
>  			break;
> diff --git a/tests/i915/gem_exec_async.c b/tests/i915/gem_exec_async.c
> index 9a06af7e..d3a64bdc 100644
> --- a/tests/i915/gem_exec_async.c
> +++ b/tests/i915/gem_exec_async.c
> @@ -82,6 +82,7 @@ static void store_dword(int fd, unsigned ring,
> =20
>  static void one(int fd, unsigned ring, uint32_t flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	struct drm_i915_gem_exec_object2 obj[2];
>  #define SCRATCH 0
> @@ -143,7 +144,7 @@ static void one(int fd, unsigned ring, uint32_t flags)
>  	gem_close(fd, obj[BATCH].handle);
> =20
>  	i =3D 0;
> -	for_each_physical_engine(fd, other) {
> +	for_each_physical_engine(fd, exec_engine_iter, other) {
>  		if (other =3D=3D ring)
>  			continue;
> =20
> diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
> index 5cfeb8ec..380396a4 100644
> --- a/tests/i915/gem_exec_await.c
> +++ b/tests/i915/gem_exec_await.c
> @@ -62,6 +62,7 @@ static void xchg_obj(void *array, unsigned i, unsigned =
j)
>  #define CONTEXTS 0x1
>  static void wide(int fd, int ring_size, int timeout, unsigned int flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const uint32_t bbe =3D MI_BATCH_BUFFER_END;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	struct {
> @@ -79,7 +80,7 @@ static void wide(int fd, int ring_size, int timeout, un=
signed int flags)
>  	double time;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, engine)
> +	for_each_physical_engine(fd, exec_engine_iter, engine)
>  		engines[nengine++] =3D engine;
>  	igt_require(nengine);
> =20
> diff --git a/tests/i915/gem_exec_create.c b/tests/i915/gem_exec_create.c
> index 54a2429e..78d66c07 100644
> --- a/tests/i915/gem_exec_create.c
> +++ b/tests/i915/gem_exec_create.c
> @@ -58,6 +58,7 @@ static double elapsed(const struct timespec *start, con=
st struct timespec *end)
> =20
>  static void all(int fd, unsigned flags, int timeout, int ncpus)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const uint32_t bbe =3D MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 obj;
> @@ -66,7 +67,7 @@ static void all(int fd, unsigned flags, int timeout, in=
t ncpus)
>  	unsigned engine;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, engine)
> +	for_each_physical_engine(fd, exec_engine_iter, engine)
>  		engines[nengine++] =3D engine;
>  	igt_require(nengine);
> =20
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index ba46595d..e849daef 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -317,6 +317,7 @@ static void test_fence_busy_all(int fd, unsigned flag=
s)
> =20
>  static void test_fence_await(int fd, unsigned ring, unsigned flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	struct drm_i915_gem_exec_object2 obj;
>  	struct drm_i915_gem_relocation_entry reloc;
> @@ -381,7 +382,7 @@ static void test_fence_await(int fd, unsigned ring, u=
nsigned flags)
>  	igt_assert(fence !=3D -1);
> =20
>  	i =3D 0;
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		if (!gem_can_store_dword(fd, engine))
>  			continue;
> =20
> @@ -447,6 +448,7 @@ static int __execbuf(int fd, struct drm_i915_gem_exec=
buffer2 *execbuf)
> =20
>  static void test_parallel(int fd, unsigned int master)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int SCRATCH =3D 0;
>  	const int BATCH =3D 1;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
> @@ -544,7 +546,7 @@ static void test_parallel(int fd, unsigned int master)
>  	obj[BATCH].relocation_count =3D 1;
> =20
>  	/* Queue all secondaries */
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		if (engine =3D=3D master)
>  			continue;
> =20
> @@ -705,6 +707,7 @@ static void test_keep_in_fence(int fd, unsigned int e=
ngine, unsigned int flags)
>  #define EXPIRED 0x10000
>  static void test_long_history(int fd, long ring_size, unsigned flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const uint32_t sz =3D 1 << 20;
>  	const uint32_t bbe =3D MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_exec_object2 obj[2];
> @@ -720,7 +723,7 @@ static void test_long_history(int fd, long ring_size,=
 unsigned flags)
>  		limit =3D ring_size / 3;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, engine)
> +	for_each_physical_engine(fd, exec_engine_iter, engine)
>  		engines[nengine++] =3D engine;
>  	igt_require(nengine);
> =20
> diff --git a/tests/i915/gem_exec_gttfill.c b/tests/i915/gem_exec_gttfill.c
> index efd612bb..605de6ba 100644
> --- a/tests/i915/gem_exec_gttfill.c
> +++ b/tests/i915/gem_exec_gttfill.c
> @@ -106,6 +106,7 @@ static void submit(int fd, int gen,
> =20
>  static void fillgtt(int fd, unsigned ring, int timeout)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_relocation_entry reloc[2];
> @@ -122,7 +123,7 @@ static void fillgtt(int fd, unsigned ring, int timeou=
t)
> =20
>  	nengine =3D 0;
>  	if (ring =3D=3D 0) {
> -		for_each_physical_engine(fd, engine) {
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			if (!gem_can_store_dword(fd, engine))
>  				continue;
> =20
> diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
> index 39f441d2..002d9060 100644
> --- a/tests/i915/gem_exec_latency.c
> +++ b/tests/i915/gem_exec_latency.c
> @@ -263,6 +263,7 @@ static void latency_from_ring(int fd,
>  			      unsigned ring, const char *name,
>  			      unsigned flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	const int has_64bit_reloc =3D gen >=3D 8;
>  	struct drm_i915_gem_exec_object2 obj[3];
> @@ -315,7 +316,7 @@ static void latency_from_ring(int fd,
>  	reloc.presumed_offset =3D obj[1].offset;
>  	reloc.target_handle =3D flags & CORK ? 1 : 0;
> =20
> -	for_each_physical_engine(fd, other) {
> +	for_each_physical_engine(fd, exec_engine_iter, other) {
>  		igt_spin_t *spin =3D NULL;
>  		IGT_CORK_HANDLE(c);
> =20
> @@ -396,7 +397,7 @@ static void latency_from_ring(int fd,
>  		igt_spin_batch_free(fd, spin);
> =20
>  		igt_info("%s-%s delay: %.2fns\n",
> -			 name, e__->name,
> +			 name, exec_engine_iter->name,
>  			 (results[2*repeats-1] - results[0]) / (double)repeats * rcs_clock);
>  	}
> =20
> @@ -457,6 +458,7 @@ static void
>  rthog_latency_on_ring(int fd, unsigned int engine, const char *name, uns=
igned int flags)
>  #define RTIDLE 0x1
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const char *passname[] =3D {
>  		"warmup",
>  		"normal",
> @@ -486,12 +488,12 @@ rthog_latency_on_ring(int fd, unsigned int engine, =
const char *name, unsigned in
> =20
>  	nengine =3D 0;
>  	if (engine =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, engine) {
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			if (!gem_can_store_dword(fd, engine))
>  				continue;
> =20
>  			engines[nengine] =3D engine;
> -			names[nengine] =3D e__->name;
> +			names[nengine] =3D exec_engine_iter->name;
>  			nengine++;
>  		}
>  		igt_require(nengine > 1);
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index b91b4d0f..7ed6dcf2 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -216,6 +216,7 @@ static void poll_ring(int fd, unsigned engine, const =
char *name, int timeout)
> =20
>  static void poll_sequential(int fd, const char *name, int timeout)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	const uint32_t MI_ARB_CHK =3D 0x5 << 23;
>  	struct drm_i915_gem_execbuffer2 execbuf;
> @@ -233,7 +234,7 @@ static void poll_sequential(int fd, const char *name,=
 int timeout)
>  		flags |=3D I915_EXEC_SECURE;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		if (!gem_can_store_dword(fd, engine))
>  			continue;
> =20
> @@ -427,6 +428,7 @@ static void headless(int fd, uint32_t handle)
> =20
>  static void parallel(int fd, uint32_t handle, int timeout)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 obj;
>  	unsigned engines[16];
> @@ -438,14 +440,14 @@ static void parallel(int fd, uint32_t handle, int t=
imeout)
> =20
>  	sum =3D 0;
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		engines[nengine] =3D engine;
> -		names[nengine] =3D e__->name;
> +		names[nengine] =3D exec_engine_iter->name;
>  		nengine++;
> =20
>  		time =3D nop_on_ring(fd, handle, engine, 1, &count) / count;
>  		sum +=3D time;
> -		igt_debug("%s: %.3fus\n", e__->name, 1e6*time);
> +		igt_debug("%s: %.3fus\n", exec_engine_iter->name, 1e6*time);
>  	}
>  	igt_require(nengine);
>  	igt_info("average (individually): %.3fus\n", sum/nengine*1e6);
> @@ -489,6 +491,7 @@ static void parallel(int fd, uint32_t handle, int tim=
eout)
> =20
>  static void series(int fd, uint32_t handle, int timeout)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 obj;
>  	struct timespec start, now, sync;
> @@ -500,10 +503,10 @@ static void series(int fd, uint32_t handle, int tim=
eout)
>  	const char *name;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		time =3D nop_on_ring(fd, handle, engine, 1, &count) / count;
>  		if (time > max) {
> -			name =3D e__->name;
> +			name =3D exec_engine_iter->name;
>  			max =3D time;
>  		}
>  		if (time < min)
> @@ -579,6 +582,7 @@ static void xchg(void *array, unsigned i, unsigned j)
> =20
>  static void sequential(int fd, uint32_t handle, unsigned flags, int time=
out)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int ncpus =3D flags & FORKED ? sysconf(_SC_NPROCESSORS_ONLN) : 1;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 obj[2];
> @@ -595,12 +599,12 @@ static void sequential(int fd, uint32_t handle, uns=
igned flags, int timeout)
> =20
>  	nengine =3D 0;
>  	sum =3D 0;
> -	for_each_physical_engine(fd, n) {
> +	for_each_physical_engine(fd, exec_engine_iter, n) {
>  		unsigned long count;
> =20
>  		time =3D nop_on_ring(fd, handle, n, 1, &count) / count;
>  		sum +=3D time;
> -		igt_debug("%s: %.3fus\n", e__->name, 1e6*time);
> +		igt_debug("%s: %.3fus\n", exec_engine_iter->name, 1e6*time);
> =20
>  		engines[nengine++] =3D n;
>  	}
> @@ -726,7 +730,9 @@ static void fence_signal(int fd, uint32_t handle,
> =20
>  	nengine =3D 0;
>  	if (ring_id =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, n)
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, n)
>  			engines[nengine++] =3D n;
>  	} else {
>  		gem_require_ring(fd, ring_id);
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_paralle=
l.c
> index a6fa698e..ee74a18b 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -169,7 +169,9 @@ static void all(int fd, unsigned engine, unsigned fla=
gs)
> =20
>  	nengine =3D 0;
>  	if (engine =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, engine) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			if (gem_can_store_dword(fd, engine))
>  				engines[nengine++] =3D engine;
>  		}
> diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> index 837f60a6..0263d7dd 100644
> --- a/tests/i915/gem_exec_reloc.c
> +++ b/tests/i915/gem_exec_reloc.c
> @@ -258,7 +258,9 @@ static void active(int fd, unsigned engine)
> =20
>  	nengine =3D 0;
>  	if (engine =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, engine) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			if (gem_can_store_dword(fd, engine))
>  				engines[nengine++] =3D engine;
>  		}
> diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedul=
e.c
> index 3df319bc..8c61475d 100644
> --- a/tests/i915/gem_exec_schedule.c
> +++ b/tests/i915/gem_exec_schedule.c
> @@ -199,6 +199,7 @@ static void fifo(int fd, unsigned ring)
>  static void independent(int fd, unsigned int engine)
>  {
>  	IGT_CORK_HANDLE(cork);
> +	const struct intel_execution_engine *exec_engine_iter;
>  	uint32_t scratch, plug, batch;
>  	igt_spin_t *spin =3D NULL;
>  	unsigned int other;
> @@ -213,7 +214,7 @@ static void independent(int fd, unsigned int engine)
>  	plug =3D igt_cork_plug(&cork, fd);
> =20
>  	/* Check that we can submit to engine while all others are blocked */
> -	for_each_physical_engine(fd, other) {
> +	for_each_physical_engine(fd, exec_engine_iter, other) {
>  		if (other =3D=3D engine)
>  			continue;
> =20
> @@ -275,7 +276,9 @@ static void smoketest(int fd, unsigned ring, unsigned=
 timeout)
> =20
>  	nengine =3D 0;
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, engine)
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, engine)
>  			engines[nengine++] =3D engine;
>  	} else {
>  		engines[nengine++] =3D ring;
> @@ -342,6 +345,7 @@ static uint32_t batch_create(int i915)
> =20
>  static void semaphore_userlock(int i915)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	struct drm_i915_gem_exec_object2 obj =3D {
>  		.handle =3D batch_create(i915),
>  	};
> @@ -359,7 +363,7 @@ static void semaphore_userlock(int i915)
>  	 */
> =20
>  	scratch =3D gem_create(i915, 4096);
> -	for_each_physical_engine(i915, engine) {
> +	for_each_physical_engine(i915, exec_engine_iter, engine) {
>  		if (!spin) {
>  			spin =3D igt_spin_batch_new(i915,
>  						  .dependency =3D scratch,
> @@ -384,7 +388,7 @@ static void semaphore_userlock(int i915)
>  	 * taking precedence.
>  	 */
>  	scratch =3D gem_context_create(i915);
> -	for_each_physical_engine(i915, engine) {
> +	for_each_physical_engine(i915, exec_engine_iter, engine) {
>  		struct drm_i915_gem_execbuffer2 execbuf =3D {
>  			.buffers_ptr =3D to_user_pointer(&obj),
>  			.buffer_count =3D 1,
> @@ -549,11 +553,12 @@ static void preempt(int fd, unsigned ring, unsigned=
 flags)
> =20
>  static igt_spin_t *__noise(int fd, uint32_t ctx, int prio, igt_spin_t *s=
pin)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned other;
> =20
>  	gem_context_set_priority(fd, ctx, prio);
> =20
> -	for_each_physical_engine(fd, other) {
> +	for_each_physical_engine(fd, exec_engine_iter, other) {
>  		if (spin =3D=3D NULL) {
>  			spin =3D __igt_spin_batch_new(fd,
>  						    .ctx =3D ctx,
> @@ -591,7 +596,9 @@ static void __preempt_other(int fd,
>  	n++;
> =20
>  	if (flags & CHAIN) {
> -		for_each_physical_engine(fd, other) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, other) {
>  			store_dword(fd, ctx[LO], other,
>  				    result, (n + 1)*sizeof(uint32_t), n + 1,
>  				    0, I915_GEM_DOMAIN_RENDER);
> @@ -617,6 +624,7 @@ static void __preempt_other(int fd,
> =20
>  static void preempt_other(int fd, unsigned ring, unsigned int flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned int primary;
>  	igt_spin_t *spin =3D NULL;
>  	uint32_t ctx[3];
> @@ -640,8 +648,8 @@ static void preempt_other(int fd, unsigned ring, unsi=
gned int flags)
>  	ctx[HI] =3D gem_context_create(fd);
>  	gem_context_set_priority(fd, ctx[HI], MAX_PRIO);
> =20
> -	for_each_physical_engine(fd, primary) {
> -		igt_debug("Primary engine: %s\n", e__->name);
> +	for_each_physical_engine(fd, exec_engine_iter, primary) {
> +		igt_debug("Primary engine: %s\n", exec_engine_iter->name);
>  		__preempt_other(fd, ctx, ring, primary, flags);
> =20
>  	}
> @@ -696,7 +704,9 @@ static void __preempt_queue(int fd,
>  	n++;
> =20
>  	if (flags & CHAIN) {
> -		for_each_physical_engine(fd, other) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, other) {
>  			store_dword(fd, ctx[LO], other,
>  				    result, (n + 1)*sizeof(uint32_t), n + 1,
>  				    0, I915_GEM_DOMAIN_RENDER);
> @@ -737,9 +747,10 @@ static void __preempt_queue(int fd,
> =20
>  static void preempt_queue(int fd, unsigned ring, unsigned int flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned other;
> =20
> -	for_each_physical_engine(fd, other) {
> +	for_each_physical_engine(fd, exec_engine_iter, other) {
>  		for (unsigned depth =3D 0; depth <=3D MAX_ELSP_QLEN; depth++)
>  			__preempt_queue(fd, ring, other, depth, flags);
>  	}
> @@ -747,6 +758,7 @@ static void preempt_queue(int fd, unsigned ring, unsi=
gned int flags)
> =20
>  static void preempt_self(int fd, unsigned ring)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	uint32_t result =3D gem_create(fd, 4096);
>  	uint32_t result_read[4096 / sizeof(uint32_t)];
>  	igt_spin_t *spin[MAX_ELSP_QLEN];
> @@ -768,7 +780,7 @@ static void preempt_self(int fd, unsigned ring)
> =20
>  	n =3D 0;
>  	gem_context_set_priority(fd, ctx[HI], MIN_PRIO);
> -	for_each_physical_engine(fd, other) {
> +	for_each_physical_engine(fd, exec_engine_iter, other) {
>  		spin[n] =3D __igt_spin_batch_new(fd,
>  					       .ctx =3D ctx[NOISE],
>  					       .engine =3D other);
> @@ -1289,12 +1301,14 @@ static void test_pi_ringfull(int fd, unsigned int=
 engine)
> =20
>  static void measure_semaphore_power(int i915)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	struct gpu_power power;
>  	unsigned int engine, signaler;
> =20
>  	igt_require(gpu_power_open(&power) =3D=3D 0);
> =20
> -	for_each_physical_engine(i915, signaler) {
> +	for_each_physical_engine(i915, exec_engine_iter, signaler) {
> +		const struct intel_execution_engine *exec_engine_iter2;
>  		struct gpu_power_sample s_spin[2];
>  		struct gpu_power_sample s_sema[2];
>  		double baseline, total;
> @@ -1313,7 +1327,7 @@ static void measure_semaphore_power(int i915)
>  		gpu_power_read(&power, &s_spin[1]);
> =20
>  		/* Add a waiter to each engine */
> -		for_each_physical_engine(i915, engine) {
> +		for_each_physical_engine(i915, exec_engine_iter2, engine) {
>  			igt_spin_t *sema;
> =20
>  			if (engine =3D=3D signaler)
> @@ -1337,7 +1351,7 @@ static void measure_semaphore_power(int i915)
>  		total =3D gpu_power_W(&power, &s_sema[0], &s_sema[1]);
> =20
>  		igt_info("%s: %.1fmW + %.1fmW (total %1.fmW)\n",
> -			 e__->name,
> +			 exec_engine_iter->name,
>  			 1e3 * baseline,
>  			 1e3 * (total - baseline),
>  			 1e3 * total);
> diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
> index a7673489..fb916e0a 100644
> --- a/tests/i915/gem_exec_store.c
> +++ b/tests/i915/gem_exec_store.c
> @@ -178,6 +178,7 @@ static void store_cachelines(int fd, unsigned ring, u=
nsigned int flags)
> =20
>  static void store_all(int fd)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	struct drm_i915_gem_exec_object2 obj[2];
>  	struct drm_i915_gem_relocation_entry reloc[32];
> @@ -220,7 +221,7 @@ static void store_all(int fd)
> =20
>  	nengine =3D 0;
>  	intel_detect_and_clear_missed_interrupts(fd);
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		if (!gem_can_store_dword(fd, engine))
>  			continue;
> =20
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index 43c52d10..d7795251 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -64,9 +64,10 @@ static void check_bo(int fd, uint32_t handle)
> =20
>  static void test_all(int fd, unsigned flags)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned engine;
> =20
> -	for_each_physical_engine(fd, engine)
> +	for_each_physical_engine(fd, exec_engine_iter, engine)
>  		if (gem_can_store_dword(fd, engine))
>  			run_test(fd, engine, flags & ~0xff);
>  }
> @@ -106,7 +107,9 @@ static void run_test(int fd, unsigned engine, unsigne=
d flags)
>  		 * GPU is then unlikely to be active!)
>  		 */
>  		if (has_semaphores(fd)) {
> -			for_each_physical_engine(fd, engine) {
> +			const struct intel_execution_engine *exec_engine_iter;
> +
> +			for_each_physical_engine(fd, exec_engine_iter, engine) {
>  				if (gem_can_store_dword(fd, engine))
>  					engines[nengine++] =3D engine;
>  			}
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 6c3b5375..b7e88c98 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -209,7 +209,9 @@ static void whisper(int fd, unsigned engine, unsigned=
 flags)
> =20
>  	nengine =3D 0;
>  	if (engine =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, engine) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, engine) {
>  			if (gem_can_store_dword(fd, engine))
>  				engines[nengine++] =3D engine;
>  		}
> diff --git a/tests/i915/gem_ring_sync_loop.c b/tests/i915/gem_ring_sync_l=
oop.c
> index 118f3638..ba4adc09 100644
> --- a/tests/i915/gem_ring_sync_loop.c
> +++ b/tests/i915/gem_ring_sync_loop.c
> @@ -38,6 +38,7 @@ IGT_TEST_DESCRIPTION("Basic check of ring<->ring write =
synchronisation.");
>  static void
>  sync_loop(int fd)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const uint32_t bbe =3D MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_exec_object2 object[2];
> @@ -48,7 +49,7 @@ sync_loop(int fd)
>  	int i;
> =20
>  	nengine =3D 0;
> -	for_each_physical_engine(fd, engine)
> +	for_each_physical_engine(fd, exec_engine_iter, engine)
>  		engines[nengine++] =3D engine;
>  	igt_require(nengine);
> =20
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 52410010..96429257 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -73,9 +73,10 @@ static void spin_exit_handler(int sig)
> =20
>  static void spin_on_all_engines(int fd, unsigned int timeout_sec)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned engine;
> =20
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		igt_fork(child, 1) {
>  			igt_install_exit_handler(spin_exit_handler);
>  			spin(fd, engine, timeout_sec);
> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 3e4feff3..b4352e5b 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -86,8 +86,10 @@ sync_ring(int fd, unsigned ring, int num_children, int=
 timeout)
>  	int num_engines =3D 0;
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> -			names[num_engines] =3D e__->name;
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
> +			names[num_engines] =3D exec_engine_iter->name;
>  			engines[num_engines++] =3D ring;
>  			if (num_engines =3D=3D ARRAY_SIZE(engines))
>  				break;
> @@ -185,11 +187,13 @@ wakeup_ring(int fd, unsigned ring, int timeout, int=
 wlen)
>  	int num_engines =3D 0;
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
>  			if (!gem_can_store_dword(fd, ring))
>  				continue;
> =20
> -			names[num_engines] =3D e__->name;
> +			names[num_engines] =3D exec_engine_iter->name;
>  			engines[num_engines++] =3D ring;
>  			if (num_engines =3D=3D ARRAY_SIZE(engines))
>  				break;
> @@ -301,11 +305,13 @@ static void active_ring(int fd, unsigned ring, int =
timeout)
>  	int num_engines =3D 0;
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
>  			if (!gem_can_store_dword(fd, ring))
>  				continue;
> =20
> -			names[num_engines] =3D e__->name;
> +			names[num_engines] =3D exec_engine_iter->name;
>  			engines[num_engines++] =3D ring;
>  			if (num_engines =3D=3D ARRAY_SIZE(engines))
>  				break;
> @@ -370,11 +376,13 @@ active_wakeup_ring(int fd, unsigned ring, int timeo=
ut, int wlen)
>  	int num_engines =3D 0;
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
>  			if (!gem_can_store_dword(fd, ring))
>  				continue;
> =20
> -			names[num_engines] =3D e__->name;
> +			names[num_engines] =3D exec_engine_iter->name;
>  			engines[num_engines++] =3D ring;
>  			if (num_engines =3D=3D ARRAY_SIZE(engines))
>  				break;
> @@ -509,11 +517,13 @@ store_ring(int fd, unsigned ring, int num_children,=
 int timeout)
>  	int num_engines =3D 0;
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
>  			if (!gem_can_store_dword(fd, ring))
>  				continue;
> =20
> -			names[num_engines] =3D e__->name;
> +			names[num_engines] =3D exec_engine_iter->name;
>  			engines[num_engines++] =3D ring;
>  			if (num_engines =3D=3D ARRAY_SIZE(engines))
>  				break;
> @@ -626,11 +636,13 @@ switch_ring(int fd, unsigned ring, int num_children=
, int timeout)
>  	gem_require_contexts(fd);
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
>  			if (!gem_can_store_dword(fd, ring))
>  				continue;
> =20
> -			names[num_engines] =3D e__->name;
> +			names[num_engines] =3D exec_engine_iter->name;
>  			engines[num_engines++] =3D ring;
>  			if (num_engines =3D=3D ARRAY_SIZE(engines))
>  				break;
> @@ -953,7 +965,9 @@ store_many(int fd, unsigned ring, int timeout)
>  	intel_detect_and_clear_missed_interrupts(fd);
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
>  			if (!gem_can_store_dword(fd, ring))
>  				continue;
> =20
> @@ -963,7 +977,7 @@ store_many(int fd, unsigned ring, int timeout)
>  					     timeout,
>  					     &shared[n]);
> =20
> -			names[n++] =3D e__->name;
> +			names[n++] =3D exec_engine_iter->name;
>  		}
>  		igt_waitchildren();
>  	} else {
> @@ -984,10 +998,11 @@ store_many(int fd, unsigned ring, int timeout)
>  static void
>  sync_all(int fd, int num_children, int timeout)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	unsigned engines[16], engine;
>  	int num_engines =3D 0;
> =20
> -	for_each_physical_engine(fd, engine) {
> +	for_each_physical_engine(fd, exec_engine_iter, engine) {
>  		engines[num_engines++] =3D engine;
>  		if (num_engines =3D=3D ARRAY_SIZE(engines))
>  			break;
> @@ -1035,12 +1050,13 @@ sync_all(int fd, int num_children, int timeout)
>  static void
>  store_all(int fd, int num_children, int timeout)
>  {
> +	const struct intel_execution_engine *exec_engine_iter;
>  	const int gen =3D intel_gen(intel_get_drm_devid(fd));
>  	unsigned engines[16];
>  	int num_engines =3D 0;
>  	unsigned int ring;
> =20
> -	for_each_physical_engine(fd, ring) {
> +	for_each_physical_engine(fd, exec_engine_iter, ring) {
>  		if (!gem_can_store_dword(fd, ring))
>  			continue;
> =20
> @@ -1149,8 +1165,10 @@ preempt(int fd, unsigned ring, int num_children, i=
nt timeout)
>  	uint32_t ctx[2];
> =20
>  	if (ring =3D=3D ALL_ENGINES) {
> -		for_each_physical_engine(fd, ring) {
> -			names[num_engines] =3D e__->name;
> +		const struct intel_execution_engine *exec_engine_iter;
> +
> +		for_each_physical_engine(fd, exec_engine_iter, ring) {
> +			names[num_engines] =3D exec_engine_iter->name;
>  			engines[num_engines++] =3D ring;
>  			if (num_engines =3D=3D ARRAY_SIZE(engines))
>  				break;
> --=20
> 2.21.0
>=20
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=20
Rodrigo Siqueira
https://siqueira.tech

--7j5kkuovamymcsr5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyroDwACgkQWJzP/com
vP8Q3hAAwBvrhmqc8NKkW66GY3iATkhFb5KXrvfT9lXZic3k7YjNvWz9VsQHOPiC
37HIXzHjnNoTCH9frTy7tVSdlcr9Y3LKw/H5hCoeL03xVomvPhKS1v1McZMeig6G
EB+Wu6Uh5E+btZTJHO9RQJ+KmejsJ1ACB6eLEmlRZgb3Hlex8kPX54N7gm5gzr96
pa6LWyAVCIyKT8FAYT/O8eHVc+qfGajTn8gYfMWLKpJm5HCV+z2g5S2+VswE7CLn
2fMnKyBxIMdGz8kyviYksUmH+h/LtF5ElT0tOwGDeiOAnMJVM+D5hrrF2lq0rpb4
YtiHC0+MGQlbj7x3Jw/lndQ7WVIzvBsue/Jxp0CnWoB7gQbb+CoB4urrgQ53fwYL
CSVW/27izCbL5SGJHd6tyeqL2OWvLc+MNAsTEhJ63NCuRmLcihvJKUZFLvJ0PyPn
QeSeGECPapbZ3T9TruUtNJ/UkcibI0DhS3u+VDTWVSmAKstDx4Y2+IFvLud+UJ5m
0+DmATkm+DaiwCUjp4q2RhCY+dPLn2vZoPMrF1W2h1hOL1PMGAmjEqXJeRiDyfEy
QatuqTnr33s4D6q+kDZq+flCOKipFon4EXllpuuM0MnVUcsO09gzEp1GzAKO4tbw
Yxwf9xXoTdoghmCa7KZYy3rL7C52hsGQL7T8LYiF4IW2ZL4Dqow=
=qf+d
-----END PGP SIGNATURE-----

--7j5kkuovamymcsr5--

--===============0122848962==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0122848962==--
