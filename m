Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCD210E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 12:22:16 +0000 (UTC)
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_query: Refactor subtests
Date: Wed, 20 Dec 2023 12:22:12 +0000
Message-ID: <BYAPR11MB34799803ED6311D9CFA09786D996A@BYAPR11MB3479.namprd11.prod.outlook.com>
References: <20231215192934.83009-1-kamil.konieczny@linux.intel.com>
 <20231215192934.83009-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20231215192934.83009-2-kamil.konieczny@linux.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Friday, December 15, 2023 8:30 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH i-g-t 1/2] tests/intel/xe_query: Refactor subtests
>=20
> Refactor subtests into simple loop. This is preparation
> to extending it into multi-gpu scenario.
>=20
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/intel/xe_query.c | 53 +++++++++++++++++-------------------------
>  1 file changed, 21 insertions(+), 32 deletions(-)
>=20
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 338ef6151..5424f9dba 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -679,43 +679,32 @@ static void test_engine_cycles_invalid(int fd)
>=20
>  igt_main
>  {
> +	const struct {
> +		const char *name;
> +		void (*func)(int);
> +	} funcs[] =3D {
> +		{ "query-engines", test_query_engines },
> +		{ "query-mem-usage", test_query_mem_regions },
> +		{ "query-gt-list", test_query_gt_list },
> +		{ "query-config", test_query_config },
> +		{ "query-hwconfig", test_query_hwconfig },
> +		{ "query-topology", test_query_gt_topology },
> +		{ "query-cs-cycles", test_query_engine_cycles },
> +		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
> +		{ "query-invalid-query", test_query_invalid_query },
> +		{ "query-invalid-size", test_query_invalid_size },
> +		{ "query-invalid-extension", test_query_invalid_extension },
> +		{ }
> +	}, *f;
>  	int xe;
>=20
>  	igt_fixture
>  		xe =3D drm_open_driver(DRIVER_XE);
>=20
> -	igt_subtest("query-engines")
> -		test_query_engines(xe);
> -
> -	igt_subtest("query-mem-usage")
> -		test_query_mem_regions(xe);
> -
> -	igt_subtest("query-gt-list")
> -		test_query_gt_list(xe);
> -
> -	igt_subtest("query-config")
> -		test_query_config(xe);
> -
> -	igt_subtest("query-hwconfig")
> -		test_query_hwconfig(xe);
> -
> -	igt_subtest("query-topology")
> -		test_query_gt_topology(xe);
> -
> -	igt_subtest("query-cs-cycles")
> -		test_query_engine_cycles(xe);
> -
> -	igt_subtest("query-invalid-cs-cycles")
> -		test_engine_cycles_invalid(xe);
> -
> -	igt_subtest("query-invalid-query")
> -		test_query_invalid_query(xe);
> -
> -	igt_subtest("query-invalid-size")
> -		test_query_invalid_size(xe);
> -
> -	igt_subtest("query-invalid-extension")
> -		test_query_invalid_extension(xe);
> +	for (f =3D funcs; f->name; f++) {
> +		igt_subtest_f("%s", f->name)
> +			f->func(xe);
> +	}
>=20
>  	igt_fixture
>  		drm_close_driver(xe);
> --
> 2.42.0
