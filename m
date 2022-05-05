Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ACC10E38A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 17:41:07 +0000 (UTC)
Message-ID: <13bd50bc-a73c-40e3-f419-27f8b4e9153c@amd.com>
Date: Thu, 5 May 2022 13:40:48 -0400
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220504184117.2441365-1-dingchen.zhang@amd.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20220504184117.2441365-1-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] tests/amdgpu/amd_bypass: skip if DSC is
 enabled on the connector
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

On 2022-05-04 14:41, David Zhang wrote:
> [why & how]
> Since the DSC is visually lossless but loss still exists after
> compression/decompression at source/destination sides. So for any
> bypass mode validation, which requires what received at sink is
> consistent to what is transmitted at source, DSC is required to be
> turned off.
> 
> skip the test run if the DSC is enabled on the connector (output).
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  tests/amdgpu/amd_bypass.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index 75ad8521..5ec90884 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -21,6 +21,7 @@
>   *
>   */
>  #include "igt.h"
> +#include "igt_amd.h"
>  
>  /*
>   * internal use
> @@ -315,6 +316,14 @@ static void bypass_8bpc_test(data_t *data)
>  
>  	test_init(data);
>  
> +	/**
> +	 * 8bpc bypass only makes sense without DSC.
> +	 * DSC is visually lossless but actually still loss exists and any bypass mode
> +	 * cannot be run w/ DSC enabled.
> +	 */
> +	igt_skip_on_f(igt_amd_read_dsc_clock_status(data->drm_fd, data->output->name) == 1,
> +		      "DSC enabled on %s and no sense to validate bypass mode\n", data->output->name);
> +
>  	igt_create_fb(data->drm_fd, data->width, data->height,
>  		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
>  
