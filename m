Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A828E7E1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 13:27:29 +0000 (UTC)
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 11 Jul 2022 13:27:27 +0000
Message-ID: <a937afd2f5c84f0996a6cd11b631346c@intel.com>
References: <20220711085214.359128-1-riana.tauro@intel.com>
 <20220711085214.359128-2-riana.tauro@intel.com>
In-Reply-To: <20220711085214.359128-2-riana.tauro@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/i915/i915_pm_rc6_residency:
 Use correct type for power in rc6-fence
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
> Sent: Monday, July 11, 2022 2:22 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Tauro, Riana <riana.tauro@intel.com>; Gupta, Anshuman
> <anshuman.gupta@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/i915/i915_pm_rc6_residency: Use correct =
type
> for power in rc6-fence
>=20
> Use the correct type in rc6-fence for power to prevent truncating value t=
o 0.
>=20
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM.
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/i915/i915_pm_rc6_residency.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/i915/i915_pm_rc6_residency.c
> b/tests/i915/i915_pm_rc6_residency.c
> index 67d25918..cf7a92b9 100644
> --- a/tests/i915/i915_pm_rc6_residency.c
> +++ b/tests/i915/i915_pm_rc6_residency.c
> @@ -509,7 +509,7 @@ static void rc6_fence(int i915, const intel_ctx_t *ct=
x)
>  		igt_debug("%s: slept=3D%lu perf=3D%"PRIu64", rc6=3D%"PRIu64"\n",
>  			  e->name, slept, ts[1] - ts[0], rc6);
>  		if (rapl_read(&rapl, &sample[1]))  {
> -			uint64_t power =3D power_J(&rapl, &sample[0],
> &sample[1]);
> +			double power =3D power_J(&rapl, &sample[0],
> &sample[1]);
>  			igt_info("Total energy used for %s: %.1fmJ
> (%.1fmW)\n",
>  				 e->name,
>  				 power * 1e3,
> --
> 2.25.1
