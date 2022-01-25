Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D541210F19B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jan 2022 10:26:58 +0000 (UTC)
Date: Tue, 25 Jan 2022 12:25:41 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <Ye/QJdCXJqa2eFZE@platvala-desk.ger.corp.intel.com>
References: <20220124144213.1900452-1-priyanka.dandamudi@intel.com>
 <dd9e60e7-127f-a5f0-5967-8d04c2abcbea@intel.com>
 <4a76924a-43af-b8b8-6c76-c8c490230ba5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4a76924a-43af-b8b8-6c76-c8c490230ba5@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_hangman : Skips test
 for RCS/CCS on DG2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John Harrison <john.c.harrison@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 10:26:20AM -0800, John Harrison wrote:
> On 1/24/2022 10:12, John Harrison wrote:
> > On 1/24/2022 06:42, priyanka.dandamudi@intel.com wrote:
> > > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > >=20
> > > Updated code to skip for RCS/CCS engines on DG2 as the
> > > platform cant handle shared reset domain.
> > Is this based on running the test and seeing it fail? Or just thinking
> > that it is a problem?
> >=20
> > As per my update to this test in the internal tree, I do not see it fail
> > on the CCS engine only RCS. That also correlates with the nature of the
> > DG2 workaround - if you hang RCS then CCS cannot switch but if you hang
> > CCS then RCS can still switch quite happily. So if this test is failing
> > on CCS in upstream then we have a bug that needs to be fixed.
> >=20
> > John.
> PS: Meant to add that making the skip is only a short term hack to get the
> CI results green. The correct fix is to update the test to be aware of the
> implications of the workaround. I.e. still run the hang test on all engin=
es
> but, on DG2, expect more than one engine to be reset as appropriate to the
> workaround.

Adding a skip just to make results green is papering over
issues. Unless there's a very good reason to do it (the machine
explodes when executing the test etc) just let it fail and track it as
a bug.

>=20
> Lastly, just adding a continue to the loop is not the correct way to skip=
 a
> test. That just makes the test vanish with no record that it is being
> skipped. You should use the igt_skip helper. That way, the test is still
> seen to exist can the skip can be tracked.

Generally, the best practices for _dynamic_ subtests is to have the
dynamic subtest vanish. But in this case if the test case is expected
to return, we should let it exist. And as mentioned above, let it
fail.


--=20
Petri Latvala


>=20
> John.
>=20
>=20
> >=20
> > >=20
> > > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > > Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> > > ---
> > > =A0 tests/i915/i915_hangman.c | 11 ++++++++++-
> > > =A0 1 file changed, 10 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> > > index 23055c27..abbdaed5 100644
> > > --- a/tests/i915/i915_hangman.c
> > > +++ b/tests/i915/i915_hangman.c
> > > @@ -445,6 +445,9 @@ static void do_tests(const char *name, const
> > > char *prefix,
> > > =A0=A0=A0=A0=A0 snprintf(buff, sizeof(buff), "%s-error-state-capture"=
, prefix);
> > > =A0=A0=A0=A0=A0 igt_subtest_with_dynamic(buff) {
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 for_each_ctx_engine(device, ctx, e) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (IS_DG2(intel_get_drm_devid(dev=
ice)) &&
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (e->class =
=3D=3D I915_ENGINE_CLASS_RENDER ||
> > > e->class =3D=3D I915_ENGINE_CLASS_COMPUTE))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_dynamic_f("%s", e->name)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 test_error_state_=
capture(ctx, e);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > @@ -466,7 +469,10 @@ static void do_tests(const char *name, const
> > > char *prefix,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_require(has_gpu_reset > 1);
> > > =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 for_each_ctx_engine(device, ctx, e) {
> > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_dynamic_f("%s", e->name)
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (IS_DG2(intel_get_drm_devid(dev=
ice)) &&
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (e->class =
=3D=3D I915_ENGINE_CLASS_RENDER ||
> > > e->class =3D=3D I915_ENGINE_CLASS_COMPUTE))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_dynamic_f("%s", e-=
>name)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 test_engine_hang(=
ctx, e, 0);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> > > =A0=A0=A0=A0=A0 }
> > > @@ -486,6 +492,9 @@ static void do_tests(const char *name, const
> > > char *prefix,
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_require(has_gpu_reset > 1);
> > > =A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0 for_each_ctx_engine(device, ctx, e) {
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (IS_DG2(intel_get_drm_devid(dev=
ice)) &&
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 (e->class =
=3D=3D I915_ENGINE_CLASS_RENDER ||
> > > e->class =3D=3D I915_ENGINE_CLASS_COMPUTE))
> > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continue;
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 igt_dynamic_f("%s", e->name)
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 test_engine_hang(=
ctx, e, IGT_SPIN_INVALID_CS);
> > > =A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> >=20
>=20
