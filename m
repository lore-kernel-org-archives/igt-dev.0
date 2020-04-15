Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 15 Apr 2020 11:45:33 +0200
From: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20200415094533.teqmhp7hoz5hbllw@gilmour.lan>
References: <20191022010032.pgqop52v4gz5omlc@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191022010032.pgqop52v4gz5omlc@smtp.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 i-g-t 4/4] kms_writeback: Add
 writeback-check-output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0846904180=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0846904180==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vpcz6ucay7yepl5n"
Content-Disposition: inline


--vpcz6ucay7yepl5n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

On Mon, Oct 21, 2019 at 10:00:39PM -0300, Brian Starkey wrote:
> Add a test which makes commits using the writeback connector, and
> checks the output buffer hash to make sure it is/isn't written as
> appropriate.
>
> V6: Simon Ser
>  - Add igt documentation with igt_describe
>  - Replace int ret by unsigned int fd_id when calling igt_create_fb
>  - Add a descriptive error message if sync_fence_wait fail
>  - Replace color_idx variable by i
>  - Use in_fb instead of out_fb for getting the expected CRC
>  - Drop unnecessary parentheses
>  - Replace igt_fb_mod_to_tiling to DRM_FORMAT_MOD_LINEAR
>
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> [rebased and updated the patch to address feedback]
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> ---
>  tests/kms_writeback.c | 123 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index a373ec4d..068595b9 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -30,6 +30,7 @@
>  #include "igt.h"
>  #include "igt_core.h"
>  #include "igt_fb.h"
> +#include "sw_sync.h"
>
>  IGT_TEST_DESCRIPTION("Exercise writeback feature.");
>
> @@ -196,6 +197,115 @@ static void writeback_test_fb(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t
>  	igt_assert(ret == -EINVAL);
>  }
>
> +static void fill_fb(igt_fb_t *fb, double color[3])
> +{
> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
> +	igt_assert(cr);
> +
> +	igt_paint_color(cr, 0, 0, fb->width, fb->height,
> +			color[0], color[1], color[2]);
> +}
> +

On which platform did you test this? On Arm (but I would assume
anything !i915), this will fire up an assert.

I've replaced this with a igt_fb_map_buffer/memset, and it works as
expected.

Maxime

--vpcz6ucay7yepl5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpbXvQAKCRDj7w1vZxhR
xbBrAP9VV7WQPW0dXYTQMRezNrrZBZQoNz0Oay4JXl8tHXiDfgD+P6XSfseo2i9T
ntLDlJwMifHXeZaeU2zCIJVCnZZMLQ4=
=LWD0
-----END PGP SIGNATURE-----

--vpcz6ucay7yepl5n--

--===============0846904180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0846904180==--
