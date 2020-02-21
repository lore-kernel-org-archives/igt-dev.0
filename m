Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D006E049
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 18:42:10 +0000 (UTC)
Date: Fri, 21 Feb 2020 20:42:07 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200221184207.GU13686@intel.com>
References: <20200221182657.340-1-ville.syrjala@linux.intel.com>
 <20200221182657.340-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221182657.340-2-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_plane: Pipeline crc
 capture and flips
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 08:26:57PM +0200, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Eliminate some dead time used to wait for crcs by pipelining
> the flips and crc capture.
> =

> On KBL:
> time kms_plane --r pixel-format-pipe-A-planes
> - real	0m22,592s
> + real	0m14,527s
> =

> time kms_plane --r pixel-format-pipe-A-planes --extended
> - real	1m8,090s
> + real	0m38,738s
> =

> To keep the code somewhat sane we only pipeline while
> capturing the colors for a single pixel format. That does
> still leave a few non-pipelined frames when switching from
> one pixel format to another. Which explains why the extended
> test gets closer to the -50% mark as it tests more colors and
> thus has a larger proportion of optimally pipelined flips.
> =

> Not sure how horrible the code would become if we tried to
> maintain the pipelining throughout the test. For now let's
> just accept the small victory and move on.
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_plane.c | 70 ++++++++++++++++++++++++++++++++---------------
>  1 file changed, 48 insertions(+), 22 deletions(-)
> =

> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9ef3a7f3c1b0..9ad366824c0d 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -500,8 +500,9 @@ static void test_format_plane_color(data_t *data, enu=
m pipe pipe,
>  		igt_plane_set_size(plane, width, height);
>  	}
>  =

> +	if (crc)
> +		igt_pipe_crc_get_previous(data->drm_fd, data->pipe_crc, crc);

Actually need to do this before painting the new fb as that can be
slow. If it takes more than a frame then we'd read the crc for frame N-1
instead of N-2 as we intended. But that's still a bit fragile perhaps.
I guess what I really need to do is sample the frame counter when I do
the flip so that I know exactly which crc I need.

>  	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_AT=
OMIC : COMMIT_UNIVERSAL);
> -	igt_pipe_crc_get_current(data->display.drm_fd, data->pipe_crc, crc);
>  =

>  	igt_remove_fb(data->drm_fd, &old_fb);
>  }
> @@ -525,6 +526,42 @@ static int num_unique_crcs(const igt_crc_t crc[], in=
t num_crc)
>  	return num_unique_crc;
>  }
>  =

> +static void capture_format_crcs(data_t *data, enum pipe pipe,
> +				igt_plane_t *plane,
> +				uint32_t format, uint64_t modifier,
> +				int width, int height,
> +				enum igt_color_encoding encoding,
> +				enum igt_color_range range,
> +				igt_crc_t crc[], struct igt_fb *fb)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < data->num_colors; i++) {
> +		const color_t *c =3D &data->colors[i];
> +
> +		/*
> +		 * The flip issued during frame N will latch
> +		 * at the start of frame N+1, and its CRC will
> +		 * be ready at the start of frame N+2. So the
> +		 * CRC captured here before the flip is issued
> +		 * is for frame N-2.
> +		 */
> +		test_format_plane_color(data, pipe, plane, format, modifier,
> +					width, height, encoding, range, c,
> +					i >=3D 2 ? &crc[i - 2] : NULL, fb);
> +	}
> +
> +	/*
> +	 * Get the remaining two crcs
> +	 *
> +	 * TODO: avoid the extra wait by maintaining the pipeline
> +	 * between different pixel formats as well? Could get messy.
> +	 */
> +	igt_pipe_crc_get_previous(data->drm_fd, data->pipe_crc, &crc[i - 2]);
> +	i++;
> +	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[i - 2]);
> +}
> +
>  static bool test_format_plane_colors(data_t *data, enum pipe pipe,
>  				     igt_plane_t *plane,
>  				     uint32_t format, uint64_t modifier,
> @@ -534,21 +571,17 @@ static bool test_format_plane_colors(data_t *data, =
enum pipe pipe,
>  				     igt_crc_t ref_crc[],
>  				     struct igt_fb *fb)
>  {
> -	int crc_mismatch_count =3D 0;
> +	igt_crc_t crc[ARRAY_SIZE(colors_extended)];
>  	unsigned int crc_mismatch_mask =3D 0;
> +	int crc_mismatch_count =3D 0;
>  	bool result =3D true;
> +	int i;
>  =

> -	for (int i =3D 0; i < data->num_colors; i++) {
> -		const color_t *c =3D &data->colors[i];
> -		igt_crc_t crc;
> -
> -		test_format_plane_color(data, pipe, plane,
> -					format, modifier,
> -					width, height,
> -					encoding, range,
> -					c, &crc, fb);
> +	capture_format_crcs(data, pipe, plane, format, modifier,
> +			    width, height, encoding, range, crc, fb);
>  =

> -		if (!igt_check_crc_equal(&crc, &ref_crc[i])) {
> +	for (i =3D 0; i < data->num_colors; i++) {
> +		if (!igt_check_crc_equal(&crc[i], &ref_crc[i])) {
>  			crc_mismatch_count++;
>  			crc_mismatch_mask |=3D (1 << i);
>  			result =3D false;
> @@ -700,16 +733,9 @@ static bool test_format_plane(data_t *data, enum pip=
e pipe,
>  		igt_remove_fb(data->drm_fd, &test_fb);
>  	}
>  =

> -	for (int i =3D 0; i < data->num_colors; i++) {
> -		const color_t *c =3D &data->colors[i];
> -
> -		test_format_plane_color(data, pipe, plane,
> -					format, modifier,
> -					width, height,
> -					IGT_COLOR_YCBCR_BT709,
> -					IGT_COLOR_YCBCR_LIMITED_RANGE,
> -					c, &ref_crc[i], &fb);
> -	}
> +	capture_format_crcs(data, pipe, plane, format, modifier,
> +			    width, height, IGT_COLOR_YCBCR_BT709,
> +			    IGT_COLOR_YCBCR_LIMITED_RANGE, ref_crc, &fb);
>  =

>  	/*
>  	 * Make sure we have some difference between the colors. This
> -- =

> 2.24.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
