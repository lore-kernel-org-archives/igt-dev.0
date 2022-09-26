Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3992710E67D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Sep 2022 11:22:39 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Sunkesula, Karthikeya" <karthikeya.sunkesula@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Sep 2022 11:22:35 +0000
Message-ID: <CY5PR11MB6211212618BE5C87332BE70795529@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20220915081704.3039599-1-karthikeya.sunkesula@intel.com>
 <20220915081704.3039599-2-karthikeya.sunkesula@intel.com>
In-Reply-To: <20220915081704.3039599-2-karthikeya.sunkesula@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] Add descriptions to pm rc6
 residency tests
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
> From: Sunkesula, Karthikeya <karthikeya.sunkesula@intel.com>
> Sent: Thursday, September 15, 2022 1:47 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Sunkesula, Karthikeya
> <karthikeya.sunkesula@intel.com>
> Subject: [PATCH i-g-t 1/2] Add descriptions to pm rc6 residency tests
>=20
> Signed-off-by: Karthikeya Sunkesula <karthikeya.sunkesula@intel.com>
> ---
>  tests/i915/i915_pm_rc6_residency.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/tests/i915/i915_pm_rc6_residency.c
> b/tests/i915/i915_pm_rc6_residency.c
> index cf7a92b9..f8cf4325 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -57,6 +57,8 @@ struct residencies {
>  	int duration;
>  };
>=20
> +IGT_TEST_DESCRIPTION("Tests to verify rc6 in different cases");
Every rc6 test is running for_each_gt(), so batter to specify GT here
instead of  subtest description.
> +
>  static unsigned long get_rc6_enabled_mask(void)  {
>  	unsigned long enabled;
> @@ -541,6 +543,8 @@ igt_main
>  		ctx =3D intel_ctx_create_all_physical(i915);
>  	}
>=20
> +	igt_describe("Measure rc6 residency and energy, when GPU is idle, "
> +			"with light workload and with waitboost.");
Measure -> Validate everywhere.
>  	igt_subtest_with_dynamic("rc6-idle") {
>  		const struct intel_execution_engine2 *e;
>=20
> @@ -555,6 +559,8 @@ igt_main
>  		}
>  	}
>=20
> +	igt_describe("Measure rc6 residency for a request held-up by external "
> +			"fence and verify power conservation while waiting.");
How about "Validate rc6 residency while execbuf is waiting for sync_file fd=
 in unblocking manner "
>  	igt_subtest("rc6-fence") {
>  		igt_require_gem(i915);
>  		gem_quiescent_gpu(i915);
> @@ -580,6 +586,7 @@ igt_main
>  			igt_require(rc6_enabled & RC6_ENABLED);
>  		}
>=20
> +		igt_describe("Measure rc6 residency per gt  when it is idle.");
I think it is " Validate rc6 residency count accuracy with respect to wall =
time"
Br,
Anshuman Gupta.
>  		igt_subtest("rc6-accuracy") {
>  			struct residencies res;
>=20
> @@ -587,6 +594,7 @@ igt_main
>  			residency_accuracy(res.rc6, res.duration, "rc6");
>  		}
>=20
> +		igt_describe("Measure media rc6 residency per gt when it is
> idle.");
>  		igt_subtest("media-rc6-accuracy") {
>  			struct residencies res;
>=20
> --
> 2.25.1
