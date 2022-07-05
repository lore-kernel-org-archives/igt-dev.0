Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B010E6A5
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jul 2022 16:04:42 +0000 (UTC)
Message-ID: <20ab8890-9222-cbf7-acaf-2cdfda7e3e5e@quicinc.com>
Date: Tue, 5 Jul 2022 09:04:36 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20220627210534.258721-1-robdclark@gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220627210534.258721-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH igt] tests/msm: Fix mapping test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 6/27/2022 2:05 PM, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The format of the fault-info in the devcore is a bit different from what
> it was looking for.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   tests/msm/msm_mapping.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
> index e1474f9f..21cdc8e1 100644
> --- a/tests/msm/msm_mapping.c
> +++ b/tests/msm/msm_mapping.c
> @@ -211,10 +211,10 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
>   	/* Make sure the devcore is from iova fault: */
>   	igt_fail_on(!strstr(devcore, "fault-info"));
>   
> -	s = strstr(devcore, "  - far: ");
> +	s = strstr(devcore, "  - iova=");
>   	igt_fail_on(!s);
>   
> -	ret = sscanf(s, "  - far: %"PRIx64, &fault_addr);
> +	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
>   	igt_fail_on(ret != 1);
>   	igt_fail_on(addr != fault_addr);
>   }
