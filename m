Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175526E0FF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 16:49:02 +0000 (UTC)
Date: Tue, 5 Oct 2021 09:44:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211005164412.GA13993@jons-linux-dev-box>
References: <20210916180301.6791-1-matthew.brost@intel.com>
 <20210916180301.6791-3-matthew.brost@intel.com>
 <4264a50f-549e-44ee-cd3e-d7221e38b21b@intel.com>
 <e481b241-c3a3-40c1-6f17-129b2144d81a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e481b241-c3a3-40c1-6f17-129b2144d81a@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] i915/gem_ctx_shared: Make
 gem_ctx_shared understand static priority mapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, igt-dev@lists.freedesktop.org, john.c.harrison@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 05, 2021 at 11:44:02AM +0100, Tvrtko Ursulin wrote:
>=20
> On 05/10/2021 00:26, Daniele Ceraolo Spurio wrote:
> >=20
> >=20
> > On 9/16/2021 11:03 AM, Matthew Brost wrote:
> > > The i915 currently has 2k visible priority levels which are currently
> > > unique. This is changing to statically map these 2k levels into 3
> > > buckets:
> > >=20
> > > low: < 0
> > > mid: 0
> > > high: > 0
> > >=20
> > > Update gem_ctx_shared to understand this. This entails updating
> > > promotion test to use 3 levels that will map into different buckets a=
nd
> > > also add bit of delay after releasing a cork beforing completing the
> > > spinners to give time to the i915 schedule to process the fence and
> > > release and queue the requests.
> > >=20
> > > v2: Add a delay between starting releasing spinner and cork in
> > > promotion
> > > v3:
> > > =A0 (Daniele)
> > > =A0=A0 - Always add delay, update commit message
> > >=20
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > > =A0 tests/i915/gem_ctx_shared.c | 5 +++--
> > > =A0 1 file changed, 3 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> > > index ea1b5dd1b..7f88871b8 100644
> > > --- a/tests/i915/gem_ctx_shared.c
> > > +++ b/tests/i915/gem_ctx_shared.c
> > > @@ -622,6 +622,7 @@ static void unplug_show_queue(int i915, struct
> > > igt_cork *c, uint64_t ahnd,
> > > =A0=A0=A0=A0=A0 igt_cork_unplug(c); /* batches will now be queued on =
the engine */
> > > =A0=A0=A0=A0=A0 igt_debugfs_dump(i915, "i915_engine_info");
> > > +=A0=A0=A0 usleep(250000);
> >=20
> > Same as previous patch, with a comment added:
> >=20
> > Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>=20
> Come on guys, it is a bit bad and lazy for good taste no? 250ms more test

Yea, this is way too long of a sleep. 25ms seems just fine.

On TGL /w the updated sleep:
gem_ctx_shared --r *promotion*
IGT-Version: 1.26-g7e489b053 (x86_64) (Linux: 5.15.0-rc3-guc+ x86_64)
Starting subtest: Q-promotion
Starting dynamic subtest: rcs0
Dynamic subtest rcs0: SUCCESS (0.059s)
Starting dynamic subtest: bcs0
Dynamic subtest bcs0: SUCCESS (0.059s)
Starting dynamic subtest: vcs0
Dynamic subtest vcs0: SUCCESS (0.060s)
Starting dynamic subtest: vecs0
Dynamic subtest vecs0: SUCCESS (0.061s)
Subtest Q-promotion: SUCCESS (0.239s)

> runtime, multiplied by number of tests and subtests (engines) will add up
> and over shadows the current test time. For instance current state is:
>=20
> # tests/gem_ctx_shared --r *promotion*
> IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 5.15.0-rc4 x86_64)
> Starting subtest: Q-promotion
> Starting dynamic subtest: rcs0
> Dynamic subtest rcs0: SUCCESS (0.174s)
> Starting dynamic subtest: bcs0
> Dynamic subtest bcs0: SUCCESS (0.224s)
> Starting dynamic subtest: vcs0
> Dynamic subtest vcs0: SUCCESS (0.153s)
> Starting dynamic subtest: vecs0
> Dynamic subtest vecs0: SUCCESS (0.153s)
> Subtest Q-promotion: SUCCESS (0.708s)
>=20
> This patch instantly makes this 1.7 seconds instead. Add the in/out order
> subtests, other tests, platforms with more engines, in a world where CI t=
ime
> budget is scarce - can't we do better than this and not settle on sprinkl=
ing
> of usleep all over the place?
>=20
> Like maybe add out fences to the two requests, merge them, and wait on th=
at
> (since there is no implicit write declared so set domain does not suffice=
)?
>

Not sure I follow. Anyways reposting now with a smaller timeout value.
Unless we hear something we plan on merging this tomorrow.

Matt=20

> Unless I am missing something it would be strictly correct for execlists
> backend as well since it now works just because it is fast enough.
>=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > Daniele
> >=20
> > > =A0=A0=A0=A0=A0 for (int n =3D 0; n < ARRAY_SIZE(spin); n++) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 ahnd =3D spin[n]->ahnd;
> > > @@ -831,10 +832,10 @@ static void promotion(int i915, const
> > > intel_ctx_cfg_t *cfg, unsigned ring)
> > > =A0=A0=A0=A0=A0 gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
> > > =A0=A0=A0=A0=A0 ctx[HI] =3D intel_ctx_create(i915, &q_cfg);
> > > -=A0=A0=A0 gem_context_set_priority(i915, ctx[HI]->id, 0);
> > > +=A0=A0=A0 gem_context_set_priority(i915, ctx[HI]->id, MAX_PRIO);
> > > =A0=A0=A0=A0=A0 ctx[NOISE] =3D intel_ctx_create(i915, &q_cfg);
> > > -=A0=A0=A0 gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
> > > +=A0=A0=A0 gem_context_set_priority(i915, ctx[NOISE]->id, 0);
> > > =A0=A0=A0=A0=A0 result =3D gem_create(i915, 4096);
> > > =A0=A0=A0=A0=A0 result_offset =3D get_offset(ahnd, result, 4096, 0);
> >=20
