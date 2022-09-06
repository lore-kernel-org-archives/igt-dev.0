Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6AE89CAD
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 12:50:40 +0000 (UTC)
Message-ID: <710d53e8-9522-2947-6dfa-95c3a5651098@intel.com>
Date: Tue, 6 Sep 2022 15:50:33 +0300
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220823183036.5270-1-umesh.nerlige.ramappa@intel.com>
 <20220823183036.5270-3-umesh.nerlige.ramappa@intel.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <20220823183036.5270-3-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 02/23] i915/perf: Fix OA short_reads test
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
> With 5000 ns oa exponent, report lost errors can occur. A report lost
> header can be read by the user even when there are no valid OA report
> samples, so we get an 8 byte read. This defeats the EFAULT check.
>
> When checking for EFAULT on a sampled report, discard any report lost
> errors.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>   tests/i915/perf.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 51e2dc87..0b8f6ac8 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -2853,8 +2853,13 @@ test_short_reads(void)
>   
>   	/* A read that can't return a single record because it would result
>   	 * in a fault on buffer overrun should result in an EFAULT error...
> +	 *
> +	 * Make sure to weed out all report lost errors before verifying EFAULT.
>   	 */
> -	ret = read(stream_fd, pages + page_size - 16, page_size);
> +	header = (void *)(pages + page_size - 16);
> +	do {
> +		ret = read(stream_fd, header, page_size);
> +	} while (ret > 0 && header->type == DRM_I915_PERF_RECORD_OA_REPORT_LOST);
>   	igt_assert_eq(ret, -1);
>   	igt_assert_eq(errno, EFAULT);
>   

