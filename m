Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5E5C10F90F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 May 2022 05:53:50 +0000 (UTC)
Message-ID: <b2d623fb-b5b9-5853-e2d5-4b62b8f63d86@intel.com>
Date: Thu, 5 May 2022 11:23:38 +0530
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220504220013.20671-1-nidhi1.gupta@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20220504220013.20671-1-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Skip the subtest
 if the resolution is not supported
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

On 5/5/2022 3:30 AM, Nidhi Gupta wrote:
> The kms_concurrent is about testing mode setting with
> reducing the resolution and then again increasing it,
> for this the test will take the high resolution supported
> by the connector and then calculate the lowest resolution,
> if the calculated resolution is not supported by the connector
> it will assign the default resolution of 1024x 768 without
> checking.
>
> Adding the check to skip the subtest if the default
> resolution is not supported by the connector.

Hi,

Please update the commit message. We're skipping if , "mode_lo->vdisplay 
 > mode_hi->vdisplay". Mention the same.

Also, I think its better to move this check inside "get_lowres_mode()".  
Before returning 1024x768 mode, we could use the same check used in the 
loop, "mode->vdisplay < limit", and skip the test if this is not met.

Thanks,
Karthik.B.S
>
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_concurrent.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index 82b2021e..fdef6b26 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -272,6 +272,8 @@ test_resolution_with_output(data_t *data, enum pipe pipe, int max_planes, igt_ou
>   		mode_hi = igt_output_get_mode(output);
>   		mode_lo = get_lowres_mode(data, mode_hi, output);
>   
> +		igt_skip_on(mode_lo->vdisplay > mode_hi->vdisplay);
> +
>   		/* switch to lower resolution */
>   		igt_output_override_mode(output, mode_lo);
>   		free(mode_lo);

