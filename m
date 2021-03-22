Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638186E591
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 19:15:18 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id v4so18337486wrp.13
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 12:15:18 -0700 (PDT)
Date: Mon, 22 Mar 2021 20:15:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFjswi42ty9YeyQO@phenom.ffwll.local>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
 <20210319223233.2982842-2-jason@jlekstrand.net>
 <YFjryBlPz798FSnF@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YFjryBlPz798FSnF@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] tests/i915: Drop gem_ctx_ringsize
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

On Mon, Mar 22, 2021 at 08:11:04PM +0100, Daniel Vetter wrote:
> On Fri, Mar 19, 2021 at 05:32:26PM -0500, Jason Ekstrand wrote:
> > I915_CONTEXT_PARAM_RINGSIZE is being removed from upstream i915 because
> > it's never been used by any userspace other than IGT.
> > ---
> >  tests/Makefile.sources        |   3 -
> >  tests/i915/gem_ctx_ringsize.c | 345 ----------------------------------
> >  tests/meson.build             |   1 -
> =

> Your forgot Makefile.sources. Yes we still have some autotools left for
> test building. With that fixed and the sob line fixed.

Lol I was blind, apologies :-/

Maybe shouldn't review patch series this late, but oh well.
-Daniel

> =

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> >  3 files changed, 349 deletions(-)
> >  delete mode 100644 tests/i915/gem_ctx_ringsize.c
> > =

> > diff --git a/tests/Makefile.sources b/tests/Makefile.sources
> > index ec52ee3b..cfef5d34 100644
> > --- a/tests/Makefile.sources
> > +++ b/tests/Makefile.sources
> > @@ -194,9 +194,6 @@ gem_ctx_param_SOURCES =3D i915/gem_ctx_param.c
> >  TESTS_progs +=3D gem_ctx_persistence
> >  gem_ctx_persistence_SOURCES =3D i915/gem_ctx_persistence.c
> >  =

> > -TESTS_progs +=3D gem_ctx_ringsize
> > -gem_ctx_ringsize_SOURCES =3D i915/gem_ctx_ringsize.c
> > -
> >  TESTS_progs +=3D gem_ctx_shared
> >  gem_ctx_shared_SOURCES =3D i915/gem_ctx_shared.c
> >  =

> > diff --git a/tests/i915/gem_ctx_ringsize.c b/tests/i915/gem_ctx_ringsiz=
e.c
> > deleted file mode 100644
> > index 60187b7c..00000000
> > --- a/tests/i915/gem_ctx_ringsize.c
> > +++ /dev/null
> > @@ -1,345 +0,0 @@
> > -/*
> > - * Copyright =A9 2019 Intel Corporation
> > - *
> > - * Permission is hereby granted, free of charge, to any person obtaini=
ng a
> > - * copy of this software and associated documentation files (the "Soft=
ware"),
> > - * to deal in the Software without restriction, including without limi=
tation
> > - * the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,
> > - * and/or sell copies of the Software, and to permit persons to whom t=
he
> > - * Software is furnished to do so, subject to the following conditions:
> > - *
> > - * The above copyright notice and this permission notice (including th=
e next
> > - * paragraph) shall be included in all copies or substantial portions =
of the
> > - * Software.
> > - *
> > - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXP=
RESS OR
> > - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,
> > - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT =
SHALL
> > - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES O=
R OTHER
> > - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARI=
SING
> > - * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER=
 DEALINGS
> > - * IN THE SOFTWARE.
> > - */
> > -
> > -#include <errno.h>
> > -#include <fcntl.h>
> > -#include <inttypes.h>
> > -#include <math.h>
> > -#include <signal.h>
> > -#include <sys/ioctl.h>
> > -#include <sys/types.h>
> > -#include <unistd.h>
> > -
> > -#include "drmtest.h"
> > -#include "i915/gem.h"
> > -#include "i915/gem_context.h"
> > -#include "i915/gem_engine_topology.h"
> > -#include "ioctl_wrappers.h" /* gem_wait()! */
> > -#include "sw_sync.h"
> > -
> > -static bool has_ringsize(int i915)
> > -{
> > -	struct drm_i915_gem_context_param p =3D {
> > -		.param =3D I915_CONTEXT_PARAM_RINGSIZE,
> > -	};
> > -
> > -	return __gem_context_get_param(i915, &p) =3D=3D 0;
> > -}
> > -
> > -static void test_idempotent(int i915)
> > -{
> > -	struct drm_i915_gem_context_param p =3D {
> > -		.param =3D I915_CONTEXT_PARAM_RINGSIZE,
> > -	};
> > -	uint32_t saved;
> > -
> > -	/*
> > -	 * Simple test to verify that we are able to read back the same
> > -	 * value as we set.
> > -	 */
> > -
> > -	gem_context_get_param(i915, &p);
> > -	saved =3D p.value;
> > -
> > -	for (uint32_t x =3D 1 << 12; x <=3D 128 << 12; x <<=3D 1) {
> > -		p.value =3D x;
> > -		gem_context_set_param(i915, &p);
> > -		gem_context_get_param(i915, &p);
> > -		igt_assert_eq_u32(p.value, x);
> > -	}
> > -
> > -	p.value =3D saved;
> > -	gem_context_set_param(i915, &p);
> > -}
> > -
> > -static void test_invalid(int i915)
> > -{
> > -	struct drm_i915_gem_context_param p =3D {
> > -		.param =3D I915_CONTEXT_PARAM_RINGSIZE,
> > -	};
> > -	uint64_t invalid[] =3D {
> > -		0, 1, 4095, 4097, 8191, 8193,
> > -		/* upper limit may be HW dependent, atm it is 512KiB */
> > -		(512 << 10) - 1, (512 << 10) + 1,
> > -		-1, -1u
> > -	};
> > -	uint32_t saved;
> > -
> > -	/*
> > -	 * The HW only accepts certain aligned values and so we reject
> > -	 * any invalid sizes specified by the user.
> > -	 *
> > -	 * Currently, the HW only accepts 4KiB - 512KiB in 4K increments,
> > -	 * and is unlikely to ever accept smaller.
> > -	 */
> > -
> > -	gem_context_get_param(i915, &p);
> > -	saved =3D p.value;
> > -
> > -	for (int i =3D 0; i < ARRAY_SIZE(invalid); i++) {
> > -		p.value =3D invalid[i];
> > -		igt_assert_eq(__gem_context_set_param(i915, &p), -EINVAL);
> > -		gem_context_get_param(i915, &p);
> > -		igt_assert_eq_u64(p.value, saved);
> > -	}
> > -}
> > -
> > -static int create_ext_ioctl(int i915,
> > -			    struct drm_i915_gem_context_create_ext *arg)
> > -{
> > -	int err;
> > -
> > -	err =3D 0;
> > -	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, arg)) {
> > -		err =3D -errno;
> > -		igt_assume(err);
> > -	}
> > -
> > -	errno =3D 0;
> > -	return err;
> > -}
> > -
> > -static void test_create(int i915)
> > -{
> > -	struct drm_i915_gem_context_create_ext_setparam p =3D {
> > -		.base =3D {
> > -			.name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> > -			.next_extension =3D 0, /* end of chain */
> > -		},
> > -		.param =3D {
> > -			.param =3D I915_CONTEXT_PARAM_RINGSIZE,
> > -			.value =3D 512 << 10,
> > -		}
> > -	};
> > -	struct drm_i915_gem_context_create_ext create =3D {
> > -		.flags =3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> > -		.extensions =3D to_user_pointer(&p),
> > -	};
> > -
> > -	/*
> > -	 * Check that the ringsize parameter is used during context constucti=
on.
> > -	 */
> > -
> > -	igt_assert_eq(create_ext_ioctl(i915, &create),  0);
> > -
> > -	p.param.ctx_id =3D create.ctx_id;
> > -	p.param.value =3D 0;
> > -	gem_context_get_param(i915, &p.param);
> > -	igt_assert_eq(p.param.value, 512 << 10);
> > -
> > -	gem_context_destroy(i915, create.ctx_id);
> > -}
> > -
> > -static void test_clone(int i915)
> > -{
> > -	struct drm_i915_gem_context_create_ext_setparam p =3D {
> > -		.base =3D {
> > -			.name =3D I915_CONTEXT_CREATE_EXT_SETPARAM,
> > -			.next_extension =3D 0, /* end of chain */
> > -		},
> > -		.param =3D {
> > -			.param =3D I915_CONTEXT_PARAM_RINGSIZE,
> > -			.value =3D 512 << 10,
> > -		}
> > -	};
> > -	struct drm_i915_gem_context_create_ext create =3D {
> > -		.flags =3D I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
> > -		.extensions =3D to_user_pointer(&p),
> > -	};
> > -
> > -	/*
> > -	 * Check that the ringsize is copied across during context cloning.
> > -	 */
> > -
> > -	igt_assert_eq(create_ext_ioctl(i915, &create),  0);
> > -
> > -	p.param.ctx_id =3D gem_context_clone(i915, create.ctx_id,
> > -					   I915_CONTEXT_CLONE_ENGINES, 0);
> > -	igt_assert_neq(p.param.ctx_id, create.ctx_id);
> > -	gem_context_destroy(i915, create.ctx_id);
> > -
> > -	p.param.value =3D 0;
> > -	gem_context_get_param(i915, &p.param);
> > -	igt_assert_eq(p.param.value, 512 << 10);
> > -
> > -	gem_context_destroy(i915, p.param.ctx_id);
> > -}
> > -
> > -static int __execbuf(int i915, struct drm_i915_gem_execbuffer2 *execbu=
f)
> > -{
> > -	int err;
> > -
> > -	err =3D 0;
> > -	if (ioctl(i915, DRM_IOCTL_I915_GEM_EXECBUFFER2, execbuf)) {
> > -		err =3D -errno;
> > -		igt_assume(err);
> > -	}
> > -
> > -	errno =3D 0;
> > -	return err;
> > -}
> > -
> > -#define IDLE (1 << 0)
> > -#define PLUG (1 << 1)
> > -
> > -static void sighandler(int sig)
> > -{
> > -}
> > -
> > -static unsigned int
> > -measure_inflight(int i915, unsigned int engine, int timeout, unsigned =
int flags)
> > -{
> > -	IGT_CORK_FENCE(cork);
> > -	unsigned int count;
> > -	igt_spin_t *spin;
> > -	int fence;
> > -	int err;
> > -
> > -	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
> > -	signal(SIGALRM, sighandler);
> > -	alarm(timeout);
> > -
> > -	fence =3D igt_cork_plug(&cork, i915);
> > -	spin =3D igt_spin_new(i915,
> > -			    .engine =3D engine,
> > -			    .fence =3D fence,
> > -			    .flags =3D (flags & PLUG) ? IGT_SPIN_FENCE_IN : 0);
> > -	for (count =3D 1; (err =3D __execbuf(i915, &spin->execbuf)) =3D=3D 0;=
 count++)
> > -		;
> > -	igt_debugfs_dump(i915, "i915_engine_info");
> > -	igt_assert_eq(err, -EWOULDBLOCK);
> > -	close(fence);
> > -
> > -	alarm(0);
> > -	signal(SIGALRM, SIG_DFL);
> > -	fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) & ~O_NONBLOCK);
> > -
> > -	igt_spin_free(i915, spin);
> > -	igt_cork_unplug(&cork);
> > -
> > -	return count;
> > -}
> > -
> > -static void test_resize(int i915,
> > -			const struct intel_execution_engine2 *e,
> > -			void *data)
> > -#define as_pointer(x) (void *)(uintptr_t)(x)
> > -{
> > -	struct drm_i915_gem_context_param p =3D {
> > -		.param =3D I915_CONTEXT_PARAM_RINGSIZE,
> > -	};
> > -	unsigned long flags =3D (uintptr_t)data;
> > -	unsigned int prev[2] =3D {};
> > -	uint64_t elapsed;
> > -	uint32_t saved;
> > -
> > -	/*
> > -	 * The ringsize directly affects the number of batches we can have
> > -	 * inflight -- when we run out of room in the ring, the client is
> > -	 * blocked (or if O_NONBLOCK is specified, -EWOULDBLOCK is reported).
> > -	 * The kernel throttles the client when they enter the last 4KiB page,
> > -	 * so as we double the size of the ring, we nearly double the number
> > -	 * of requests we can fit as 2^n-1: i.e 0, 1, 3, 7, 15, 31 pages.
> > -	 */
> > -
> > -	gem_context_get_param(i915, &p);
> > -	saved =3D p.value;
> > -
> > -	/* XXX disable hangchecking? */
> > -	elapsed =3D 0;
> > -	gem_quiescent_gpu(i915);
> > -	for (p.value =3D 1 << 12; p.value <=3D 128 << 12; p.value <<=3D 1) {
> > -		struct timespec tv =3D {};
> > -		unsigned int count;
> > -
> > -		gem_context_set_param(i915, &p);
> > -
> > -		igt_nsec_elapsed(&tv);
> > -		count =3D measure_inflight(i915,
> > -					 e->flags,
> > -					 1 + 4 * ceil(elapsed*1e-9),
> > -					 flags);
> > -		elapsed =3D igt_nsec_elapsed(&tv);
> > -
> > -		igt_info("%s: %6llx -> %'6d\n", e->name, p.value, count);
> > -		igt_assert(count > 3 * (prev[1] - prev[0]) / 4 + prev[1]);
> > -		if (flags & IDLE)
> > -			gem_quiescent_gpu(i915);
> > -
> > -		prev[0] =3D prev[1];
> > -		prev[1] =3D count;
> > -	}
> > -	gem_quiescent_gpu(i915);
> > -
> > -	p.value =3D saved;
> > -	gem_context_set_param(i915, &p);
> > -}
> > -
> > -static void gem_test_each_engine(int i915, const char *name,
> > -				 void (*fn)(int i915,
> > -					    const struct intel_execution_engine2 *e,
> > -					    void *data),
> > -				 void *data)
> > -{
> > -	const struct intel_execution_engine2 *e;
> > -
> > -	igt_subtest_with_dynamic(name) {
> > -		__for_each_physical_engine(i915, e) {
> > -			igt_dynamic_f("%s", e->name)
> > -				fn(i915, e, data);
> > -		}
> > -	}
> > -}
> > -
> > -igt_main
> > -{
> > -	int i915;
> > -
> > -	igt_fixture {
> > -		i915 =3D drm_open_driver(DRIVER_INTEL);
> > -		igt_require_gem(i915);
> > -
> > -		igt_require(has_ringsize(i915));
> > -	}
> > -
> > -	igt_subtest("idempotent")
> > -		test_idempotent(i915);
> > -
> > -	igt_subtest("invalid")
> > -		test_invalid(i915);
> > -
> > -	igt_subtest("create")
> > -		test_create(i915);
> > -	igt_subtest("clone")
> > -		test_clone(i915);
> > -
> > -	gem_test_each_engine(i915, "idle", test_resize, as_pointer(IDLE));
> > -	gem_test_each_engine(i915, "active", test_resize, 0);
> > -	gem_test_each_engine(i915, "plugged", test_resize, as_pointer(PLUG));
> > -
> > -	/* XXX ctx->engines[]? Clone (above) should be enough */
> > -
> > -	igt_fixture {
> > -		close(i915);
> > -	}
> > -}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 0abda2c3..846a9ccf 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -135,7 +135,6 @@ i915_progs =3D [
> >  	'gem_ctx_isolation',
> >  	'gem_ctx_param',
> >  	'gem_ctx_persistence',
> > -	'gem_ctx_ringsize',
> >  	'gem_ctx_shared',
> >  	'gem_ctx_switch',
> >  	'gem_evict_alignment',
> > -- =

> > 2.29.2
> > =

> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
