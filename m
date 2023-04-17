Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B7D10E284
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Apr 2023 05:54:39 +0000 (UTC)
Message-ID: <dd5b612c-8e4f-1955-6c60-e66be55dde1b@intel.com>
Date: Mon, 17 Apr 2023 08:54:16 +0300
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230329115642.244296-1-matthew.auld@intel.com>
 <20230329115642.244296-5-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230329115642.244296-5-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tests/xe/query: extend for CPU
 visible accounting
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



On 3/29/23 2:56 PM, Matthew Auld wrote:
> Print the visible size and how much is used. Also sanity check the
> values.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   tests/xe/xe_query.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index 3f038225..9367d65e 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -228,6 +228,21 @@ test_query_mem_usage(int fd)
>   		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
>   		       mem_usage->regions[i].min_page_size,
>   		       mem_usage->regions[i].max_page_size);
> +
> +		igt_info("visible size=%lluMiB\n",
> +			 mem_usage->regions[i].cpu_visible_size >> 20);
> +		igt_info("visible used=%lluMiB\n",
> +			 mem_usage->regions[i].cpu_visible_used >> 20);
> +
> +		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_size,
> +				   mem_usage->regions[i].total_size);
> +		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_used,
> +				   mem_usage->regions[i].cpu_visible_size);
> +		igt_assert_lte_u64(mem_usage->regions[i].cpu_visible_used,
> +				   mem_usage->regions[i].used);
> +		igt_assert_lte_u64(mem_usage->regions[i].used -
> +				   mem_usage->regions[i].cpu_visible_used,
> +				   mem_usage->regions[i].total_size);
Although not exactly the cpu visible sanity check that the title of this 
commit refers to, but there is no sanity check between used and total_size.
If it's not a semantic duplicate check, could you add this sanity check 
as well?

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>

>   	}
>   	dump_hex_debug(mem_usage, query.size);
>   	free(mem_usage);
