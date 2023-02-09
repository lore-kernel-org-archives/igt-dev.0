Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB9210E0E4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Feb 2023 12:43:03 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so4051480wms.0
 for <igt-dev@lists.freedesktop.org>; Thu, 09 Feb 2023 04:43:03 -0800 (PST)
Message-ID: <a1307e52-ec42-4ec2-851f-820d22776d3e@gmail.com>
Date: Thu, 9 Feb 2023 14:42:55 +0200
MIME-Version: 1.0
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230206072934.25256-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230206072934.25256-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [v2] tests/kms_plane_scaling: Add
 downscaling+upscaling tests
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

On 6.2.2023 9.29, Swati Sharma wrote:
> In newer hardware versions (i.e. display version >= 14), the second
> scaler doesn't support downscaling. Current driver design in the
> case of 2 plane scaling scenario is if plane1-US and plane2-DS,
> it's reject for now. That's why new tests are added for plane1-DS
> and plane2-US, so that different DS+US combinations can be validated.
> 
> v2: -minor fix
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_plane_scaling.c | 70 ++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 887a55e63..e9301d89f 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -31,7 +31,8 @@ IGT_TEST_DESCRIPTION("Test display plane scaling");
>   enum scaler_combo_test_type {
>   	TEST_PLANES_UPSCALE = 0,
>   	TEST_PLANES_DOWNSCALE,
> -	TEST_PLANES_UPSCALE_DOWNSCALE
> +	TEST_PLANES_UPSCALE_DOWNSCALE,
> +	TEST_PLANES_DOWNSCALE_UPSCALE
>   };
>   
>   typedef struct {
> @@ -286,6 +287,69 @@ const struct {
>   		0.75,
>   		TEST_PLANES_UPSCALE_DOWNSCALE,
>   	},
> +	{
> +		"Tests downscaling (scaling factor 0.25) and upscaling (20x20) of 2 planes.",
> +		"planes-downscale-factor-0-25-upscale-20x20",
> +		0.25,
> +		0.0,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.25) and upscaling (scaling factor 0.25) of 2 planes.",
> +		"planes-downscale-factor-0-25-upscale-0-25",
> +		0.25,
> +		0.25,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.25) and scaling (unity) of 2 planes.",
> +		"planes-downscale-factor-0-25-unity-scaling",
> +		0.25,
> +		1.0,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.5) and upscaling (20x20) of 2 planes.",
> +		"planes-downscale-factor-0-5-upscale-20x20",
> +		0.5,
> +		0.0,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.5) and upscaling (scaling factor 0.25) of 2 planes.",
> +		"planes-downscale-factor-0-5-upscale-0-25",
> +		0.5,
> +		0.25,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.5) and scaling (unity) of 2 planes.",
> +		"planes-downscale-factor-0-5-unity-scaling",
> +		0.5,
> +		1.0,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.75) and upscaling (20x20) of 2 planes.",
> +		"planes-downscale-factor-0-75-upscale-20x20",
> +		0.75,
> +		0.0,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.75) and upscaling (scaling factor 0.25) of 2 planes.",
> +		"planes-downscale-factor-0-75-upscale-0-25",
> +		0.75,
> +		0.25,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
> +	{
> +		"Tests downscaling (scaling factor 0.75) and scaling (unity) of 2 planes.",
> +		"planes-downscale-factor-0-75-unity-scaling",
> +		0.75,
> +		1.0,
> +		TEST_PLANES_DOWNSCALE_UPSCALE,
> +	},
>   };
>   
>   static int get_width(drmModeModeInfo *mode, double scaling_factor)
> @@ -653,6 +717,10 @@ test_planes_scaling_combo(data_t *d, int w1, int h1, int w2, int h2,
>   		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[1]);
>   		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[2]);
>   	}
> +	if (test_type == TEST_PLANES_DOWNSCALE_UPSCALE) {
> +		setup_fb(display->drm_fd, mode->hdisplay, mode->vdisplay, 0.0, 1.0, 0.0, &d->fb[1]);
> +		setup_fb(display->drm_fd, w1, h1, 1.0, 0.0, 0.0, &d->fb[2]);
> +	}

Should this TEST_PLANES_DOWNSCALE_UPSCALE be taken care of also in 
__test_planes_scaling_combo(..) ? You could also change these stream of 
"if (test_type .." to switch case and have default having assert(0) so 
when 'the next guy' come changing these it will be obvious if something 
was missed.

/Juha-Pekka

>   
>   	for (int k = 0; k < display->pipes[pipe].n_planes; k++) {
>   		igt_plane_t *p1, *p2;
