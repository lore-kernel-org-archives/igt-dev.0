Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA19F10E09C
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jun 2022 09:11:22 +0000 (UTC)
Message-ID: <45dcdb84-7357-2fcd-9311-0f1fe0f317e7@intel.com>
Date: Mon, 13 Jun 2022 14:41:08 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220531051408.13090-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220531051408.13090-1-nidhi1.gupta@intel.com>
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

On 5/31/2022 10:44 AM, Nidhi Gupta wrote:
> Fix regression caused by commit 14ad49f5b6ed861eda93e9d6b6ed0f3c77d228d1
> to skip the subtest if the suitable resolution is not found.
>
> -the test will calculate the high resolution and low resolution supported by
> the connector.
> -high resolution will be the default highest resolution supported by the connector
> and using that test calculates the lower resolution.
> -if the lower resolution is not supported by the connector it will assign the
> default resolution of 1024x768
> -if the default  resolution value is higher than the high resolutin, skip in that
> situation to avoid failure of the test.

Hi,

Please update the commit message. The only issue is that instead of 
checking hdisplay < 1024, currently vdisplay < 1024 is being checked.
So could you just update the igt_skip check with vdisplay instead of 
hdisplay. No need to move the skip to a different functions.

Also, please add a fixes tag.


Thanks,
Karthik.B.S


>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_concurrent.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index d4536e3b..f3cec242 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -252,7 +252,6 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
>   			return igt_memdup(mode, sizeof(*mode));
>   	}
>   
> -	igt_skip_on_f(mode_default->vdisplay < 1024, "No suitable resolution was found\n");
>   	return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
>   }
>   
> @@ -273,6 +272,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>   		mode_hi = igt_output_get_mode(output);
>   		mode_lo = get_lowres_mode(data, mode_hi, output);
>   
> +		igt_skip_on_f(mode_lo->vdisplay > mode_hi->vdisplay, "No suitable resolution was found\n");
> +		
>   		/* switch to lower resolution */
>   		igt_output_override_mode(output, mode_lo);
>   		free(mode_lo);

