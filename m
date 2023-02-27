Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AAE10E3CA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Feb 2023 11:39:26 +0000 (UTC)
Date: Mon, 27 Feb 2023 13:39:18 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <Y/yWZsRqr/VciGCu@intel.com>
References: <20230227113227.19671-1-juhapekka.heikkila@gmail.com>
 <20230227113227.19671-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230227113227.19671-2-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_vblank: no need to clear
 black with black
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 01:32:27PM +0200, Juha-Pekka Heikkila wrote:
> created framebuffer was uselessly painted black which just wasted
> time from ci.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

For the series:
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  tests/kms_vblank.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 5bd3fefe1..b6c1c7c42 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -79,11 +79,10 @@ static void prepare_crtc(data_t *data, int fd, igt_output_t *output)
>  
>  	/* create and set the primary plane fb */
>  	mode = igt_output_get_mode(output);
> -	igt_create_color_fb(fd, mode->hdisplay, mode->vdisplay,
> -			    DRM_FORMAT_XRGB8888,
> -			    DRM_FORMAT_MOD_LINEAR,
> -			    0.0, 0.0, 0.0,
> -			    &data->primary_fb);
> +	igt_create_fb(fd, mode->hdisplay, mode->vdisplay,
> +		      DRM_FORMAT_XRGB8888,
> +		      DRM_FORMAT_MOD_LINEAR,
> +		      &data->primary_fb);
>  
>  	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data->primary_fb);
> -- 
> 2.39.0

-- 
Ville Syrjälä
Intel
