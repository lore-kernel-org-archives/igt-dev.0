Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940A210E185
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 09:57:45 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/xe_pm_residency: assert only if idle
 residency is lesser than elapsed time
Date: Tue, 12 Dec 2023 09:57:28 +0000
Message-ID: <CY5PR11MB62112645B3405679CD594A9B958EA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20231212093501.4105363-1-riana.tauro@intel.com>
In-Reply-To: <20231212093501.4105363-1-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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



> -----Original Message-----
> From: Tauro, Riana <riana.tauro@intel.com>
> Sent: Tuesday, December 12, 2023 3:05 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>
> Subject: [PATCH i-g-t] tests/intel/xe_pm_residency: assert only if idle r=
esidency is
> lesser than elapsed time
>=20
> When device is suspended (system suspend or runtime suspend), device need=
s to
> be woken up to read residency.
> Idle residency may increase above tolerance based on the resume time, thu=
s
> being greater than elapsed ms.
>=20
> assert only if idle residency is less than elapsed time and not within to=
lerance.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c index
> 5542f8fb4..7db3cd162 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -204,13 +204,6 @@ static void test_idle_residency(int fd, int gt, enum
> test_type flag)
>  		residency_start =3D read_idle_residency(fd, gt);
>  		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
> SUSPEND_TEST_NONE);
>  		residency_end =3D read_idle_residency(fd, gt);
> -
> -		/*
> -		 * Idle residency may increase even after suspend, only assert if
> residency
> -		 * is lesser than autoresume delay and is not within tolerance.
> -		 */
> -		if ((residency_end - residency_start) >=3D elapsed_ms)
> -			return;
>  	}
>=20
>  	if (flag =3D=3D TEST_IDLE) {
> @@ -222,6 +215,14 @@ static void test_idle_residency(int fd, int gt, enum
> test_type flag)
>  	igt_info("Measured %lums of idle residency in %lums\n",
>  		 residency_end - residency_start, elapsed_ms);
>=20
> +	/*
> +	 * When suspended (system or runtime suspend), device needs to be
> woken up to read
> +	 * residency. Idle residency may increase during resume thus being
> greater than
> +	 * elapsed ms.
> +	 */
> +	if ((residency_end - residency_start) >=3D elapsed_ms)
> +		return;
> +
>  	assert_within_epsilon(residency_end - residency_start, elapsed_ms,
> tolerance);  }
>=20
> --
> 2.40.0
