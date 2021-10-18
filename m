Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B896E96C
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 06:57:25 +0000 (UTC)
Message-ID: <eafdb389-cc49-06e8-e35e-6a9ab7010d78@intel.com>
Date: Mon, 18 Oct 2021 12:27:13 +0530
Content-Language: en-US
References: <20211013221727.6392-1-ville.syrjala@linux.intel.com>
 <20211013221727.6392-5-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20211013221727.6392-5-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] tests/i915/kms_flip_tiling: Replace
 i915 interlace check with try_commit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/14/2021 3:47 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Rather than having to maintain i915 specific exceptions here
> let's just use try_commit to figure out if we can even do the
> actual test (the page flip ioctl).
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_flip_tiling.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
> index 0ed08f78f917..63e0b8b9648f 100644
> --- a/tests/i915/kms_flip_tiling.c
> +++ b/tests/i915/kms_flip_tiling.c
> @@ -65,6 +65,12 @@ static void pipe_crc_free(void)
>   	}
>   }
>   
> +static int try_commit(igt_display_t *display)
> +{
> +	return igt_display_try_commit2(display, display->is_atomic ?
> +				       COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
>   static void
>   test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t modifier[2])
>   {
> @@ -79,13 +85,6 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
>   
>   	mode = igt_output_get_mode(output);
>   
> -	/* Interlaced modes don't support Y/Yf tiling */
> -	if (modifier[0] == I915_FORMAT_MOD_Y_TILED ||
> -	    modifier[0] == I915_FORMAT_MOD_Yf_TILED ||
> -	    modifier[1] == I915_FORMAT_MOD_Y_TILED ||
> -	    modifier[1] == I915_FORMAT_MOD_Yf_TILED)
> -		igt_require(!(mode->flags & DRM_MODE_FLAG_INTERLACE));
> -
>   	primary = igt_output_get_plane(output, 0);
>   
>   	fb_id = igt_create_pattern_fb(data->drm_fd,
> @@ -103,12 +102,16 @@ test_flip_tiling(data_t *data, enum pipe pipe, igt_output_t *output, uint64_t mo
>   
>   	/* Set the crtc and generate a reference CRC. */
>   	igt_plane_set_fb(primary, &data->fb[1]);
> -	igt_display_commit(&data->display);
> +	igt_require_f(try_commit(&data->display) == 0,
> +		      "commit failed with " IGT_MODIFIER_FMT "\n",
> +		      IGT_MODIFIER_ARGS(modifier[1]));
>   	igt_pipe_crc_collect_crc(pipe_crc, &reference_crc);
>   
>   	/* Commit the first fb. */
>   	igt_plane_set_fb(primary, &data->fb[0]);
> -	igt_display_commit(&data->display);
> +	igt_require_f(try_commit(&data->display) == 0,
> +		      "commit failed with " IGT_MODIFIER_FMT "\n",
> +		      IGT_MODIFIER_ARGS(modifier[1]));
>   
>   	/* Flip to the second fb. */
>   	ret = drmModePageFlip(data->drm_fd, output->config.crtc->crtc_id,

