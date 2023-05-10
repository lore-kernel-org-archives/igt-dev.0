Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8FF10E462
 for <igt-dev@lists.freedesktop.org>; Wed, 10 May 2023 08:46:56 +0000 (UTC)
Message-ID: <04a7f10e-99ff-e1cd-0fe7-6f63d9e896d0@linux.intel.com>
Date: Wed, 10 May 2023 09:46:53 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
 <20230506005528.1890922-16-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230506005528.1890922-16-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 15/15] intel_gpu_top: Add gt specific
 values to header in interactive mode
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


On 06/05/2023 01:55, Umesh Nerlige Ramappa wrote:
> If -p options is specified in INTERACTIVE mode, show the gt specific
> values.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tools/intel_gpu_top.c | 33 +++++++++++++++++++++++++--------
>   1 file changed, 25 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 0acc81e9e..7018499c7 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1988,14 +1988,31 @@ print_header(const struct igt_device_card *card,
>   	lines = print_header_token(" @ ", lines, con_w, con_h, &rem,
>   				   "%s", card->card);
>   
> -	lines = print_header_token(" - ", lines, con_w, con_h, &rem,
> -				   "%s/%s MHz",
> -				   freq_items[1].buf,
> -				   freq_items[0].buf);
> -
> -	lines = print_header_token("; ", lines, con_w, con_h, &rem,
> -				   "%s%% RC6",
> -				   rc6_items[0].buf);
> +	if (class_view || engines->num_gts == 1) {
> +		lines = print_header_token(" - ", lines, con_w, con_h, &rem,
> +					   "%s/%s MHz",
> +					   freq_items[1].buf,
> +					   freq_items[0].buf);
> +
> +		lines = print_header_token("; ", lines, con_w, con_h, &rem,
> +					   "%s%% RC6",
> +					   rc6_items[0].buf);
> +	} else {
> +		for (i = 0; i < engines->num_gts; i++) {
> +			const char *cont = !i ? " - ": "; ";
> +
> +			lines = print_header_token(cont, lines, con_w, con_h, &rem,
> +						   "%s/%s MHz(gt%d)",
> +						   freq_items_gt[i * 4 + 1].buf,
> +						   freq_items_gt[i * 4 + 0].buf,
> +						   i);
> +
> +			lines = print_header_token("; ", lines, con_w, con_h, &rem,
> +						   "%s%% RC6(gt%d)",
> +						   rc6_items_gt[i * 3].buf,
> +						   i);
> +		}
> +	}
>   
>   	if (engines->r_gpu.present) {
>   		lines = print_header_token("; ", lines, con_w, con_h,

Series was a super easy read, thanks for that! Pretty much r-b for the 
lot from me but I would just like to visualize how the output looks like 
first. Would you mind pasting some examples for all the modes?

Regards,

Tvrtko
