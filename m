Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCC410E301
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Sep 2022 07:51:07 +0000 (UTC)
Message-ID: <2409b586-d7a8-fc6c-3665-cc48031bd9a5@intel.com>
Date: Wed, 28 Sep 2022 10:50:36 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>, Ashutosh Dixit <ashutosh.dixit@intel.com>
References: <20220923195224.283045-1-umesh.nerlige.ramappa@intel.com>
 <20220923195224.283045-7-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220923195224.283045-7-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 06/17] i915/perf: Define OA report
 types and fix oa-formats test
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

On 23/09/2022 22:52, Umesh Nerlige Ramappa wrote:
> With newer gen12 platforms, formats used for OAG buffer and
> MI_REPORT_PERF_FORMAT differ slightly. This causes issues when the
> oa-formats test does a sanity check. Run oa-formats for OAG reports
> only.
>
> OAR formats must be tested with the gen12-mi-rpc and
> gen12-unprivileged-single-ctx-counters.
>
> v2: Clarify commit message
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/i915/perf.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 5fe874c1..65434055 100644
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
> @@ -108,6 +115,7 @@ struct oa_format {
>   	int n_b;
>   	int c_off;
>   	int n_c;
> +	int oa_type;
>   };
>   
>   static struct oa_format hsw_oa_formats[I915_OA_FORMAT_MAX] = {
> @@ -1483,6 +1491,9 @@ test_oa_formats(void)
>   		if (!format.name) /* sparse, indexed by ID */
>   			continue;
>   
> +		if (format.oa_type != OAG) /* sparse, indexed by ID */
> +			continue;
> +
>   		igt_debug("Checking OA format %s\n", format.name);
>   
>   		open_and_read_2_oa_reports(i,

