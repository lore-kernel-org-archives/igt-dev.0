Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F3F10E39F
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Dec 2022 19:06:19 +0000 (UTC)
Date: Tue, 20 Dec 2022 18:06:07 -0100
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <20221220190607.fjrl5dyc4hzcndy3@mail.igalia.com>
References: <20221219192150.1497674-1-alex.hung@amd.com>
 <20221220115544.ytkcz3jyfobkg3rm@mail.igalia.com>
 <c545097f-5436-d559-f02e-8f051357d943@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ykmjjy2owm3krsxo"
Content-Disposition: inline
In-Reply-To: <c545097f-5436-d559-f02e-8f051357d943@amd.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_color: Reduce skips on some ctm-*
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--ykmjjy2owm3krsxo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12/20, Alex Hung wrote:
>=20
>=20
> On 2022-12-20 04:55, Melissa Wen wrote:
> > On 12/19, Alex Hung wrote:
> > > 64d0ff72 introduced a workaround for ctm-max but the condition caused
> > > other ctm tests to skip unintentionally on some platforms.
> >=20
> > Hi Alex,
> >=20
> > Can't we just drop this gamma/degamma setup for CTM tests?
> >=20
> > I remember thinking about removing this setup before... From DRM docs,
> > "Each of the properties are optional." so I don't see an explicity
> > reason for degamma/gamma dependencies. I think we should only test the
> > CTM property here, or change the name of the subtest to describe a full
> > color mgmt testing.
> >=20
> > I took a look at previous discussions on having or not degamma/gamma
> > here and if it's an intel limitation, than I prefer to explicitly
> > restrict it for i915 HW. What do you think?
>=20
> Hi Melissa,
>=20
> I may not understand you 100%.
>=20
> Could you please share what you'd like to change, or create a patch for m=
ore
> discussion?

My suggestion is basically disable degamma and gamma and only set them for
i915 + not max ctm case, something like the following diff:

diff --git a/tests/kms_color.c b/tests/kms_color.c
index d016cefb..2be4095d 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -493,12 +493,16 @@ static bool test_pipe_ctm(data_t *data,
        igt_assert(fb_modeset_id);
        igt_plane_set_fb(primary, &fb_modeset);

+       disable_degamma(primary->pipe);
+       disable_gamma(primary->pipe);
+
        /*
-        * Don't program LUT's for max CTM cases, as limitation of
-        * representing intermediate values between 0 and 1.0 causes
-        * rounding issues and inaccuracies leading to crc mismatch.
+        * Program LUT's only for i915, but not in max CTM cases, as limita=
tion
+        * of representing intermediate values between 0 and 1.0 causes
+        * rounding issues and inaccuracies leading to crc mismatch in i915
+        * devices.
         */
-       if (memcmp(before, after, sizeof(color_t))) {
+       if (is_i915_device(data->drm_fd) && memcmp(before, after, sizeof(co=
lor_t))) {
                igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_D=
EGAMMA_LUT));
                igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_G=
AMMA_LUT));

@@ -507,10 +511,6 @@ static bool test_pipe_ctm(data_t *data,

                set_degamma(data, primary->pipe, degamma_linear);
                set_gamma(data, primary->pipe, gamma_linear);
-       } else {
-               /* Disable Degamma and Gamma for ctm max test */
-               disable_degamma(primary->pipe);
-               disable_gamma(primary->pipe);
        }

        disable_ctm(primary->pipe);

>=20
> Cheers,
> Alex
>=20
> >=20
> > Best regards,
> >=20
> > Melissa
> >=20
> > >=20
> > > The patch improves the condition by keeping the original condition
> > > for i915 and checking degamma and gamma props for others. The
> > > following subtests will be executed instead of skipped.
> > >=20
> > >    kms_color@ctm-0-25@*
> > >    kms_color@ctm-0-50@*
> > >    kms_color@ctm-0-75@*
> > >    kms_color@ctm-red-to-blue@*
> > >    kms_color@ctm-negative@*
> > >=20
> > > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > > ---
> > >   tests/kms_color.c | 30 +++++++++++++++++++++---------
> > >   1 file changed, 21 insertions(+), 9 deletions(-)
> > >=20
> > > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > > index d016cefb..450bf7ca 100644
> > > --- a/tests/kms_color.c
> > > +++ b/tests/kms_color.c
> > > @@ -446,6 +446,26 @@ end:
> > >   	return ret;
> > >   }
> > > +static bool is_gamma_degamma_supported(data_t *data,
> > > +				       igt_plane_t *primary,
> > > +				       color_t *before,
> > > +				       color_t *after)
> > > +{
> > > +	/*
> > > +	 * Don't program LUT's for max CTM cases, as limitation of
> > > +	 * representing intermediate values between 0 and 1.0 causes
> > > +	 * rounding issues and inaccuracies leading to crc mismatch.
> > > +	 */
> > > +	if (is_i915_device(data->drm_fd) && memcmp(before, after, sizeof(co=
lor_t)))
> > > +		return true;
> > > +
> > > +	if (igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT) &&
> > > +	    igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT))
> > > +		return true;
> > > +
> > > +	return false;
> > > +}
> > > +
> > >   /*
> > >    * Draw 3 rectangles using before colors with the ctm matrix apply =
and verify
> > >    * the CRC is equal to using after colors with an identify ctm matr=
ix.
> > > @@ -493,14 +513,7 @@ static bool test_pipe_ctm(data_t *data,
> > >   	igt_assert(fb_modeset_id);
> > >   	igt_plane_set_fb(primary, &fb_modeset);
> > > -	/*
> > > -	 * Don't program LUT's for max CTM cases, as limitation of
> > > -	 * representing intermediate values between 0 and 1.0 causes
> > > -	 * rounding issues and inaccuracies leading to crc mismatch.
> > > -	 */
> > > -	if (memcmp(before, after, sizeof(color_t))) {
> > > -		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_=
LUT));
> > > -		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LU=
T));
> > > +	if (is_gamma_degamma_supported(data, primary, before, after)) {
> > >   		degamma_linear =3D generate_table(data->degamma_lut_size, 1.0);
> > >   		gamma_linear =3D generate_table(data->gamma_lut_size, 1.0);
> > > @@ -508,7 +521,6 @@ static bool test_pipe_ctm(data_t *data,
> > >   		set_degamma(data, primary->pipe, degamma_linear);
> > >   		set_gamma(data, primary->pipe, gamma_linear);
> > >   	} else {
> > > -		/* Disable Degamma and Gamma for ctm max test */
> > >   		disable_degamma(primary->pipe);
> > >   		disable_gamma(primary->pipe);
> > >   	}
> > > --=20
> > > 2.25.1
> > >=20

--ykmjjy2owm3krsxo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOiB5IACgkQwqF3j0dL
ehxo5BAAiFbh9ulYi/4fqoVyc+zrL2Ig6vp8Nj7Mpf0kkkb1XBAaCfCDuey7cLHv
V3zq5AGFarXKGrHQRvSyOrWxALQp5mLcxhclMOcutUp122tinQEdJzmYUQLlznyc
3pyp94EJX8kVwocNRnlfpvzr6gSeSUgsjokBoaNofMULKTsRNw5go5jzGi/jerYJ
Vo4qipJzv6qgL506vOB4ZmEtsBHdIUpbHwfA5udRlfjKglI+sbJfn7mgvaY0DfS9
IKxwZhVvfNjmPJxMj9LInvC3ktJPGYCr3ciA6D8bIM8xM50oFQYeamivpBILJ4zE
ZVSFlxb2F45DVEPod/QuI/7P5TyJr9YfEEKXI37Mjjwr/412LRJSUrrnK8D/L5aS
fia8jD+psW/kfVmdgp5RVuWvd2y/EJsvF31sBCq1Hp3Rns+VAKGUaRa5Gd39FxeV
8hrQUoz6ypjJw09DNJTRKS8nHgBbQHhCfBqAE3bNI6VIwWixDNb7++VgAX4Za8iF
ihz7mcboBKOB0nTSKc11yzpTPqbzfwc4xGpKLJGg//M3MxsdkH9cXNh7X0xOzGN6
bbU7VLxg1A+Ya/qIRpiGHSv/LMJR/rq/8m4hRoXnPF5aEPlJ2M2uHzfCKGUUkU/z
ri9fy5t4PBp2Eyx9Ogmt4LZ9/iN8Uf7HJ6HI9gR8xScysa+Jo/Q=
=lFFe
-----END PGP SIGNATURE-----

--ykmjjy2owm3krsxo--
