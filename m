Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380DF10E76E
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 13:22:01 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
In-Reply-To: <20220928060601.12941-1-ville.syrjala@linux.intel.com>
References: <20220928060601.12941-1-ville.syrjala@linux.intel.com>
Date: Wed, 28 Sep 2022 16:21:56 +0300
Message-ID: <87tu4ry6q3.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_frontbuffer_tracking:
 Check compression state on all gens
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

On Wed, 28 Sep 2022, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> The compression status has been available on all platforms
> since commit 3fd5d1ecae2d ("drm/i915: Implement fbc_status
> "Compressing" info for all platforms") in the kernel. Make
> use of it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

On the series,

Acked-by: Jani Nikula <jani.nikula@intel.com>

didn't review all the details.

I guess we've deciced in the past it's fine to break testing for older
kernels...?


> ---
>  tests/i915/kms_frontbuffer_tracking.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_front=
buffer_tracking.c
> index 9518c706d87d..bdf718cf073a 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -1415,17 +1415,11 @@ static bool fbc_supported_on_chipset(void)
>=20=20
>  static void setup_fbc(void)
>  {
> -	int devid =3D intel_get_drm_devid(drm.fd);
> -
>  	if (!fbc_supported_on_chipset()) {
>  		igt_info("Can't test FBC: not supported on this chipset\n");
>  		return;
>  	}
>=20=20
> -	/* Early Generations are not able to report compression status. */
> -	if (!AT_LEAST_GEN(devid, 7))
> -		opt.fbc_check_compression =3D false;
> -
>  	fbc.can_test =3D true;
>=20=20
>  	fbc_setup_last_action();

--=20
Jani Nikula, Intel Open Source Graphics Center
