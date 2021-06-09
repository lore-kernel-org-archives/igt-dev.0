Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672EB6EADC
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 20:15:48 +0000 (UTC)
Date: Wed, 9 Jun 2021 16:15:42 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210609201542.hhjwxi5gzlprgcjr@outlook.office365.com>
References: <20210601172936.3785449-1-markyacoub@chromium.org>
In-Reply-To: <20210601172936.3785449-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] tests/kms_vblank: Turn on hardware before
 testing invalid vblank.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1920054917=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1920054917==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="55e6uf245gbft3ad"
Content-Disposition: inline

--55e6uf245gbft3ad
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06/01, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
>=20
> [Why]
> Before any hardware is on, the vblank is off and its ref counter is in
> an initialized state as each driver handles toggling it differently.
> Ioctl DRM_IOCTL_WAIT_VBLANK could return 0 such as on i915, or an invalid
> integer that doesn't mean much, such as on Zork running Kernel 5.4 due
> to the kernel workaround that increments the vblank ref count to prevent
> a get from enabling the interrupt.
>=20
> [How]
> For invalid_subtest(), active the CRTCs to turn the hardware on so
> DRM_IOCTL_WAIT_VBLANK returns something meaningful.
>=20
> =3D=3D=3D Changes from v1 =3D=3D=3D
> 1. Update Commit message
> 2. Rename variable p to pipe_number

nit:
When I see changes in history in the commit (git log), it usually looks lik=
e:

Changes since v1:

or

v1:

but tbh, I don't think we have this documented anywhere...

>=20
> Signed-off-by: markyacoub@chromium.org

You forget to add your name in the S-o-b.

Best Regards

> ---
>  tests/kms_vblank.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 93b01eba..988794c0 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -475,8 +475,14 @@ static void invalid_subtest(data_t *data, int fd)
>  {
>  	union drm_wait_vblank vbl;
>  	unsigned long valid_flags;
> +	igt_display_t* display =3D &data->display;
> +	enum pipe pipe_number =3D 0;
> +	igt_output_t* output;
> =20
> -	igt_display_require_output_on_pipe(&data->display, 0);
> +	igt_display_require_output_on_pipe(display, pipe_number);
> +	data->pipe =3D pipe_number;
> +	for_each_valid_output_on_pipe(display, pipe_number, output)
> +		prepare_crtc(data, fd, output);
> =20
>  	/* First check all is well with a simple query */
>  	memset(&vbl, 0, sizeof(vbl));
> @@ -511,6 +517,9 @@ static void invalid_subtest(data_t *data, int fd)
>  	vbl.request.type |=3D _DRM_VBLANK_SECONDARY;
>  	vbl.request.type |=3D _DRM_VBLANK_FLAGS_MASK;
>  	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> +
> +	for_each_valid_output_on_pipe(display, pipe_number, output)
> +		cleanup_crtc(data, fd, output);
>  }
> =20
>  igt_main
> --=20
> 2.32.0.rc0.204.g9fa02ecfa5-goog
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--55e6uf245gbft3ad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmDBIWoACgkQWJzP/com
vP+Tbw/6A3i8kvgadlL48jXf0To21omusso0G1GUITDGzr2hxDCVQGu9qw4sjsUW
5ULbPuoN79ovIiSMsodvNo26ZLU+sC28nFfOGwGe+1IbzZpenOFb9r3O5mrI38/g
uX54gteElJjkbp6SMmkzKb6kpcoI7+ApL2M6uk/JV80KFZgg0rT7eCQemNFBBLvk
NFsL2ddcMwfFRzpkNyBHN3yhS/VZRlHQj3B+V3IACwOF0lECi6pfyLqF0fw4DVK2
vrHdiWa1Zdwbyh3eu7Gmc66k0mDTEBPKWTDCpN5sSintjMPjCv2hNt9g91KR3+KS
ggsT8CfxLpZR6uHaED/RBOb2ZjFjjH/kvwgHjOuH/N+Y0wCeerv7cCn/hb17r9si
XwUJ6eb2ttUtwPKc4QiYyeGcSfAeOlgMaNGgl+SV69zvb1BjzVU4InrpyV2tmTfM
nIeR+e1uS3UxLrLaEa5Nx2hEZOcilOP3ppjGUM8z0J9B6OAHcKKwRdLbf1rfwIrH
TtSU9omovyjvWZ4TpuP79VKPsuHyzYnmxwgbkNhnWO80ralZPYH3JNiVhcbZsdXF
hjkuoM3xNZjsVFtkdtU3t5G/uGb3GfmRD7smGjQqOfPAioI90ZaJCTpzCUPtcIOg
G7XSsFzxTxhe2MPQp6v3lUpypdtUE369nnqJFZhO6fMKIH7Dm2Q=
=iFqy
-----END PGP SIGNATURE-----

--55e6uf245gbft3ad--

--===============1920054917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1920054917==--
