Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BCE10E123
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Jul 2023 13:29:39 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Thu, 27 Jul 2023 13:29:36 +0000
Message-ID: <SJ1PR11MB62043562FA1F2B87F4363AD88101A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230720120147.1057467-1-priyanka.dandamudi@intel.com>
 <20230720120147.1057467-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20230720120147.1057467-2-priyanka.dandamudi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] xe/xe_sysfs: Updated tests to use
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
> Sent: Thursday, July 20, 2023 5:32 PM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Subject: [PATCH i-g-t 1/3] xe/xe_sysfs: Updated tests to use
> xe_sysfs_gt_open
>=20
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
> Tests have been updated to use xe_sysfs_gt_open function.
> Updated code to work non privileged user.
> Modified documentation.
>=20
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/xe/xe_sysfs_defaults.c  | 16 +++++++++-------
> tests/xe/xe_sysfs_scheduler.c | 33 +++++++++++++++++++++++----------
>  2 files changed, 32 insertions(+), 17 deletions(-)
>=20
> diff --git a/tests/xe/xe_sysfs_defaults.c b/tests/xe/xe_sysfs_defaults.c =
index
> 5c9de43e9..80d0419bf 100644
> --- a/tests/xe/xe_sysfs_defaults.c
> +++ b/tests/xe/xe_sysfs_defaults.c
> @@ -6,10 +6,10 @@
>  /**
>   * TEST: xe sysfs defaults
>   * Category: Infrastructure
> - * Functionality: driver handler
> + * Functionality: sysman defaults
>   * Run type: FULL
> - * Sub-category: xe
> - * Test category: SysMan
> + * Sub-category: sysman
> + * Test category: functionality test
>   * SUBTEST: engine-defaults
>   */
>=20
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
> +			close(gt_fd);
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
> index 1da0f541a..bdb679d37 100644
> --- a/tests/xe/xe_sysfs_scheduler.c
> +++ b/tests/xe/xe_sysfs_scheduler.c
> @@ -5,6 +5,9 @@
>=20
>  /**
>   * TEST: xe sysfs scheduler
> + * Sub-category: sysman
> + * Functionality: sysman
> + * Test category: functionality test
>   * Run type: FULL
>   *
>   * SUBTEST: %s-invalid
> @@ -107,14 +110,21 @@ static void test_min_max(int xe, int engine, const
> char **property)
>=20
>  static void test_param_nonpriv(int xe, int engine, const char **property=
)  {
> +	struct stat st_engine, st_property;
>  	unsigned int default_max, max;
>  	unsigned int default_min, min;
>  	unsigned int set;
> -	struct stat st;
>  	int defaults;
> +	int property_fd;
>=20
> -	fstat(engine, &st);
> -	fchmod(engine, (st.st_mode | S_IROTH | S_IWOTH));
> +	property_fd =3D openat(engine, property[0], O_RDWR);
> +	igt_require(property_fd !=3D -1);
> +
> +	fstat(engine, &st_engine);
> +	fchmod(engine, (st_engine.st_mode | S_IRWXO | S_IRWXG |
> S_IRWXU));
> +
> +	fstat(property_fd, &st_property);
> +	fchmod(property_fd, (st_property.st_mode | S_IRWXO | S_IRWXG |
> +S_IRWXU));

Are these changes related to tile addition in sysfs path or equivalent API =
change. To me it does not look related to it. If not then can we please put=
 this as separate patch explaining what this suppose to do?

Basically different patch for path change or tile addition change in sysfs =
and any other functionality change that you are doing here with description=
 in commit.

Thanks,
Tejas
>=20
>  	defaults =3D openat(engine, ".defaults", O_DIRECTORY);
>  	igt_require(defaults !=3D -1);
> @@ -144,13 +154,14 @@ static void test_param_nonpriv(int xe, int engine,
> const char **property)
>  		igt_sysfs_scanf(engine, property[0], "%u", &set);
>  		igt_assert_neq(set, default_max);
>=20
> -		igt_sysfs_printf(engine, property[0], "%d", max);
> +		igt_sysfs_printf(engine, property[0], "%d", max-1);
>  		igt_sysfs_scanf(engine, property[0], "%u", &set);
> -		igt_assert_eq(set, max);
> +		igt_assert_eq(set, max-1);
>  	}
>  	igt_waitchildren();
>=20
> -	fchmod(engine, st.st_mode);
> +	fchmod(engine, st_engine.st_mode);
> +	fchmod(property_fd, st_property.st_mode);
>=20
>  	/* Reset max, min to original values */
>  	igt_sysfs_printf(engine, property[1], "%d", default_min); @@ -184,6
> +195,7 @@ igt_main
>=20
>  		sys_fd =3D igt_sysfs_open(xe);
>  		igt_require(sys_fd !=3D -1);
> +		close(sys_fd);
>  	}
>=20
>  	for (int i =3D 0; i < count; i++) {
> @@ -191,20 +203,21 @@ igt_main
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
