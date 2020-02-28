Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 289D66E02C
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Feb 2020 14:42:16 +0000 (UTC)
Date: Fri, 28 Feb 2020 16:42:13 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200228144213.GF13686@intel.com>
References: <1582810023-28424-1-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1582810023-28424-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: remove
 redundant work
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 27, 2020 at 03:27:03PM +0200, Juha-Pekka Heikkila wrote:
> removed fb does not take part into final crc comparisons.
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_rotation_crc.c | 13 -------------
>  1 file changed, 13 deletions(-)
> =

> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 58bebf3..164eade 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -54,7 +54,6 @@ typedef struct {
>  	igt_display_t display;
>  	struct igt_fb fb;
>  	struct igt_fb fb_reference;
> -	struct igt_fb fb_unrotated;
>  	struct igt_fb fb_flip;
>  	igt_crc_t ref_crc;
>  	igt_crc_t flip_crc;
> @@ -156,7 +155,6 @@ static void remove_fbs(data_t *data)
>  {
>  	igt_remove_fb(data->gfx_fd, &data->fb);
>  	igt_remove_fb(data->gfx_fd, &data->fb_reference);
> -	igt_remove_fb(data->gfx_fd, &data->fb_unrotated);
>  	igt_remove_fb(data->gfx_fd, &data->fb_flip);
>  }
>  =

> @@ -306,17 +304,6 @@ static void prepare_fbs(data_t *data, igt_output_t *=
output,
>  	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->ref_cr=
c);
>  =

>  	/*
> -	 * Prepare the non-rotated reference fb.
> -	 */
> -	igt_create_fb(data->gfx_fd, ref_w, ref_h, pixel_format, tiling, &data->=
fb_unrotated);
> -	paint_squares(data, IGT_ROTATION_0, &data->fb_unrotated, 1.0);
> -	igt_plane_set_fb(plane, &data->fb_unrotated);
> -	igt_plane_set_rotation(plane, IGT_ROTATION_0);
> -	if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> -		igt_plane_set_position(plane, data->pos_x, data->pos_y);
> -	igt_display_commit2(display, COMMIT_ATOMIC);
> -
> -	/*

Looks unused indeed.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>


>  	 * Prepare the plane with an non-rotated fb let the hw rotate it.
>  	 */
>  	igt_create_fb(data->gfx_fd, w, h, pixel_format, tiling, &data->fb);
> -- =

> 2.7.4
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
