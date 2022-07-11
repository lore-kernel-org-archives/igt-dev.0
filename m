Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15AAB113612
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jul 2022 13:53:37 +0000 (UTC)
Message-ID: <7f25a80d-1bdf-cae7-c345-8579a7a5a9a2@intel.com>
Date: Mon, 11 Jul 2022 14:53:33 +0100
MIME-Version: 1.0
Content-Language: en-GB
To: Nirmoy Das <nirmoy.das@intel.com>, igt-dev@lists.freedesktop.org
References: <20220711120750.657-1-nirmoy.das@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220711120750.657-1-nirmoy.das@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915_query: fix cache type
 iteration
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 11/07/2022 13:07, Nirmoy Das wrote:
> Iterate over each cache types otherwise this will get
> stuck in infinite loop if the value starts with 0 1st bit.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6249
> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Matthew Auld <matthew.auld@intel.com>

> ---
>   tests/i915/i915_query.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
> index b33ffecff..ca500d2be 100644
> --- a/tests/i915/i915_query.c
> +++ b/tests/i915/i915_query.c
> @@ -1348,8 +1348,7 @@ static void query_parse_and_validate_hwconfig_table(int i915)
>   			if (!value)
>   				igt_info("-\n");
>   
> -			j = 0;
> -			while (value) {
> +			for (j = 0; value; j++) {
>   				if (value & BIT(j)) {
>   					value &= ~BIT(j);
>   					igt_assert(j < __INTEL_HWCONFIG_CACHE_TYPE_LIMIT);
