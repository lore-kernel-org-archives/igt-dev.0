Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B146E10E060
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 10:03:11 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 10:03:05 +0000
Message-ID: <CY5PR11MB62117BFEEE62FE5F9B4A61389524A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230628093504.517988-1-riana.tauro@intel.com>
 <20230628093504.517988-4-riana.tauro@intel.com>
In-Reply-To: <20230628093504.517988-4-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/xe/xe_guc_pc: Remove rc6 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Nilawar, Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Wednesday, June 28, 2023 3:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; kamil.konieczny@linux.intel.com; Sundaresan,
> Sujaritha <sujaritha.sundaresan@intel.com>
> Subject: [PATCH i-g-t 3/4] tests/xe/xe_guc_pc: Remove rc6 tests
>=20
> Remove these tests as sysfs paths have been changed and a generic naming
> used.
>=20
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/441
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/xe/xe_guc_pc.c | 44 --------------------------------------------
>  1 file changed, 44 deletions(-)
>=20
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c index
> 89d5ae9e..79359942 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -348,27 +348,6 @@ static void test_reset(int fd, int sysfs, int gt_id,=
 int
> cycles)
>  	}
>  }
>=20
> -
> -/**
> - * SUBTEST: rc6_on_idle
> - * Description: check if GPU is in RC6 on idle
> - * Run type: BAT
> - *
> - * SUBTEST: rc0_on_exec
> - * Description: check if GPU is in RC0 on when doing some work
> - * Run type: BAT
> - */
> -
> -static bool in_rc6(int sysfs, int gt_id) -{
> -	char path[32];
> -	char rc[8];
> -	sprintf(path, "device/gt%d/rc_status", gt_id);
> -	if (igt_sysfs_scanf(sysfs, path, "%s", rc) < 0)
> -		return false;
> -	return strcmp(rc, "rc6") =3D=3D 0;
> -}
> -
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -460,29 +439,6 @@
> igt_main
>  		}
>  	}
>=20
> -	igt_subtest("rc6_on_idle") {
> -		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
> -		xe_for_each_gt(fd, gt) {
> -			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
> -		}
> -	}
> -
> -	igt_subtest("rc0_on_exec") {
> -		igt_require(!IS_PONTEVECCHIO(xe_dev_id(fd)));
> -		xe_for_each_gt(fd, gt) {
> -			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
> -			xe_for_each_hw_engine(fd, hwe)
> -				igt_fork(child, ncpus) {
> -					igt_debug("Execution Started\n");
> -					exec_basic(fd, hwe,
> MAX_N_ENGINES, 16);
> -					igt_debug("Execution Finished\n");
> -				}
> -			/* While exec in threads above, let's check rc_status
> */
> -			assert(igt_wait(!in_rc6(sysfs, gt), 1000, 1));
> -			igt_waitchildren();
> -		}
> -	}
> -
>  	igt_fixture {
>  		xe_for_each_gt(fd, gt) {
>  			set_freq(sysfs, gt, "min", stash_min);
> --
> 2.40.0
