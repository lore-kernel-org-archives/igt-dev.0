Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E7B6E834
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Oct 2021 17:25:36 +0000 (UTC)
Date: Tue, 12 Oct 2021 10:20:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20211012172050.GA9075@jons-linux-dev-box>
References: <e481b241-c3a3-40c1-6f17-129b2144d81a@linux.intel.com>
 <20211005164412.GA13993@jons-linux-dev-box>
 <712c2aea-f998-520f-3f51-e117e05c0d54@linux.intel.com>
 <20211006164104.GA7828@jons-linux-dev-box>
 <b74b343e-513a-52cb-e66e-19b019e0afb1@linux.intel.com>
 <20211008174947.GA12060@jons-linux-dev-box>
 <1fc93656-a24d-a3b5-6a31-649478b3306d@linux.intel.com>
 <20211011171803.GA23672@jons-linux-dev-box>
 <4dc41f15-df44-85a6-a6eb-7d20ad426503@intel.com>
 <6fc76cce-0ef7-411a-b2ea-2093d49fb817@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <6fc76cce-0ef7-411a-b2ea-2093d49fb817@linux.intel.com>
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
Cc: John Harrison <john.c.harrison@intel.com>, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 12, 2021 at 09:02:17AM +0100, Tvrtko Ursulin wrote:
>=20
> On 11/10/2021 19:50, John Harrison wrote:
> > On 10/11/2021 10:18, Matthew Brost wrote:
> > > On Mon, Oct 11, 2021 at 09:04:29AM +0100, Tvrtko Ursulin wrote:
> > > > On 08/10/2021 18:49, Matthew Brost wrote:
> > > > > On Wed, Oct 06, 2021 at 07:34:45PM +0100, Tvrtko Ursulin wrote:
> > > > > > On 06/10/2021 17:41, Matthew Brost wrote:
> > > > > > > On Wed, Oct 06, 2021 at 09:12:41AM +0100, Tvrtko Ursulin wrot=
e:
> > > > > > > > On 05/10/2021 17:44, Matthew Brost wrote:
> > > > > > > > > On Tue, Oct 05, 2021 at 11:44:02AM +0100, Tvrtko Ursulin =
wrote:
> > > > > > > > > > On 05/10/2021 00:26, Daniele Ceraolo Spurio wrote:
> > > > > > > > > > > On 9/16/2021 11:03 AM, Matthew Brost wrote:
> > > > > > > > > > > > The i915 currently has 2k
> > > > > > > > > > > > visible priority levels which
> > > > > > > > > > > > are currently
> > > > > > > > > > > > unique. This is changing to
> > > > > > > > > > > > statically map these 2k levels
> > > > > > > > > > > > into 3
> > > > > > > > > > > > buckets:
> > > > > > > > > > > >=20
> > > > > > > > > > > > low: < 0
> > > > > > > > > > > > mid: 0
> > > > > > > > > > > > high: > 0
> > > > > > > > > > > >=20
> > > > > > > > > > > > Update gem_ctx_shared to understand this. This enta=
ils updating
> > > > > > > > > > > > promotion test to use 3 levels
> > > > > > > > > > > > that will map into different
> > > > > > > > > > > > buckets and
> > > > > > > > > > > > also add bit of delay after
> > > > > > > > > > > > releasing a cork beforing
> > > > > > > > > > > > completing the
> > > > > > > > > > > > spinners to give time to the
> > > > > > > > > > > > i915 schedule to process the
> > > > > > > > > > > > fence and
> > > > > > > > > > > > release and queue the requests.
> > > > > > > > > > > >=20
> > > > > > > > > > > > v2: Add a delay between starting releasing spinner =
and cork in
> > > > > > > > > > > > promotion
> > > > > > > > > > > > v3:
> > > > > > > > > > > > =A0=A0=A0 =A0 (Daniele)
> > > > > > > > > > > > =A0=A0=A0 =A0=A0 - Always add delay, update commit =
message
> > > > > > > > > > > >=20
> > > > > > > > > > > > Signed-off-by: Matthew Brost <matthew.brost@intel.c=
om>
> > > > > > > > > > > > ---
> > > > > > > > > > > > =A0=A0=A0 =A0 tests/i915/gem_ctx_shared.c | 5 +++--
> > > > > > > > > > > > =A0=A0=A0 =A0 1 file changed, 3 insertions(+), 2 de=
letions(-)
> > > > > > > > > > > >=20
> > > > > > > > > > > > diff --git
> > > > > > > > > > > > a/tests/i915/gem_ctx_shared.c
> > > > > > > > > > > > b/tests/i915/gem_ctx_shared.c
> > > > > > > > > > > > index ea1b5dd1b..7f88871b8 100644
> > > > > > > > > > > > --- a/tests/i915/gem_ctx_shared.c
> > > > > > > > > > > > +++ b/tests/i915/gem_ctx_shared.c
> > > > > > > > > > > > @@ -622,6 +622,7 @@ static void
> > > > > > > > > > > > unplug_show_queue(int i915,
> > > > > > > > > > > > struct
> > > > > > > > > > > > igt_cork *c, uint64_t ahnd,
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 igt_cork_unplug(c); /*
> > > > > > > > > > > > batches will now be queued on
> > > > > > > > > > > > the engine */
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 igt_debugfs_dump(i915, "i=
915_engine_info");
> > > > > > > > > > > > +=A0=A0=A0 usleep(250000);
> > > > > > > > > > > Same as previous patch, with a comment added:
> > > > > > > > > > >=20
> > > > > > > > > > > Reviewed-by: Daniele Ceraolo Spurio
> > > > > > > > > > > <daniele.ceraolospurio@intel.com>
> > > > > > > > > > Come on guys, it is a bit bad and lazy
> > > > > > > > > > for good taste no? 250ms more test
> > > > > > > > > Yea, this is way too long of a sleep. 25ms seems just fin=
e.
> > > > > > > > Until you get 1/1000 failures in CI on some
> > > > > > > > platforms due phase of the moon.
> > > > > > > > Adding sleeps should be avoided where possible.
> > > > > > > >=20
> > > > > > > Yea, that is always a risk. Looking at this test there is alr=
eady 1
> > > > > > > other sleep in the test and in gem_exec_schedule there are 5 =
other
> > > > > > > sleeps. I'm not breaking precedent here.
> > > > > > >=20
> > > > > > > > > On TGL /w the updated sleep:
> > > > > > > > > gem_ctx_shared --r *promotion*
> > > > > > > > > IGT-Version: 1.26-g7e489b053 (x86_64)
> > > > > > > > > (Linux: 5.15.0-rc3-guc+ x86_64)
> > > > > > > > > Starting subtest: Q-promotion
> > > > > > > > > Starting dynamic subtest: rcs0
> > > > > > > > > Dynamic subtest rcs0: SUCCESS (0.059s)
> > > > > > > > > Starting dynamic subtest: bcs0
> > > > > > > > > Dynamic subtest bcs0: SUCCESS (0.059s)
> > > > > > > > > Starting dynamic subtest: vcs0
> > > > > > > > > Dynamic subtest vcs0: SUCCESS (0.060s)
> > > > > > > > > Starting dynamic subtest: vecs0
> > > > > > > > > Dynamic subtest vecs0: SUCCESS (0.061s)
> > > > > > > > > Subtest Q-promotion: SUCCESS (0.239s)
> > > > > > > > >=20
> > > > > > > > > > runtime, multiplied by number of tests
> > > > > > > > > > and subtests (engines) will add up
> > > > > > > > > > and over shadows the current test time.
> > > > > > > > > > For instance current state is:
> > > > > > > > > >=20
> > > > > > > > > > # tests/gem_ctx_shared --r *promotion*
> > > > > > > > > > IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 5.15.0-rc4 x8=
6_64)
> > > > > > > > > > Starting subtest: Q-promotion
> > > > > > > > > > Starting dynamic subtest: rcs0
> > > > > > > > > > Dynamic subtest rcs0: SUCCESS (0.174s)
> > > > > > > > > > Starting dynamic subtest: bcs0
> > > > > > > > > > Dynamic subtest bcs0: SUCCESS (0.224s)
> > > > > > > > > > Starting dynamic subtest: vcs0
> > > > > > > > > > Dynamic subtest vcs0: SUCCESS (0.153s)
> > > > > > > > > > Starting dynamic subtest: vecs0
> > > > > > > > > > Dynamic subtest vecs0: SUCCESS (0.153s)
> > > > > > > > > > Subtest Q-promotion: SUCCESS (0.708s)
> > > > > > > > > >=20
> > > > > > > > > > This patch instantly makes this 1.7
> > > > > > > > > > seconds instead. Add the in/out order
> > > > > > > > > > subtests, other tests, platforms with
> > > > > > > > > > more engines, in a world where CI time
> > > > > > > > > > budget is scarce - can't we do better
> > > > > > > > > > than this and not settle on sprinkling
> > > > > > > > > > of usleep all over the place?
> > > > > > > > > >=20
> > > > > > > > > > Like maybe add out fences to the two
> > > > > > > > > > requests, merge them, and wait on that
> > > > > > > > > > (since there is no implicit write
> > > > > > > > > > declared so set domain does not
> > > > > > > > > > suffice)?
> > > > > > > > > >=20
> > > > > > > > > Not sure I follow. Anyways reposting now
> > > > > > > > > with a smaller timeout value.
> > > > > > > > > Unless we hear something we plan on merging this tomorrow.
> > > > > > > > The in/out-order test as example. It needs to
> > > > > > > > wait until two dword writes
> > > > > > > > have completed, right? I am saying pass output
> > > > > > > > fences out from spinners and
> > > > > > > > wait on them before checking content of the shared buffer.
> > > > > > > >=20
> > > > > > > > I also think sleep after uncorking is also
> > > > > > > > conceptually misleading because
> > > > > > > > that's not where the problem lies. Problem is
> > > > > > > > set domain does not actually
> > > > > > > > wait for sdw completion (existing comment even
> > > > > > > > hints so "no write hazard
> > > > > > > > lies!"). If I am right sporadic fail can in
> > > > > > > > *theory* happen with execlists
> > > > > > > > as well.
> > > > > > > >=20
> > > > > > > Still not following what you are saying. The sleep
> > > > > > > just adds period of
> > > > > > > time for all the uncorked requests to make it into the GuC sc=
heduler,
> > > > > > > without it is possible for the lower priority
> > > > > > > request (submitted first)
> > > > > > > completes before the higher priority request
> > > > > > > (submitted after) makes it
> > > > > > > into the GuC. The sleep ensures alls the requests are in the =
GuC
> > > > > > > scheduler still stuck behind spinning requests on the hardwar=
e, then
> > > > > > > after the spinners complete the requests are scheduled in ord=
er of
> > > > > > > priority. Yes, this possible with execlists too but
> > > > > > > I think the timing
> > > > > > > is different enough it doesn't happen.
> > > > > > >=20
> > > > > > > Again adding a sleep here seems legit to me, the same problem=
 would
> > > > > > > exist if we used fences as you suggest (e.g. the
> > > > > > > lower priority request
> > > > > > > would be submitted first + could complete before the higher p=
riority
> > > > > > > request is submitted). Let's not over think this one.
> > > > > > I don't understand how sleep _after_ uncork can have an
> > > > > > effect you describe.
> > > > > > Both HI and LO have been submitted and the following
> > > > > > operation will just
> > > > > > check the writes in memory.
> > > > > >=20
> > > > > After the uncork but before releasing the spinning batches, anyth=
ing
> > > > > submitted to the GuC is still be blocked behind the spinners. A s=
leep
> > > > > makes sure that all contexts submitted after the uncork are
> > > > > processed by
> > > > > the GuC, sitting in the GuC scheduler, and still blocked behind t=
he
> > > > > spinners. Once the spinners are released now the GuC submits unco=
rked
> > > > > requests in the correct order. Without this sleep, there is
> > > > > a race where
> > > > > the earlier contexts (lower priority) is in the GuC scheduler but=
 the
> > > > > later ones (higher priority) are not. In this case the earlier (l=
ower
> > > > > priority) contexts get submitted and complete before the GuC sees=
 the
> > > > > higher priority ones causing the test to fail. It only fails
> > > > > like this 1
> > > > > out of 10ish times without the sleep (i.e. it is racey). I
> > > > > just ran this
> > > > > 1000x times in the loop /w the sleep and didn't see a failure.
> > > > >=20
> > > > > Make sense? Can we get this merged and move on?
> > > > I am still skeptical I'm afraid. Let me try to ask you from a diffe=
rent
> > > > angle and please feel free to tell me I am missing something crucia=
l.
> > > >=20
> > > > Is the test testing uapi contract or scheduler implementation detai=
ls?
> > > >=20
> > > This is testing that priority inheritance works. To be honest I have =
no
> > > idea if this is concerned part of the uAPI. This could be one of those
> > > features nobody asked for but someone on the i915 dev team thought it
> > > would be a cool idea so it got implemented. AFAIK no other DRM driver
> > > implents PI, at least PI certainly isn't a feature implemented in the
> > > DRM scheduler.
> > >=20
> > > > If it would be the former, then it would be highlighting the contra=
ct is
> > > > broken. If it is the latter then why it should be fudged to run wit=
h an
> > > > incompatible backend?
> > > >=20
> > > Regardless if PI considered part of the uAPI, there is absolutely no =
way
> > > this breaking any contract. This test is racey, the sleep mitigates
> > > (maybe even seals) the race.
> > > > Personally I can't see that it is uapi being tested. Two
> > > > unrelated contexts,
> > > > no data dependencies, why would there be any guarantees who runs
> > > > first? So
> > > > how about just skip the test with GuC? If I am correct there may
> > > > even not be
> > > > much value to have it with execlists.
> > > >=20
> > > If PI is indeed a uAPI feature, then yes this test is providing value.
> > > Again I have no idea why we can't merge this and move on. If this test
> > > pops in CI we can revisit just disabling it. If we just drop PI when =
we
> > > move the DRM scheduler, we can just delete this test.
> > >=20
> > > Matt
> > I believe the point of PI is to prevent PI. That is, inheriting
> > priorities prevents priority inversion where a high priority request is
> > blocked waiting for a low priority request to complete. That would
> > happen quite easily with the hardware compositor in Android some time
> > back. I have no idea if that is still a real world concern now, but it
> > certainly was back around 2015 on VLV for certain customers.
> >=20
> > I would view this as an artificial test trying to emulate a real world
> > race condition. As in, genuine applications could hit this but it takes
> > multiple applications running in parallel with effectively random timing
> > between them. In order to recreate that race in a synthetic test, we
> > have to force certain behaviours by doing what could be considered
> > unrealistic operations. For example, setting up a pointless opening
> > situations using infinite loop batch buffers and sleeps. Sure, totally
> > unrealistic, but this is a synthetic test emulating a situation that
> > would be very difficult to recreate faithfully.
> >=20
> > So stop worrying about how realistic the test is. It can't ever be
> > realistic. Let it do what it needs to do to exercise the problem code
> > path and call it good.
>=20
> I am talking about gem_exec_shared@reorder here to be clear. Are we all on
> the same page?
>=20

I don't think we are on the same page. This sleep is required for
gem_exex_shared@promotion. A previous rev of this series only added the
sleep for that test but Daniele suggestion was just add it for all
tests.

> There all I see are two GPU _readers_, from different contexts, and a sha=
red
> buffer object. So I really don't see why would kernel have to enforce any
> ordering between the two regardless of the priorities?
>=20
> Please someone say in plain words I am missing something crucial? If I am
> not, then I think test is invalid and solution is not to add sleeps to it
> but to remove the test. At least from the GuC execution if someone wants =
to
> argue exercising execlists backend implementation details has value from
> this test (it's not even gem_exec_schedule).
>

Promotion has value, I haven't looked at reorder in a while so I can't
really comment if that test has any value.

Matt
=20
> Regards,
>=20
> Tvrtko
>=20
> >=20
> > John.
> >=20
> > > > Regards,
> > > >=20
> > > > Tvrtko
> > > >=20
> > > > > > Unless the problem really is that the spinner does not start ex=
ecuting
> > > > > > before the unplug? Does the sleep before unplug work as well?
> > > > > >=20
> > > > > No see above. This doesn't help at all.
> > > > >=20
> > > > > Matt
> > > > >=20
> > > > > > Regards,
> > > > > >=20
> > > > > > Tvrtko
> > > > > >=20
> > > > > >=20
> > > > > > > Matt
> > > > > > >=20
> > > > > > > > Regards,
> > > > > > > >=20
> > > > > > > > Tvrtko
> > > > > > > >=20
> > > > > > > > > Matt
> > > > > > > > >=20
> > > > > > > > > > Unless I am missing something it would
> > > > > > > > > > be strictly correct for execlists
> > > > > > > > > > backend as well since it now works just because it is f=
ast enough.
> > > > > > > > > >=20
> > > > > > > > > > Regards,
> > > > > > > > > >=20
> > > > > > > > > > Tvrtko
> > > > > > > > > >=20
> > > > > > > > > > > Daniele
> > > > > > > > > > >=20
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 for (int n =3D 0; n < ARR=
AY_SIZE(spin); n++) {
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 ahnd =3D spin=
[n]->ahnd;
> > > > > > > > > > > > @@ -831,10 +832,10 @@ static void promotion(int i91=
5, const
> > > > > > > > > > > > intel_ctx_cfg_t *cfg, unsigned ring)
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 gem_context_set_priority(=
i915, ctx[LO]->id, MIN_PRIO);
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 ctx[HI] =3D intel_ctx_cre=
ate(i915, &q_cfg);
> > > > > > > > > > > > -=A0=A0=A0 gem_context_set_priority(i915, ctx[HI]->=
id, 0);
> > > > > > > > > > > > +=A0=A0=A0 gem_context_set_priority(i915, ctx[HI]->=
id, MAX_PRIO);
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 ctx[NOISE] =3D intel_ctx_=
create(i915, &q_cfg);
> > > > > > > > > > > > -=A0=A0=A0 gem_context_set_priority(i915, ctx[NOISE=
]->id, MIN_PRIO/2);
> > > > > > > > > > > > +=A0=A0=A0 gem_context_set_priority(i915, ctx[NOISE=
]->id, 0);
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 result =3D gem_create(i91=
5, 4096);
> > > > > > > > > > > > =A0=A0=A0 =A0=A0=A0=A0=A0 result_offset =3D get_off=
set(ahnd, result, 4096, 0);
> >=20
