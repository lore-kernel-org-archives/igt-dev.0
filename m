Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8F910E460
 for <igt-dev@lists.freedesktop.org>; Wed, 10 May 2023 08:41:18 +0000 (UTC)
Message-ID: <198bc0a4-563f-eaa2-9608-9d93334921bc@linux.intel.com>
Date: Wed, 10 May 2023 09:41:15 +0100
MIME-Version: 1.0
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20230506005528.1890922-1-umesh.nerlige.ramappa@intel.com>
 <20230506005528.1890922-14-umesh.nerlige.ramappa@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230506005528.1890922-14-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 13/15] intel_gpu_top: Show gt specific
 values if requested
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
> On multi-gt platforms, the aggregate values are displayed as default. If
> user passes -p (physical) option for these platforms, show gt specific
> counter values.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tools/intel_gpu_top.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tools/intel_gpu_top.c b/tools/intel_gpu_top.c
> index 4d0aeee16..8bcca67a6 100644
> --- a/tools/intel_gpu_top.c
> +++ b/tools/intel_gpu_top.c
> @@ -1944,6 +1944,26 @@ print_header(const struct igt_device_card *card,
>   		&power_group,
>   		NULL
>   	};
> +	int i;
> +
> +	/*
> +	 * If we have multi-gt and the user has specified -p options, show gt
> +	 * specific values.
> +	 */
> +	if (!class_view && engines->num_gts > 1) {
> +		int j = 0;
> +
> +		groups[j++] = &period_group;
> +		for (i = 0; i < engines->num_gts; i++)
> +			groups[j++] = &freq_group_gt[i];
> +
> +		groups[j++] = &irq_group;
> +		for (i = 0; i < engines->num_gts; i++)
> +			groups[j++] = &rc6_group_gt[i];
> +
> +		groups[j++] = &power_group;
> +		groups[j++] = NULL;
> +	}
>   
>   	if (output_mode != JSON)
>   		memmove(&groups[0], &groups[1],

This works fine. One day we can think about how to make the setup one 
time. Like have two pre-configured groups arrays and then just select 
the right one here based on class_view.

Regards,

Tvrtko
