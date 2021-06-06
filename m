Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Sun, 6 Jun 2021 09:09:23 +0000
Message-ID: <CO6PR11MB5569C381A87795F5D6B369498D399@CO6PR11MB5569.namprd11.prod.outlook.com>
References: <1622176543-12759-1-git-send-email-vidya.srinivas@intel.com>
 <1622812262-16592-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1622812262-16592-1-git-send-email-vidya.srinivas@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/kms_color: Disable gamma in degamma
 tests
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
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lin, Charlton" <charlton.lin@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Friday, June 4, 2021 6:41 PM
> To: intel-gfx@lists.freedesktop.org; igt-dev@lists.freedesktop.org
> Cc: markyacoub@chromium.org; Almahallawy, Khaled
> <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>;
> Latvala, Petri <petri.latvala@intel.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Shankar, Uma <uma.shankar@intel.com>;
> Srinivas, Vidya <vidya.srinivas@intel.com>
> Subject: [PATCH] tests/kms_color: Disable gamma in degamma tests
> 
> This patch disables gamma in degamma subtest which is missing.
> It compares CRC between (linear degamma + solid colors) and (max
> degamma + gradient colors).
> 
> v2 - Addressed review comments from Bhanuprakash Modem
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> Change-Id: Ibdb91b603e2e4024d170727d24c6a5425441e2e1
> ---
>  tests/kms_color.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 3a42532a5c27..41720dcdd90f 100644
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
> @@ -75,8 +72,8 @@ static void test_pipe_degamma(data_t *data,
> 
>  		igt_plane_set_fb(primary, &fb_modeset);
>  		disable_ctm(primary->pipe);
> -		disable_degamma(primary->pipe);
> -		set_gamma(data, primary->pipe, gamma_linear);
> +		disable_gamma(primary->pipe);
> +		set_degamma(data, primary->pipe, degamma_linear);
>  		igt_display_commit(&data->display);
> 
>  		/* Draw solid colors with no degamma transformation. */

Please fix the comment s/"no degamma"/"linear degamma"/.
Also, we need to port this patch on "kms_color_chamelium".

> @@ -103,15 +100,17 @@ static void test_pipe_degamma(data_t *data,
>  		 */
>  		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> 
> +		disable_degamma(primary->pipe);
>  		igt_plane_set_fb(primary, NULL);
>  		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit2(&data->display, data->display.is_atomic ?
> +							COMMIT_ATOMIC : COMMIT_LEGACY);
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
> @@ -189,8 +188,11 @@ static void test_pipe_gamma(data_t *data,
>  		 */
>  		igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
> 
> +		disable_gamma(primary->pipe);
>  		igt_plane_set_fb(primary, NULL);
>  		igt_output_set_pipe(output, PIPE_NONE);
> +		igt_display_commit2(&data->display, data->display.is_atomic ?
> +							COMMIT_ATOMIC : COMMIT_LEGACY);
 
These changes are not relevant to the degamma, but still we need these changes.
It would be good if we mention this in commit message.

With above changes, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu
>  		igt_remove_fb(data->drm_fd, &fb);
>  		igt_remove_fb(data->drm_fd, &fb_modeset);
>  	}
> --
> 2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
