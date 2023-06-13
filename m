Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF99410E265
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 14:25:13 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 13 Jun 2023 16:25:01 +0200
Message-ID: <13715101.RDIVbhacDa@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230613153400.52ddf090@maurocar-mobl2>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
 <843329842.0ifERbkFSE@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230613153400.52ddf090@maurocar-mobl2>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t 10/10] KUnit: replace abort with
 graceful skip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 13 June 2023 15:34:00 CEST Mauro Carvalho Chehab wrote:
> On Tue, 13 Jun 2023 13:15:50 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
>=20
> > On Tuesday, 13 June 2023 11:58:47 CEST Mauro Carvalho Chehab wrote:
> > > On Tue, 13 Jun 2023 11:11:00 +0200
> > > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > >  =20
> > > > On Tuesday, 13 June 2023 10:41:03 CEST Mauro Carvalho Chehab wrote:=
 =20
> > > > > On Tue, 13 Jun 2023 09:27:26 +0200
> > > > > Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wro=
te:
> > > > >    =20
> > > > > > Sample drm_buddy output with missing requirements:
> > > > > > 	Starting subtest: drm_buddy_test
> > > > > > 	(drm_buddy:32218) igt_kmod-WARNING: Unable to load KUnit
> > > > > > 	Subtest drm_buddy_test: SKIP (0.001s)
> > > > > >=20
> > > > > > Signed-off-by: Dominik Karol Pi=C4=85tkowski    =20
> > > > <dominik.karol.piatkowski@intel.com> =20
> > > > > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > > > > ---
> > > > > >  lib/igt_kmod.c | 20 +++++++++++++-------
> > > > > >  1 file changed, 13 insertions(+), 7 deletions(-)
> > > > > >=20
> > > > > > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > > > > > index 1511bdef4..04220f404 100644
> > > > > > --- a/lib/igt_kmod.c
> > > > > > +++ b/lib/igt_kmod.c
> > > > > > @@ -763,27 +763,27 @@ static void __igt_kunit(const char *modul=
e_name,    =20
> > > > const char *opts) =20
> > > > > >  	int ret;
> > > > > >  	struct ktap_test_results *results;
> > > > > >  	struct ktap_test_results_element *temp;
> > > > > > +	bool skip =3D false;
> > > > > > =20
> > > > > >  	/* get normalized module name */
> > > > > >  	if (igt_ktest_init(&tst, module_name) !=3D 0) {
> > > > > > -		igt_warn("Unable to initialize ktest for %s\n",    =20
> > > > module_name); =20
> > > > > > -		igt_fail(IGT_EXIT_SKIP);
> > > > > > +		igt_skip("Unable to initialize ktest for %s\n",    =20
> > > > module_name); =20
> > > > > >  	}
> > > > > > =20
> > > > > >  	if (igt_ktest_begin(&tst) !=3D 0) {
> > > > > > -		igt_warn("Unable to begin ktest for %s\n", module_name);
> > > > > > -
> > > > > >  		igt_ktest_fini(&tst);
> > > > > > -		igt_fail(IGT_EXIT_SKIP);
> > > > > > +		igt_skip("Unable to begin ktest for %s\n", module_name);
> > > > > >  	}
> > > > > > =20
> > > > > >  	if (tst.kmsg < 0) {
> > > > > >  		igt_warn("Could not open /dev/kmsg\n");
> > > > > > +		skip =3D true;   =20
> > > > >=20
> > > > > Hmm.... not being able to read from /dev/kmsg doesn't seem a reas=
on for
> > > > > skipping the test.
> > > > >=20
> > > > > IMO, the test should be skipped only if:
> > > > >=20
> > > > > 1. The Kernel is not compiled with KUnit support;
> > > > > 2. The KUnit test was not compiled.
> > > > >=20
> > > > > Errors for all other conditions should be considered as failures.
> > > > >=20
> > > > > Now, I'm not sure what would be the proper way to test for such
> > > > > skip condition. I suspect you could check the error code at
> > > > > igt_kmod_load(), calling igt_skip() if it returns -ENOENT,
> > > > > e. g. on this part of __igt_kunit():
> > > > >=20
> > > > >         /* The KUnit module is required for running any KUnit tes=
ts */
> > > > >         if (igt_kmod_load("kunit", NULL) !=3D 0 ||
> > > > >             kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit=
_kmod) !=3D    =20
> > > > 0) { =20
> > > > >                 igt_warn("Unable to load KUnit\n");
> > > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > > >         }
> > > > >=20
> > > > >         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=
=3D    =20
> > > > KMOD_MODULE_BUILTIN; =20
> > > > >=20
> > > > >         results =3D ktap_parser_start(f, is_builtin);
> > > > >=20
> > > > >         if (igt_kmod_load(module_name, opts) !=3D 0) {
> > > > >                 igt_warn("Unable to load %s module\n", module_nam=
e);
> > > > >                 ret =3D ktap_parser_stop();
> > > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > > >         }
> > > > >=20
> > > > >=20
> > > > > This could be replaced by something similar to:
> > > > >=20
> > > > > 	err =3D igt_kmod_load("kunit", NULL);
> > > > > 	igt_skip_on(err =3D=3D ENOENT, "KUnit not supported");
> > > > > 	igt_fail_on_f(err !=3D 0, "Error %d when trying to load kunit", =
err);
> > > > >         if (kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit=
_kmod) !=3D    =20
> > > > 0) { =20
> > > > >                 igt_warn("Unable to load KUnit\n");
> > > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > > >         }
> > > > >=20
> > > > >=20
> > > > >         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=
=3D    =20
> > > > KMOD_MODULE_BUILTIN; =20
> > > > >=20
> > > > >         results =3D ktap_parser_start(f, is_builtin);
> > > > >=20
> > > > >         err =3D igt_kmod_load(module_name, opts)=20
> > > > > 	igt_skip_on(err =3D=3D ENOENT, "Module %s not found", module_nam=
e);
> > > > > 	if (err) {
> > > > >                 igt_warn("Error %d when trying to load %s module\=
n", err,    =20
> > > > module_name); =20
> > > > >                 ret =3D ktap_parser_stop();
> > > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > > >         }
> > > > >=20
> > > > >=20
> > > > > In order to explicitly check for (1) and (2).   =20
> > > >=20
> > > > Why do we reinvent the wheel instead of following the pattern from=
=20
> > > > igt_kselftest()?  =20
> > >=20
> > > Nobody is talking about reinventing the wheel. Selftests and KUnit te=
sts
> > > are executed on different ways.
> > >=20
> > > For selftests, the same driver that was loaded before needs to be unl=
oaded
> > > and re-probed with a different argument.
> > >=20
> > > For KUnit tests, a different module will be loaded, if the Kernel was
> > > compiled with KUnit support for a given test suite.
> > >=20
> > > Looking at KUnit modprobe time, if a module doesn't load because the =
file
> > > doesn't exist (-ENOENT error), it means that:
> > >=20
> > > - for KUnit: the KUnit module was not compiled.
> > > - for selftests: this is really unlikely to happen, as all other
> > >   previous IGT tests depend on having the driver module loaded.
> > >   So, no need for any explicit check for this specific condition.
> > >  =20
> > > > We used to follow it, before the whole igt_kunit() body was=20
> > > > put under igt_subtest_with_dynamic() (patch 6/8 of v5, then squashe=
d with 5/5,=20
> > > > IIRC).  That forced us to introduce a series of changes inside igt_=
kunit(),=20
> > > > which we now contest.  Was that really necessary? =20
> > >=20
> > > This has nothing to do with using (or not) a dynamic IGT subtest. =20
> >=20
> > It has.  As soon as you enter an igt_subtest or igt_subtest_with_dynami=
c=20
> > section, your inform users (CI) that the subtest execution started.  An=
d, you=20
> > can't call return, only igt_success(), or igt_skip()/igt_fail() and fri=
ends,=20
> > form inside, while you can before.
>=20
> Well, igt selftest excecution also calls igt_subtest_with_dynamic().
> However, on kunit, the tests start running during modprobe time,=20

The same as it was happening on modules that implemented the old DRM i915-
alike selftests, and still happens on i915 selftests.  AFAICT, kunit module=
s=20
are not any different in that aspect.

> so
> igt_subtest_with_dynamic() needs to be called before that. Maybe some
> validations could happen earlier, but the most important one (checking
> that the module exists) happens when the module is probed, which is the
> same call that starts the test.
>=20
> >=20
> > The DRM selftests we are going to update are now using igt_kselftest(),=
 which=20
> > calls return on some initial conditions not met, before the=20
> > igt_subtest_with_dynamic section is entered.
>=20
> No. Since 2022 - specifically, since those commits:
>=20
> 	- 932da861956a ("drm: selftest: convert drm_buddy selftest to KUnit")
> 	- fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
>=20
> those tests don't work anymore, as upstream removed support for selftest,
> in favor of KUnit. So, those tests currently do nothing.

In my opinion -- no, those tests currently skip, which is different from do=
ing=20
nothing.

>=20
> We are changing because those tests are currently broken on IGT.=20

In my opinion -- no, they are not broken, they are outdated.

> That
> is the reason why we need KUnit support for such tests.
>=20
> > CI expects that behavior, users=20
> > are used to it.  We shouldn't change that only because we switch from a=
n old=20
> > underlying kernel selftest format to a new shiny one, I believe, unless=
 we are=20
> > able to prove that there was something wrong with that former approach,=
 or we=20
> > can explain why it no longer fits into the kunit variant.
>=20
> Yes, there's something wrong with the former approach:=20

Are you saying that error handling in igt_ksleftest() is broken?  In my=20
opinion, i915 selftests successfully executing on CI now and again, as well=
 as=20
the outdated DRM selftests successfully skipping, prove something different.

I believe that igt_kunit() that follows as closely as possible the pattern =
of=20
how igt_kselftest() is handling unmet conditions and errors, with full resp=
ect=20
to real differences between kunit and i915-like selftests, would be the bes=
t=20
solution.

Thanks,
Janusz


> the tests are
> currently broken, as upstream moved on.
>=20
> >=20
> > >=20
> > > It is related to how to report IGT errors while trying to run KUnit
> > > tests.
> > >=20
> > > Without this patch, every kind of errors will produce a failure; =20
> >=20
> > Yes, that was wrong, and thank you Dominik for fixing this.  But plaese=
 also=20
> > note that the badness was mostly caused by ad-hoc corrections to igt_ku=
nit()=20
> > body, forced by putting it as a whole insinde igt_subtest_with_dynamic(=
)=20
> > section while it was not ready for that.  IOW, my objections don't appl=
y to=20
> > this patch specifically, but rather the the whole series that started f=
rom=20
> > igt_kunit() trying to provide the same used experience as igt_ksleftest=
(),=20
> > then that approach being destroyed with patches subsequently added to t=
he=20
> > series.
> >=20
> > > after this patch, they'll all produce a skip.
> > >=20
> > > IMO, what it is needed is to split KUnit errors on two different
> > > categories:
> > >=20
> > > 1. "real" errors while running KUnit (like troubles reading dmesg); =
=20
> >=20
> > I agree that troubles reading dmesg are critical to kunit variants, whi=
le they=20
> > were negligible for old selftests, hence their handling specifically mu=
st now=20
> > be different, but for me such a difference is not a sufficient justific=
ation=20
> > for killing the whole igt_ksleftest() error handling pattern and invent=
ing a=20
> > new one from scratch.
> >=20
> > Thanks,
> > Janusz
> >=20
> > > 2. the KUnit module to be modprobed doesn't exist.
> > >=20
> > > for (1), igt_fail() is the proper error handling.
> > >=20
> > > For (2), igt_skip() is the right error handling, as the Kernel under
> > > tests doesn't have what it is needed to run KUnit, as the module was
> > > not compiled.
> > >=20
> > > Regards,
> > > Mauro
> > >=20
> > >=20
> > >  =20
> >=20
> >=20
> >=20
> >=20
>=20





