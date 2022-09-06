Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D3210E660
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:08:39 +0000 (UTC)
Message-ID: <6290f1ef-7a8e-3521-2a79-24d67285c2c5@intel.com>
Date: Tue, 6 Sep 2022 16:08:15 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-9-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 08/23] i915/perf: Define OA report types
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

On 23/08/2022 21:30, Umesh Nerlige Ramappa wrote:
> Differentiate between OAG and OAR format types for tests like
> oa-formats.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/i915/perf.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 19c33324..b61dd6e2 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -95,6 +95,13 @@ struct accumulator {
>   	uint64_t deltas[MAX_RAW_OA_COUNTERS];
>   };
>   
> +enum {
> +	OAG,
> +	OAR,
> +
> +	MAX_OA_TYPE,
> +};
> +
>   struct oa_format {
>   	const char *name;
>   	size_t size;
> @@ -110,6 +117,7 @@ struct oa_format {
>   	int n_b;
>   	int c_off;
>   	int n_c;
> +	int oa_type;
>   };
>   
>   static struct oa_format hsw_oa_formats[I915_OA_FORMAT_MAX] = {
> @@ -1539,6 +1547,9 @@ test_oa_formats(void)
>   		if (!format.name) /* sparse, indexed by ID */
>   			continue;
>   
> +		if (format.oa_type != OAG) /* sparse, indexed by ID */
> +			continue;
> +

I can't make sense of this comment.

Also you're not going to test OAR reports?


>   		igt_debug("Checking OA format %s\n", format.name);
>   
>   		open_and_read_2_oa_reports(i,

