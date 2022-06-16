Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81C18112F01
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 14:46:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id x17so2176428wrg.6
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jun 2022 07:46:28 -0700 (PDT)
Message-ID: <8719b7e7-7ff6-bfb2-3f2f-331388807556@gmail.com>
Date: Thu, 16 Jun 2022 17:46:20 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20220615095906.23688-1-swati2.sharma@intel.com>
 <20220615095906.23688-3-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220615095906.23688-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/kms_flip_scaled_crc: Add
 new tests covering modifiers and pixel-formats
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

On 15.6.2022 12.59, Swati Sharma wrote:
> New test cases are added covering various modifiers and
> pixel-formats.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_flip_scaled_crc.c | 258 ++++++++++++++++++++++++++++++-
>   1 file changed, 257 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index 6cf3a64b..ca70588d 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -57,6 +57,38 @@ const struct {
>   		1.0,
>   		2.0,
>   	},
> +	{
> +		"flip-32bpp-yftile-to-64bpp-yftile-downscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-32bpp-xtile-to-64bpp-xtile-downscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-32bpp-4tile-to-64bpp-4tile-downscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-32bpp-linear-to-64bpp-linear-downscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
>   	{
>   		"flip-64bpp-ytile-to-32bpp-ytile-downscaling",
>   		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> @@ -65,6 +97,38 @@ const struct {
>   		1.0,
>   		2.0,
>   	},
> +	{
> +		"flip-64bpp-yftile-to-32bpp-yftile-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-xtile-to-32bpp-xtile-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tile-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-linear-to-32bpp-linear-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
> +	},
>   	{
>   		"flip-64bpp-ytile-to-16bpp-ytile-downscaling",
>   		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
> @@ -73,6 +137,38 @@ const struct {
>   		1.0,
>   		2.0,
>   	},
> +	{
> +		"flip-64bpp-yftile-to-16bpp-yftile-downscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-xtile-to-16bpp-xtile-downscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-16bpp-4tile-downscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-linear-to-16bpp-linear-downscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp downscaled fb to stress CD clock programming",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
> +		1.0,
> +		2.0,
> +	},
>   	{
>   		"flip-32bpp-ytileccs-to-64bpp-ytile-downscaling",
>   		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
> @@ -81,6 +177,14 @@ const struct {
>   		1.0,
>   		2.0,
>   	},
> +	{
> +		"flip-32bpp-yftileccs-to-64bpp-yftile-downscaling",
^
flip-32bpp-yftileccs-to-64bpp-ytile-downscaling? Mismatch with modifier 
and test name.


> +		"Flip from 32bpp non scaled fb to 64bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling",
>   		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> @@ -89,6 +193,14 @@ const struct {
>   		1.0,
>   		2.0,
>   	},
> +	{
> +		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
> +		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
> +	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytileccs-downscaling",
>   		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> @@ -97,6 +209,14 @@ const struct {
>   		1.0,
>   		2.0,
>   	},
> +	{
> +		"flip-32bpp-yftile-to-32bpp-yftileccs-downscaling",
> +		"Flip from 32bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
> +	},
>   	{
>   		"flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling",
>   		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> @@ -105,6 +225,14 @@ const struct {
>   		1.0,
>   		2.0,
>   	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
> +		1.0,
> +		2.0,
> +	},
>   	{
>   		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
>   		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> @@ -113,6 +241,38 @@ const struct {
>   		0.5,
>   		1.0,
>   	},
> +	{
> +		"flip-32bpp-yftile-to-64bpp-yftile-upscaling",

should this be called down scaling test as its going from upscaled to 
non scaled?

> +		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
^
upscaled to non scaled? This same comment seem to apply to all below 
added tests.

> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-32bpp-xtile-to-64bpp-xtile-upscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-32bpp-4tile-to-64bpp-4tile-upscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-32bpp-linear-to-64bpp-linear-upscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
>   	{
>   		"flip-64bpp-ytile-to-32bpp-ytile-upscaling",
>   		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> @@ -121,6 +281,38 @@ const struct {
>   		0.5,
>   		1.0,
>   	},
> +	{
> +		"flip-64bpp-yftile-to-32bpp-yftile-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-xtile-to-32bpp-xtile-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB8888,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tile-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-linear-to-32bpp-linear-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB8888,
> +		0.5,
> +		1.0,
> +	},
>   	{
>   		"flip-64bpp-ytile-to-16bpp-ytile-upscaling",
>   		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
> @@ -129,6 +321,38 @@ const struct {
>   		0.5,
>   		1.0,
>   	},
> +	{
> +		"flip-64bpp-yftile-to-16bpp-yftile-upscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_RGB565,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-xtile-to-16bpp-xtile-upscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_X_TILED, DRM_FORMAT_RGB565,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-16bpp-4tile-upscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_RGB565,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-linear-to-16bpp-linear-upscaling",
> +		"Flip from 64bpp non scaled fb to 16bpp upscaled fb to stress CD clock programming",
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_XRGB16161616F,
> +		DRM_FORMAT_MOD_LINEAR, DRM_FORMAT_RGB565,
> +		0.5,
> +		1.0,
> +	},
>   	{
>   		"flip-32bpp-ytileccs-to-64bpp-ytile-upscaling",
>   		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> @@ -137,6 +361,14 @@ const struct {
>   		0.5,
>   		1.0,
>   	},
> +	{
> +		"flip-32bpp-yftileccs-to-64bpp-yftile-upscaling",
> +		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
>   		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> @@ -145,6 +377,14 @@ const struct {
>   		0.5,
>   		1.0,
>   	},
> +	{
> +		"flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
> +		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
> +		0.5,
> +		1.0,
> +	},
>   	{
>   		"flip-32bpp-ytile-to-32bpp-ytileccs-upscaling",
>   		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> @@ -154,13 +394,29 @@ const struct {
>   		1.0,
>   	},
>   	{
> -		"flip-64bpp-ytile-to-32bpp-ytilercccs-upscaling",
> +		"flip-32bpp-yftile-to-32bpp-yftileccs-upscaling",
> +		"Flip from 32bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_Yf_TILED, DRM_FORMAT_XRGB8888,
> +		I915_FORMAT_MOD_Yf_TILED_CCS, DRM_FORMAT_XRGB8888,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling",
>   		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
>   		I915_FORMAT_MOD_Y_TILED, DRM_FORMAT_XRGB16161616F,
>   		I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS, DRM_FORMAT_XRGB8888,
>   		0.5,
>   		1.0,
>   	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_DG2_RC_CCS, DRM_FORMAT_XRGB8888,
> +		0.5,
> +		1.0,
> +	},
>   };
>   
>   static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
