Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B02510E046
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 09:11:05 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 13 Jun 2023 11:11:00 +0200
Message-ID: <1853791.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230613104103.275638be@maurocar-mobl2>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
 <20230613072726.4164-11-dominik.karol.piatkowski@intel.com>
 <20230613104103.275638be@maurocar-mobl2>
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
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>, Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 13 June 2023 10:41:03 CEST Mauro Carvalho Chehab wrote:
> On Tue, 13 Jun 2023 09:27:26 +0200
> Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:
>=20
> > Sample drm_buddy output with missing requirements:
> > 	Starting subtest: drm_buddy_test
> > 	(drm_buddy:32218) igt_kmod-WARNING: Unable to load KUnit
> > 	Subtest drm_buddy_test: SKIP (0.001s)
> >=20
> > Signed-off-by: Dominik Karol Pi=C4=85tkowski=20
<dominik.karol.piatkowski@intel.com>
> > Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> > ---
> >  lib/igt_kmod.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 1511bdef4..04220f404 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
> > @@ -763,27 +763,27 @@ static void __igt_kunit(const char *module_name,=
=20
const char *opts)
> >  	int ret;
> >  	struct ktap_test_results *results;
> >  	struct ktap_test_results_element *temp;
> > +	bool skip =3D false;
> > =20
> >  	/* get normalized module name */
> >  	if (igt_ktest_init(&tst, module_name) !=3D 0) {
> > -		igt_warn("Unable to initialize ktest for %s\n",=20
module_name);
> > -		igt_fail(IGT_EXIT_SKIP);
> > +		igt_skip("Unable to initialize ktest for %s\n",=20
module_name);
> >  	}
> > =20
> >  	if (igt_ktest_begin(&tst) !=3D 0) {
> > -		igt_warn("Unable to begin ktest for %s\n", module_name);
> > -
> >  		igt_ktest_fini(&tst);
> > -		igt_fail(IGT_EXIT_SKIP);
> > +		igt_skip("Unable to begin ktest for %s\n", module_name);
> >  	}
> > =20
> >  	if (tst.kmsg < 0) {
> >  		igt_warn("Could not open /dev/kmsg\n");
> > +		skip =3D true;
>=20
> Hmm.... not being able to read from /dev/kmsg doesn't seem a reason for
> skipping the test.
>=20
> IMO, the test should be skipped only if:
>=20
> 1. The Kernel is not compiled with KUnit support;
> 2. The KUnit test was not compiled.
>=20
> Errors for all other conditions should be considered as failures.
>=20
> Now, I'm not sure what would be the proper way to test for such
> skip condition. I suspect you could check the error code at
> igt_kmod_load(), calling igt_skip() if it returns -ENOENT,
> e. g. on this part of __igt_kunit():
>=20
>         /* The KUnit module is required for running any KUnit tests */
>         if (igt_kmod_load("kunit", NULL) !=3D 0 ||
>             kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) !=
=3D=20
0) {
>                 igt_warn("Unable to load KUnit\n");
>                 igt_fail(IGT_EXIT_FAILURE);
>         }
>=20
>         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D=20
KMOD_MODULE_BUILTIN;
>=20
>         results =3D ktap_parser_start(f, is_builtin);
>=20
>         if (igt_kmod_load(module_name, opts) !=3D 0) {
>                 igt_warn("Unable to load %s module\n", module_name);
>                 ret =3D ktap_parser_stop();
>                 igt_fail(IGT_EXIT_FAILURE);
>         }
>=20
>=20
> This could be replaced by something similar to:
>=20
> 	err =3D igt_kmod_load("kunit", NULL);
> 	igt_skip_on(err =3D=3D ENOENT, "KUnit not supported");
> 	igt_fail_on_f(err !=3D 0, "Error %d when trying to load kunit", err);
>         if (kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) !=
=3D=20
0) {
>                 igt_warn("Unable to load KUnit\n");
>                 igt_fail(IGT_EXIT_FAILURE);
>         }
>=20
>=20
>         is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D=20
KMOD_MODULE_BUILTIN;
>=20
>         results =3D ktap_parser_start(f, is_builtin);
>=20
>         err =3D igt_kmod_load(module_name, opts)=20
> 	igt_skip_on(err =3D=3D ENOENT, "Module %s not found", module_name);
> 	if (err) {
>                 igt_warn("Error %d when trying to load %s module\n", err,=
=20
module_name);
>                 ret =3D ktap_parser_stop();
>                 igt_fail(IGT_EXIT_FAILURE);
>         }
>=20
>=20
> In order to explicitly check for (1) and (2).

Why do we reinvent the wheel instead of following the pattern from=20
igt_kselftest()?  We used to follow it, before the whole igt_kunit() body w=
as=20
put under igt_subtest_with_dynamic() (patch 6/8 of v5, then squashed with 5=
/5,=20
IIRC).  That forced us to introduce a series of changes inside igt_kunit(),=
=20
which we now contest.  Was that really necessary?

Thanks,
Janusz

>=20
> Regards,
> Mauro
>=20





