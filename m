Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4662810E65E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 13:07:05 +0000 (UTC)
Message-ID: <ddbd2978-eb9d-42b3-2030-7de7891328c7@intel.com>
Date: Tue, 6 Sep 2022 16:06:37 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-6-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-6-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 05/23] i915/perf: Bump timestamp
 tolerance for DG1
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
> Timestamp deltas obtained from the batch vs the delta obtained from oa
> reports have a delta that's between 4 to 5 us in DG1. Adjust the test
> accordingly.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

It's odd...

4/5us between 2 commands that follow each other exactly in a command stream?

Even if the PIPE_CONTROL stalls, it's supposed to write the timestamp 
after it's done stalling.

And the MI_REPORT_PERF_COUNT command is just after.


If you're sure there is no other explanation : Reviewed-by: Lionel 
Landwerlin <lionel.g.landwerlin@intel.com>


> ---
>   tests/i915/perf.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index ca3ccc17..95600562 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -4084,8 +4084,9 @@ static void gen12_single_ctx_helper(void)
>   	delta_delta = delta_ts64_ns > delta_oa32_ns ?
>   		      (delta_ts64_ns - delta_oa32_ns) :
>   		      (delta_oa32_ns - delta_ts64_ns);
> -	if (delta_delta > 500) {
> -		igt_debug("delta_delta exceeds margin, skipping..\n");
> +	if (delta_delta > 5000) {
> +		igt_debug("delta_delta = %d. exceeds margin, skipping..\n",
> +			  delta_delta);
>   		exit(EAGAIN);
>   	}
>   

