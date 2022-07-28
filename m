Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433EF1128CC
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 14:28:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YuIeu2vSAFE8YnB3@kamilkon-desk1>
References: <20220713105342.653916-1-karolina.drobnik@intel.com>
 <Yt/GvIdBSkRUAxWU@kamilkon-desk1>
 <5f3bc16e-ac4d-5d51-9653-7478f981615f@intel.com>
 <YuIeu2vSAFE8YnB3@kamilkon-desk1>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Date: Thu, 28 Jul 2022 15:12:02 +0100
Message-ID: <165901752241.12256.12138491571584116288@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] i915/i915_pm_rps: Check impact of
 fence ordering on waitboosting
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

Quoting Kamil Konieczny (2022-07-28 06:29:31)
> Hi,
>=20
> On 2022-07-27 at 14:27:02 +0200, Karolina Drobnik wrote:
> > Hi,
> >=20
> > On 26.07.2022 12:49, Kamil Konieczny wrote:
> > > Hi Karolina,
> > >=20
> > > few more nits, see below.
> > >=20
> > > On 2022-07-13 at 12:53:42 +0200, Karolina Drobnik wrote:
> > > > From: Chris Wilson <chris@chris-wilson.co.uk>
> > > >=20
> > > > Currently the wait boost heuristic is evaluated at the start of each
> > > > fence wait for a series within dma-resv. There is no strict orderin=
g of
> > > > fences defined by dma-resv, and so it turns out that the same opera=
tion
> > > > under different circumstances can result in different heuristics be=
ing
> > > > applied, and dramatic performance variations in user applications.
> > > >=20
> > > > Link: https://gitlab.freedesktop.org/drm/intel/-/issues/6284
> > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> > > > ---
> > > > v4:
> > > >    - Added test descriptions with igt_describe()
> > > > v3:
> > > >    - Removed unnecessary calls to gem_write
> > > > v2:
> > > >    - Introduced batch_create() with arbitration points to prevent h=
angs
> > > >    - Added engine-order subtest
> > > >    - Added reporting of GPU frequency
> > > >    - Changed runtimes and switched prints from us to ms
> > > >=20
> > > >   tests/i915/i915_pm_rps.c | 261 ++++++++++++++++++++++++++++++++++=
++++-
> > > >   1 file changed, 255 insertions(+), 6 deletions(-)
> > > >=20
> > > > diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> > > > index b37f15c2..6125ea60 100644
> > > > --- a/tests/i915/i915_pm_rps.c
> > > > +++ b/tests/i915/i915_pm_rps.c
> > > > @@ -37,8 +37,10 @@
> > > >   #include <sys/wait.h>
> > > >=20
> > > >   #include "i915/gem.h"
> > > > +#include "i915/gem_create.h"
> > > >   #include "igt.h"
> > > >   #include "igt_dummyload.h"
> > > > +#include "igt_perf.h"
> > > >   #include "igt_sysfs.h"
> > > >=20
> > > >   IGT_TEST_DESCRIPTION("Render P-States tests - verify GPU frequenc=
y changes");
> > > > @@ -614,14 +616,253 @@ static void waitboost(int fd, bool reset)
> > > >           igt_assert_lt(post_freqs[CUR], post_freqs[MAX]);
> > > >   }
> > > >=20
> > > > +static uint32_t batch_create(int i915, uint64_t sz)
> > > > +{
> > > > + const uint32_t bbe =3D MI_BATCH_BUFFER_END;
> > > > + const uint32_t chk =3D 0x5 << 23;
> > > > + uint32_t handle =3D gem_create(i915, sz);
> > > > +
> > > > + for (uint64_t pg =3D 4096; pg + 4096 < sz; pg +=3D 4096)
> > > > +         gem_write(i915, handle, pg, &chk, sizeof(chk));
> > > > +
> > > > + gem_write(i915, handle, sz - sizeof(bbe), &bbe, sizeof(bbe));
> > > > +
> > > > + return handle;
> > > > +}
> > > > +
> > > > +static uint64_t __fence_order(int i915,
> > > > +                       struct drm_i915_gem_exec_object2 *obj,
> > > > +                       struct drm_i915_gem_execbuffer2 *eb,
> > > > +                       uint64_t flags0, uint64_t flags1,
> > > > +                       double *outf)
> > > > +{
> > > > + uint64_t before[2], after[2];
> > > > + struct timespec tv;
> > > > + int fd;
> > > > +
> > > > + gem_quiescent_gpu(i915);
> > > > + fd =3D perf_i915_open(i915, I915_PMU_ACTUAL_FREQUENCY);
> > > > +
> > > > + igt_gettime(&tv);
> > > > +
> > > > + obj->flags =3D flags0;
> > > > + gem_execbuf(i915, eb);
> > > > +
> > > > + obj->flags =3D flags1;
> > > > + gem_execbuf(i915, eb);
> > > > +
> > > > + read(fd, before, sizeof(before));
> > > > + gem_sync(i915, obj->handle);
> > > > + read(fd, after, sizeof(after));
> > > > + close(fd);
> > > > +
> > > > + after[0] -=3D before[0];
> > > > + after[1] -=3D before[1];
> > >=20
> > > Put igt_assert here (check for zero before divide).
> >=20
> > Hmm, isn't that more of a belts and suspenders approach? It's unlikely =
we'd
> > get zero here. Also, don't we put asserts towards the end of the test
> > whenever possible?
>=20
> It is userspace so we can afford some extra checks, so maybe
>         if (after[1] =3D=3D 0)
>                 return 0;
> >=20
> > > > +
> > > > + *outf =3D 1e9 * after[0] / after[1];
> > > > + return igt_nsec_elapsed(&tv);
> > > > +}
> > > > +
> > > > +static void fence_order(int i915)
> > > > +{
> > > > + const uint64_t sz =3D 512ull << 20;
> > > > + struct drm_i915_gem_exec_object2 obj[2] =3D {
> > > > +         { .handle =3D gem_create(i915, 4096) },
> > > > +         { .handle =3D batch_create(i915, sz) },
> > > > + };
> > > > + struct drm_i915_gem_execbuffer2 execbuf =3D {
> > > > +         .buffers_ptr =3D to_user_pointer(obj),
> > > > +         .buffer_count =3D ARRAY_SIZE(obj),
> > > > + };
> > > > + uint64_t wr, rw;
> > > > + int min, max;
> > > > + double freq;
> > > > + int sysfs;
> > > > +
> > > > + /*
> > > > +  * Check the order of fences found during GEM_WAIT does not affect
> > > > +  * waitboosting.
> > > > +  *
> > > > +  * Internally, implicit fences are tracked within a dma-resv which
> > > > +  * imposes no order on the individually fences tracked within. Si=
nce
> > > > +  * there is no defined order, the sequence of waits (and the asso=
ciated
> > > > +  * waitboosts) is also undefined, undermining the consistency of =
the
> > > > +  * waitboost heuristic.
> > > > +  *
> > > > +  * In particular, we can influence the sequence of fence storage
> > > > +  * within dma-resv by mixing read/write semantics for implicit fe=
nces.
> > > > +  * We can exploit this property of dma-resv to exercise that no m=
atter
> > > > +  * the stored order, the heuristic is applied consistently for the
> > > > +  * user's GEM_WAIT ioctl.
> > > > +  */
> > > > +
> > > > + sysfs =3D igt_sysfs_open(i915);
> > > > + min =3D igt_sysfs_get_u32(sysfs, "gt_RPn_freq_mhz");
> > > > + max =3D igt_sysfs_get_u32(sysfs, "gt_RP0_freq_mhz");
> > > > + igt_require(max > min);
> > > > +
> > > > + /* Only allow ourselves to upclock via waitboosting */
> > > > + igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
> > > > + igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", min);
> > > > + igt_sysfs_printf(sysfs, "gt_boost_freq_mhz", "%d", max);
> > > > +
> > > > + /* Warm up to bind the vma */
> > > > + __fence_order(i915, &obj[0], &execbuf, 0, 0, &freq);
> > > > +
> > > > + wr =3D __fence_order(i915, &obj[0], &execbuf, EXEC_OBJECT_WRITE, =
0, &freq);
> > > > + igt_info("Write-then-read: %.2fms @ %.3fMHz\n", wr * 1e-6, freq);
> > > > +
> > > > + rw =3D __fence_order(i915, &obj[0], &execbuf, 0, EXEC_OBJECT_WRIT=
E, &freq);
> > > > + igt_info("Read-then-write: %.2fms @ %.3fMHz\n", rw * 1e-6, freq);
> > > > +
> > > > + gem_close(i915, obj[0].handle);
> > > > + gem_close(i915, obj[1].handle);
> > >=20
> > > Close sysfs here.
> >=20
> > Good catch. I'll close it before asserts (as agreed).
> >=20
>=20
> My bad, this close should be after resetting max freq, two lines
> below. Btw why not reuse code from other tests, reading old freqs
> at beginnig of test or reusing freqs readed at fixture in
> igt_main ?
>=20
> > > > +
> > > > + igt_sysfs_printf(sysfs, "gt_min_freq_mhz", "%d", min);
> > > > + igt_sysfs_printf(sysfs, "gt_max_freq_mhz", "%d", max);
> > >=20
> > > Here we should put previous values, not those readed from RPx,
> > > but if they are always the same it is ok.
> >=20
> > We restore the values we read from sysfs
> >=20
>=20
> But we readed RPx values, not gt_min|gt_max freq ones, so here
> you can use origfreqs[MIN] and origfreqs[MAX] or declare in test

Not required. igt owns the device. We completely take over the device,
restoring default properties, all previous state will be lost. Anything
that pretends otherwise is misleading.
-Chris
