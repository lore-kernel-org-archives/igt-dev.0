Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C3910E035
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Aug 2023 23:50:25 +0000 (UTC)
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Wed, 30 Aug 2023 23:50:21 +0000
Message-ID: <SJ2PR11MB7715DB82985E89D8C26E0CE3F8E6A@SJ2PR11MB7715.namprd11.prod.outlook.com>
References: <20230829141107.1505705-1-lucas.demarchi@intel.com>
 <20230829141107.1505705-5-lucas.demarchi@intel.com>
In-Reply-To: <20230829141107.1505705-5-lucas.demarchi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt 4/4] tests/xe_debugfs: skip page table
 level check for Xe2
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De
> Marchi
> Sent: Tuesday, August 29, 2023 7:11 AM
> To: igt-dev@lists.freedesktop.org
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: [igt-dev] [PATCH igt 4/4] tests/xe_debugfs: skip page table leve=
l check
> for Xe2
>=20
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> Starting with Xe2, a 5-level page table is always used, regardless of the=
 actual
> virtual address range supported by the platform. Do not depend on VA rang=
e to
> configure max page table level.
>=20
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Anusha Srivatsa <anusha.srivatsa@intel.com>

> ---
>  tests/xe/xe_debugfs.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c index
> e51d03661..72c069bfc 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -74,6 +74,7 @@ static int validate_entries(int fd, const char *add_pat=
h,
> const char * const str  static void  test_base(int fd, struct drm_xe_quer=
y_config
> *config)  {
> +	uint16_t devid =3D intel_get_drm_devid(fd);
>  	static const char * const expected_files[] =3D {
>  		"gt0",
>  		"gt1",
> @@ -86,7 +87,6 @@ test_base(int fd, struct drm_xe_query_config *config)
>  		"clients",
>  		"name"
>  	};
> -
>  	char reference[4096];
>  	int val =3D 0;
>=20
> @@ -104,16 +104,19 @@ test_base(int fd, struct drm_xe_query_config *confi=
g)
>=20
>  	igt_assert(igt_debugfs_search(fd, "info", reference));
>=20
> -	switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
> -	case 48:
> -		val =3D 3;
> -		break;
> -	case 57:
> -		val =3D 4;
> -		break;
> +	if (!AT_LEAST_GEN(devid, 20)) {
> +		switch (config->info[XE_QUERY_CONFIG_VA_BITS]) {
> +		case 48:
> +			val =3D 3;
> +			break;
> +		case 57:
> +			val =3D 4;
> +			break;
> +		}
> +
> +		sprintf(reference, "vm_max_level %d", val);
> +		igt_assert(igt_debugfs_search(fd, "info", reference));
>  	}
> -	sprintf(reference, "vm_max_level %d", val);
> -	igt_assert(igt_debugfs_search(fd, "info", reference));
>=20
>  	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
>  	if (config->info[XE_QUERY_CONFIG_GT_COUNT] > 1)
> --
> 2.40.1
