Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C387E10E061
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 09:58:56 +0000 (UTC)
Date: Tue, 13 Jun 2023 11:58:47 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230613115847.1430f9f9@maurocar-mobl2>
In-Reply-To: <1853791.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
 <20230613072726.4164-11-dominik.karol.piatkowski@intel.com>
 <20230613104103.275638be@maurocar-mobl2>
 <1853791.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
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

On Tue, 13 Jun 2023 11:11:00 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> On Tuesday, 13 June 2023 10:41:03 CEST Mauro Carvalho Chehab wrote:
> > On Tue, 13 Jun 2023 09:27:26 +0200
> > Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:
> >  =20
> > > Sample drm_buddy output with missing requirements:
> > > 	Starting subtest: drm_buddy_test
> > > 	(drm_buddy:32218) igt_kmod-WARNING: Unable to load KUnit
> > > 	Subtest drm_buddy_test: SKIP (0.001s)
> > >=20
> > > Signed-off-by: Dominik Karol Pi=C4=85tkowski  =20
> <dominik.karol.piatkowski@intel.com>
> > > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > > ---
> > >  lib/igt_kmod.c | 20 +++++++++++++-------
> > >  1 file changed, 13 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > > index 1511bdef4..04220f404 100644
> > > --- a/lib/igt_kmod.c
> > > +++ b/lib/igt_kmod.c
> > > @@ -763,27 +763,27 @@ static void __igt_kunit(const char *module_name=
,  =20
> const char *opts)
> > >  	int ret;
> > >  	struct ktap_test_results *results;
> > >  	struct ktap_test_results_element *temp;
> > > +	bool skip =3D false;
> > > =20
> > >  	/* get normalized module name */
> > >  	if (igt_ktest_init(&tst, module_name) !=3D 0) {
> > > -		igt_warn("Unable to initialize ktest for %s\n",  =20
> module_name);
> > > -		igt_fail(IGT_EXIT_SKIP);
> > > +		igt_skip("Unable to initialize ktest for %s\n",  =20
> module_name);
> > >  	}
> > > =20
> > >  	if (igt_ktest_begin(&tst) !=3D 0) {
> > > -		igt_warn("Unable to begin ktest for %s\n", module_name);
> > > -
> > >  		igt_ktest_fini(&tst);
> > > -		igt_fail(IGT_EXIT_SKIP);
> > > +		igt_skip("Unable to begin ktest for %s\n", module_name);
> > >  	}
> > > =20
> > >  	if (tst.kmsg < 0) {
> > >  		igt_warn("Could not open /dev/kmsg\n");
> > > +		skip =3D true; =20
> >=20
> > Hmm.... not being able to read from /dev/kmsg doesn't seem a reason for
> > skipping the test.
> >=20
> > IMO, the test should be skipped only if:
> >=20
> > 1. The Kernel is not compiled with KUnit support;
> > 2. The KUnit test was not compiled.
> >=20
> > Errors for all other conditions should be considered as failures.
> >=20
> > Now, I'm not sure what would be the proper way to test for such
> > skip condition. I suspect you could check the error code at
> > igt_kmod_load(), calling igt_skip() if it returns -ENOENT,
> > e. g. on this part of __igt_kunit():
> >=20
> >         /* The KUnit module is required for running any KUnit tests */
> >         if (igt_kmod_load("kunit", NULL) !=3D 0 ||
> >             kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod)=
 !=3D  =20
> 0) {
> >                 igt_warn("Unable to load KUnit\n");
> >                 igt_fail(IGT_EXIT_FAILURE);
> >         }
> >=20
> >         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D  =20
> KMOD_MODULE_BUILTIN;
> >=20
> >         results =3D ktap_parser_start(f, is_builtin);
> >=20
> >         if (igt_kmod_load(module_name, opts) !=3D 0) {
> >                 igt_warn("Unable to load %s module\n", module_name);
> >                 ret =3D ktap_parser_stop();
> >                 igt_fail(IGT_EXIT_FAILURE);
> >         }
> >=20
> >=20
> > This could be replaced by something similar to:
> >=20
> > 	err =3D igt_kmod_load("kunit", NULL);
> > 	igt_skip_on(err =3D=3D ENOENT, "KUnit not supported");
> > 	igt_fail_on_f(err !=3D 0, "Error %d when trying to load kunit", err);
> >         if (kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod)=
 !=3D  =20
> 0) {
> >                 igt_warn("Unable to load KUnit\n");
> >                 igt_fail(IGT_EXIT_FAILURE);
> >         }
> >=20
> >=20
> >         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D  =20
> KMOD_MODULE_BUILTIN;
> >=20
> >         results =3D ktap_parser_start(f, is_builtin);
> >=20
> >         err =3D igt_kmod_load(module_name, opts)=20
> > 	igt_skip_on(err =3D=3D ENOENT, "Module %s not found", module_name);
> > 	if (err) {
> >                 igt_warn("Error %d when trying to load %s module\n", er=
r,  =20
> module_name);
> >                 ret =3D ktap_parser_stop();
> >                 igt_fail(IGT_EXIT_FAILURE);
> >         }
> >=20
> >=20
> > In order to explicitly check for (1) and (2). =20
>=20
> Why do we reinvent the wheel instead of following the pattern from=20
> igt_kselftest()?=20

Nobody is talking about reinventing the wheel. Selftests and KUnit tests
are executed on different ways.

For selftests, the same driver that was loaded before needs to be unloaded
and re-probed with a different argument.

For KUnit tests, a different module will be loaded, if the Kernel was
compiled with KUnit support for a given test suite.

Looking at KUnit modprobe time, if a module doesn't load because the file
doesn't exist (-ENOENT error), it means that:

- for KUnit: the KUnit module was not compiled.
- for selftests: this is really unlikely to happen, as all other
  previous IGT tests depend on having the driver module loaded.
  So, no need for any explicit check for this specific condition.

> We used to follow it, before the whole igt_kunit() body was=20
> put under igt_subtest_with_dynamic() (patch 6/8 of v5, then squashed with=
 5/5,=20
> IIRC).  That forced us to introduce a series of changes inside igt_kunit(=
),=20
> which we now contest.  Was that really necessary?

This has nothing to do with using (or not) a dynamic IGT subtest.

It is related to how to report IGT errors while trying to run KUnit
tests.

Without this patch, every kind of errors will produce a failure;
after this patch, they'll all produce a skip.

IMO, what it is needed is to split KUnit errors on two different
categories:

1. "real" errors while running KUnit (like troubles reading dmesg);
2. the KUnit module to be modprobed doesn't exist.

for (1), igt_fail() is the proper error handling.

For (2), igt_skip() is the right error handling, as the Kernel under
tests doesn't have what it is needed to run KUnit, as the module was
not compiled.

Regards,
Mauro

