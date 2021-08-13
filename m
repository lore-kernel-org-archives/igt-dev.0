Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 652026E5CD
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 11:30:33 +0000 (UTC)
Date: Fri, 13 Aug 2021 14:33:14 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YRZYejwRAKyXO9XA@platvala-desk.ger.corp.intel.com>
References: <1628134823-27763-1-git-send-email-maitreye@codeaurora.org>
 <1628134823-27763-2-git-send-email-maitreye@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1628134823-27763-2-git-send-email-maitreye@codeaurora.org>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] lib/igt_fb: add an API to support
 color square DP CTS pattern
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: maitreye <maitreye@codeaurora.org>
Cc: igt-dev@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org, aravindh@codeaurora.org, abhinavk@codeaurora.org, khsieh@codeaurora.org, manasi.d.navare@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 04, 2021 at 08:40:23PM -0700, maitreye wrote:
> Add an api to support the CTA range color square video test
> pattern as explained in section 3.2.5.3 of the DP CTS
> specification. This pattern is required for supporting
> the CTA range for RGB formats.
> 
> Also rename the existing api igt_fill_cts_framebuffer to
> igt_fill_cts_color_ramp_framebuffer to higlight the
> pattern type.
> 
> Signed-off-by: maitreye <maitreye@codeaurora.org>

Can you use your real name here?

> ---
>  lib/igt_fb.c                | 125 +++++++++++++++++++++++++++++++++++++++++++-
>  lib/igt_fb.h                |   4 +-
>  tools/intel_dp_compliance.c |   2 +-
>  tools/msm_dp_compliance.c   |  43 +++++++++++----
>  4 files changed, 160 insertions(+), 14 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 583cc9e..3d34457 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1396,7 +1396,128 @@ void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
>  }
>  
>  /**
> - * igt_fill_cts_framebuffer:
> + *
> + * igt_fill_cts_color_square_framebuffer:
> + * @pixmap: handle to mapped buffer
> + * @video_width: required width for pattern
> + * @video_height: required height for pattern
> + * @bitdepth: required bitdepth fot pattern
> + * @alpha: required alpha for the pattern
> + *
> + * This function draws a color square pattern for given width and height
> + * as per the specifications mentioned in section 3.2.5.3 of DP CTS spec.
> + */
> +int igt_fill_cts_color_square_framebuffer(uint32_t *pixmap, uint32_t video_width,
> +		uint32_t video_height, uint32_t bitdepth, int alpha)
> +{
> +	uint32_t max_color_val = 0;
> +	uint32_t min_color_val = 0;
> +	uint32_t* pmax = &max_color_val;
> +	uint32_t* pmin = &min_color_val;


I'm not fully understanding why these pointers are used?



-- 
Petri Latvala


> +	int tile_width = 64;
> +	int tile_height = 64;
> +	int reverse = 0;
> +
> +	switch(bitdepth) {
> +	case 8:
> +		*pmax  = 235;
> +		*pmin  = 16;
> +		break;
> +	case 10:
> +		*pmax  = 940;
> +		*pmin  = 64;
> +		break;
> +        }
> +	/* 
> + 	* According to the requirement stated in the 3.2.5.3  DP CTS spec  the required pattern for color 
> +	* square should look like below
> +	*
> +	*      white | yellow | cyan    | green | magenta | red    | blue  | black | white | ... | ..
> +	*      -------------------------------------------------------------------------------
> +	*      blue  | red    | magenta | green | cyan    | yellow | white | black | blue  | ... | ..
> +	*      -------------------------------------------------------------------------------
> +	*      white | yellow | cyan    | green | magenta | red    | blue  | black | white | ... | ..
> +	*      -------------------------------------------------------------------------------
> +	*      blue  | red    | magenta | green | cyan    | yellow | white | black | blue  | ... | ..
> +	*      	--------------------------------------------------------------------------------
> +	*	.    |   .    |	  .	|  .	|   .     |	.  |   .   |   .   |   .   |  .
> +	*
> +	*	.    |	 .    |	  .	|  .	|   .	  |	.  |   .   |   .   |   .   |  .
> +	*
> +	*
> +	*/
> +        uint32_t colors[8][3] = {
> +	/* White Color */
> +        {(*pmax), (*pmax), (*pmax)}, 
> +	/* Yellow Color */
> +        {(*pmax), (*pmax), (*pmin)},
> +	/* Cyan Color */
> +        {(*pmin), (*pmax), (*pmax)},
> +	/* Green Color */  
> +        {(*pmin), (*pmax), (*pmin)},
> +	/* Magenta Color */
> +        {(*pmax), (*pmin), (*pmax)},
> +	/* Red Color */
> +        {(*pmax), (*pmin), (*pmin)},
> +	/* Blue Color */
> +        {(*pmin), (*pmin), (*pmax)},
> +	/* Black Color */
> +        {(*pmin), (*pmin), (*pmin)},
> +        };
> +
> +	uint32_t reverse_colors[8][3] = {
> +	/* Blue Color */
> +	{(*pmin), (*pmin), (*pmax)},
> +	/* Red Color */
> +	{(*pmax), (*pmin), (*pmin)},
> +	/* Magenta Color */
> +	{(*pmax), (*pmin), (*pmax)},
> +	/* Green Color */
> +	{(*pmin), (*pmax), (*pmin)},
> +	/* Cyan Color */  
> +	{(*pmin), (*pmax), (*pmax)},
> +	/* Yellow Color */
> +	{(*pmax), (*pmax), (*pmin)},
> +	/* White Color */
> +	{(*pmax), (*pmax), (*pmax)},
> +	/* Black Color */
> +	{(*pmin), (*pmin), (*pmin)},
> +	};
> +
> +	for (uint32_t height = 0; height < video_height; height++) {
> +		uint32_t color = 0;
> +		uint8_t *temp = pixmap;
> +		uint8_t **buffer = &temp;
> +		uint32_t (*color_array)[3];
> +		temp += (4 * video_width * height);
> +		for (uint32_t width = 0; width < video_width; width++) {
> +
> +			if (reverse == 0)
> +				color_array = colors;
> +			else
> +				color_array = reverse_colors;
> +
> +			/* using BGRA8888 format */
> +			*(*buffer)++ = (((uint8_t)color_array[color][2]) & 0xFF);
> +			*(*buffer)++ = (((uint8_t)color_array[color][1]) & 0xFF);
> +			*(*buffer)++ = (((uint8_t)color_array[color][0]) & 0xFF);
> +			*(*buffer)++ = ((uint8_t)alpha & 0xFF);
> +
> +			if (((width + 1) % tile_width) == 0)
> +				color = (color + 1 ) % 8;
> +
> +		}
> +		if (((height + 1) % tile_height)== 0) {
> +			if (reverse == 0)
> +				reverse = 1;
> +			else
> +				reverse = 0;
> +		}
> +	}
> +	return 0;
> +}
> +/**
> + * igt_fill_cts_color_ramp_framebuffer:
>   * @pixmap: handle to the mapped buffer
>   * @video_width: required width for the CTS pattern
>   * @video_height: required height for the CTS pattern
> @@ -1404,7 +1525,7 @@ void igt_paint_color(cairo_t *cr, int x, int y, int w, int h,
>   * @alpha: required alpha for the CTS pattern
>   * This functions draws the CTS test pattern for a given width, height.
>   */
> -int igt_fill_cts_framebuffer(uint32_t *pixmap, uint32_t video_width,
> +int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video_width,
>  		uint32_t video_height, uint32_t bitdepth, int alpha)
>  {
>  	uint32_t tile_height, tile_width;
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 2c2b826..e6f2840 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -213,8 +213,10 @@ bool igt_format_is_fp16(uint32_t drm_format);
>  int igt_format_plane_bpp(uint32_t drm_format, int plane);
>  void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
>  			   bool allow_yuv);
> -int igt_fill_cts_framebuffer(uint32_t *pixmap, uint32_t video_width,
> +int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video_width,
>  		uint32_t video_height, uint32_t bitdepth, int alpha);
> +int igt_fill_cts_color_square_framebuffer(uint32_t *pixmap,  uint32_t video_width,
> +                uint32_t video_height, uint32_t bitdepth, int alpha);
>  
>  int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc);
>  
> diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
> index fb94605..20216e7 100644
> --- a/tools/intel_dp_compliance.c
> +++ b/tools/intel_dp_compliance.c
> @@ -532,7 +532,7 @@ static int set_test_mode(struct connector *dp_conn)
>  			return ret;
>  		}
>  
> -		ret = igt_fill_cts_framebuffer(dp_conn->test_pattern.pixmap,
> +		ret = igt_fill_cts_color_ramp_framebuffer(dp_conn->test_pattern.pixmap,
>  				dp_conn->test_pattern.hdisplay,
>  				dp_conn->test_pattern.vdisplay,
>  				dp_conn->test_pattern.bitdepth,
> diff --git a/tools/msm_dp_compliance.c b/tools/msm_dp_compliance.c
> index 7bc2bfa..144dfee 100644
> --- a/tools/msm_dp_compliance.c
> +++ b/tools/msm_dp_compliance.c
> @@ -143,6 +143,10 @@
>  /* DRM definitions - must be kept in sync with the DRM header */
>  #define DP_TEST_LINK_VIDEO_PATTERN	(1 << 1)
>  
> +
> +/* DP CTS PATTERN TYPE */
> +#define PATTERN_COLOR_RAMP 1
> +#define PATTERN_COLOR_SQUARE 3
>  /* Global file pointers for the sysfs files */
>  FILE *test_active_fp, *test_data_fp, *test_type_fp;
>  
> @@ -153,6 +157,7 @@ uint16_t hdisplay;
>  uint16_t vdisplay;
>  uint8_t bitdepth;
>  
> +uint16_t pattern;
>  drmModeRes *resources;
>  int drm_fd, modes, gen;
>  uint64_t tiling = LOCAL_DRM_FORMAT_MOD_NONE;
> @@ -172,6 +177,7 @@ struct test_video_pattern {
>  	uint16_t hdisplay;
>  	uint16_t vdisplay;
>  	uint8_t bitdepth;
> +	uint16_t pattern;
>  	uint32_t fb;
>  	uint32_t size;
>  	struct igt_fb fb_pattern;
> @@ -244,15 +250,15 @@ static unsigned long get_test_type(void)
>  static void get_test_videopattern_data(void)
>  {
>  	int count = 0;
> -	uint16_t video_pattern_value[3];
> -	char video_pattern_attribute[15];
> +	uint16_t video_pattern_value[5];
> +	char video_pattern_attribute[20];
>  	int ret;
>  
>  	if (!test_data_fp)
>  		fprintf(stderr, "Invalid test_data file\n");
>  
>  	rewind(test_data_fp);
> -	while (!feof(test_data_fp) && count < 3) {
> +	while (!feof(test_data_fp) && count < 4) {
>  		ret = fscanf(test_data_fp, "%s %u\n", video_pattern_attribute,
>  		       (unsigned int *)&video_pattern_value[count++]);
>  		if (ret < 2) {
> @@ -264,10 +270,11 @@ static void get_test_videopattern_data(void)
>  	hdisplay = video_pattern_value[0];
>  	vdisplay = video_pattern_value[1];
>  	bitdepth = video_pattern_value[2];
> +	pattern = video_pattern_value[3];
>  	igt_info("Hdisplay = %d\n", hdisplay);
>  	igt_info("Vdisplay = %d\n", vdisplay);
>  	igt_info("BitDepth = %u\n", bitdepth);
> -
> +	igt_info("pattern = %d\n", pattern);
>  }
>  
>  static int process_test_request(int test_type)
> @@ -325,6 +332,7 @@ static int setup_video_pattern_framebuffer(struct connector *dp_conn)
>  
>  	dp_conn->test_pattern.size = dp_conn->test_pattern.fb_pattern.size;
>  	memset(dp_conn->test_pattern.pixmap, 0, dp_conn->test_pattern.size);
> +	igt_info("size: %d \n",dp_conn->test_pattern.size);
>  	return 0;
>  
>  }
> @@ -374,6 +382,8 @@ static int set_test_mode(struct connector *dp_conn)
>  		dp_conn->test_pattern.hdisplay = hdisplay;
>  		dp_conn->test_pattern.vdisplay = vdisplay;
>  		dp_conn->test_pattern.bitdepth = bitdepth;
> +		dp_conn->test_pattern.pattern = pattern;
> +		igt_info("Pattern :%d\n", dp_conn->test_pattern.pattern);
>  
>  		ret = setup_video_pattern_framebuffer(dp_conn);
>  		if (ret) {
> @@ -381,16 +391,29 @@ static int set_test_mode(struct connector *dp_conn)
>  				 c->connector_id, ret);
>  			return ret;
>  		}
> -
> -		ret = igt_fill_cts_framebuffer(dp_conn->test_pattern.pixmap,
> +		if(dp_conn->test_pattern.pattern == PATTERN_COLOR_RAMP) {
> +			ret = igt_fill_cts_color_ramp_framebuffer(dp_conn->test_pattern.pixmap,
>  				dp_conn->test_pattern.hdisplay,
>  				dp_conn->test_pattern.vdisplay,
>  				dp_conn->test_pattern.bitdepth,
>  				0);
> -		if (ret) {
> -			igt_warn("Filling framebuffer for connector %u failed (%d)\n",
> -				 c->connector_id, ret);
> -			return ret;
> +			if (ret) {
> +				igt_warn("Filling framebuffer for connector %u failed (%d)\n",
> +					c->connector_id, ret);
> +				return ret;
> +			}
> +		}
> +		if(dp_conn->test_pattern.pattern == PATTERN_COLOR_SQUARE) {
> +			ret = igt_fill_cts_color_square_framebuffer(dp_conn->test_pattern.pixmap,
> +                                dp_conn->test_pattern.hdisplay,
> +                                dp_conn->test_pattern.vdisplay,
> +                                dp_conn->test_pattern.bitdepth,
> +                                0);
> +			if(ret) {
> +				igt_warn("Filling framebuffer for connector %u failed (%d)\n",
> +					c->connector_id, ret);
> +				return ret;
> +			}
>  		}
>  		/* unmapping the buffer previously mapped during setup */
>  		munmap(dp_conn->test_pattern.pixmap,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
