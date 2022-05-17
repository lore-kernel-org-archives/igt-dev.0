Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07A10E325
 for <igt-dev@lists.freedesktop.org>; Tue, 17 May 2022 09:23:35 +0000 (UTC)
Message-ID: <4f292456-4f07-02a4-64ea-420b7f3a8a26@intel.com>
Date: Tue, 17 May 2022 14:53:22 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220516104127.25657-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220516104127.25657-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] tests/kms_concurrent: Skip the
 subtest if the resolution is not supported
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

On 5/16/2022 4:11 PM, Nidhi Gupta wrote:
> The kms_concurrent is about testing mode setting with
> reducing the resolution and then again increasing it,
> for this the test will take the high resolution supported
> by the connector and then calculate the lowest resolution,
> if the calculated resolution is not supported by the connector
> it will assign the default resolution of 1024x 768 without
> checking.
>
> Added check to skip the subtest if the default resolution is not supported
> by the connector, to achieve that we are skipping if, mode_default->vdisplay < 1024"
> becuase if the default resolution is greater then the highest
> resolution supported by the connector then the test should skip.

Hi,

Please update the commit message to something like, "Added check to skip 
the subtest if the current mode is smaller than 1024 mode". We're 
basically skipping the test because we couldn't find a mode lower than 
the current mode.
In most cases it would be true that current mode would be the highest, 
but need not be always true. So better to make it clear in the commit 
message.

With this updated, the patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Thanks,
Karthik.B.S
>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_concurrent.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 82b2021e..0b696e63 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -252,6 +252,7 @@ get_lowres_mode(data_t *data, const drmModeModeInfo *mode_default,
>   			return igt_memdup(mode, sizeof(*mode));
>   	}
>   
> +	igt_skip_on_f(mode_default->vdisplay < 1024, "No suitable resolution was found\n");
>   	return igt_std_1024_mode_get(igt_output_preferred_vrefresh(output));
>   }
>   

