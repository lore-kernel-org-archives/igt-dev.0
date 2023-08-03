Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB74810E5B5
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Aug 2023 07:40:06 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 3 Aug 2023 07:39:57 +0000
Message-ID: <SJ1PR11MB62048C69DE22CF34CD41E51E8108A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230803060814.1180879-1-priyanka.dandamudi@intel.com>
 <20230803060814.1180879-3-priyanka.dandamudi@intel.com>
In-Reply-To: <20230803060814.1180879-3-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/5] xe/xe_sysfs_scheduler: Try to set
 sysfs scheduler with default min
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



> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: Thursday, August 3, 2023 11:38 AM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 2/5] xe/xe_sysfs_scheduler: Try to set sysfs schedu=
ler
> with default min
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Test tries to set sysfs scheduler with default min which is beyond local =
min
> and assert is expected to be not equal to the set one.
>=20
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/xe/xe_sysfs_scheduler.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.=
c
> index 2a113ea0f..f199d6be8 100644
> --- a/tests/xe/xe_sysfs_scheduler.c
> +++ b/tests/xe/xe_sysfs_scheduler.c
> @@ -94,7 +94,7 @@ static void test_min_max(int xe, int engine, const char
> **property)
>=20
>  	igt_sysfs_printf(engine, property[0], "%d", default_min);
>  	igt_sysfs_scanf(engine, property[0], "%u", &set);
> -	igt_assert_eq(set, default_min);
> +	igt_assert_neq(set, default_min);

Should we make sure we store-restore property[0] as well at start and end o=
f test respectively.

Thanks,
Tejas
>=20
>  	igt_sysfs_printf(engine, property[0], "%d", min);
>  	igt_sysfs_scanf(engine, property[0], "%u", &set);
> --
> 2.25.1
