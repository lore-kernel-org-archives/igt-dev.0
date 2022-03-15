Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DB410E422
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Mar 2022 16:01:44 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id bi12so42515248ejb.3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Mar 2022 09:01:44 -0700 (PDT)
Message-ID: <c258c5bf-e1bd-bf62-8a7e-2f26e261077d@gmail.com>
Date: Tue, 15 Mar 2022 18:01:37 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20220309164452.8240-1-jeevan.b@intel.com>
 <20220309164452.8240-6-jeevan.b@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220309164452.8240-6-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/kms_plane_scaling: Adding
 Tile-4 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 9.3.2022 18.44, Jeevan B wrote:
> Adding subtest to test new tiling format
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_plane_scaling.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index b91039b0..73975480 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -40,6 +40,7 @@ typedef struct {
>   	igt_display_t display;
>   	struct igt_fb fb[4];
>   	bool extended;
> +	bool has_4tile;

this entire has_4tile flag seems mostly harmful. Only place where it is 
used is followed by igt_plane_has_format_mod(..)

>   } data_t;
>   
>   const struct {
> @@ -331,7 +332,8 @@ static const uint64_t modifiers[] = {
>   	DRM_FORMAT_MOD_LINEAR,
>   	I915_FORMAT_MOD_X_TILED,
>   	I915_FORMAT_MOD_Y_TILED,
> -	I915_FORMAT_MOD_Yf_TILED
> +	I915_FORMAT_MOD_Yf_TILED,
> +	I915_FORMAT_MOD_4_TILED
>   };
>   
>   static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
> @@ -350,6 +352,10 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
>   
>   		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
>   			uint64_t modifier = modifiers[i];
> +
> +			if (modifier == I915_FORMAT_MOD_4_TILED)
> +				igt_require(d->has_4tile);
> +

I think this will cause this test to skip on all non dg2 boxes?

>   			struct igt_vec tested_formats;
>   
>   			igt_vec_init(&tested_formats, sizeof(uint32_t));
> @@ -682,6 +688,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   		data.devid = is_i915_device(data.drm_fd) ?
>   			intel_get_drm_devid(data.drm_fd) : 0;
>   		igt_require(data.display.is_atomic);
> +
> +		data.has_4tile = is_i915_device(data.drm_fd) &&
> +				 intel_get_device_info(intel_get_drm_devid(data.drm_fd))->has_4tile;
>   	}
>   
>   	igt_subtest_group {
