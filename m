Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1B996EC1C
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Oct 2021 08:42:38 +0000 (UTC)
Date: Thu, 14 Oct 2021 11:42:35 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YWftexnS+5L4uyFd@intel.com>
References: <20211012142224.15632-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211012142224.15632-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_cursor_crc: fix size change
 and alpha tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Oct 12, 2021 at 05:22:24PM +0300, Juha-Pekka Heikkila wrote:
> Unify and simplify cursor size change and cursor alpha tests.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_cursor_crc.c | 190 ++++++++++++-----------------------------
>  1 file changed, 56 insertions(+), 134 deletions(-)
>=20
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 9faba1a18..7d9ec1927 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -71,7 +71,7 @@ typedef struct {
>  	igt_plane_t *cursor;
>  	cairo_surface_t *surface;
>  	uint32_t devid;
> -	bool hwimageistestimage;
> +	double alpha;
>  } data_t;
> =20
>  #define TEST_DPMS (1<<0)
> @@ -89,7 +89,7 @@ typedef struct {
>  	int height;
>  } cursorarea;
> =20
> -static void draw_cursor(cairo_t *cr, cursorarea *cursor)
> +static void draw_cursor(cairo_t *cr, cursorarea *cursor, double alpha)
>  {
>  	int wl, wr, ht, hb;
> =20
> @@ -104,13 +104,13 @@ static void draw_cursor(cairo_t *cr, cursorarea *cu=
rsor)
>  	    (cursor->y < SHRT_MIN) || (cursor->y > SHRT_MAX))
>  		return;
> =20
> -	cairo_set_operator(cr, CAIRO_OPERATOR_SOURCE);
> +	cairo_set_operator(cr, CAIRO_OPERATOR_OVER);
>  	cairo_set_antialias(cr, CAIRO_ANTIALIAS_NONE);
>  	/* 4 color rectangles in the corners, RGBY */
> -	igt_paint_color(cr, cursor->x, cursor->y, wl, ht, RED);
> -	igt_paint_color(cr, cursor->x + wl, cursor->y, wr, ht, GREEN);
> -	igt_paint_color(cr, cursor->x, cursor->y + ht, wl, hb, BLUE);
> -	igt_paint_color(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE);
> +	igt_paint_color_alpha(cr, cursor->x, cursor->y, wl, ht, RED, alpha);
> +	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y, wr, ht, GREEN, alp=
ha);
> +	igt_paint_color_alpha(cr, cursor->x, cursor->y + ht, wl, hb, BLUE, alph=
a);
> +	igt_paint_color_alpha(cr, cursor->x + wl, cursor->y + ht, wr, hb, WHITE=
, alpha);

Is this an actual bugfix? The alpha seems to have disappeared at some
point.

Hmm. test_cursor_alpha() is apparently creating its own fb currently,
and clobbering data->fb which was created by the top level fixture for
everyone else. Ugh.

Anyways, the diff is huge, can't really figure out what the heck
it's doing. There seems to be some code motion in there as well,
but maybe with other changes sprinkled in? Dunno. Can you split
it up a bit?

--=20
Ville Syrj=E4l=E4
Intel
