Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 31 Aug 2023 15:46:38 +0000
Message-ID: <CY5PR11MB62114B3D39F4994E692E49D695E5A@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20230830233836.477940-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20230830233836.477940-1-vinay.belgaumkar@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_pm_freq_api: Test s2idle
 instead of S3
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
> From: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
> Sent: Thursday, August 31, 2023 5:09 AM
> To: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
> Cc: Belgaumkar, Vinay <vinay.belgaumkar@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t] tests/i915_pm_freq_api: Test s2idle instead of S3
>=20
> Test skips whenever S3 is not supported, use s2idle instead, which is wid=
ely
> enabled.
>=20
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_freq_api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/i915_pm_freq_api.c b/tests/i915/i915_pm_freq_api.=
c
> index 2912287c4..03bd0d05b 100644
> --- a/tests/i915/i915_pm_freq_api.c
> +++ b/tests/i915/i915_pm_freq_api.c
> @@ -125,7 +125,7 @@ static void test_suspend(int i915, int dirfd, int gt)
>  		igt_assert_eq(req_freq, rpn);
>=20
>  	/* Manually trigger a suspend */
> -	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
> +	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE,
>  				      SUSPEND_TEST_NONE);
>=20
>  	req_freq =3D get_freq(dirfd, RPS_CUR_FREQ_MHZ);
> --
> 2.38.1
