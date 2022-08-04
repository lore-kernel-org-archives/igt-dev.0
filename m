Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A195A6EDA
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Aug 2022 20:37:10 +0000 (UTC)
Message-ID: <1ccea314-e8a9-1a56-bcc8-debb01553f11@quicinc.com>
Date: Thu, 4 Aug 2022 13:37:05 -0700
MIME-Version: 1.0
Content-Language: en-US
To: Rohith Iyer <quic_rohiiyer@quicinc.com>, <igt-dev@lists.freedesktop.org>
References: <20220730003506.10659-1-quic_rohiiyer@quicinc.com>
 <20220730003506.10659-3-quic_rohiiyer@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220730003506.10659-3-quic_rohiiyer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v5 2/3] tests/testdisplay: Use
 igt_parse_mode_string for command line arguments
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 7/29/2022 5:35 PM, Rohith Iyer wrote:
> Use igt_parse_mode_string instead of sscanf to parse mode string from command line.
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>

LGTM,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   tests/testdisplay.c | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index e9fbd260..4db182b4 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -625,8 +625,6 @@ static const char *help_str =
>   
>   static int opt_handler(int opt, int opt_index, void *data)
>   {
> -	float force_clock;
> -
>   	switch (opt) {
>   	case '3':
>   		test_stereo_modes = 1;
> @@ -642,12 +640,8 @@ static int opt_handler(int opt, int opt_index, void *data)
>   		break;
>   	case 'f':
>   		force_mode = 1;
> -		if (sscanf(optarg,"%f,%hu,%hu,%hu,%hu,%hu,%hu,%hu,%hu",
> -			   &force_clock,&force_timing.hdisplay, &force_timing.hsync_start,&force_timing.hsync_end,&force_timing.htotal,
> -			   &force_timing.vdisplay, &force_timing.vsync_start, &force_timing.vsync_end, &force_timing.vtotal)!= 9)
> +		if (!igt_parse_mode_string(optarg, &force_timing))
>   			return IGT_OPT_HANDLER_ERROR;
> -		force_timing.clock = force_clock*1000;
> -
>   		break;
>   	case 's':
>   		sleep_between_modes = atoi(optarg);
