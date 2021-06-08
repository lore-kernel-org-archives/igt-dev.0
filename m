Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Tue, 8 Jun 2021 07:46:17 +0000
Message-ID: <BY5PR11MB4372EFEE2684DBD056EDF30E89379@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1622812262-16592-1-git-send-email-vidya.srinivas@intel.com>
 <1623037661-2087-1-git-send-email-vidya.srinivas@intel.com>
 <CO6PR11MB556903B29EDB88A1EC2EB3898D379@CO6PR11MB5569.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB556903B29EDB88A1EC2EB3898D379@CO6PR11MB5569.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: Disable gamma in
 degamma tests
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lin, Charlton" <charlton.lin@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you very much Bhanu for the review.
I have fixed all the comments, added your RB and submitted series https://patchwork.freedesktop.org/series/91145/

Regards
Vidya

-----Original Message-----
From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com> 
Sent: Tuesday, June 8, 2021 12:17 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Cc: markyacoub@chromium.org; Almahallawy, Khaled <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>; Latvala, Petri <petri.latvala@intel.com>; Shankar, Uma <uma.shankar@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_color: Disable gamma in degamma tests

> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Monday, June 7, 2021 9:18 AM
> To: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
> Cc: markyacoub@chromium.org; Almahallawy, Khaled 
> <khaled.almahallawy@intel.com>; Lin, Charlton 
> <charlton.lin@intel.com>; Latvala, Petri <petri.latvala@intel.com>; 
> Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar, Uma 
> <uma.shankar@intel.com>; Srinivas, Vidya <vidya.srinivas@intel.com>
> Subject: [PATCH i-g-t] tests/kms_color: Disable gamma in degamma tests
> 
> This patch disables gamma in degamma subtest which is missing.
> It compares CRC between (linear degamma + solid colors) and (max 
> degamma + gradient colors). Patch also cleans up degamma before 
> exiting degamma test and cleans up gamma before exiting gamma test.
> 
> v2 - Addressed review comments from Bhanuprakash Modem Changed full 
> degamma for reference CRC to linear degamma Added clean up of degamma 
> end of degamma test.
> 
> v3 - Addressed review comments from Bhanuprakash Modem Ported changes 
> to kms_color_chamelium
> 
> Change-Id: Ibdb91b603e2e4024d170727d24c6a5425441e2e1
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_color.c           | 14 +++++++-------
>  tests/kms_color_chamelium.c | 12 ++++++------
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c index 
> 3a42532a5c27..1b021ac3ce0c 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -32,7 +32,6 @@ static void test_pipe_degamma(data_t *data,
>  	igt_output_t *output;
>  	igt_display_t *display = &data->display;
>  	gamma_lut_t *degamma_linear, *degamma_full;
> -	gamma_lut_t *gamma_linear;
>  	color_t red_green_blue[] = {
>  		{ 1.0, 0.0, 0.0 },
>  		{ 0.0, 1.0, 0.0 },
> @@ -45,8 +44,6 @@ static void test_pipe_degamma(data_t *data,
>  	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
>  	degamma_full = generate_table_max(data->degamma_lut_size);
> 
> -	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
> -
>  	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe,
> output) {
>  		drmModeModeInfo *mode;
>  		struct igt_fb fb_modeset, fb;
> @@ -75,11 +72,11 @@ static void test_pipe_degamma(data_t *data,
> 
>  		igt_plane_set_fb(primary, &fb_modeset);
>  		disable_ctm(primary->pipe);
> -		disable_degamma(primary->pipe);
> -		set_gamma(data, primary->pipe, gamma_linear);
> +		disable_gamma(primary->pipe);
> +		set_degamma(data, primary->pipe, degamma_linear);
>  		igt_display_commit(&data->display);
> 
> -		/* Draw solid colors with no degamma transformation. */
> +		/* Draw solid colors with linear degamma transformation. */
>  		paint_rectangles(data, mode, red_green_blue, &fb);
>  		igt_plane_set_fb(primary, &fb);
>  		igt_display_commit(&data->display);
> @@ -103,15 +100,16 @@ static void test_pipe_degamma(data_t *data,
>  		 */
>  		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> 
> +		disable_degamma(primary->pipe);
>  		igt_plane_set_fb(primary, NULL);
>  		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit(&data->display);
>  		igt_remove_fb(data->drm_fd, &fb);
>  		igt_remove_fb(data->drm_fd, &fb_modeset);
>  	}
> 
>  	free_lut(degamma_linear);
>  	free_lut(degamma_full);
> -	free_lut(gamma_linear);
>  }
> 
>  /*
> @@ -189,8 +187,10 @@ static void test_pipe_gamma(data_t *data,
>  		 */
>  		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> 
> +		disable_gamma(primary->pipe);
>  		igt_plane_set_fb(primary, NULL);
>  		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit(&data->display);
>  		igt_remove_fb(data->drm_fd, &fb);
>  		igt_remove_fb(data->drm_fd, &fb_modeset);
>  	}
> diff --git a/tests/kms_color_chamelium.c b/tests/kms_color_chamelium.c 
> index 30b38b82e306..c21d64e9cc9a 100644
> --- a/tests/kms_color_chamelium.c
> +++ b/tests/kms_color_chamelium.c
> @@ -36,7 +36,6 @@ static void test_pipe_degamma(data_t *data,  {
>  	igt_output_t *output;
>  	gamma_lut_t *degamma_linear, *degamma_full;
> -	gamma_lut_t *gamma_linear;
>  	color_t red_green_blue[] = {
>  		{ 1.0, 0.0, 0.0 },
>  		{ 0.0, 1.0, 0.0 },
> @@ -57,8 +56,6 @@ static void test_pipe_degamma(data_t *data,
>  	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
>  	degamma_full = generate_table_max(data->degamma_lut_size);
> 
> -	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
> -
>  	for_each_valid_output_on_pipe(&data->display,
>  				      primary->pipe->pipe,
>  				      output) {
> @@ -110,10 +107,10 @@ static void test_pipe_degamma(data_t *data,
>  		igt_plane_set_fb(primary, &fb_modeset);
>  		disable_ctm(primary->pipe);
>  		disable_degamma(primary->pipe);

This can be disable_gamma(), right?

Also, please create separate patches for kms_color & kms_color_chamelium under the same series.

With above changes:
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> -		set_gamma(data, primary->pipe, gamma_linear);
> +		set_degamma(data, primary->pipe, degamma_linear);
>  		igt_display_commit(&data->display);
> 
> -		/* Draw solid colors with no degamma transformation. */
> +		/* Draw solid colors with linear degamma transformation. */
>  		paint_rectangles(data, mode, red_green_blue, &fbref);
> 
>  		/* Draw a gradient with degamma LUT to remap all @@ -135,13 +132,14 
> @@ static void test_pipe_degamma(data_t *data,
>  					      frame_fullcolors, &fbref,
>  					      CHAMELIUM_CHECK_ANALOG);
> 
> +		disable_degamma(primary->pipe);
>  		igt_plane_set_fb(primary, NULL);
>  		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit(&data->display);
>  	}
> 
>  	free_lut(degamma_linear);
>  	free_lut(degamma_full);
> -	free_lut(gamma_linear);
>  }
> 
>  /*
> @@ -247,8 +245,10 @@ static void test_pipe_gamma(data_t *data,
>  					      frame_fullcolors, &fbref,
>  					      CHAMELIUM_CHECK_ANALOG);
> 
> +		disable_gamma(primary->pipe);
>  		igt_plane_set_fb(primary, NULL);
>  		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit(&data->display);
>  	}
> 
>  	free_lut(gamma_full);
> --
> 2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
