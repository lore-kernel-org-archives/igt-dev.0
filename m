Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3593510E2DE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 15:27:21 +0000 (UTC)
Message-ID: <0d9e5146-fda3-a59d-83d3-7996d6d1c2c1@intel.com>
Date: Mon, 5 Jun 2023 20:57:16 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 igt-dev@lists.freedesktop.org
References: <20230602105001.7610-1-juhapekka.heikkila@gmail.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230602105001.7610-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Add debug prints for
 pixel format tests if couldn't use custom plane size
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 02-Jun-23 4:20 PM, Juha-Pekka Heikkila wrote:
> Moved check for setting 64x64 plane size for pixel format tests into its own
> function and added debug prints if couldn't use smaller than full mode size
> plane for testing.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   tests/kms_plane.c | 57 +++++++++++++++++++++++++++++------------------
>   1 file changed, 35 insertions(+), 22 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 90b68a47..dfc6a8c5 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -896,6 +896,40 @@ struct format_mod {
>   	uint32_t format;
>   };
>   
> +/*
> + * See if test can go use 64x64 plane size for testing. If driver is not
> + * reporting to be atomic, will not try to use 64x64 plane size.
> +*/
> +static void check_allowed_plane_size_64x64(data_t *data, igt_plane_t *plane,
> +					   uint64_t *width, uint64_t *height,
> +					   uint32_t format)
> +{
> +	struct igt_fb test_fb;
> +	int ret;
> +
> +	if (!data->display.is_atomic) {
> +		igt_debug("Not using 64x64 plane size on non-atomic platform\n");
> +		return;
> +	}
> +
> +	igt_create_fb(data->drm_fd, 64, 64, format, DRM_FORMAT_MOD_LINEAR, &test_fb);
> +	igt_plane_set_fb(plane, &test_fb);
> +
> +	ret = igt_display_try_commit_atomic(&data->display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);
> +	if (!ret) {
> +		*width = test_fb.width;
> +		*height = test_fb.height;
> +	} else {
> +		igt_debug("Not using 64x64 plane size, atomic commit did not "
> +			  "accept 64x64 plane size\n");
> +	}
> +
> +	igt_remove_fb(data->drm_fd, &test_fb);
> +}
> +
>   static bool test_format_plane(data_t *data, enum pipe pipe,
>   			      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
>   {
> @@ -944,28 +978,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
>   		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
>   		 kmstest_pipe_name(pipe), plane->index);
>   
> -	if (data->display.is_atomic) {
> -		struct igt_fb test_fb;
> -		int ret;
> -
> -		igt_create_fb(data->drm_fd, 64, 64, ref.format,
> -			      DRM_FORMAT_MOD_LINEAR, &test_fb);
> -
> -		igt_plane_set_fb(plane, &test_fb);
> -
> -		ret = igt_display_try_commit_atomic(&data->display,
> -						    DRM_MODE_ATOMIC_TEST_ONLY |
> -						    DRM_MODE_ATOMIC_ALLOW_MODESET,
> -						    NULL);
> -		if (!ret) {
> -			width = test_fb.width;
> -			height = test_fb.height;
> -		}
> -
> -		igt_plane_set_fb(plane, clear_fb);
> -
> -		igt_remove_fb(data->drm_fd, &test_fb);
> -	}
> +	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
>   
>   	capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier,
>   				   width, height, IGT_COLOR_YCBCR_BT709,
