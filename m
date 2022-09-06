Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F3110E68E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 14:22:04 +0000 (UTC)
Message-ID: <56546b30-c922-380f-7b07-b4039785bffb@intel.com>
Date: Tue, 6 Sep 2022 17:21:55 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-21-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-21-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 20/23] lib/i915/perf: implement report
 accumulation for new format
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
> From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>
> Available on XEHPSDV+.
>
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   lib/i915/perf.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/lib/i915/perf.c b/lib/i915/perf.c
> index 2f24cbd8..d004313f 100644
> --- a/lib/i915/perf.c
> +++ b/lib/i915/perf.c
> @@ -676,6 +676,39 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
>   	memset(acc, 0, sizeof(*acc));
>   
>   	switch (oa_format) {
> +	case I915_OA_FORMAT_A24u40_A14u32_B8_C8:
> +		accumulate_uint32(start + 1, end + 1, deltas + idx++); /* timestamp */
> +		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */
> +
> +		/* 4x 32bit A0-3 counters... */
> +		for (i = 0; i < 4; i++)
> +			accumulate_uint32(start + 4 + i, end + 4 + i, deltas + idx++);
> +
> +		/* 20x 40bit A4-23 counters... */
> +		for (i = 0; i < 20; i++)
> +			accumulate_uint40(i + 4, start, end, deltas + idx++);
> +
> +		/* 4x 32bit A24-27 counters... */
> +		for (i = 0; i < 4; i++)
> +			accumulate_uint32(start + 28 + i, end + 28 + i, deltas + idx++);
> +
> +		/* 4x 40bit A28-31 counters... */
> +		for (i = 0; i < 4; i++)
> +			accumulate_uint40(i + 28, start, end, deltas + idx++);
> +
> +		/* 5x 32bit A32-36 counters... */
> +		for (i = 0; i < 5; i++)
> +			accumulate_uint32(start + 36 + i, end + 36 + i, deltas + idx++);
> +
> +		/* 1x 32bit A37 counter... */
> +		accumulate_uint32(start + 46, end + 46, deltas + idx++);
> +
> +		/* 8x 32bit B counters + 8x 32bit C counters... */
> +		for (i = 0; i < 16; i++)
> +			accumulate_uint32(start + 48 + i, end + 48 + i, deltas + idx++);
> +		break;
> +
> +	case I915_OAR_FORMAT_A32u40_A4u32_B8_C8:
>   	case I915_OA_FORMAT_A32u40_A4u32_B8_C8:
>   		accumulate_uint32(start + 1, end + 1, deltas + idx++); /* timestamp */
>   		accumulate_uint32(start + 3, end + 3, deltas + idx++); /* clock */

