Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655F210E572
 for <igt-dev@lists.freedesktop.org>; Mon, 30 May 2022 11:43:28 +0000 (UTC)
Date: Mon, 30 May 2022 10:43:08 -0100
From: Melissa Wen <mwen@igalia.com>
To: "Kim, Sung joon" <Sungjoon.Kim@amd.com>
Message-ID: <20220530114308.t5nsrvm7nip5ykjd@mail.igalia.com>
References: <20220525170939.141509-1-mwen@igalia.com>
 <MN2PR12MB3054254D1331EDFFBAA5080097D99@MN2PR12MB3054.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nysri6jjkphp7ng4"
Content-Disposition: inline
In-Reply-To: <MN2PR12MB3054254D1331EDFFBAA5080097D99@MN2PR12MB3054.namprd12.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t] test/kms_plane_alpha_blend: clearer
 validation for coverage-7efc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "petri.latvala@intel.com" <petri.latvala@intel.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--nysri6jjkphp7ng4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/26, Kim, Sung joon wrote:
> [AMD Official Use Only - General]
>=20
> Looks good to me.
> One suggestion would be adding some information (e.g. commit id, etc...) =
about the change that enabled Coverage alpha blend mode made in the kernel =
in your description?
>=20
> Reviewed-by: Sung Joon Kim <sungkim@amd.com>

Hi,

Thanks for taking a look at it.

I think you are talking about those kernel changes in the AMD display
driver.  As kms_plane_alpha_blend should be a generic test for any GPU
vendors, the improvement here is not retricted to AMD, so I would prefer
to keep the message generic too.

But from your suggestion, I included the commit for alpha-7efc change,
where I exemplify the problems of the original approach for different
vendors. I just sent a v2 and included your r-b.

Let me know if you are okay with it.

BR,

Melissa
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Melissa Wen
> > Sent: Wednesday, May 25, 2022 1:10 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: petri.latvala@intel.com; markyacoub@google.com
> > Subject: [igt-dev] [PATCH i-g-t] test/kms_plane_alpha_blend: clearer
> > validation for coverage-7efc
> >
> > Inspired by previous change in alpha-7efc, get a clearer validation for
> > the swappable property of plane_alpha and fg.alpha in the coverage blend
> > formula. Get rid of the 8-increment alpha loop by refactoring
> > coverage-7efc in favor of one-shot check format, avoiding doubts related
> > to bit precision and rounding issue.
> >
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >  tests/kms_plane_alpha_blend.c | 23 +++++++++++------------
> >  1 file changed, 11 insertions(+), 12 deletions(-)
> >
> > diff --git a/tests/kms_plane_alpha_blend.c
> > b/tests/kms_plane_alpha_blend.c
> > index 8e54dfd6..001a1479 100644
> > --- a/tests/kms_plane_alpha_blend.c
> > +++ b/tests/kms_plane_alpha_blend.c
> > @@ -420,20 +420,18 @@ static void coverage_7efc(data_t *data, enum pipe
> > pipe, igt_plane_t *plane)
> >       igt_pipe_crc_start(data->pipe_crc);
> >
> >       /* for coverage, plane alpha and fb alpha should be swappable, so
> > swap fb and alpha */
> > -     for (i =3D 0; i < 256; i +=3D 8) {
> > -             igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, ((i/2)
> > << 8) | (i/2));
> > -             igt_plane_set_fb(plane, &data->argb_fb_cov_fc);
> > -             igt_display_commit2(display, COMMIT_ATOMIC);
> > +     igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
> > +     igt_plane_set_fb(plane, &data->argb_fb_cov_fc);
> > +     igt_display_commit2(display, COMMIT_ATOMIC);
> >
> > -             igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> > &ref_crc);
> > +     igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> > &ref_crc);
> >
> > -             igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, (i << 8)
> > | i);
> > -             igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
> > -             igt_display_commit2(display, COMMIT_ATOMIC);
> > +     igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0xfcfc);
> > +     igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
> > +     igt_display_commit2(display, COMMIT_ATOMIC);
> >
> > -             igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> > &crc);
> > -             igt_assert_crc_equal(&ref_crc, &crc);
> > -     }
> > +     igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
> > +     igt_assert_crc_equal(&ref_crc, &crc);
> >
> >       igt_pipe_crc_stop(data->pipe_crc);
> >  }
> > @@ -537,7 +535,8 @@ static void run_subtests(data_t *data, enum pipe
> > pipe)
> >       igt_subtest_f("pipe-%s-alpha-7efc", kmstest_pipe_name(pipe))
> >               run_test_on_pipe_planes(data, pipe, false, true, alpha_7e=
fc);
> >
> > -     igt_describe("Tests pipe coverage blending properties.");
> > +     igt_describe("Uses alpha values 0x7e and 0xfc to validate fg.alpha
> > and "
> > +                  "plane_alpha are swappable on coverage blend mode.");
> >       igt_subtest_f("pipe-%s-coverage-7efc", kmstest_pipe_name(pipe))
> >               run_test_on_pipe_planes(data, pipe, true, true,
> > coverage_7efc);
> >
> > --
> > 2.35.1
>=20

--nysri6jjkphp7ng4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmKUrcQACgkQwqF3j0dL
ehzXyw/+IuTyimm7ERoaVmaB3ZokY06Aaa3oo2YM/tv/Jiz0ZgzpUvOvG2Wp2ZdB
5PQpc0Whxw7d7gKCCPPQIYlFXdzYhmBmqtRwWSvSKfJZlR67Hk1xNF0s6j0D5AqK
KIooKfXW5wW+tKNVI4A0/WMz8sbEclZXqin5GlhSytLl2Cso7m8zy7oQvWHGBMZ5
gyKgiKmPnxKdY5l4czvPI7qcv4xrKECcIWq10juLYBQd3JQfQup5oBSrwiukRMC8
EKai7Fpy2xBDoLp7zoR5JVnwTsVcMS8GS6G/X3efSYxiwlgU2HXVCLhHTUgQAwB7
z4uknFkXxrBgNb5yap8s11kJq+MT4BkFd2dSE9e62U7J2Vepf4+iL4DgakQso5cs
2MqdlpV7m8Nf5/wA97t0Ed9vz+vrP5azdKAdAJdhfqg5DveZ+iIvD31584lTy9OX
jda0FO7kuDdxh/kUukf1CBG3Xbm0y+0b3SyP8mmJ1/EXXEtlUx7Ut4t8KAsOmwp4
PkLVqZqVeKYv2K0JR9rEtTHpKhflq9rOxD0VlNHvvBCwxobe1NtVKFjF4y7OQ7Ou
oBW2M8z32oU1NEh0y4KhwYrduXFALnv9FiPthGonnhFO2o3+FRGB/dyzD9atw7A3
x+jgZgoCmEVIHg+8DkBFyxOAcESLNWRMRjFU2599mTD5y4gkDaU=
=t0Bv
-----END PGP SIGNATURE-----

--nysri6jjkphp7ng4--
