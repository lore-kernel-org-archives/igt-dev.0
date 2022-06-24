Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78A310E50C
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jun 2022 08:11:54 +0000 (UTC)
Message-ID: <314a12fc-0142-a64c-d171-6e5cb0757d1c@intel.com>
Date: Fri, 24 Jun 2022 13:41:36 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220624050000.22886-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220624050000.22886-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
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

On 6/24/2022 10:30 AM, Nidhi Gupta wrote:
> Fix regression caused by commit 14ad49f5b6ed861eda93e9d6b6ed0f3c77d228d1
> to skip the subtest if the suitable resolution is not found.
>
> The kms_concurrent is about testing mode setting with
> reducing the resolution and then again increasing it,
> for this the test will take the high resolution supported
> by the connector and then calculate the lowest resolution,
> if the calculated resolution is not supported by the connector
> it will assign the default resolution of 1024x 768 without
> checking.
>
> Added check to skip the subtest if the current mode is smaller
> than 1024 mode (igt_skip_on_f(mode_default->hdisplay < 1024))
> becuase if the default resolution is greater then the highest
> resolution supported by the connector then the test should skip.
>
> Fixes: 14ad49f5b6ed861eda93e9d6b6ed0f3c77d228d1
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_concurrent.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index d4536e3b..6f8ffd4a 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -252,7 +252,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
>   			return igt_memdup(mode, sizeof(*mode));
>   	}
>   
> -	igt_skip_on_f(mode_default->vdisplay < 1024, "No suitable resolution was found\n");
> +	igt_skip_on_f(mode_default->hdisplay < 1024, "No suitable resolution was found\n");
>   	return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
>   }
>   

