Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E36910E784
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 09:35:05 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id x34so8395188ede.8
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 02:35:05 -0700 (PDT)
Message-ID: <1b6cbe1b-1ae2-3409-67ec-1a5ff6700eb8@gmail.com>
Date: Fri, 18 Mar 2022 11:34:57 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
References: <20220317205414.13668-1-jeevan.b@intel.com>
 <20220317205414.13668-3-jeevan.b@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220317205414.13668-3-jeevan.b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 2/4] igt/tests: Add support for
 Tile4(TileF) format to tests/kms_addfb_basic
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

Subject line need to be fixed, with that

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 17.3.2022 22.54, Jeevan B wrote:
> Adding subtest to test new tiling format
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_addfb_basic.c | 46 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 46 insertions(+)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index b7b3b0f2..6b2323a9 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -676,6 +676,50 @@ static void addfb25_ytile(int fd)
>   	}
>   }
>   
> +static void addfb25_4tile(int fd)
> +{
> +	struct drm_mode_fb_cmd2 f = {};
> +	igt_display_t display;
> +
> +	igt_fixture {
> +		igt_display_require(&display, fd);
> +
> +		gem_bo = igt_create_bo_with_dimensions(fd, 1024, 1024,
> +				DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
> +		igt_assert(gem_bo);
> +
> +		memset(&f, 0, sizeof(f));
> +
> +		f.width = 1024;
> +		f.height = 1024;
> +		f.pixel_format = DRM_FORMAT_XRGB8888;
> +		f.pitches[0] = 1024*4;
> +		f.flags = DRM_MODE_FB_MODIFIERS;
> +		f.modifier[0] = DRM_FORMAT_MOD_LINEAR;
> +
> +		f.handles[0] = gem_bo;
> +
> +	}
> +
> +	igt_describe("Check if addfb2 call works for tiling-4");
> +	igt_subtest("addfb25-4-tiled") {
> +		igt_require_fb_modifiers(fd);
> +		igt_require_intel(fd);
> +
> +		f.modifier[0] = I915_FORMAT_MOD_4_TILED;
> +		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) ==
> +			   addfb_expected_ret(&display, &f));
> +		if (!addfb_expected_ret(&display, &f))
> +			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) == 0);
> +		f.fb_id = 0;
> +	}
> +
> +	igt_fixture {
> +		gem_close(fd, gem_bo);
> +		igt_display_fini(&display);
> +	}
> +}
> +
>   static void prop_tests(int fd)
>   {
>   	struct drm_mode_fb_cmd2 f = {};
> @@ -826,6 +870,8 @@ igt_main
>   
>   	addfb25_ytile(fd);
>   
> +	addfb25_4tile(fd);
> +
>   	tiling_tests(fd);
>   
>   	prop_tests(fd);
