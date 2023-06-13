Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84EA10E258
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 13:34:05 +0000 (UTC)
Date: Tue, 13 Jun 2023 15:34:00 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230613153400.52ddf090@maurocar-mobl2>
In-Reply-To: <843329842.0ifERbkFSE@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
 <1853791.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230613115847.1430f9f9@maurocar-mobl2>
 <843329842.0ifERbkFSE@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 10/10] KUnit: replace abort with
 graceful skip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 13 Jun 2023 13:15:50 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> On Tuesday, 13 June 2023 11:58:47 CEST Mauro Carvalho Chehab wrote:
> > On Tue, 13 Jun 2023 11:11:00 +0200
> > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> >  =20
> > > On Tuesday, 13 June 2023 10:41:03 CEST Mauro Carvalho Chehab wrote: =
=20
> > > > On Tue, 13 Jun 2023 09:27:26 +0200
> > > > Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:
> > > >    =20
> > > > > Sample drm_buddy output with missing requirements:
> > > > > 	Starting subtest: drm_buddy_test
> > > > > 	(drm_buddy:32218) igt_kmod-WARNING: Unable to load KUnit
> > > > > 	Subtest drm_buddy_test: SKIP (0.001s)
> > > > >=20
> > > > > Signed-off-by: Dominik Karol Pi=C4=85tkowski    =20
> > > <dominik.karol.piatkowski@intel.com> =20
> > > > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > > > ---
> > > > >  lib/igt_kmod.c | 20 +++++++++++++-------
> > > > >  1 file changed, 13 insertions(+), 7 deletions(-)
> > > > >=20
> > > > > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > > > > index 1511bdef4..04220f404 100644
> > > > > --- a/lib/igt_kmod.c
> > > > > +++ b/lib/igt_kmod.c
> > > > > @@ -763,27 +763,27 @@ static void __igt_kunit(const char *module_=
name,    =20
> > > const char *opts) =20
> > > > >  	int ret;
> > > > >  	struct ktap_test_results *results;
> > > > >  	struct ktap_test_results_element *temp;
> > > > > +	bool skip =3D false;
> > > > > =20
> > > > >  	/* get normalized module name */
> > > > >  	if (igt_ktest_init(&tst, module_name) !=3D 0) {
> > > > > -		igt_warn("Unable to initialize ktest for %s\n",    =20
> > > module_name); =20
> > > > > -		igt_fail(IGT_EXIT_SKIP);
> > > > > +		igt_skip("Unable to initialize ktest for %s\n",    =20
> > > module_name); =20
> > > > >  	}
> > > > > =20
> > > > >  	if (igt_ktest_begin(&tst) !=3D 0) {
> > > > > -		igt_warn("Unable to begin ktest for %s\n", module_name);
> > > > > -
> > > > >  		igt_ktest_fini(&tst);
> > > > > -		igt_fail(IGT_EXIT_SKIP);
> > > > > +		igt_skip("Unable to begin ktest for %s\n", module_name);
> > > > >  	}
> > > > > =20
> > > > >  	if (tst.kmsg < 0) {
> > > > >  		igt_warn("Could not open /dev/kmsg\n");
> > > > > +		skip =3D true;   =20
> > > >=20
> > > > Hmm.... not being able to read from /dev/kmsg doesn't seem a reason=
 for
> > > > skipping the test.
> > > >=20
> > > > IMO, the test should be skipped only if:
> > > >=20
> > > > 1. The Kernel is not compiled with KUnit support;
> > > > 2. The KUnit test was not compiled.
> > > >=20
> > > > Errors for all other conditions should be considered as failures.
> > > >=20
> > > > Now, I'm not sure what would be the proper way to test for such
> > > > skip condition. I suspect you could check the error code at
> > > > igt_kmod_load(), calling igt_skip() if it returns -ENOENT,
> > > > e. g. on this part of __igt_kunit():
> > > >=20
> > > >         /* The KUnit module is required for running any KUnit tests=
 */
> > > >         if (igt_kmod_load("kunit", NULL) !=3D 0 ||
> > > >             kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_k=
mod) !=3D    =20
> > > 0) { =20
> > > >                 igt_warn("Unable to load KUnit\n");
> > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > >         }
> > > >=20
> > > >         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D=
    =20
> > > KMOD_MODULE_BUILTIN; =20
> > > >=20
> > > >         results =3D ktap_parser_start(f, is_builtin);
> > > >=20
> > > >         if (igt_kmod_load(module_name, opts) !=3D 0) {
> > > >                 igt_warn("Unable to load %s module\n", module_name);
> > > >                 ret =3D ktap_parser_stop();
> > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > >         }
> > > >=20
> > > >=20
> > > > This could be replaced by something similar to:
> > > >=20
> > > > 	err =3D igt_kmod_load("kunit", NULL);
> > > > 	igt_skip_on(err =3D=3D ENOENT, "KUnit not supported");
> > > > 	igt_fail_on_f(err !=3D 0, "Error %d when trying to load kunit", er=
r);
> > > >         if (kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_k=
mod) !=3D    =20
> > > 0) { =20
> > > >                 igt_warn("Unable to load KUnit\n");
> > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > >         }
> > > >=20
> > > >=20
> > > >         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D=
    =20
> > > KMOD_MODULE_BUILTIN; =20
> > > >=20
> > > >         results =3D ktap_parser_start(f, is_builtin);
> > > >=20
> > > >         err =3D igt_kmod_load(module_name, opts)=20
> > > > 	igt_skip_on(err =3D=3D ENOENT, "Module %s not found", module_name);
> > > > 	if (err) {
> > > >                 igt_warn("Error %d when trying to load %s module\n"=
, err,    =20
> > > module_name); =20
> > > >                 ret =3D ktap_parser_stop();
> > > >                 igt_fail(IGT_EXIT_FAILURE);
> > > >         }
> > > >=20
> > > >=20
> > > > In order to explicitly check for (1) and (2).   =20
> > >=20
> > > Why do we reinvent the wheel instead of following the pattern from=20
> > > igt_kselftest()?  =20
> >=20
> > Nobody is talking about reinventing the wheel. Selftests and KUnit tests
> > are executed on different ways.
> >=20
> > For selftests, the same driver that was loaded before needs to be unloa=
ded
> > and re-probed with a different argument.
> >=20
> > For KUnit tests, a different module will be loaded, if the Kernel was
> > compiled with KUnit support for a given test suite.
> >=20
> > Looking at KUnit modprobe time, if a module doesn't load because the fi=
le
> > doesn't exist (-ENOENT error), it means that:
> >=20
> > - for KUnit: the KUnit module was not compiled.
> > - for selftests: this is really unlikely to happen, as all other
> >   previous IGT tests depend on having the driver module loaded.
> >   So, no need for any explicit check for this specific condition.
> >  =20
> > > We used to follow it, before the whole igt_kunit() body was=20
> > > put under igt_subtest_with_dynamic() (patch 6/8 of v5, then squashed =
with 5/5,=20
> > > IIRC).  That forced us to introduce a series of changes inside igt_ku=
nit(),=20
> > > which we now contest.  Was that really necessary? =20
> >=20
> > This has nothing to do with using (or not) a dynamic IGT subtest. =20
>=20
> It has.  As soon as you enter an igt_subtest or igt_subtest_with_dynamic=
=20
> section, your inform users (CI) that the subtest execution started.  And,=
 you=20
> can't call return, only igt_success(), or igt_skip()/igt_fail() and frien=
ds,=20
> form inside, while you can before.

Well, igt selftest excecution also calls igt_subtest_with_dynamic().
However, on kunit, the tests start running during modprobe time, so
igt_subtest_with_dynamic() needs to be called before that. Maybe some
validations could happen earlier, but the most important one (checking
that the module exists) happens when the module is probed, which is the
same call that starts the test.

>=20
> The DRM selftests we are going to update are now using igt_kselftest(), w=
hich=20
> calls return on some initial conditions not met, before the=20
> igt_subtest_with_dynamic section is entered.

No. Since 2022 - specifically, since those commits:

	- 932da861956a ("drm: selftest: convert drm_buddy selftest to KUnit")
	- fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")

those tests don't work anymore, as upstream removed support for selftest,
in favor of KUnit. So, those tests currently do nothing.

We are changing because those tests are currently broken on IGT. That
is the reason why we need KUnit support for such tests.

> CI expects that behavior, users=20
> are used to it.  We shouldn't change that only because we switch from an =
old=20
> underlying kernel selftest format to a new shiny one, I believe, unless w=
e are=20
> able to prove that there was something wrong with that former approach, o=
r we=20
> can explain why it no longer fits into the kunit variant.

Yes, there's something wrong with the former approach: the tests are
currently broken, as upstream moved on.

>=20
> >=20
> > It is related to how to report IGT errors while trying to run KUnit
> > tests.
> >=20
> > Without this patch, every kind of errors will produce a failure; =20
>=20
> Yes, that was wrong, and thank you Dominik for fixing this.  But plaese a=
lso=20
> note that the badness was mostly caused by ad-hoc corrections to igt_kuni=
t()=20
> body, forced by putting it as a whole insinde igt_subtest_with_dynamic()=
=20
> section while it was not ready for that.  IOW, my objections don't apply =
to=20
> this patch specifically, but rather the the whole series that started fro=
m=20
> igt_kunit() trying to provide the same used experience as igt_ksleftest()=
,=20
> then that approach being destroyed with patches subsequently added to the=
=20
> series.
>=20
> > after this patch, they'll all produce a skip.
> >=20
> > IMO, what it is needed is to split KUnit errors on two different
> > categories:
> >=20
> > 1. "real" errors while running KUnit (like troubles reading dmesg); =20
>=20
> I agree that troubles reading dmesg are critical to kunit variants, while=
 they=20
> were negligible for old selftests, hence their handling specifically must=
 now=20
> be different, but for me such a difference is not a sufficient justificat=
ion=20
> for killing the whole igt_ksleftest() error handling pattern and inventin=
g a=20
> new one from scratch.
>=20
> Thanks,
> Janusz
>=20
> > 2. the KUnit module to be modprobed doesn't exist.
> >=20
> > for (1), igt_fail() is the proper error handling.
> >=20
> > For (2), igt_skip() is the right error handling, as the Kernel under
> > tests doesn't have what it is needed to run KUnit, as the module was
> > not compiled.
> >=20
> > Regards,
> > Mauro
> >=20
> >=20
> >  =20
>=20
>=20
>=20
>=20
