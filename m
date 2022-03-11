Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD35810EAF1
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Mar 2022 21:30:20 +0000 (UTC)
Message-ID: <7b8a7dc5-fce8-4f6b-910e-d7598ed97ee6@amd.com>
Date: Fri, 11 Mar 2022 16:30:15 -0500
Content-Language: en-US
To: David Zhang <dingchen.zhang@amd.com>, igt-dev@lists.freedesktop.org
References: <20220311194452.291714-1-dingchen.zhang@amd.com>
 <20220311194452.291714-2-dingchen.zhang@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20220311194452.291714-2-dingchen.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 1/4] lib/igt_psr: pass higher versions of
 PSR SU panels
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



On 2022-03-11 14:44, David Zhang wrote:
> [why]
>  From eDP 1.5 (eDP 1.4b SCR adopted), a higher version of PSR-SU eDP
> panel, i.e. version 0x4, is added into spec. Need to treat such PSR
> panel as PSR capable sink device.
> 
> [how]
> validate the PSR capable sink for higher PSR version 0x4.
> 
> Cc: Rodrigo Siqueira <rodrigo.siqueira@amd.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Jay Pillai <aurabindo.pillai@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> 
> Signed-off-by: David Zhang <dingchen.zhang@amd.com>
> ---
>   lib/igt_psr.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
> index 98eb28b4..2b73e809 100644
> --- a/lib/igt_psr.c
> +++ b/lib/igt_psr.c
> @@ -209,8 +209,14 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode)
>   		/*
>   		 * i915 requires PSR version 0x03 that is PSR2 + SU with
>   		 * Y-coordinate to support PSR2
> +		 *
> +		 * or
> +		 *
> +		 * PSR version 0x4 that is PSR2 + SU w/ Y-coordinate and SU
> +		 * Region Early Transport to support PSR2 (eDP 1.5)
>   		 */
> -		return strstr(buf, "Sink support: yes [0x03]");
> +		return strstr(buf, "Sink support: yes [0x03]") ||
> +		       strstr(buf, "Sink support: yes [0x04]");
>   }
>   
>   #define PSR2_SU_BLOCK_STR_LOOKUP "PSR2 SU blocks:\n0\t"


Except for nitpicks, with changes addressed, the series is:

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
