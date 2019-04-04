Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDEA06EA34
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2019 22:40:40 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Thu, 4 Apr 2019 22:40:39 +0000
Message-ID: <23d69bb512afda5863e088c947a6a08efb93c9d0.camel@intel.com>
References: <36a00595c5083adb40d496ff30ebc820ae770474.1552545177.git.harish.chegondi@intel.com>
 <f4808a400a4111da36ab2f30a20ec6c5170ae53c.1554339208.git.harish.chegondi@intel.com>
In-Reply-To: <f4808a400a4111da36ab2f30a20ec6c5170ae53c.1554339208.git.harish.chegondi@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/1] i915/pm_backlight: Do not turn off
 DPMS before system suspend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1814062628=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Chegondi, Harish" <harish.chegondi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1814062628==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-0EfDI70cyj5gtoOWIDnX"

--=-0EfDI70cyj5gtoOWIDnX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-04-03 at 18:26 -0700, Harish Chegondi wrote:
> backlight fade with suspend test turns off dpms which turns off the
> edp
> backlight. Then it does a system suspend and resume. After resume,
> the edp backlight would still be off, but the test sets the
> brightness
> value and reads it back. Since the edp backlight is off, the
> brightness
> values written and read are different causing the test to fail.
>=20
> Do not turn off the DPMS before suspend so that after system resume,
> the edp backlight would be on and setting the brightness value would
> be successful.
>=20
> v2: Remove "DPMS off" before system suspend instead of adding
>     "DPMS on" after system resume.

Reviewed-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>

And going to push it.

>=20
> Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Clinton Taylor <clinton.a.taylor@intel.com>
> Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>
> References: https://bugs.freedesktop.org/show_bug.cgi?id=3D107820
> Fixes: 377752242995 ("Brightness test with DPMS and System suspend.")
> ---
>  tests/i915/i915_pm_backlight.c | 7 -------
>  1 file changed, 7 deletions(-)
>=20
> diff --git a/tests/i915/i915_pm_backlight.c
> b/tests/i915/i915_pm_backlight.c
> index 054300f6..4c1bff5b 100644
> --- a/tests/i915/i915_pm_backlight.c
> +++ b/tests/i915/i915_pm_backlight.c
> @@ -175,13 +175,6 @@ test_fade_with_dpms(struct context *context,
> igt_output_t *output)
>  static void
>  test_fade_with_suspend(struct context *context, igt_output_t
> *output)
>  {
> -	igt_require(igt_setup_runtime_pm());
> -
> -	kmstest_set_connector_dpms(output->display->drm_fd,
> -				   output->config.connector,
> -				   DRM_MODE_DPMS_OFF);
> -	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPEN
> DED));
> -
>  	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
> =20
>  	test_fade(context);

--=-0EfDI70cyj5gtoOWIDnX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlymh+YACgkQVenbO/mO
WknwJQf9HBSs84/dpsEVBfKKVDLnZHvWPmEmHGatj3q6Gu5749NgIqx11DgwNiZe
8HlJfFxxfQPP8u8PkzxSGWuYa3sBSg/9d/k3613dby4MEPy1x04j8TnbYWMO6ROF
oNxAO3zAjEmxQHcoo2SEjWz9C5mtXfBeHnWRYlf+WZbthP34klOPwKF2oR7VceP8
0+c10LWzN8ZqsKRd15bfWXAunkhoPw7A/+QZa9PcHee6X59UeUldHYjzwVC/VKiL
5mdtijDdZ0tzsj+tpVimaALLBKznW5hcXrnCv2gomTRPMVrL4P/U0nvFDNTdR8Q6
uck/3RzU9FotJMXxaofPMBTJ/WbTeA==
=UgUy
-----END PGP SIGNATURE-----

--=-0EfDI70cyj5gtoOWIDnX--

--===============1814062628==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1814062628==--
