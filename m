Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF2210E1B9
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Apr 2023 16:46:30 +0000 (UTC)
Message-ID: <f6acd7c4-ab9c-60f7-4e13-35edadfe96dc@amd.com>
Date: Mon, 24 Apr 2023 10:46:25 -0600
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 aurabindo.pillai@amd.com, alex.hung@amd.com, hamza.mahfooz@amd.com
References: <20230424141626.78069-1-hersenxs.wu@amd.com>
Content-Language: en-US
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20230424141626.78069-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_link_settings: use
 mode 640x480 for link configuration test
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



On 4/24/23 08:16, Hersen Wu wrote:
> with 4k dp connected, amdgpu kernel warning mesaage dp_blank timeout

/mesaage/message/

> happens intermittently. link configuration <1, 162> could not support

Do you mean 1.62?

> 4k mode. dp safe mode 640x480@60hz could be used for all link

Is this safe mode defined in the spec?

Also, after set to this safe mode this test stop to be intermittently?

> configuration test.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/amdgpu/amd_link_settings.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
> index 14c8c4d7..ec5e6fe5 100644
> --- a/tests/amdgpu/amd_link_settings.c
> +++ b/tests/amdgpu/amd_link_settings.c
> @@ -159,6 +159,24 @@ static void run_link_training_config(data_t *data, igt_output_t *output)
>   	}
>   }
>   
> +static const drmModeModeInfo dp_safe_mode_640_480 = {
> +	.name		= "640x480",
> +	.vrefresh	= 60,
> +	.clock		= 25200,
> +
> +	.hdisplay	= 640,
> +	.hsync_start	= 656,
> +	.hsync_end	= 752,
> +	.htotal		= 800,
> +
> +	.vdisplay	= 480,
> +	.vsync_start	= 490,
> +	.vsync_end	= 492,
> +	.vtotal		= 525,
> +
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +};
> +
>   static void test_link_training_configs(data_t *data)
>   {
>   	const drmModeModeInfo *orig_mode;
> @@ -177,7 +195,12 @@ static void test_link_training_configs(data_t *data)
>   		/* Init only if display supports link_settings */
>   		test_init(data, output);
>   
> -		orig_mode = igt_output_get_mode(output);
> +		/* run_link_training_config run test from <1, 1.62>
> +		 * to highest link configuration. to make sure mode timing
> +		 * be fitted into <1, 1.62> and higher configuration, use
> +		 * dp safe mode 640x480@60hz
> +		 */
> +		orig_mode = &dp_safe_mode_640_480;
>   		igt_assert(orig_mode);
>   		igt_output_override_mode(output, orig_mode);
>   
