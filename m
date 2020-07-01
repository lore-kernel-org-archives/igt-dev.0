Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2059.outbound.protection.outlook.com [40.107.94.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4016E944
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 16:22:24 +0000 (UTC)
Date: Wed, 1 Jul 2020 12:22:14 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20200701162214.u2ex7du3yjjtslji@outlook.office365.com>
References: <cover.1592991729.git.melissa.srw@gmail.com>
 <e1b9c469820c9625b0723680b76784f312564b4e.1592991729.git.melissa.srw@gmail.com>
In-Reply-To: <e1b9c469820c9625b0723680b76784f312564b4e.1592991729.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] test/kms_cursor_crc: update
 subtests descriptions and some comments
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1421290711=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, aurabindo.pillai@amd.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

--===============1421290711==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zjp4v3j5bakgkugf"
Content-Disposition: inline

--zjp4v3j5bakgkugf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

LGTM

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 06/25, Melissa Wen wrote:
> Add descriptions for some subtests and detail a little more the comments =
in
> test_cursor_alpha.
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  tests/kms_cursor_crc.c | 38 ++++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index f105e295..4dba1471 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -31,12 +31,13 @@
> =20
> =20
>  IGT_TEST_DESCRIPTION(
> -   "Use the display CRC support to validate cursor plane functionality. "
> -   "The test will position the cursor plane either fully onscreen, "
> -   "partially onscreen, or fully offscreen, using either a fully opaque "
> -   "or fully transparent surface. In each case it then reads the PF CRC "
> -   "and compares it with the CRC value obtained when the cursor plane "
> -   "was disabled.");
> +   "Use the display CRC support to validate cursor plane functionality. =
"\
> +   "The test will position the cursor plane either fully onscreen, "\
> +   "partially onscreen, or fully offscreen, using either a fully opaque =
"\
> +   "or fully transparent surface. In each case, it enables the cursor pl=
ane "\
> +   "and then reads the PF CRC (hardware test) and compares it with the C=
RC "\
> +   "value obtained when the cursor plane was disabled and its drawing is=
 "
> +   "directly inserted on the PF by software.");
> =20
>  #ifndef DRM_CAP_CURSOR_WIDTH
>  #define DRM_CAP_CURSOR_WIDTH 0x8
> @@ -485,7 +486,7 @@ static void test_cursor_alpha(data_t *data, double a)
>  	int curw =3D data->curw;
>  	int curh =3D data->curh;
> =20
> -	/*alpha cursor fb*/
> +	/*Alpha cursor fb with white color*/
>  	fb_id =3D igt_create_fb(data->drm_fd, curw, curh,
>  				    DRM_FORMAT_ARGB8888,
>  				    LOCAL_DRM_FORMAT_MOD_NONE,
> @@ -495,22 +496,24 @@ static void test_cursor_alpha(data_t *data, double =
a)
>  	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
>  	igt_put_cairo_ctx(data->drm_fd, &data->fb, cr);
> =20
> -	/*Hardware Test*/
> +	/*Hardware Test - enable cursor and get PF CRC*/
>  	cursor_enable(data);
>  	igt_display_commit(display);
>  	igt_wait_for_vblank(data->drm_fd, data->pipe);
>  	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
> +
>  	cursor_disable(data);
>  	igt_remove_fb(data->drm_fd, &data->fb);
> =20
> -	/*Software Test*/
> +	/*Software Test - render cursor in software, drawn it directly on PF*/
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER]);
>  	igt_paint_color_alpha(cr, 0, 0, curw, curh, 1.0, 1.0, 1.0, a);
>  	igt_put_cairo_ctx(data->drm_fd, &data->primary_fb[FRONTBUFFER], cr);
> -
>  	igt_display_commit(display);
>  	igt_wait_for_vblank(data->drm_fd, data->pipe);
>  	igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &ref_crc);
> +
> +	/*Compare CRC from Hardware/Software tests*/
>  	igt_assert_crc_equal(&crc, &ref_crc);
> =20
>  	/*Clear Screen*/
> @@ -688,13 +691,19 @@ static void run_tests_on_pipe(data_t *data, enum pi=
pe pipe)
>  		igt_require(data->output);
>  	}
> =20
> +        igt_describe("Create a maximum size cursor, then change the size=
 in "\
> +        "flight to smaller ones to see that the size is applied correctl=
y.");
>  	igt_subtest_f("pipe-%s-cursor-size-change", kmstest_pipe_name(pipe))
>  		run_test(data, test_cursor_size,
>  			 data->cursor_max_w, data->cursor_max_h);
> =20
> +	igt_describe("Validates the composition of a fully opaque cursor "\
> +	"plane, i.e., alpha channel equal to 1.0.");
>  	igt_subtest_f("pipe-%s-cursor-alpha-opaque", kmstest_pipe_name(pipe))
>  		run_test(data, test_cursor_opaque, data->cursor_max_w, data->cursor_ma=
x_h);
> =20
> +	igt_describe("Validates the composition of a fully transparent cursor "\
> +	"plane, i.e., alpha channel equal to 0.0.");
>  	igt_subtest_f("pipe-%s-cursor-alpha-transparent", kmstest_pipe_name(pip=
e))
>  		run_test(data, test_cursor_transparent, data->cursor_max_w, data->curs=
or_max_h);
> =20
> @@ -728,15 +737,24 @@ static void run_tests_on_pipe(data_t *data, enum pi=
pe pipe)
>  		}
> =20
>  		/* Using created cursor FBs to test cursor support */
> +		igt_describe("Check if a given-size cursor is well-positioned inside t=
he screen.");
>  		igt_subtest_f("pipe-%s-cursor-%dx%d-onscreen", kmstest_pipe_name(pipe)=
, w, h)
>  			run_test(data, test_crc_onscreen, w, h);
> +
> +		igt_describe("Check if a given-size cursor is well-positioned outside =
the screen.");
>  		igt_subtest_f("pipe-%s-cursor-%dx%d-offscreen", kmstest_pipe_name(pipe=
), w, h)
>  			run_test(data, test_crc_offscreen, w, h);
> +
> +		igt_describe("Check the smooth and pixel-by-pixel given-size cursor mo=
vements on"\
> +		"horizontal, vertical and diagonal.");
>  		igt_subtest_f("pipe-%s-cursor-%dx%d-sliding", kmstest_pipe_name(pipe),=
 w, h)
>  			run_test(data, test_crc_sliding, w, h);
> +
> +		igt_describe("Check random placement of a cursor with given size.");
>  		igt_subtest_f("pipe-%s-cursor-%dx%d-random", kmstest_pipe_name(pipe), =
w, h)
>  			run_test(data, test_crc_random, w, h);
> =20
> +		igt_describe("Check the rapid update of given-size cursor movements.");
>  		igt_subtest_f("pipe-%s-cursor-%dx%d-rapid-movement", kmstest_pipe_name=
(pipe), w, h) {
>  			run_test(data, test_rapid_movement, w, h);
>  		}
> --=20
> 2.27.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--zjp4v3j5bakgkugf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl78uC8ACgkQWJzP/com
vP8/rA/9EJOI2bBwkSJ22f0G4UEbL0ubgS5lbheIS2FuGClYgnZTC85XDzEqfVr2
H1EDWW/ZDj0eZbCfRCnGPoNja/l5KAqukl5OvUISxLL2Ifq/AU6avJlSLz753DD4
kC3m1Qdmo7WHblywhiev4pkpYqueAb/6mW6DUYFasCNfRpys65LBsSlK2LN4H6H3
CrjNIKLehzQrapRX3DwbxITBBnHcXTAGF3UCP6fqSlN9ZRnHR0b0YLN8/cr9JZav
IrmS8ip2Gbev8+GybI3KTg/z5tvWkXNLolzGo3llwERQZyvwLCXgegbvVezTO30y
YxtolfenP5dNEsxFIMi9i9nUbgGPUv560V08AFwVk6tAFl/XjY3jntRLUZ9+w/2U
jThC3ZAoTMwFhfiowy5toQfBSVZOPBypSJWwFAJGPAWsJWWfTIERMOHicwMTMFQX
JZ8T4wVwt/pi4XN424Gsjto+1Qkf4qRF6FVWzUgcb9N7/ZHoVVN+pGKHvYBotYb2
9SjiQ2OUCsJBbOA4M2gusci1FMKVCeTplWkBwkrkhY1PQ2+tQ7s+62sLyuMQYYK3
Qe2iZrZ6fdwt7Xd5euNJxYOye9V4LhYQBbL8Wp0I9eEQMhctppY7AlpM1C3Bmizg
1AOESDUT+ZGWb7F3obJc8BG7+q2gmcTNLj+bN0DVqUX4e8tCij0=
=iv6v
-----END PGP SIGNATURE-----

--zjp4v3j5bakgkugf--

--===============1421290711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1421290711==--
