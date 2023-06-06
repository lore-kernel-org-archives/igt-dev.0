Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13C510E2AE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 07:42:24 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 06 Jun 2023 09:42:19 +0200
Message-ID: <14923516.tv2OnDr8pf@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230605104716.5678-9-dominik.karol.piatkowski@intel.com>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <20230605104716.5678-9-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t 8/8] lib/igt_kmod: fix nesting
 igt_fixture in igt_subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Monday, 5 June 2023 12:47:16 CEST Dominik Karol Piatkowski wrote:
> Fix the following issue:
> 	$ ./build/tests/drm_buddy
> 	Starting subtest: all-tests
> 	nesting igt_fixture in igt_subtest is invalid
> 	please refer to lib/igt_core documentation

AFAICS, this patch reverts a lot of changes introduced by PATCH 5/5 "Change=
=20
logic of ktap parser to run on a thread".  Then, I think it should be squas=
hed=20
with the latter.  Ideally, PATCH 6/8 "lib/igt_kmod: place KUnit tests on a=
=20
subtest", which looks like a fix for the sqashed 5+8, should be squashed wi=
th=20
5/8 either to provide a really working solution, I believe.

Thanks,
Janusz

>=20
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> ---
>  lib/igt_kmod.c | 80 ++++++++++++++++++++++++--------------------------
>  1 file changed, 38 insertions(+), 42 deletions(-)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index c62eb97a..2c0cc026 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -772,47 +772,45 @@ static int __igt_kunit(const char *module_name, con=
st char *opts)
>  		return ret;
>  	}
> =20
> -	igt_fixture {
> -		if (igt_ktest_begin(&tst) !=3D 0) {
> -			igt_warn("Unable to begin ktest for %s\n", module_name);
> +	if (igt_ktest_begin(&tst) !=3D 0) {
> +		igt_warn("Unable to begin ktest for %s\n", module_name);
> =20
> -			igt_ktest_fini(&tst);
> -			return ret;
> -		}
> +		igt_ktest_fini(&tst);
> +		return ret;
> +	}
> =20
> -		if (tst.kmsg < 0) {
> -			igt_warn("Could not open /dev/kmsg\n");
> -			goto unload;
> -		}
> +	if (tst.kmsg < 0) {
> +		igt_warn("Could not open /dev/kmsg\n");
> +		goto unload;
> +	}
> =20
> -		if (lseek(tst.kmsg, 0, SEEK_END)) {
> -			igt_warn("Could not seek the end of /dev/kmsg\n");
> -			goto unload;
> -		}
> +	if (lseek(tst.kmsg, 0, SEEK_END)) {
> +		igt_warn("Could not seek the end of /dev/kmsg\n");
> +		goto unload;
> +	}
> =20
> -		f =3D fdopen(tst.kmsg, "r");
> +	f =3D fdopen(tst.kmsg, "r");
> =20
> -		if (f =3D=3D NULL) {
> -			igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointe=
r\n");
> -			goto unload;
> -		}
> +	if (f =3D=3D NULL) {
> +		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer=
\n");
> +		goto unload;
> +	}
> =20
> -		/* The KUnit module is required for running any KUnit tests */
> -		if (igt_kmod_load("kunit", NULL) !=3D 0 ||
> -		    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) !=3D 0=
) {
> -			igt_warn("Unable to load KUnit\n");
> -			igt_fail(IGT_EXIT_FAILURE);
> -		}
> +	/* The KUnit module is required for running any KUnit tests */
> +	if (igt_kmod_load("kunit", NULL) !=3D 0 ||
> +	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) !=3D 0)=
 {
> +		igt_warn("Unable to load KUnit\n");
> +		igt_fail(IGT_EXIT_FAILURE);
> +	}
> =20
> -		is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D KMOD_MODUL=
E_BUILTIN;
> +	is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D KMOD_MODULE=
_BUILTIN;
> =20
> -		results =3D ktap_parser_start(f, is_builtin);
> +	results =3D ktap_parser_start(f, is_builtin);
> =20
> -		if (igt_kmod_load(module_name, opts) !=3D 0) {
> -			igt_warn("Unable to load %s module\n", module_name);
> -			ret =3D ktap_parser_stop();
> -			igt_fail(IGT_EXIT_FAILURE);
> -		}
> +	if (igt_kmod_load(module_name, opts) !=3D 0) {
> +		igt_warn("Unable to load %s module\n", module_name);
> +		ret =3D ktap_parser_stop();
> +		igt_fail(IGT_EXIT_FAILURE);
>  	}
> =20
>  	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) !=
=3D NULL)
> @@ -820,7 +818,7 @@ static int __igt_kunit(const char *module_name, const=
 char *opts)
>  		if (READ_ONCE(results->head) !=3D NULL) {
>  			pthread_mutex_lock(&results->mutex);
> =20
> -			igt_subtest(results->head->test_name) {
> +			igt_dynamic(results->head->test_name) {
>  				if (READ_ONCE(results->head->passed))
>  					igt_success();
>  				else
> @@ -836,19 +834,17 @@ static int __igt_kunit(const char *module_name, con=
st char *opts)
>  	}
> =20
>  unload:
> -	igt_fixture {
> -		igt_ktest_end(&tst);
> +	igt_ktest_end(&tst);
> =20
> -		igt_ktest_fini(&tst);
> +	igt_ktest_fini(&tst);
> =20
> -		ret =3D ktap_parser_stop();
> +	ret =3D ktap_parser_stop();
> =20
> -		if (ret !=3D 0)
> -			ret =3D IGT_EXIT_ABORT;
> +	if (ret !=3D 0)
> +		ret =3D IGT_EXIT_ABORT;
> =20
> -		if (ret =3D=3D 0)
> -			igt_success();
> -	}
> +	if (ret =3D=3D 0)
> +		igt_success();
>  	return ret;
>  }
> =20
>=20





