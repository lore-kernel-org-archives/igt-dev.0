Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3EAF6EB7C
 for <igt-dev@lists.freedesktop.org>; Wed, 12 May 2021 12:01:45 +0000 (UTC)
Date: Wed, 12 May 2021 15:01:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YJvDobbBtV7MVck8@intel.com>
References: <20210512063742.185593-1-khaled.almahallawy@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210512063742.185593-1-khaled.almahallawy@intel.com>
Subject: Re: [igt-dev] [RFC PATCH i-g-t] tests/kms_invalid_dotclock: Test
 every mode
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
To: Khaled Almahallawy <khaled.almahallawy@intel.com>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 11, 2021 at 11:37:42PM -0700, Khaled Almahallawy wrote:
> Implementing:
> =

> /*
>  * FIXME test every mode we have to be more
>  * sure everything is really getting rejected?
>  */

I don't quite recall the history of that FIXME. I guess there
should be at least no real harm in doing this.

However there are a bunch of other more extensive tests here:
https://patchwork.freedesktop.org/series/69531/
Would be nice to get those in. Can't remember if they would conflict
with this stuff...

> =

> Output of the test  will look like the following:
> ...
> Checking pipe A connector DP-2 with mode  720x400 70 720 738 846 900 400 =
412 414 449 0x6 0x40 1305601
> Checking pipe B connector DP-2 with mode  720x400 70 720 738 846 900 400 =
412 414 449 0x6 0x40 1305601
> Checking pipe C connector DP-2 with mode  720x400 70 720 738 846 900 400 =
412 414 449 0x6 0x40 1305601
> Checking pipe D connector DP-2 with mode  720x400 70 720 738 846 900 400 =
412 414 449 0x6 0x40 1305601
> SUCCESS (0.743s)
> =

> Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
> ---
>  tests/kms_invalid_dotclock.c | 54 +++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 28 deletions(-)
> =

> diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
> index 402629ab097f..aab765136d0e 100644
> --- a/tests/kms_invalid_dotclock.c
> +++ b/tests/kms_invalid_dotclock.c
> @@ -48,9 +48,10 @@ static int
>  test_output(data_t *data)
>  {
>  	igt_output_t *output =3D data->output;
> -	drmModeModeInfo mode;
> +	drmModeConnector *connector =3D output->config.connector;
> +	drmModeModeInfo *mode;
>  	struct igt_fb fb;
> -	int i;
> +	int i, j;
>  =

>  	/*
>  	 * FIXME When we have a fixed mode, the kernel will ignore
> @@ -63,33 +64,30 @@ test_output(data_t *data)
>  	if (has_scaling_mode_prop(data))
>  		return 0;
>  =

> -	/*
> -	 * FIXME test every mode we have to be more
> -	 * sure everything is really getting rejected?
> -	 */
> -	mode =3D *igt_output_get_mode(output);
> -	mode.clock =3D data->max_dotclock + 1;
> -
> -	igt_create_fb(data->drm_fd,
> -		      mode.hdisplay, mode.vdisplay,
> -		      DRM_FORMAT_XRGB8888,
> -		      LOCAL_DRM_FORMAT_MOD_NONE,
> -		      &fb);
> -
> -	for (i =3D 0; i < data->res->count_crtcs; i++) {
> -		int ret;
> -
> -		igt_info("Checking pipe %c connector %s with mode %s\n",
> -			 'A'+i, output->name, mode.name);
> -
> -		ret =3D drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
> -				     fb.fb_id, 0, 0,
> -				     &output->id, 1, &mode);
> -		igt_assert_lt(ret, 0);
> +	for (j =3D 0; j < connector->count_modes; j++) {
> +		mode =3D &connector->modes[j];
> +		mode->clock =3D data->max_dotclock + 1;
> +
> +		igt_create_fb(data->drm_fd,
> +			mode->hdisplay, mode->vdisplay,
> +			DRM_FORMAT_XRGB8888,
> +			LOCAL_DRM_FORMAT_MOD_NONE,
> +			&fb);
> +
> +		for (i =3D 0; i < data->res->count_crtcs; i++) {
> +			int ret;
> +
> +			igt_info("Checking pipe %c connector %s with mode",
> +				'A'+i, output->name);
> +			kmstest_dump_mode(mode);
> +			ret =3D drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
> +					fb.fb_id, 0, 0,
> +					&output->id, 1, mode);
> +			igt_assert_lt(ret, 0);
> +		}
> +
> +		igt_remove_fb(data->drm_fd, &fb);
>  	}
> -
> -	igt_remove_fb(data->drm_fd, &fb);
> -
>  	return 1;
>  }
>  =

> -- =

> 2.25.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
