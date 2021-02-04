Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22326ECFD
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Feb 2021 08:47:18 +0000 (UTC)
Date: Thu, 4 Feb 2021 10:47:15 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YBu0k+/EspHLfPiL@platvala-desk.ger.corp.intel.com>
References: <20210203162503.9544-1-juhapekka.heikkila@gmail.com>
 <20210203162503.9544-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203162503.9544-2-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_rotation_crc: different
 display modes can have different crc
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 06:25:02PM +0200, Juha-Pekka Heikkila wrote:
> 
> Different resolutions with same content may have different crc hence generate
> buffer verification crcs for different modes if needed.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/kms_rotation_crc.c | 62 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 53 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index e7072e208..6d4e87ed9 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -30,6 +30,7 @@
>  #define MAXMULTIPLANESAMOUNT 2
>  #define TEST_MAX_WIDTH 640
>  #define TEST_MAX_HEIGHT 480
> +#define MAX_TESTED_MODES 8
>  
>  struct p_struct {
>  	igt_plane_t *plane;
> @@ -79,11 +80,15 @@ typedef struct {
>  	bool use_native_resolution;
>  	bool extended;
>  
> +	int output_crc_in_use, max_crc_in_use;
>  	struct crc_rect_tag {
> +		int mode;
>  		bool valid;
>  		igt_crc_t ref_crc;
>  		igt_crc_t flip_crc;
> -	} crc_rect[num_rectangle_types];
> +	} crc_rect[MAX_TESTED_MODES][num_rectangle_types];
> +
> +	igt_fb_t last_on_screen;
>  } data_t;
>  
>  typedef struct {
> @@ -169,7 +174,6 @@ static void remove_fbs(data_t *data)
>  {
>  	igt_remove_fb(data->gfx_fd, &data->fb);
>  	igt_remove_fb(data->gfx_fd, &data->fb_reference);
> -	igt_remove_fb(data->gfx_fd, &data->fb_flip);
>  }
>  
>  static void cleanup_crtc(data_t *data)
> @@ -272,7 +276,7 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>  	 */
>  	igt_require(igt_display_has_format_mod(display, pixel_format, tiling));
>  
> -	if (!data->crc_rect[rect].valid) {
> +	if (!data->crc_rect[data->output_crc_in_use][rect].valid) {
>  		/*
>  		* Create a reference software rotated flip framebuffer.
>  		*/
> @@ -285,7 +289,9 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>  			igt_plane_set_position(plane, data->pos_x, data->pos_y);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  
> -		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].flip_crc);
> +		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> +					 &data->crc_rect[data->output_crc_in_use][rect].flip_crc);
> +
>  		igt_remove_fb(data->gfx_fd, &data->fb_flip);
>  
>  		/*
> @@ -300,10 +306,13 @@ static void prepare_fbs(data_t *data, igt_output_t *output,
>  			igt_plane_set_position(plane, data->pos_x, data->pos_y);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  
> -		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &data->crc_rect[rect].ref_crc);
> -		data->crc_rect[rect].valid = true;
> +		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc,
> +					 &data->crc_rect[data->output_crc_in_use][rect].ref_crc);
> +
> +		data->crc_rect[data->output_crc_in_use][rect].valid = true;
>  	}
>  
> +	data->last_on_screen = data->fb_flip;
>  	/*
>  	  * Prepare the non-rotated flip fb.
>  	  */
> @@ -340,6 +349,13 @@ static void test_single_case(data_t *data, enum pipe pipe,
>  		igt_plane_set_size(plane, data->fb.height, data->fb.width);
>  
>  	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +
> +	/*
> +	 * Remove this last fb after it was taken out from screen
> +	 * to avoid unnecessary delays.
> +	 */
> +	igt_remove_fb(data->gfx_fd, &data->last_on_screen);
> +
>  	if (test_bad_format) {
>  		igt_pipe_crc_drain(data->pipe_crc);
>  		igt_assert_eq(ret, -EINVAL);
> @@ -351,7 +367,8 @@ static void test_single_case(data_t *data, enum pipe pipe,
>  
>  	/* Check CRC */
>  	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> -	igt_assert_crc_equal(&data->crc_rect[rect].ref_crc, &crc_output);
> +	igt_assert_crc_equal(&data->crc_rect[data->output_crc_in_use][rect].ref_crc,
> +			     &crc_output);
>  
>  	/*
>  	 * If flips are requested flip to a different fb and
> @@ -374,7 +391,8 @@ static void test_single_case(data_t *data, enum pipe pipe,
>  		}
>  		kmstest_wait_for_pageflip(data->gfx_fd);
>  		igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc_output);
> -		igt_assert_crc_equal(&data->crc_rect[rect].flip_crc, &crc_output);
> +		igt_assert_crc_equal(&data->crc_rect[data->output_crc_in_use][rect].flip_crc,
> +				     &crc_output);
>  	}
>  }
>  
> @@ -403,6 +421,7 @@ static bool test_format(data_t *data,
>  static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_format)
>  {
>  	igt_display_t *display = &data->display;
> +	drmModeModeInfo *mode;
>  	igt_output_t *output;
>  	enum pipe pipe;
>  	int pipe_count = 0;
> @@ -416,8 +435,33 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
>  		igt_plane_t *plane;
>  		int i, j, c;
>  
> +		mode = igt_output_get_mode(output);
> +
> +		/*
> +		 * Find mode which is in use in connector. If this is mode
> +		 * which was not run on earlier we'll end up on zeroed
> +		 * struct crc_rect and recalculate reference crcs.
> +		 */
> +		for (data->output_crc_in_use = 0;
> +		     data->output_crc_in_use < data->max_crc_in_use &&
> +		     data->crc_rect[data->output_crc_in_use][0].mode != mode->vdisplay;
> +		     data->output_crc_in_use++)
> +			;
> +
> +		/*
> +		 * This is if there was different mode on different connector
> +		 * and this mode was not run on before.
> +		 */
> +		if (data->crc_rect[data->output_crc_in_use][0].mode != mode->vdisplay) {
> +			data->crc_rect[data->output_crc_in_use][0].mode = mode->vdisplay;
> +			data->max_crc_in_use++;
> +
> +			if (data->max_crc_in_use >= MAX_TESTED_MODES)
> +				data->max_crc_in_use = MAX_TESTED_MODES - 1;
> +		}
> +
>  		for (c = 0; c < num_rectangle_types; c++)
> -			data->crc_rect[c].valid = false;
> +			data->crc_rect[data->output_crc_in_use][c].valid = false;
>  
>  		if (IS_CHERRYVIEW(data->devid) && pipe != PIPE_B)
>  			continue;
> -- 
> 2.28.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
