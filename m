Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE516ED38
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 12:09:10 +0000 (UTC)
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
Date: Thu, 20 Feb 2020 12:09:08 +0000
Message-ID: <09d7c2ac7ef2fd4db7809daf0315ac8c6c3e1420.camel@intel.com>
References: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1581969803-15387-1-git-send-email-juhapekka.heikkila@gmail.com>
Content-Language: en-US
Content-ID: <A083BA65FF21DD4CAAFBCBBEB96A1F42@intel.com>
MIME-Version: 1.0
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
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 2020-02-17 at 22:03 +0200, Juha-Pekka Heikkila wrote:
> It shouldn't make difference here if used maximum available
> screen resolution or something smaller. Something smaller
> is much faster so limit maximum size to 640x480.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_rotation_crc.c | 46 +++++++++++++++++++++++++++++++++-----
> --------
>  1 file changed, 33 insertions(+), 13 deletions(-)

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

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
> @@ -210,8 +214,13 @@ static void prepare_fbs(data_t *data,
> igt_output_t *output,
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
> @@ -404,8 +413,16 @@ static void test_plane_rotation(data_t *data,
> int plane_type, bool test_bad_form
>  
>  			/* Only support partial covering primary plane
> on gen9+ */
>  			if (plane_type == DRM_PLANE_TYPE_PRIMARY &&
> -			    i != rectangle &&
> intel_gen(intel_get_drm_devid(data->gfx_fd)) < 9)
> -				continue;
> +			    intel_gen(intel_get_drm_devid(data-
> >gfx_fd)) < 9) {
> +				if (i != rectangle)
> +					continue;
> +				else
> +					data->use_native_resolution =
> true;
> +				
> +			} else {
> +				data->use_native_resolution = false;
> +			}
> +			
>  
>  			if (!data->override_fmt) {
>  				for (j = 0; j < plane->drm_plane-
> >count_formats; j++) {
> @@ -493,7 +510,7 @@ static void pointlocation(data_t *data,
> planeinfos *p, drmModeModeInfo *mode,
>  			  int c)
>  {
>  	if (data->planepos[c].origo & p_right) {
> -		p[c].x1 = (int32_t)(data->planepos[c].x * mode-
> >hdisplay
> +		p[c].x1 = (int32_t)(data->planepos[c].x *
> min(TEST_MAX_WIDTH, mode->hdisplay)
>  				+ mode->hdisplay);
>  		p[c].x1 &= ~3;
>  		/*
> @@ -504,17 +521,17 @@ static void pointlocation(data_t *data,
> planeinfos *p, drmModeModeInfo *mode,
>  		 */
>  		p[c].x1 -= mode->hdisplay & 2;
>  	} else {
> -		p[c].x1 = (int32_t)(data->planepos[c].x * mode-
> >hdisplay);
> +		p[c].x1 = (int32_t)(data->planepos[c].x *
> min(TEST_MAX_WIDTH, mode->hdisplay));
>  		p[c].x1 &= ~3;
>  	}
>  
>  	if (data->planepos[c].origo & p_bottom) {
> -		p[c].y1 = (int32_t)(data->planepos[c].y * mode-
> >vdisplay
> +		p[c].y1 = (int32_t)(data->planepos[c].y *
> min(TEST_MAX_HEIGHT, mode->vdisplay)
>  				+ mode->vdisplay);
>  		p[c].y1 &= ~3;
>  		p[c].y1 -= mode->vdisplay & 2;
>  	} else {
> -		p[c].y1 = (int32_t)(data->planepos[c].y * mode-
> >vdisplay);
> +		p[c].y1 = (int32_t)(data->planepos[c].y *
> min(TEST_MAX_HEIGHT, mode->vdisplay));
>  		p[c].y1 &= ~3;
>  	}
>  }
> @@ -530,7 +547,7 @@ static void test_multi_plane_rotation(data_t
> *data, enum pipe pipe)
>  	igt_output_t *output;
>  	igt_crc_t retcrc_sw, retcrc_hw;
>  	planeinfos p[2];
> -	int c;
> +	int c, used_w, used_h;
>  	struct p_struct *oldplanes;
>  	drmModeModeInfo *mode;
>  
> @@ -568,14 +585,17 @@ static void test_multi_plane_rotation(data_t
> *data, enum pipe pipe)
>  		igt_display_require_output(display);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  
> +		used_w = min(TEST_MAX_WIDTH, mode->hdisplay);
> +		used_h = min(TEST_MAX_HEIGHT, mode->vdisplay);
> +
>  		data->pipe_crc = igt_pipe_crc_new(data->gfx_fd, pipe,
>  						  INTEL_PIPE_CRC_SOURCE
> _AUTO);
>  		igt_pipe_crc_start(data->pipe_crc);
>  
>  		for (i = 0; i < ARRAY_SIZE(planeconfigs); i++) {
>  			p[0].planetype = DRM_PLANE_TYPE_PRIMARY;
> -			p[0].width = (uint64_t)(planeconfigs[i].width *
> mode->hdisplay);
> -			p[0].height = (uint64_t)(planeconfigs[i].height
> * mode->vdisplay);
> +			p[0].width = (uint64_t)(planeconfigs[i].width *
> used_w);
> +			p[0].height = (uint64_t)(planeconfigs[i].height
> * used_h);
>  			p[0].tiling = planeconfigs[i].tiling;
>  			pointlocation(data, (planeinfos *)&p, mode, 0);
>  
> @@ -584,8 +604,8 @@ static void test_multi_plane_rotation(data_t
> *data, enum pipe pipe)
>  
>  				for (j = 0; j <
> ARRAY_SIZE(planeconfigs); j++) {
>  					p[1].planetype =
> DRM_PLANE_TYPE_OVERLAY;
> -					p[1].width =
> (uint64_t)(planeconfigs[j].width * mode->hdisplay);
> -					p[1].height =
> (uint64_t)(planeconfigs[j].height * mode->vdisplay);
> +					p[1].width =
> (uint64_t)(planeconfigs[j].width * used_w);
> +					p[1].height =
> (uint64_t)(planeconfigs[j].height * used_h);
>  					p[1].tiling =
> planeconfigs[j].tiling;
>  					pointlocation(data, (planeinfos
> *)&p,
>  						      mode, 1);
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
