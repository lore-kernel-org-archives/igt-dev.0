Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8152110E24E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 11:02:40 +0000 (UTC)
Date: Wed, 14 Jun 2023 13:02:35 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Message-ID: <20230614130235.31261d19@maurocar-mobl2>
In-Reply-To: <20230614105811.3429-11-dominik.karol.piatkowski@intel.com>
References: <20230614105811.3429-1-dominik.karol.piatkowski@intel.com>
 <20230614105811.3429-11-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 10/10] KUnit: gracefully skip on missing
 KUnit or tested module, fail otherwise
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

On Wed, 14 Jun 2023 12:58:11 +0200
Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com> wrote:

> Sample drm_buddy output with missing KUnit module:
> 	Starting subtest: drm_buddy_test
> 	(drm_buddy:32218) igt_kmod-WARNING: Unable to load KUnit
> 	Subtest drm_buddy_test: SKIP (0.001s)
>=20
> Signed-off-by: Dominik Karol Pi=C4=85tkowski <dominik.karol.piatkowski@in=
tel.com>
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Works for me.

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/igt_kmod.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> index 1511bdef4..66c3028b3 100644
> --- a/lib/igt_kmod.c
> +++ b/lib/igt_kmod.c
> @@ -763,27 +763,31 @@ static void __igt_kunit(const char *module_name, co=
nst char *opts)
>  	int ret;
>  	struct ktap_test_results *results;
>  	struct ktap_test_results_element *temp;
> +	bool skip =3D false;
> +	bool fail =3D false;
> =20
>  	/* get normalized module name */
>  	if (igt_ktest_init(&tst, module_name) !=3D 0) {
>  		igt_warn("Unable to initialize ktest for %s\n", module_name);
> -		igt_fail(IGT_EXIT_SKIP);
> +		igt_fail(IGT_EXIT_ABORT);
>  	}
> =20
>  	if (igt_ktest_begin(&tst) !=3D 0) {
>  		igt_warn("Unable to begin ktest for %s\n", module_name);
> =20
>  		igt_ktest_fini(&tst);
> -		igt_fail(IGT_EXIT_SKIP);
> +		igt_fail(IGT_EXIT_ABORT);
>  	}
> =20
>  	if (tst.kmsg < 0) {
>  		igt_warn("Could not open /dev/kmsg\n");
> +		fail =3D true;
>  		goto unload;
>  	}
> =20
>  	if (lseek(tst.kmsg, 0, SEEK_END)) {
>  		igt_warn("Could not seek the end of /dev/kmsg\n");
> +		fail =3D true;
>  		goto unload;
>  	}
> =20
> @@ -791,6 +795,7 @@ static void __igt_kunit(const char *module_name, cons=
t char *opts)
> =20
>  	if (f =3D=3D NULL) {
>  		igt_warn("Could not turn /dev/kmsg file descriptor into a FILE pointer=
\n");
> +		fail =3D true;
>  		goto unload;
>  	}
> =20
> @@ -798,7 +803,8 @@ static void __igt_kunit(const char *module_name, cons=
t char *opts)
>  	if (igt_kmod_load("kunit", NULL) !=3D 0 ||
>  	    kmod_module_new_from_name(kmod_ctx(), "kunit", &kunit_kmod) !=3D 0)=
 {
>  		igt_warn("Unable to load KUnit\n");
> -		igt_fail(IGT_EXIT_FAILURE);
> +		skip =3D true;
> +		goto unload;
>  	}
> =20
>  	is_builtin =3D kmod_module_get_initstate(kunit_kmod) =3D=3D KMOD_MODULE=
_BUILTIN;
> @@ -808,7 +814,8 @@ static void __igt_kunit(const char *module_name, cons=
t char *opts)
>  	if (igt_kmod_load(module_name, opts) !=3D 0) {
>  		igt_warn("Unable to load %s module\n", module_name);
>  		ret =3D ktap_parser_stop();
> -		igt_fail(IGT_EXIT_FAILURE);
> +		skip =3D true;
> +		goto unload;
>  	}
> =20
>  	while (READ_ONCE(results->still_running) || READ_ONCE(results->head) !=
=3D NULL)
> @@ -836,6 +843,12 @@ unload:
> =20
>  	igt_ktest_fini(&tst);
> =20
> +	if (skip)
> +		igt_skip("");
> +
> +	if (fail)
> +		igt_fail(IGT_EXIT_ABORT);
> +
>  	ret =3D ktap_parser_stop();
> =20
>  	if (ret !=3D 0)
