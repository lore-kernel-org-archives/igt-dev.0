Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 998596EEAF
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 07:47:24 +0000 (UTC)
References: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <7a1dab95-6b13-626b-273b-91bc0ddbf16b@linux.intel.com>
Date: Fri, 21 Feb 2020 09:47:20 +0200
MIME-Version: 1.0
In-Reply-To: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_rotation_crc: limit maximum
 used plane size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-02-17 22:03, Juha-Pekka Heikkila wrote:
> It shouldn't make difference here if used maximum available
> screen resolution or something smaller. Something smaller
> is much faster so limit maximum size to 640x480.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Thanks for this. It shaved 00:02:23s (00:15:06 -> 00:13:17) from the
rotation_crc run time, so this is looking better but more work is still
needed:

IGT: igt@kms_rotation_crc@primary-y-tiled-reflect-x-180 		59.40 s
IGT: igt@kms_rotation_crc@primary-y-tiled-reflect-x-270 		59.38 s
IGT: igt@kms_rotation_crc@primary-y-tiled-reflect-x-0		59.32 s
IGT: igt@kms_rotation_crc@primary-y-tiled-reflect-x-90 		59.02 s
IGT: igt@kms_rotation_crc@primary-rotation-90 			58.93 s
IGT: igt@kms_rotation_crc@primary-rotation-270 			58.90 s	
IGT: igt@kms_rotation_crc@primary-x-tiled-reflect-x-0 		58.84 s
IGT: igt@kms_rotation_crc@primary-x-tiled-reflect-x-180 		58.80 s
IGT: igt@kms_rotation_crc@primary-rotation-180 			56.44 s
IGT: igt@kms_rotation_crc@sprite-rotation-180 			40.83 s
IGT: igt@kms_rotation_crc@sprite-rotation-90 			40.82 s
IGT: igt@kms_rotation_crc@sprite-rotation-90-pos-100-0 		40.80 s
IGT: igt@kms_rotation_crc@sprite-rotation-270 			40.78 s
IGT: igt@kms_rotation_crc@bad-tiling 				39.64 s
IGT: igt@kms_rotation_crc@multiplane-rotation-cropping-bottom	18.20 s
IGT: igt@kms_rotation_crc@multiplane-rotation-cropping-top 		18.06 s
IGT: igt@kms_rotation_crc@multiplane-rotation 			17.99 s

However I agree with the patch, although you were a little more
aggressive with your choice of resolution than I would have been :D.  In
any case, this patch is:

Acked-by: Martin Peres <martin.peres@linux.intel.com>

Let's see how much this will improve on Ville's patch!

> ---
>  tests/kms_rotation_crc.c | 46 +++++++++++++++++++++++++++++++++-------------
>  1 file changed, 33 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 2a7b10e..819897b 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -27,6 +27,8 @@
>  
>  #define MAX_FENCES 32
>  #define MAXMULTIPLANESAMOUNT 2
> +#define TEST_MAX_WIDTH 640
> +#define TEST_MAX_HEIGHT 480
>  
>  struct p_struct {
>  	igt_plane_t *plane;
> @@ -65,6 +67,8 @@ typedef struct {
>  
>  	struct p_struct *multiplaneoldview;
>  	struct p_point planepos[MAXMULTIPLANESAMOUNT];
> +
> +	bool use_native_resolution;
>  } data_t;
>  
>  typedef struct {
> @@ -210,8 +214,13 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>  
>  	mode = igt_output_get_mode(output);
>  	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
> -		w = mode->hdisplay;
> -		h = mode->vdisplay;
> +		if (data->use_native_resolution) {
> +			w = mode->hdisplay;
> +			h = mode->vdisplay;
> +		} else {
> +			w = min(TEST_MAX_WIDTH, mode->hdisplay);
> +			h = min(TEST_MAX_HEIGHT, mode->vdisplay);
> +		}
>  
>  		min_w = 256;
>  		min_h = 256;
> @@ -404,8 +413,16 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>  
>  			/* Only support partial covering primary plane on gen9+ */
>  			if (plane_type == DRM_PLANE_TYPE_PRIMARY &&
> -			    i != rectangle && intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9)
> -				continue;
> +			    intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9) {
> +				if (i != rectangle)
> +					continue;
> +				else
> +					data->use_native_resolution = true;
> +				
> +			} else {
> +				data->use_native_resolution = false;
> +			}
> +			
>  
>  			if (!data->override_fmt) {
>  				for (j = 0; j < plane->drm_plane->count_formats; j++) {
> @@ -493,7 +510,7 @@ static void pointlocation(data_t *data, planeinfos *p, drmModeModeInfo *mode,
>  			  int c)
>  {
>  	if (data->planepos[c].origo & p_right) {
> -		p[c].x1 = (int32_t)(data->planepos[c].x * mode->hdisplay
> +		p[c].x1 = (int32_t)(data->planepos[c].x * min(TEST_MAX_WIDTH, mode->hdisplay)
>  				+ mode->hdisplay);
>  		p[c].x1 &= ~3;
>  		/*
> @@ -504,17 +521,17 @@ static void pointlocation(data_t *data, planeinfos *p, drmModeModeInfo *mode,
>  		 */
>  		p[c].x1 -= mode->hdisplay & 2;
>  	} else {
> -		p[c].x1 = (int32_t)(data->planepos[c].x * mode->hdisplay);
> +		p[c].x1 = (int32_t)(data->planepos[c].x * min(TEST_MAX_WIDTH, mode->hdisplay));
>  		p[c].x1 &= ~3;
>  	}
>  
>  	if (data->planepos[c].origo & p_bottom) {
> -		p[c].y1 = (int32_t)(data->planepos[c].y * mode->vdisplay
> +		p[c].y1 = (int32_t)(data->planepos[c].y * min(TEST_MAX_HEIGHT, mode->vdisplay)
>  				+ mode->vdisplay);
>  		p[c].y1 &= ~3;
>  		p[c].y1 -= mode->vdisplay & 2;
>  	} else {
> -		p[c].y1 = (int32_t)(data->planepos[c].y * mode->vdisplay);
> +		p[c].y1 = (int32_t)(data->planepos[c].y * min(TEST_MAX_HEIGHT, mode->vdisplay));
>  		p[c].y1 &= ~3;
>  	}
>  }
> @@ -530,7 +547,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>  	igt_output_t *output;
>  	igt_crc_t retcrc_sw, retcrc_hw;
>  	planeinfos p[2];
> -	int c;
> +	int c, used_w, used_h;
>  	struct p_struct *oldplanes;
>  	drmModeModeInfo *mode;
>  
> @@ -568,14 +585,17 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>  		igt_display_require_output(display);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  
> +		used_w = min(TEST_MAX_WIDTH, mode->hdisplay);
> +		used_h = min(TEST_MAX_HEIGHT, mode->vdisplay);
> +
>  		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
>  						  INTEL_PIPE_CRC_SOURCE_AUTO);
>  		igt_pipe_crc_start(data->pipe_crc);
>  
>  		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
>  			p[0].planetype = DRM_PLANE_TYPE_PRIMARY;
> -			p[0].width = (uint64_t)(planeconfigs[i].width * mode->hdisplay);
> -			p[0].height = (uint64_t)(planeconfigs[i].height * mode->vdisplay);
> +			p[0].width = (uint64_t)(planeconfigs[i].width * used_w);
> +			p[0].height = (uint64_t)(planeconfigs[i].height * used_h);
>  			p[0].tiling = planeconfigs[i].tiling;
>  			pointlocation(data, (planeinfos *)&p, mode, 0);
>  
> @@ -584,8 +604,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>  
>  				for (j = 0; j < ARRAY_SIZE(planeconfigs); j++) {
>  					p[1].planetype = DRM_PLANE_TYPE_OVERLAY;
> -					p[1].width = (uint64_t)(planeconfigs[j].width * mode->hdisplay);
> -					p[1].height = (uint64_t)(planeconfigs[j].height * mode->vdisplay);
> +					p[1].width = (uint64_t)(planeconfigs[j].width * used_w);
> +					p[1].height = (uint64_t)(planeconfigs[j].height * used_h);
>  					p[1].tiling = planeconfigs[j].tiling;
>  					pointlocation(data, (planeinfos *)&p,
>  						      mode, 1);
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
