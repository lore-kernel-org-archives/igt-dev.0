Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774FA10E027
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 10:18:07 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 10:17:46 +0000
Message-ID: <CY5PR11MB6211D6931BE5F0729E3B856B9524A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230628093504.517988-1-riana.tauro@intel.com>
 <20230628093504.517988-3-riana.tauro@intel.com>
In-Reply-To: <20230628093504.517988-3-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] tests/xe : Add a test to check if
 gt is in c6 on idle
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
> Subject: [PATCH i-g-t 2/4] tests/xe : Add a test to check if gt is in c6 =
on idle
>=20
> Add a test that checks if gt is in c6 on idle
Use full stop after end of commit log.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/xe/xe_pm_residency.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/tests/xe/xe_pm_residency.c b/tests/xe/xe_pm_residency.c
> index 19fbe14e..4f6c23aa 100644
> --- a/tests/xe/xe_pm_residency.c
> +++ b/tests/xe/xe_pm_residency.c
> @@ -47,6 +47,11 @@ static unsigned int measured_usleep(unsigned int
> usec)
>  	return igt_nsec_elapsed(&ts) / 1000;
>  }
>=20
> +/**
> + * SUBTEST: gt-c6-on-idle
> + * Description: check if gt is in C6 on idle
> + * Run type: BAT
> + */
>  static bool in_gt_c6(int sysfs, int gt)  {
>  	char path[PATH_MAX];
> @@ -107,6 +112,11 @@ igt_main
>  		igt_assert(sysfs !=3D -1);
>  	}
>=20
> +	igt_describe("check if gt is in c6 on idle");
%s/"check"/"validate"
> +	igt_subtest("gt-c6-on-idle")
> +		xe_for_each_gt(fd, gt)
> +			assert(igt_wait(in_gt_c6(sysfs, gt), 1000, 1));
		We should use igt_assert().
		With all above,
		Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> +
>  	igt_describe("check idle residency within a time interval is within
> tolerance");
>  	igt_subtest("idle-residency")
>  		xe_for_each_gt(fd, gt)
> --
> 2.40.0
