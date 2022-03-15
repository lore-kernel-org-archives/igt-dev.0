Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EE510E422
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Mar 2022 16:00:53 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w4so24804083edc.7
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Mar 2022 09:00:53 -0700 (PDT)
Message-ID: <ce66978e-e21e-3f96-9fc5-e63bc3228bfb@gmail.com>
Date: Tue, 15 Mar 2022 18:00:43 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20220309164452.8240-1-jeevan.b@intel.com>
 <20220309164452.8240-5-jeevan.b@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220309164452.8240-5-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tests/kms_draw_crc: Use 4 tiling
 when filling framebuffer
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 9.3.2022 18.44, Jeevan B wrote:
> From: Mika Kahola <mika.kahola@intel.com>
> 
> For platforms with 4 tiling, let's use 4 tiling instead of Y tiling.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/i915/kms_draw_crc.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index 33b7bdf4..33fefed4 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -226,6 +226,7 @@ static void fill_fb_subtest(void)
>   	int rc;
>   	struct igt_fb fb;
>   	igt_crc_t base_crc, crc;
> +	bool has_4tile = intel_get_device_info(intel_get_drm_devid(drm_fd))->has_4tile;
>   
>   	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
>   		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
> @@ -248,7 +249,9 @@ static void fill_fb_subtest(void)
>   	igt_assert_crc_equal(&crc, &base_crc);
>   
>   	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
> -		get_fill_crc(I915_FORMAT_MOD_Y_TILED, &crc);
> +		get_fill_crc(has_4tile ?
> +			     I915_FORMAT_MOD_4_TILED : I915_FORMAT_MOD_Y_TILED,
> +			     &crc);
>   		igt_assert_crc_equal(&crc, &base_crc);
>   	}
>   
