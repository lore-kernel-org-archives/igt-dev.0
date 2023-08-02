Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADAC10E524
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 08:50:33 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 2 Aug 2023 08:50:28 +0000
Message-ID: <SJ1PR11MB620434C4E148378A23B626C3810BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
 <20230802083900.1175872-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230802083900.1175872-2-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] xe/xe_sysfs: Updated tests to use
 xe_sysfs_gt_open
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
> Sent: Wednesday, August 2, 2023 2:09 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 1/4] xe/xe_sysfs: Updated tests to use
> xe_sysfs_gt_open
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Tests have been updated to use xe_sysfs_gt_open function.
>=20
> v2: Updated code to check when root user try to set value beyond local
> min/max scheduler property.
>=20
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/xe/xe_sysfs_defaults.c  | 10 ++++++----  tests/xe/xe_sysfs_schedul=
er.c
> | 12 +++++++-----
>  2 files changed, 13 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/xe/xe_sysfs_defaults.c b/tests/xe/xe_sysfs_defaults.c =
index
> 5c9de43e9..ff958161b 100644
> --- a/tests/xe/xe_sysfs_defaults.c
> +++ b/tests/xe/xe_sysfs_defaults.c
> @@ -65,25 +65,27 @@ igt_main
>=20
>  		sys_fd =3D igt_sysfs_open(xe);
>  		igt_require(sys_fd !=3D -1);
> +		close(sys_fd);
>  	}
>=20
>  	igt_subtest_with_dynamic("engine-defaults") {
>  		xe_for_each_gt(xe, gt) {
>  			int engines_fd =3D -1;
> -			char buf[100];
> +			int gt_fd =3D -1;
>=20
> -			sprintf(buf, "device/gt%d/engines", gt);
> -			engines_fd =3D openat(sys_fd, buf, O_RDONLY);
> +			gt_fd =3D xe_sysfs_gt_open(xe, gt);
> +			igt_require(gt_fd !=3D -1);
> +			engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
>  			igt_require(engines_fd !=3D -1);
>=20
>  			igt_sysfs_engines(xe, engines_fd, NULL,
> test_defaults);
>=20
>  			close(engines_fd);
> +			 close(gt_fd);
>  		}
>  	}
>=20
>  	igt_fixture {
> -		close(sys_fd);
>  		xe_device_put(xe);
>  		close(xe);
>  	}
> diff --git a/tests/xe/xe_sysfs_scheduler.c b/tests/xe/xe_sysfs_scheduler.=
c
> index 1da0f541a..f199d6be8 100644
> --- a/tests/xe/xe_sysfs_scheduler.c
> +++ b/tests/xe/xe_sysfs_scheduler.c
> @@ -94,7 +94,7 @@ static void test_min_max(int xe, int engine, const char
> **property)
>=20
>  	igt_sysfs_printf(engine, property[0], "%d", default_min);
>  	igt_sysfs_scanf(engine, property[0], "%u", &set);
> -	igt_assert_eq(set, default_min);
> +	igt_assert_neq(set, default_min);

This change does not belong to this patch it seems. Other than that looks g=
ood to me.

Thanks,
Tejas
>=20
>  	igt_sysfs_printf(engine, property[0], "%d", min);
>  	igt_sysfs_scanf(engine, property[0], "%u", &set); @@ -184,6 +184,7
> @@ igt_main
>=20
>  		sys_fd =3D igt_sysfs_open(xe);
>  		igt_require(sys_fd !=3D -1);
> +		close(sys_fd);
>  	}
>=20
>  	for (int i =3D 0; i < count; i++) {
> @@ -191,20 +192,21 @@ igt_main
>  			igt_subtest_with_dynamic_f("%s-%s", property[i][0],
> t->name) {
>  				xe_for_each_gt(xe, gt) {
>  					int engines_fd =3D -1;
> -					char buf[100];
> +					int gt_fd =3D -1;
>=20
> -					sprintf(buf, "device/gt%d/engines",
> gt);
> -					engines_fd =3D openat(sys_fd, buf,
> O_RDONLY);
> +					gt_fd =3D xe_sysfs_gt_open(xe, gt);
> +					igt_require(gt_fd !=3D -1);
> +					engines_fd =3D openat(gt_fd, "engines",
> O_RDONLY);
>  					igt_require(engines_fd !=3D -1);
>=20
>  					igt_sysfs_engines(xe, engines_fd,
> property[i], t->fn);
>  					close(engines_fd);
> +					close(gt_fd);
>  				}
>  			}
>  		}
>  	}
>  	igt_fixture {
> -		close(sys_fd);
>  		xe_device_put(xe);
>  		close(xe);
>  	}
> --
> 2.25.1
